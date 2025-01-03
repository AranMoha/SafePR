# Copyright 2012 IgH Essen GmbH
#
# Abstract:
#   Real-Time Workshop template makefile for building a user space
#   executable of a Simulink model
#
#   Note that this template is automatically customized by the build 
#   procedure to create "<model>.mk"
#
#   The following defines can be used to modify the behavior of the
#   build:
#     EXTRA_CFLAGS  - optional compile flags
#     EXTRA_LDFLAGS - optional link flags (e.g. EXTRA_LDFLAGS="-some -flags")
#     STAGING_DIR   - Optional directory where EtherLab and libraries are
#                     installed (e.g. STAGING_DIR=/path/to/install)
#     VERBOSE       - Show compile line (e.g. VERBOSE=1)
#     DEBUG         - Adds -g to CFLAGS and LDFLAGS (e.g. DEBUG=1)
#     USER_SRCS     - Additional user sources, such as files needed by
#                     S-functions.
#     USER_INCLUDES - Additional include paths
#                    (i.e. USER_INCLUDES="-Iwhere-ever -Iwhere-ever2")
#
#   These flags can be set on the make command line in
#   Configuration Parameters -> Real-Time Workshop -> Make command:
#   e.g.: make_rtw EXTRA_CFLAGS=-m32 EXTRA_LDFLAGS=-m32
#
#   This template makefile is designed to be used with a system target
#   file that contains 'rtwgensettings.BuildDirSuffix' see grt.tlc

#------------------------ Macros read by make_rtw ------------------------------
#
# The following macros are read by the build procedure:
#
#  MAKECMD         - This is the command used to invoke the make utility
#  HOST            - What platform this template makefile is targeted for
#                    (i.e. PC or UNIX)
#  BUILD           - Invoke make from the build procedure (yes/no)?
#  SYS_TARGET_FILE - Name of system target file.

MAKECMD         = make
HOST            = UNIX
BUILD           = yes
SYS_TARGET_FILE = etherlab.tlc
COMPILER_TOOL_CHAIN = unix

unexport LD_LIBRARY_PATH

#---------------------- Tokens expanded by make_rtw ----------------------------
#
# The following tokens, when wrapped with "|>" and "<|" are expanded by the
# build procedure.
#
#  MODEL_NAME          - Name of the Simulink block diagram
#  MODEL_MODULES       - Any additional generated source modules
#  MAKEFILE_NAME       - Name of makefile created from template makefile <model>.mk
#  MATLAB_ROOT         - Path to where MATLAB is installed.
#  S_FUNCTIONS         - List of S-functions.
#  S_FUNCTIONS_LIB     - List of S-functions libraries to link.
#  SOLVER              - Solver source file name
#  NUMST               - Number of sample times
#  TID01EQ             - yes (1) or no (0): Are sampling rates of continuous task
#                        (tid=0) and 1st discrete task equal.
#  NCSTATES            - Number of continuous states
#  COMPUTER            - Computer type. See the MATLAB computer command.
#  BUILDARGS           - Options passed in at the command line.
#  MULTITASKING        - yes (1) or no (0): Is solver mode multitasking
#  EXT_MODE            - yes (1) or no (0): Build for external mode
#  TMW_EXTMODE_TESTING - yes (1) or no (0): Build ext_test.c for external mode
#                        testing.
#  EXTMODE_TRANSPORT   - Index of transport mechanism (e.g. tcpip, serial) for extmode
#  EXTMODE_STATIC      - yes (1) or no (0): Use static instead of dynamic mem alloc.
#  EXTMODE_STATIC_SIZE - Size of static memory allocation buffer.
#  GEN_MDLREF_SFCN     - (1/0): are we generating model reference wrapper s-function
#  TGT_FCN_LIB         - Target Funtion library to use
#  MODELREFS           - List of referenced models

MODEL                = appint_ros_example
MODULES              = appint_ros_example_capi.c appint_ros_example_data.c appint_ros_example_header.c rtGetInf.c rtGetNaN.c rt_nonfinite.c SL_func_dummy.cpp
MAKEFILE             = appint_ros_example.mk
MATLAB_ROOT          = /usr/local/MATLAB/R2018b
ALT_MATLAB_ROOT      = /usr/local/MATLAB/R2018b
MATLAB_BIN           = /usr/local/MATLAB/R2018b/bin
MASTER_ANCHOR_DIR    = 
START_DIR            = /home/pkmadmin/Schreibtisch/etherlab-examples-master/appinterface_ros/ros_rt_interface
S_FUNCTIONS          = rtiostream_utils.c
S_FUNCTIONS_LIB      = $(START_DIR)/build/../build/libros_sl_interface.so
SOLVER               = 
NUMST                = 1
TID01EQ              = 0
NCSTATES             = 0
COMPUTER             = GLNXA64
BUILDARGS            =  COMBINE_OUTPUT_UPDATE_FCNS=0 INCLUDE_MDL_TERMINATE_FCN=1 MULTI_INSTANCE_CODE=0 ISPROTECTINGMODEL=NOTPROTECTING OPTS="-DEXT_MODE -DEXTMODE_STATIC -DEXTMODE_STATIC_SIZE=80000000 -DON_TARGET_WAIT_FOR_START=0"
MULTITASKING         = 0
MAT_FILE             = 0
EXT_MODE             = 1
TMW_EXTMODE_TESTING  = 0
EXTMODE_TRANSPORT    = 0
EXTMODE_STATIC       = 1
EXTMODE_STATIC_SIZE  = 80000000
MEXEXT               = mexa64
TGT_FCN_LIB          = ISO_C
MODELREFS            = 
SHARED_SRC           = 
SHARED_SRC_DIR       = 
SHARED_BIN_DIR       = 
SHARED_LIB           = 
TARGET_LANG_EXT      = c
OPTIMIZATION_FLAGS   = 
ADDITIONAL_LDFLAGS   = 
ETHERCAT32BIT        = 0

# CLASSIC_INTERFACE    = >CLASSIC_INTERFACE<|
# Optional for GRT
# ONESTEPFCN           = >COMBINE_OUTPUT_UPDATE_FCNS<|
TERMFCN              = 1
MULTI_INSTANCE_CODE  = 0

# EtherLAB options
OVERRUNMAX      = 1
BUFFER_TIME     = 2
STACKSIZE       = 2000
PARAMETER_PREFIX = ModelParameter

#--------------------------- Model and reference models -----------------------
MODELLIB                  = appint_ros_examplelib.a
MODELREF_LINK_LIBS        = 
MODELREF_INC_PATH         = 
RELATIVE_PATH_TO_ANCHOR   = ..
# NONE: standalone, SIM: modelref sim, RTW: modelref coder target
MODELREF_TARGET_TYPE       = NONE

#-- In the case when directory name contains space ---
ifneq ($(MATLAB_ROOT),$(ALT_MATLAB_ROOT))
MATLAB_ROOT := $(ALT_MATLAB_ROOT)
endif

#--------------------------- Tool Specifications -------------------------------

CC = gcc
LD = $(CC)
CXX = g++
OPT_OPTS = -O2
WARN_OPTS = -Wall
ETHERLAB_DIR = /usr/local/share/etherlab

ifeq ($(ETHERCAT32BIT),1)
  PLATFORM_LIBDIR = lib/i386-linux-gnu
else
  PLATFORM_LIBDIR = lib
endif

#------------------------------ Include Path -----------------------------------

MATLAB_INCLUDES = \
        -I$(MATLAB_ROOT)/simulink/include \
        -I$(MATLAB_ROOT)/extern/include \
        -I$(MATLAB_ROOT)/rtw/c/src \
        -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common

# Additional file include paths
ADD_INCLUDES = \
    -I$(START_DIR) \
    -I$(START_DIR)/appint_ros_example_etl_hrt \
    -I/home/pkmadmin/Schreibtisch/etherlab-examples-master/appinterface_ros \
    -I$(MATLAB_ROOT)/extern/include \
    -I$(MATLAB_ROOT)/simulink/include \
    -I$(MATLAB_ROOT)/rtw/c/src \
    -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common \
    -I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils \
    -I$(START_DIR)/ros_rt_core \
    -I$(START_DIR)/build \


SHARED_INCLUDES =
ifneq ($(SHARED_SRC_DIR),)
SHARED_INCLUDES = -I$(SHARED_SRC_DIR)
endif

INCLUDES = -I. -I$(RELATIVE_PATH_TO_ANCHOR) \
        $(MATLAB_INCLUDES) $(ADD_INCLUDES) $(USER_INCLUDES) \
        $(MODELREF_INC_PATH) $(SHARED_INCLUDES) \
        -I$(ETHERLAB_DIR)/include 

#----------------------------- External mode -----------------------------------
# Uncomment -DVERBOSE to have information printed to stdout
# To add a new transport layer, see the comments in
#   <matlabroot>/toolbox/simulink/simulink/extmode_transports.m
ifeq ($(EXT_MODE),1)
  EXT_CC_OPTS = -DEXT_MODE -D$(COMPUTER) #-DVERBOSE
  EXT_LIB     =
  EXT_SRC     = ext_svr.c updown.c ext_work.c
  LINT_EXT_COMMON_SRC =
  LINT_EXT_TCPIP_SRC  =
  ifeq ($(EXTMODE_TRANSPORT),0) #tcpip
    EXT_SRC += rtiostream_interface.c rtiostream_tcpip.c
    LINT_EXT_COMMON_SRC = ext_svr.c updown.c ext_work.c \
	rtiostream_interface.c
    LINT_EXT_TCPIP_SRC  = rtiostream_tcpip.c
  endif
  ifeq ($(EXTMODE_TRANSPORT),1) #serial
    EXT_SRC += ext_svr_serial_transport.c ext_serial_pkt.c
    EXT_SRC += rtiostream_serial_interface.c rtiostream_serial.c    
  endif
  ifeq ($(TMW_EXTMODE_TESTING),1)
    EXT_SRC     += ext_test.c
    EXT_CC_OPTS += -DTMW_EXTMODE_TESTING
  endif
  ifeq ($(EXTMODE_STATIC),1)
    EXT_SRC             += mem_mgr.c
    LINT_EXT_COMMON_SRC += mem_mgr.c
    EXT_CC_OPTS         += -DEXTMODE_STATIC -DEXTMODE_STATIC_SIZE=$(EXTMODE_STATIC_SIZE)
  endif
  ifeq ($(COMPUTER),SOL64)
    EXT_LIB = -lsocket -lnsl
  endif
endif

#-------------------------------- C Flags --------------------------------------

# General User Options
ifeq ($(DEBUG),1)
DBG_FLAG = -g
endif

ifeq ($(ETHERCAT32BIT),1)
EXTRA_CFLAGS += -m32
EXTRA_LDFLAGS += -m32
endif

CPP_REQ_DEFINES = -DMODEL=$(MODEL) -DRT -DUSE_RTMODEL -DNUMST=$(NUMST) \
                  -DTID01EQ=$(TID01EQ) -DNCSTATES=$(NCSTATES) -DUNIX \
                  -DMT=$(MULTITASKING) -DHAVESTDIO \
		  -DONESTEPFCN=$(ONESTEPFCN) -DTERMFCN=$(TERMFCN) \
		  -DMULTI_INSTANCE_CODE=$(MULTI_INSTANCE_CODE) \
		  -DCLASSIC_INTERFACE=$(CLASSIC_INTERFACE) \
                  -DOVERRUNMAX=$(OVERRUNMAX) -DBUFFER_TIME=$(BUFFER_TIME) \
                  -DSTACKSIZE=$(STACKSIZE) \
                  -DPARAMETER_PREFIX="$(PARAMETER_PREFIX)"

CFLAGS   = $(DBG_FLAG) $(OPT_OPTS) $(EXT_CC_OPTS) $(CPP_REQ_DEFINES) $(INCLUDES) \
                $(OPTIMIZATION_FLAGS) $(EXTRA_CFLAGS)
LDFLAGS  = $(DBG_FLAG) $(ADDITIONAL_LDFLAGS) $(EXTRA_LDFLAGS)

#-------------------------- Additional Libraries ------------------------------

SYSLIBS =  -lm -ldl -lrt -pthread

ifneq ($(findstring rtipc.c,$(S_FUNCTIONS)),)
    SYSLIBS += -lrtipc
    S_FUNCTIONS := $(filter-out rtipc.c,$(S_FUNCTIONS))
endif

ifneq ($(findstring ecrt_support.c,$(S_FUNCTIONS)),)
    SYSLIBS += -lethercat
endif

LIBS = $(S_FUNCTIONS_LIB) $(INSTRUMENT_LIBS) \


#----------------------------- Source Files ------------------------------------

USER_SRCS =

USER_OBJS       = $(addsuffix .o, $(basename $(USER_SRCS)))
LOCAL_USER_OBJS = $(notdir $(USER_OBJS))


SRCS = $(MODULES) $(S_FUNCTIONS)

ifeq ($(MODELREF_TARGET_TYPE), NONE)
    PRODUCT            = $(RELATIVE_PATH_TO_ANCHOR)/$(MODEL)
    BIN_SETTING        = $(LD) -o $(PRODUCT) $(LDFLAGS)
    BUILD_PRODUCT_TYPE = "executable"
    ifeq ($(CLASSIC_INTERFACE), 1)
       MAIN_SRC  = hrt_main_classic.c
       OTHER_SRC = rt_sim.c
    else
       MAIN_SRC  = hrt_main.c
       OTHER_SRC = rt_sim.c
    endif
    SRCS               += $(MODEL).$(TARGET_LANG_EXT) $(MAIN_SRC) $(OTHER_SRC) $(EXT_SRC) $(SOLVER) 
else
    # Model reference coder target
    PRODUCT            = $(MODELLIB)
    BUILD_PRODUCT_TYPE = "library"
endif

ifneq ($(findstring .cpp,$(suffix $(SRCS), $(USER_SRCS))),)
  LD = $(CXX)
endif

OBJS      = $(addsuffix .o, $(basename $(SRCS))) $(USER_OBJS)
LINK_OBJS = $(addsuffix .o, $(basename $(SRCS))) $(LOCAL_USER_OBJS)

SHARED_SRC := $(wildcard $(SHARED_SRC))
SHARED_OBJS = $(addsuffix .o, $(basename $(SHARED_SRC)))

# Add RELATIVE_PATH_TO_ANCHOR to non-absolute files
MODULE_PAYLOAD := $(filter /%,$(MODULE_PAYLOAD)) \
                  $(addprefix $(RELATIVE_PATH_TO_ANCHOR)/,\
                          $(filter-out /%,$(MODULE_PAYLOAD)))

# Filter out files that do not exist
MODULE_PAYLOAD := $(wildcard $(MODULE_PAYLOAD))

#------------- Verbose build options -------------------------------------------

ifeq ($(VERBOSE),1)
cc  = $(CC)
cxx = $(CXX)
ld  = $(LD)
ar  = $(AR)
else
cc  = @echo "	CC " $@; $(CC)
cxx = @echo "	C++ " $@; $(CXX)
ld  = @echo "	LD " $@; $(LD)
ar  = @echo "	AR " $@; $(AR)
endif

#--------------------------------- Rules ---------------------------------------
.PHONY : all
all: Makefile $(PRODUCT)

ifeq ($(MODELREF_TARGET_TYPE),NONE)
$(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(MODELREF_LINK_LIBS)
	$(BIN_SETTING) $(LINK_OBJS) $(MODELREF_LINK_LIBS) $(SHARED_LIB) $(LIBS)  $(ADDITIONAL_LDFLAGS) $(SYSLIBS)
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"
else
$(PRODUCT) : $(OBJS) $(SHARED_LIB)
	@rm -f $(MODELLIB)
	ar ruvs $(MODELLIB) $(LINK_OBJS)
	@echo "### Created $(MODELLIB)"
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"
endif

#-------------------------------- Depencencies -------------------------------

# Generate model symbol file
module_payload.c: $(MODULE_PAYLOAD)
	@echo Generating $@
	@$(ETHERLAB_DIR)/bin/gen_payload.py $^ > $@

Makefile: $(MAKEFILE)
	ln -s $< $@

ifneq ($(SHARED_SRC_DIR),)
$(SHARED_BIN_DIR)/%.o : $(SHARED_SRC_DIR)/%.c
	cd $(SHARED_BIN_DIR); $(CC) -c $(CFLAGS) $(notdir $?)

$(SHARED_BIN_DIR)/%.o : $(SHARED_SRC_DIR)/%.cpp
	cd $(SHARED_BIN_DIR); $(CXX) -c $(CXXFLAGS) $(notdir $?)
endif

%.o : %.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : %.cpp
	$(cxx) -c $(CXXFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(cc) -c $(WARN_OPTS) $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(cxx) -c $(WARN_OPTS) $(CXXFLAGS) "$<"

%.o : $(ETHERLAB_DIR)/src/%.c
	$(cc) -c $(WARN_OPTS) $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/rtiostream/rtiostreamtcpip/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/custom/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/build/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/ros_rt_core/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"



%.o : $(RELATIVE_PATH_TO_ANCHOR)/build/%.cpp
	$(cxx) -c $(CXXFLAGS) "$<"
%.o : $(RELATIVE_PATH_TO_ANCHOR)/ros_rt_core/%.cpp
	$(cxx) -c $(CXXFLAGS) "$<"
%.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(cxx) -c $(CXXFLAGS) "$<"
%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(cxx) -c $(CXXFLAGS) "$<"
%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.cpp
	$(cxx) -c $(CXXFLAGS) "$<"
%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.cpp
	$(cxx) -c $(CXXFLAGS) "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(cc) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(cxx) -c $(CXXFLAGS) "$<"

#------------------------------- Libraries -------------------------------------





#----------------------------- Dependencies ------------------------------------

$(OBJS) : $(MAKEFILE) rtw_proj.tmw

$(SHARED_LIB) : $(SHARED_OBJS)
	@echo "### Creating $@ "
	ar ruvs $@ $(SHARED_OBJS)
	@echo "### $@ Created  "


#--------- Miscellaneous rules to purge, clean ---------------------------------

purge : clean
	@echo "### Deleting the generated source code for $(MODEL)"
	@\rm -f $(MODEL).c $(MODEL).h $(MODEL)_types.h $(MODEL)_data.c \
	        $(MODEL)_private.h $(MODEL).rtw $(MODULES) rtw_proj.tmw $(MAKEFILE) Makefile

clean :
	@echo "### Deleting the objects and $(PRODUCT)"
	@\rm -f $(LINK_OBJS) $(PRODUCT) $(MODELLIB)

# EOF: etherlab_hrt.tmf
