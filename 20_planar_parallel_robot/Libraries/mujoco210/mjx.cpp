/* Copyright © 2018, Roboti LLC
  This file is licensed under the MuJoCo Resource License (the "License").
  You may not use this file except in compliance with the License.
  You may obtain a copy of the License at
    https://www.roboti.us/resourcelicense.txt
  Modified by Jonathan Vorndamme, RSI, TU Muenchen
*/
#include "mex.h"
#include "mujoco.h"
#include "mjxmacro.h"
#include "glfw3.h"
#include "stdio.h"
#include "string.h"
#include <mutex>
#include <thread>
using namespace std;

//--------------------------- basic.cpp with thread/mutex ----------------------
// background thread
thread background_thread;
thread::id background_id;
bool initialized = false;
bool exitrequest = false;

// main data structures: protected with mutex
mutex mtx;
mjModel* m = NULL;
mjData* d = NULL;

// visualization data structures
mjvCamera cam;
mjvOption opt;
mjvScene scn;
mjrContext con;


// mouse interaction
bool button_left = false;
bool button_middle = false;
bool button_right = false;
double lastx = 0;
double lasty = 0;

//------------------------ copy data between MATLAB and Mujoco -----------------
// check size of numeric field from MATLAB
static void checkNumeric(const mxArray* mx, const char* name, int sz0,
                         int sz1) {
  char msg[100];
  if( !mx ) {
    sprintf(msg, "%s: missing numeric argument", name);
    mexErrMsgTxt(msg);
  }
  if( mxGetNumberOfDimensions(mx)!=2 ) {
    sprintf(msg, "%s: numeric argument has %d dimensions, should be 2",
      name, mxGetNumberOfDimensions(mx));
    mexErrMsgTxt(msg);
  }
  if( mxGetClassID(mx)!=mxDOUBLE_CLASS ) {
    sprintf(msg, "%s: expected class DOUBLE", name);
    mexErrMsgTxt(msg);
  }
  const mwSize* sz = mxGetDimensions(mx);
  if( (sz[0]!=sz0 || sz[1]!=sz1) && (sz[0]!=sz1 || sz[1]!=sz0) ) {
    sprintf(msg, "%s: expected %d-by-%d or %d-by-%d, got %d-by-%d",
      name, sz0, sz1, sz1, sz0, sz[0], sz[1]);
    mexErrMsgTxt(msg);
  }
}
// MATLAB => Mujoco: structure field
template <typename T>
void mx2mjc(T* mj, const mxArray* arg, const int nr, const int nc,
            const char* name) {
  // get field and check
  const mxArray* mx = mxGetField(arg, 0, name);
  if( !mx ) {
    // skip empty array
    if( nr==0 || nc==0 )
      return;
    char msg[200];
    sprintf(msg, "missing field '%s'", name);
    mexErrMsgTxt(msg);
  }
  checkNumeric(mx, name, nr, nc);
  // copy data
  double* mat = mxGetPr(mx);
  for( int r=0; r<nr; r++ )
    for( int c=0; c<nc; c++ )
      mj[c+r*nc] = (T)mat[r+c*nr];
}
// MATLAB => Mujoco: structure field, 2D array
template <typename T, const int nc>
void mx2mjc2(T mj[][nc], const mxArray* arg, const int nr, const char* name) {
  // get field and check
  const mxArray* mx = mxGetField(arg, 0, name);
  if( !mx ) {
    // skip empty array
    if( nr==0 || nc==0 )
      return;
    char msg[200];
    sprintf(msg, "missing field '%s'", name);
    mexErrMsgTxt(msg);
  }
  checkNumeric(mx, name, nr, nc);
  // copy data
  double* mat = mxGetPr(mx);
  for( int r=0; r<nr; r++ )
    for( int c=0; c<nc; c++ )
      mj[r][c] = (T)mat[r+c*nr];
}
// Mujoco => MATLAB: structure field
template <typename T>
void mjc2mx(mxArray* out, const T* mj, const int nr, const int nc,
            const char* name) {
  // return if no data; empty matrix assigned by default
  if( !nr || !nc )
    return;
  // check field name
  if( mxGetFieldNumber(out, name)==-1 ) {
    mexPrintf("field name '%s' unrecognized\n", name);
    mexErrMsgTxt("error copying data from MuJoCo to Matlab");
  }
  // create field
  mxSetField(out, 0, name, mxCreateDoubleMatrix(nr, nc, mxREAL));
  // copy data
  double* mat = mxGetPr(mxGetField(out, 0, name));
  for( int r=0; r<nr; r++ )
    for( int c=0; c<nc; c++ )
      mat[r+c*nr] = (double)mj[c+r*nc];
}
// Mujoco => MATLAB: structure field, 2D array
template <typename T, const int nc>
void mjc2mx2(mxArray* out, const T mj[][nc], const int nr, const char* name) {
  // return if no data; empty matrix assigned by default
  if( !nr )
    return;
  // check field name
  if( mxGetFieldNumber(out, name)==-1 ) {
    mexPrintf("field name '%s' unrecognized\n", name);
    mexErrMsgTxt("error copying data from MuJoCo to Matlab");
  }
  // create field
  mxSetField(out, 0, name, mxCreateDoubleMatrix(nr, nc, mxREAL));
  // copy data
  double* mat = mxGetPr(mxGetField(out, 0, name));
  for( int r=0; r<nr; r++ )
    for( int c=0; c<nc; c++ )
      mat[r+c*nr] = (double)mj[r][c];
}
// wrapper for mj_get_contact
void getcontact(int nout, mxArray* pout[]) {
  // create Matlab structure
  const int size = 8;
  const char* name[size] = {
      "ncon",
      "time",
      "pos",
      "frame",
      "dist",
      "force",
      "geom1",
      "geom2"
  };
  const int dims[8][2] = {
      {1, 1},
      {1, 1},
      {d->ncon, 3},
      {d->ncon, 9},
      {d->ncon, 1},
      {d->ncon, 6},
      {d->ncon, 1},
      {d->ncon, 1}
  };
  double* pfields[size];
  if (nout <= 1) {
    pout[0] = mxCreateStructMatrix(1, 1, size, name);
    for (int i=0;i<size;++i) {
      mxSetField(pout[0], 0, name[i],
                 mxCreateDoubleMatrix(dims[i][0], dims[i][1], mxREAL));
      pfields[i] = mxGetPr(mxGetField(pout[0], 0, name[i]));
    }
  } else if (nout <= 8) {
    for (int i=0;i<nout;++i) {
      pout[i] = mxCreateDoubleMatrix(dims[i][0], dims[i][1], mxREAL);
      pfields[i] = mxGetPr(pout[i]);
    }
  } else {
    mexErrMsgTxt("between 1 and 8 outputs are required");
  }
  // fill fields with data
  switch (nout) {
    case 0: case 1: case 8:
      for (int i=0;i<d->ncon;++i) {
        pfields[7][i] = (double) d->contact[i].geom2;
      }
    case 7:
      for (int i=0;i<d->ncon;++i) {
        pfields[6][i] = (double) d->contact[i].geom1;
      }
    case 6:
      for (int i=0;i<d->ncon;++i) {
        mjtNum force[6];
        mj_contactForce(m, d, i, force);
        for (int j=0; j<6; ++j) {
          pfields[5][i+j*d->ncon] = (double) force[j];
        }
      }
    case 5:
      for (int i=0;i<d->ncon;++i) {
        pfields[4][i] = (double) d->contact[i].dist;
      }
    case 4:
      for (int i=0;i<d->ncon;++i) {
        for (int j=0; j<9; ++j) {
          pfields[3][i+j*d->ncon] = d->contact[i].frame[j];
        }
      }
    case 3:
      for (int i=0;i<d->ncon;++i) {
        for (int j=0; j<3; ++j) {
          pfields[2][i+j*d->ncon] = d->contact[i].pos[j];
        }
      }
    case 2:
      *pfields[1] = d->time;
      *pfields[0] = d->ncon;
  }
}
// wrapper for mj_info
mxArray* info(void) {
  // create Matlab structure
  const int size = 37;
  const char* name[size] = {
      "nq",
      "nv",
      "na",
      "njnt",
      "nbody",
      "ngeom",
      "nsite",
      "ntendon",
      "nu",
      "neq",
      "nkey",
      "nmocap",
      "nsensor",
      "nsensordata",
      "nmat",
      "timestep",
      "apirate",
      "sensor_type",
      "sensor_datatype",
      "sensor_objtype",
      "sensor_objid",
      "sensor_dim",
      "sensor_adr",
      "sensor_noise",
      "jnt_type",
      "jnt_bodyid",
      "jnt_qposadr",
      "jnt_dofadr",
      "jnt_range",
      "geom_type",
      "geom_bodyid",
      "eq_type",
      "eq_obj1id",
      "eq_obj2id",
      "actuator_trntype",
      "actuator_trnid",
      "actuator_ctrlrange"
  };
  mxArray* out = mxCreateStructMatrix(1, 1, size, name);
  // fill structure with data
  mjc2mx(out, &m->nq,          1, 1, "nq");
  mjc2mx(out, &m->nv,          1, 1, "nv");
  mjc2mx(out, &m->na,          1, 1, "na");
  mjc2mx(out, &m->njnt,        1, 1, "njnt");
  mjc2mx(out, &m->nbody,       1, 1, "nbody");
  mjc2mx(out, &m->ngeom,       1, 1, "ngeom");
  mjc2mx(out, &m->nsite,       1, 1, "nsite");
  mjc2mx(out, &m->ntendon,     1, 1, "ntendon");
  mjc2mx(out, &m->nu,          1, 1, "nu");
  mjc2mx(out, &m->neq,         1, 1, "neq");
  mjc2mx(out, &m->nkey,        1, 1, "nkey");
  mjc2mx(out, &m->nmocap,      1, 1, "nmocap");
  mjc2mx(out, &m->nsensor,     1, 1, "nsensor");
  mjc2mx(out, &m->nsensordata, 1, 1, "nsensordata");
  mjc2mx(out, &m->nmat,        1, 1, "nmat");
  mjc2mx(out, &m->opt.timestep,    1, 1, "timestep");
  mjc2mx(out, &m->opt.apirate,     1, 1, "apirate");
  mjc2mx(out, m->sensor_type,     m->nsensor, 1, "sensor_type");
  mjc2mx(out, m->sensor_datatype, m->nsensor, 1, "sensor_datatype");
  mjc2mx(out, m->sensor_objtype,  m->nsensor, 1, "sensor_objtype");
  mjc2mx(out, m->sensor_objid,    m->nsensor, 1, "sensor_objid");
  mjc2mx(out, m->sensor_dim,      m->nsensor, 1, "sensor_dim");
  mjc2mx(out, m->sensor_adr,      m->nsensor, 1, "sensor_adr");
  mjc2mx(out, m->sensor_noise,    m->nsensor, 1, "sensor_noise");
  mjc2mx(out, m->jnt_type,     m->njnt, 1, "jnt_type");
  mjc2mx(out, m->jnt_bodyid,   m->njnt, 1, "jnt_bodyid");
  mjc2mx(out, m->jnt_qposadr,  m->njnt, 1, "jnt_qposadr");
  mjc2mx(out, m->jnt_dofadr,   m->njnt, 1, "jnt_dofadr");
  mjc2mx(out, m->jnt_range,    m->njnt, 2,   "jnt_range");
  mjc2mx(out, m->geom_type,    m->ngeom, 1, "geom_type");
  mjc2mx(out, m->geom_bodyid,  m->ngeom, 1, "geom_bodyid");
  mjc2mx(out, m->eq_type,      m->neq, 1, "eq_type");
  mjc2mx(out, m->eq_obj1id,    m->neq, 1, "eq_obj1id");
  mjc2mx(out, m->eq_obj2id,    m->neq, 1, "eq_obj2id");
  mjc2mx(out, m->actuator_trntype,   m->nu, 1, "actuator_trntype");
  mjc2mx(out, m->actuator_trnid,     m->nu, 2,   "actuator_trnid");
  mjc2mx(out, m->actuator_ctrlrange, m->nu, 2, "actuator_ctrlrange");
  return out;
}
//get visual flags
mxArray* getvisflags() {
  char name[mjNVISFLAG][100];
  const char* name_const[mjNVISFLAG];
  for (int i=0;i<mjNVISFLAG;++i) {
    strcpy(name[i], mjVISSTRING[i][0]);
    for(int j=0; j<strlen(mjVISSTRING[i][0]); ++j)
      if( mjVISSTRING[i][0][j]=='&' ) {
        strcpy(name[i]+j, mjVISSTRING[i][0]+j+1);
        break;
      }
    name_const[i] = name[i];
  }
  mxArray* out = mxCreateStructMatrix(1, 1, mjNVISFLAG, name_const);
  for (int i=0;i<mjNVISFLAG;++i) {
    mxSetField(out, 0, name[i], mxCreateDoubleMatrix(1, 1, mxREAL));
    double* flag = mxGetPr(mxGetField(out, 0, name[i]));
    *flag = (double) opt.flags[i];
  }
  return out;
}
//set visual flags
void setvisflags(const char* fieldname, int value) {
  bool success = false;
  char name[100];
  for (int i=0;i<mjNVISFLAG;++i) {
    strcpy(name, mjVISSTRING[i][0]);
    for(int j=0; j<strlen(mjVISSTRING[i][0]); ++j)
      if( mjVISSTRING[i][0][j]=='&' ) {
        strcpy(name+j, mjVISSTRING[i][0]+j+1);
        break;
      }
    if (!strcmp(fieldname, name)) {
      opt.flags[i] = value;
      success = true;
      break;
    }
  }
  if (!success)
    mexErrMsgTxt("unknown visual flag provided");
}
// keyboard callback
void keyboard(GLFWwindow* window, int key, int scancode, int act, int mods) {
  // only on press
  if(act!=GLFW_PRESS)
    return;
  // toggle visualization flag
  for(int i=0; i<mjNVISFLAG; i++)
    if(key==mjVISSTRING[i][2][0])
      opt.flags[i] = !opt.flags[i];
  // toggle rendering flag
  for(int i=0; i<mjNRNDFLAG; i++)
    if(key==mjRNDSTRING[i][2][0])
      scn.flags[i] = !scn.flags[i];
  // toggle geom/site group
  for(int i=0; i<mjNGROUP; i++)
    if(key==i+'0') {
      if(mods & GLFW_MOD_SHIFT)
        opt.sitegroup[i] = !opt.sitegroup[i];
      else
        opt.geomgroup[i] = !opt.geomgroup[i];
    }
}
// mouse button callback
void mouse_button(GLFWwindow* window, int button, int act, int mods) {
  // update button state
  button_left =
      (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT)==GLFW_PRESS);
  button_middle =
      (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_MIDDLE)==GLFW_PRESS);
  button_right =
      (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_RIGHT)==GLFW_PRESS);
  // update mouse position
  glfwGetCursorPos(window, &lastx, &lasty);
}
// mouse move callback
void mouse_move(GLFWwindow* window, double xpos, double ypos) {
  // no buttons down: nothing to do
  if(!button_left && !button_middle && !button_right)
    return;
  // compute mouse displacement, save
  double dx = xpos - lastx;
  double dy = ypos - lasty;
  lastx = xpos;
  lasty = ypos;
  // get current window size
  int width, height;
  glfwGetWindowSize(window, &width, &height);
  // get shift key state
  bool mod_shift = (glfwGetKey(window, GLFW_KEY_LEFT_SHIFT)==GLFW_PRESS ||
           glfwGetKey(window, GLFW_KEY_RIGHT_SHIFT)==GLFW_PRESS);
  // determine action based on mouse button
  mjtMouse action;
  if(button_right)
    action = mod_shift ? mjMOUSE_MOVE_H : mjMOUSE_MOVE_V;
  else if(button_left)
    action = mod_shift ? mjMOUSE_ROTATE_H : mjMOUSE_ROTATE_V;
  else
    action = mjMOUSE_ZOOM;
  // move camera
  lock_guard<mutex> guard(mtx);
  mjv_moveCamera(m, action, dx/height, dy/height, &scn, &cam);
}
// scroll callback
void scroll(GLFWwindow* window, double xoffset, double yoffset) {
  // emulate vertical mouse motion = 5% of window height
  lock_guard<mutex> guard(mtx);
  mjv_moveCamera(m, mjMOUSE_ZOOM, 0, -0.05*yoffset, &scn, &cam);
}
// background thread: render, process events
void background(GLFWwindow* window, int cam_mode) {
  // save thread id
  background_id = this_thread::get_id();
  // associate OpenGL context with this thread, enable v-sync
  glfwMakeContextCurrent(window);
  glfwSwapInterval(1);
  // initialize visualization data structures
  mjv_defaultCamera(&cam);
  mjv_defaultOption(&opt);
  //opt.flags[mjVIS_CONTACTFORCE] = true;
  opt.flags[mjVIS_PERTFORCE] = true;
  mjv_defaultScene(&scn);
  mjr_defaultContext(&con);
  // create scene and context, set default camera view
  {
    lock_guard<mutex> guard(mtx);
    mjv_makeScene(m, &scn, 2000);
    mjr_makeContext(m, &con, mjFONTSCALE_150);
    // scale view
    if(cam_mode== -1){//free cam
         cam.lookat[0] = m->stat.center[0];
         cam.lookat[1] = m->stat.center[1];
         cam.lookat[2] = m->stat.center[2];
         cam.distance = 1 * m->stat.extent;
        //cam.lookat[0] = 0;
        //cam.lookat[1] = 0;
       // cam.lookat[2] = 0.3135;
        //cam.distance = .2;
        cam.azimuth = -30;
        cam.elevation = -85;
    }
    else{//user defined cam
        cam.fixedcamid=cam_mode;
        cam.type=2;
    }    
    
  }
  // install GLFW mouse and keyboard callbacks
  glfwSetKeyCallback(window, keyboard);
  glfwSetCursorPosCallback(window, mouse_move);
  glfwSetMouseButtonCallback(window, mouse_button);
  glfwSetScrollCallback(window, scroll);
  // run until asked to exit (ignore window close button)
  while(!exitrequest) {
    // get framebuffer viewport
    mjrRect viewport = {0, 0, 0, 0};
    glfwGetFramebufferSize(window, &viewport.width, &viewport.height);
    // update scene
    {
      lock_guard<mutex> guard(mtx);
      mjv_updateScene(m, d, &opt, NULL, &cam, mjCAT_ALL, &scn);
    }
    // render
    mjr_render(viewport, &scn, &con);
    // swap OpenGL buffers (blocking call due to v-sync)
    glfwSwapBuffers(window);
    // process pending GUI events, call GLFW callbacks
    glfwPollEvents();
  }
  // uninstall GLFW callbacks
  glfwSetKeyCallback(window, NULL);
  glfwSetCursorPosCallback(window, NULL);
  glfwSetMouseButtonCallback(window, NULL);
  glfwSetScrollCallback(window, NULL);
  // free visualization data structures
  mjv_freeScene(&scn);
  mjr_freeContext(&con);
}
//--------------------------- MATLAB-specific code -----------------------------
// error
void mju_MATLAB_error(const char* msg) {
  mexErrMsgTxt(msg);
}
// warning
void mju_MATLAB_warning(const char* msg) {
  // ignore warnings from background thread because MEX API is not thread-safe
  if(background_id==this_thread::get_id())
    return;
  mexWarnMsgTxt(msg);
}
// allocate memory with mxMalloc, make persistent
void* mju_MATLAB_malloc(size_t sz) {
  void* ptr = mxMalloc(sz);
  mexMakeMemoryPersistent(ptr);
  return ptr;
}
// free memory with mxFree
void mju_MATLAB_free(void* ptr) {
  mxFree(ptr);
}
// exit function
void exitFunction(void) {
  if(initialized) {
    // wait for thread to exit
    exitrequest = true;
    background_thread.join();
    // delete model and data, deactivate
    mj_deleteData(d);
    mj_deleteModel(m);
    mj_deactivate();
    // close GLFW
    #ifdef _WIN32
      glfwTerminate();  // causes crash with Linux NVidia drivers
    #endif
    // clear globals
    m = NULL;
    d = NULL;
    initialized = false;
    exitrequest = false;
    // unlock mex so MATLAB can remove it from memory
    mexUnlock();
  }
}
// find mjData field with given name, return pointer and dimensions
double* findfield(const char* name, int* nr, int* nc) {
  // prepare constants for NC
  int nv = m->nv;
  int njmax = m->njmax;
  // find field
  #define X(TYPE, NAME, NR, NC)                               \
    if( !strcmp(#NAME, name) && !strcmp(#TYPE, "mjtNum") ) {  \
        *nr = m->NR;                                          \
        *nc = NC;                                             \
        return (double*)d->NAME;                              \
    }
    MJDATA_POINTERS
  #undef X
  // not found or type not mjtNum
  return NULL;
}

// help string
static char helpstr[] =
"USAGE:\n"
" [result] = mjx(command, [parameters]);\n"
"EXAMPLES:\n"
" mjx('load', 'mjkey.txt', '../model/humanoid.xml');\n"
" myxpos = mjx('get', 'xpos');\n"
" mjx('set', 'xpos', myxpos);\n"
"COMMANDS AND PARAMETERS:\n"
" load file   : initialize and load model file\n"
" info      : return model info\n"
" get field   : return mjData numeric field\n"
" get_contacts : return contact data\n"
" get_visflags : return visualization flags\n"
" set_visflag name value : set visualization flag name to value (0/1)\n"
" set field data : set mjData numeric field to given data\n"
" reset [key]  : call mj_reset, optional keyframe to reset to\n"
" step [number] : call mj_step, optional number of time steps\n"
" forward    : call mj_forward\n"
" inverse    : call mj_inverse\n"
" exit or quit  : terminate\n\n";

// entry point
void mexFunction(int nout, mxArray* pout[], int nin, const mxArray* pin[]) {
  char filename[100], command[100], fieldname[100];
  int cam_mode, monitor_nr, xpos_window, ypos_window, width_window, height_window;
  // no inputs: print help, return
  if(!nin) {
    mexPrintf(helpstr);
    return;
  }
  // get command string
  if(mxGetClassID(pin[0])!=mxCHAR_CLASS) {
    mexPrintf("first argument must be command string\n");
    return;
  }
  mxGetString(pin[0], command, 100);
  //---------------------------- initialize and load model file
  if(!strcmp(command, "load")) {
    // check for repeated initialization
    if(initialized)
      mexErrMsgTxt("already initialized");
    // get filename
    if(nin<5 || mxGetClassID(pin[1])!=mxCHAR_CLASS ||
       mxGetClassID(pin[2])!=mxCHAR_CLASS)
      mexErrMsgTxt("second argument must be path to key file, "
                   "third must be path to model file, "
                    "fourth must be cam_mode (-1 -> default cam), "
                   "fifth must be the desired monitor_nr");
    mxGetString(pin[1], filename, 100);
    // set MATLAB handlers
    mju_user_error = mju_MATLAB_error;
    mju_user_warning = mju_MATLAB_warning;
    mju_user_malloc = mju_MATLAB_malloc;
    mju_user_free = mju_MATLAB_free;
    // activate MuJoCo
    mj_activate(filename);
    mxGetString(pin[2], filename, 100);
    // get cam_mode
    cam_mode=mxGetScalar(pin[3]);
    // get monitor_nr
    monitor_nr=mxGetScalar(pin[4]);
    // get xpos_window, ypos_window
    xpos_window=mxGetScalar(pin[5]);
    ypos_window=mxGetScalar(pin[6]);
    // get width_window, height_window
    width_window=mxGetScalar(pin[7]);
    height_window=mxGetScalar(pin[8]);    
    // load and compile model
    char error[1000] = "Could not load binary model";
    if(strlen(filename)>4 && !strcmp(filename+strlen(filename)-4, ".mjb"))
      m = mj_loadModel(filename, 0);
    else
      m = mj_loadXML(filename, 0, error, 1000);
    if(!m)
      mju_error_s("Load model error: %s", error);
    // make data and update
    d = mj_makeData(m);
    mj_forward(m, d);
    // init GLFW
    if(!glfwInit())
      mju_error("Could not initialize GLFW");
    // create window
    int count;
    GLFWmonitor** monitors = glfwGetMonitors(&count);
    int xpos,ypos;
    glfwGetMonitorPos(monitors[monitor_nr],&xpos,&ypos);
    GLFWvidmode vmode= *glfwGetVideoMode(monitors[monitor_nr]);	
    //GLFWvidmode vmode = *glfwGetVideoMode(glfwGetPrimaryMonitor());
    GLFWwindow* wnd = glfwCreateWindow(vmode.width*0.5, vmode.height*0.5,
                      "mjx", NULL, NULL);    
//     GLFWwindow* wnd = glfwCreateWindow(width_window, height_window,
//                       "mjx", NULL, NULL);
    glfwSetWindowPos(wnd, xpos, ypos);
//     glfwSetWindowPos(wnd, xpos_window, ypos_window);

    // finish initialization
    mexAtExit(exitFunction);
    mexLock();
    initialized = true;
    // start background processing
    exitrequest = false;
    background_thread = thread(background, wnd, cam_mode);
    return;
  }
  //---------------------------- terminate
  else if(!strcmp(command, "exit") || !strcmp(command, "quit")) {
    exitFunction();
    return;
  }
  // the remaining commands require initialization
  if(!initialized)
    mexErrMsgTxt("not initialized");
  //---------------------------- return mjData and mjModel info
  else if(!strcmp(command, "info")) {
    pout[0] = info();
  }
  //---------------------------- return contact data
  else if(!strcmp(command, "get_contacts")) {
    getcontact(nout, pout);
  }
  //---------------------------- return mjvOption.flags
  else if(!strcmp(command, "get_visflags")) {
    pout[0] = getvisflags();
  }
  //---------------------------- set mjvOption.flags
  else if(!strcmp(command, "set_visflag")) {
    int value;
    if(nin<3 || !mxIsClass(pin[1], "char") || !mxIsNumeric(pin[2]))
      mexErrMsgTxt("field name as string and flag value (0/1) expected");
    else {
      mxGetString(pin[1], fieldname, 100);
      value = mju_round(mxGetScalar(pin[2]));
      if(value!=0 && value!=1)
        mexErrMsgTxt("invalid number, (0/1) expected");
    }
    setvisflags(fieldname, value);
  }
  //---------------------------- get/set mjData field
  else if(!strcmp(command, "get") || !strcmp(command, "set")) {
    lock_guard<mutex> guard(mtx);
    // get field name
    if(nin<2 || !mxIsClass(pin[1], "char"))
      mexErrMsgTxt("field name expected");
    mxGetString(pin[1], fieldname, 100);
    // find field
    int nr = 0, nc = 0;
    double* fielddata = findfield(fieldname, &nr, &nc);
    if(!fielddata)
      mexErrMsgTxt("invalid field name");
    // get
    if(!strcmp(command, "get")) {
      // create MATLAB matrix and copy data (assuming mjtNum is double)
      pout[0] = mxCreateDoubleMatrix(nc, nr, mxREAL);
      memcpy(mxGetPr(pout[0]), fielddata, nr*nc*sizeof(double));
    }
    // set
    else {
      // require data argument
      if(nin<3 || !mxIsNumeric(pin[2]))
        mexErrMsgTxt("field name expected");
      // check data dimensions
      const mwSize* sz = mxGetDimensions(pin[2]);
      if(mxGetNumberOfDimensions(pin[2])!=2 || sz[0]!=nc || sz[1]!=nr)
        mexErrMsgTxt("invalid data dimensions");
      // copy data (assuming mjtNum is double)
      memcpy(fielddata, mxGetPr(pin[2]), nr*nc*sizeof(double));
    }
  }
  //---------------------------- reset [key]
  else if(!strcmp(command, "reset")) {
    lock_guard<mutex> guard(mtx);
    // no key
    if(nin<2)
      mj_resetData(m, d);
    // key specified
    else {
      // check argument, get key
      if(!mxIsNumeric(pin[1]))
        mexErrMsgTxt("numeric optional argument expected");
      int key = mju_round(mxGetScalar(pin[1]));
      if(key<0 || key>=m->nkey)
        mexErrMsgTxt("invalid key");
      // reset to specified key
      mj_resetDataKeyframe(m, d, key);
    }
    // update rendering
    mj_forward(m, d);
  }
  //---------------------------- step [number]
  else if(!strcmp(command, "step")) {
    lock_guard<mutex> guard(mtx);
    // no number
    if(nin<2)
      mj_step(m, d);
    // number of steps specified
    else {
      // check argument, get number of steps
      if(!mxIsNumeric(pin[1]))
        mexErrMsgTxt("numeric optional argument expected");
      int number = mju_round(mxGetScalar(pin[1]));
      if(number<0)
        mexErrMsgTxt("invalid nunber");
      // run for specified number of steps
      for(int i=0; i<number; i++)
        mj_step(m, d);
    }
  }
  //---------------------------- forward
  else if(!strcmp(command, "forward")) {
    lock_guard<mutex> guard(mtx);
    mj_forward(m, d);
  }
  //---------------------------- inverse
  else if(!strcmp(command, "inverse")) {
    lock_guard<mutex> guard(mtx);
    mj_inverse(m, d);
  }
  // undefined command
  else
    mexErrMsgTxt("undefined command string");
}
