/*
 * appint_ros_example.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "appint_ros_example".
 *
 * Model version              : 1.62
 * Simulink Coder version : 9.0 (R2018b) 24-May-2018
 * C source code generated on : Thu Jan 27 17:54:20 2022
 *
 * Target selection: etherlab.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "appint_ros_example_capi.h"
#include "appint_ros_example.h"
#include "appint_ros_example_private.h"
#include "appint_ros_example_dt.h"

/* Block signals (default storage) */
B_appint_ros_example_T appint_ros_example_B;

/* Block states (default storage) */
DW_appint_ros_example_T appint_ros_example_DW;

/* Real-time model */
RT_MODEL_appint_ros_example_T appint_ros_example_M_;
RT_MODEL_appint_ros_example_T *const appint_ros_example_M =
  &appint_ros_example_M_;

/* Model output function */
void appint_ros_example_output(void)
{
  real_T t7;
  real_T t3;
  real_T t9;
  real_T t5;
  real_T t8;
  real_T t26;
  real_T t28;
  real_T t65;
  real_T t15;
  real_T t22;
  real_T t24;
  real_T t39;
  real_T t23;
  real_T t29;
  real_T t25;
  real_T t62;
  real_T t61;
  real_T t60;
  real_T t11;
  real_T t59;
  real_T t58;
  real_T t14;
  real_T t57;
  real_T t56;
  real_T t55;
  real_T t17;
  real_T t47;
  real_T t13;
  real_T t40;
  real_T t38;
  real_T t12;
  real_T t35;
  real_T t34;
  real_T t10;
  real_T t1;
  int32_T r2;
  int32_T i;

  /* Delay: '<Root>/Delay' */
  appint_ros_example_B.sl_state = appint_ros_example_DW.Delay_1_DSTATE;
  appint_ros_example_B.q_meas[0] = appint_ros_example_DW.Delay_2_DSTATE[0];
  appint_ros_example_B.qd_meas[0] = appint_ros_example_DW.Delay_3_DSTATE[0];
  appint_ros_example_B.q_meas[1] = appint_ros_example_DW.Delay_2_DSTATE[1];
  appint_ros_example_B.qd_meas[1] = appint_ros_example_DW.Delay_3_DSTATE[1];

  /* BusCreator: '<Root>/BusConversion_InsertedFor_ros_rt_interface_pcu2_at_inport_0' */
  appint_ros_example_B.BusConversion_InsertedFor_ros_r.sl_state =
    appint_ros_example_B.sl_state;
  appint_ros_example_B.BusConversion_InsertedFor_ros_r.q_meas[0] =
    appint_ros_example_B.q_meas[0];
  appint_ros_example_B.BusConversion_InsertedFor_ros_r.q_meas[1] =
    appint_ros_example_B.q_meas[1];
  appint_ros_example_B.BusConversion_InsertedFor_ros_r.qd_meas[0] =
    appint_ros_example_B.qd_meas[0];
  appint_ros_example_B.BusConversion_InsertedFor_ros_r.qd_meas[1] =
    appint_ros_example_B.qd_meas[1];

  /* S-Function (ros_rt_interface_pcu): '<Root>/ros_rt_interface_pcu2' */
  SL_io_func((SL_OUT_type*)&appint_ros_example_B.BusConversion_InsertedFor_ros_r,
             &appint_ros_example_B.ros_rt_interface_pcu2);

  /* SignalConversion: '<Root>/SigConversion_InsertedFor_Bus Selector1_at_outport_1' */
  appint_ros_example_B.param_D[0] =
    appint_ros_example_B.ros_rt_interface_pcu2.param_D[0];
  appint_ros_example_B.param_D[1] =
    appint_ros_example_B.ros_rt_interface_pcu2.param_D[1];

  /* SignalConversion: '<Root>/SigConversion_InsertedFor_Bus Selector1_at_outport_2' */
  appint_ros_example_B.param_K[0] =
    appint_ros_example_B.ros_rt_interface_pcu2.param_K[0];
  appint_ros_example_B.param_K[1] =
    appint_ros_example_B.ros_rt_interface_pcu2.param_K[1];

  /* SignalConversion: '<Root>/SigConversion_InsertedFor_Bus Selector1_at_outport_3' */
  appint_ros_example_B.q_set[0] =
    appint_ros_example_B.ros_rt_interface_pcu2.q_set[0];
  appint_ros_example_B.q_set[1] =
    appint_ros_example_B.ros_rt_interface_pcu2.q_set[1];

  /* SignalConversion: '<Root>/SigConversion_InsertedFor_Bus Selector1_at_outport_4' */
  appint_ros_example_B.qd_set[0] =
    appint_ros_example_B.ros_rt_interface_pcu2.qd_set[0];
  appint_ros_example_B.qd_set[1] =
    appint_ros_example_B.ros_rt_interface_pcu2.qd_set[1];

  /* SignalConversion: '<Root>/SigConversion_InsertedFor_Bus Selector1_at_outport_5' */
  for (i = 0; i < 6; i++) {
    appint_ros_example_B.FMext[i] =
      appint_ros_example_B.ros_rt_interface_pcu2.FMext[i];
  }

  /* End of SignalConversion: '<Root>/SigConversion_InsertedFor_Bus Selector1_at_outport_5' */
  /* DiscreteIntegrator: '<S2>/Discrete-Time Integrator1' */
  appint_ros_example_B.q[0] =
    appint_ros_example_DW.DiscreteTimeIntegrator1_DSTATE[0];
  appint_ros_example_B.q[1] =
    appint_ros_example_DW.DiscreteTimeIntegrator1_DSTATE[1];

  /* DiscreteIntegrator: '<S2>/Discrete-Time Integrator' */
  appint_ros_example_B.qD[0] =
    appint_ros_example_DW.DiscreteTimeIntegrator_DSTATE[0];
  appint_ros_example_B.qD[1] =
    appint_ros_example_DW.DiscreteTimeIntegrator_DSTATE[1];

  /* MATLAB Function: '<S6>/inertiajoint_fcn' incorporates:
   *  Constant: '<S6>/Constant6'
   *  Constant: '<S6>/Constant7'
   *  Constant: '<S6>/Constant8'
   *  Constant: '<S6>/Constant9'
   */
  t7 = sin(appint_ros_example_B.q[0]);
  t3 = t7 * t7;
  t9 = cos(appint_ros_example_B.q[0]);
  t5 = t9 * t9;
  t8 = cos(appint_ros_example_B.q[1]);
  t7 = sin(appint_ros_example_B.q[1]);
  t7 = ((t7 * t7 * appint_ros_example_P.Constant9_Value[2] + t8 * t8 *
         appint_ros_example_P.Constant9_Value[5]) +
        appint_ros_example_P.Constant9_Value[7]) +
    (appint_ros_example_P.Constant8_Value[1] *
     appint_ros_example_P.Constant8_Value[1] *
     appint_ros_example_P.Constant7_Value[1] + appint_ros_example_P.pkin *
     appint_ros_example_P.pkin * appint_ros_example_P.Constant7_Value[2]) * (t3
    + t5);
  t3 = ((2.0 * t5 + t3) * t3 + t5 * t5) * appint_ros_example_P.Constant9_Value[8];
  appint_ros_example_B.Mq[0] = t7;
  appint_ros_example_B.Mq[2] = 0.0;
  appint_ros_example_B.Mq[1] = 0.0;
  appint_ros_example_B.Mq[3] = t3;

  /* Delay: '<Root>/Delay1' */
  appint_ros_example_B.Delay1[0] = appint_ros_example_DW.Delay1_DSTATE[0];
  appint_ros_example_B.Delay1[1] = appint_ros_example_DW.Delay1_DSTATE[1];

  /* Sum: '<S1>/Add' */
  appint_ros_example_B.Add[0] = appint_ros_example_B.q_set[0] -
    appint_ros_example_B.Delay1[0];
  appint_ros_example_B.Add[1] = appint_ros_example_B.q_set[1] -
    appint_ros_example_B.Delay1[1];

  /* Product: '<S1>/Product' */
  appint_ros_example_B.Product[0] = appint_ros_example_B.param_K[0] *
    appint_ros_example_B.Add[0];
  appint_ros_example_B.Product[1] = appint_ros_example_B.param_K[1] *
    appint_ros_example_B.Add[1];

  /* Delay: '<Root>/Delay2' */
  appint_ros_example_B.Delay2[0] = appint_ros_example_DW.Delay2_DSTATE[0];
  appint_ros_example_B.Delay2[1] = appint_ros_example_DW.Delay2_DSTATE[1];

  /* Sum: '<S1>/Add1' */
  appint_ros_example_B.Add1[0] = appint_ros_example_B.qd_set[0] -
    appint_ros_example_B.Delay2[0];
  appint_ros_example_B.Add1[1] = appint_ros_example_B.qd_set[1] -
    appint_ros_example_B.Delay2[1];

  /* Product: '<S1>/Product1' */
  appint_ros_example_B.Product1[0] = appint_ros_example_B.param_D[0] *
    appint_ros_example_B.Add1[0];
  appint_ros_example_B.Product1[1] = appint_ros_example_B.param_D[1] *
    appint_ros_example_B.Add1[1];

  /* Sum: '<S1>/Add2' */
  appint_ros_example_B.Add2[0] = appint_ros_example_B.Product[0] +
    appint_ros_example_B.Product1[0];
  appint_ros_example_B.Add2[1] = appint_ros_example_B.Product[1] +
    appint_ros_example_B.Product1[1];

  /* MATLAB Function: '<S5>/MATLAB Function' incorporates:
   *  Constant: '<S2>/Constant'
   *  Constant: '<S5>/Constant5'
   *  Constant: '<S5>/Constant6'
   *  Constant: '<S5>/Constant7'
   */
  t3 = sin(appint_ros_example_B.q[0]);
  t5 = cos(appint_ros_example_B.q[0]);
  appint_ros_example_B.taug[0] = (appint_ros_example_P.Constant5_Value[1] * t3 *
    appint_ros_example_P.Constant7_Value_h[1] +
    appint_ros_example_P.Constant5_Value[2] * t5 * appint_ros_example_P.pkin) *
    appint_ros_example_P.g_base[2];
  appint_ros_example_B.taug[1] = 0.0;

  /* MATLAB Function: '<S4>/coriolisvec_fcn' incorporates:
   *  Constant: '<S4>/Constant5'
   */
  t7 = sin(appint_ros_example_B.q[0]);
  t26 = sin(appint_ros_example_B.q[1]);
  t28 = cos(appint_ros_example_B.q[1]);
  t5 = appint_ros_example_P.Constant5_Value_m[2] -
    appint_ros_example_P.Constant5_Value_m[5];
  t65 = t5 * t28 * t26;
  t15 = t7 * t65;
  t22 = t26 * t26;
  t24 = t28 * t28;
  t39 = appint_ros_example_P.Constant5_Value_m[2] * t24 +
    appint_ros_example_P.Constant5_Value_m[5] * t22;
  t28 = 2.0 * appint_ros_example_B.qD[1];
  t3 = -appint_ros_example_P.Constant5_Value_m[8] + t39;
  t26 = t7 * t3;
  t23 = t7 * t7;
  t29 = cos(appint_ros_example_B.q[0]);
  t25 = t29 * t29;
  t8 = appint_ros_example_P.Constant5_Value_m[8] * t25 + t39 * t23;
  t62 = t7 / 2.0;
  t61 = -t29 / 2.0;
  t60 = t29 / 2.0;
  t11 = t29 * t26;
  t59 = t11 * t7;
  t58 = t11 * t29;
  t14 = t29 * t65;
  t57 = t14 * t29;
  t56 = t15 * t7;
  t55 = t8 * t7;
  t17 = t23 * appint_ros_example_P.Constant5_Value_m[8] + t25 * t39;
  t39 = t17 * t29;
  t47 = appint_ros_example_B.qD[0] * t29;
  t13 = t14 * appint_ros_example_B.qD[0];
  t9 = (t22 - t24) * t5;
  t5 = appint_ros_example_B.qD[1] * t9;
  t22 = t7 * t5 - t13;
  t24 = appint_ros_example_B.qD[0] * t65;
  t5 = t7 * t24 + t29 * t5;
  t40 = -t5 * t7 + t22 * t29;
  t38 = appint_ros_example_B.qD[1] * t65;
  t12 = t7 * t14;
  t35 = (t8 * t29 - t59) * appint_ros_example_B.qD[1];
  t34 = (-t17 * t7 + t58) * appint_ros_example_B.qD[1];
  t10 = t9 * t29;
  t9 *= t7;
  t8 = -t8 + t17;
  t3 = (-t23 + t25) * appint_ros_example_B.qD[0] * t3 + -t12 * t28;
  t17 = -t15 * appint_ros_example_B.qD[0] + t35;
  t1 = -t13 + t34;
  appint_ros_example_B.tauc[0] = ((((((-t7 * t8 - t55) + t58) * t61 + ((t29 * t8
    - t39) + t59) * t62) * appint_ros_example_B.qD[1] + ((t17 * t62 - t13 * t61)
    + t1 * t60)) + ((1.5 * t56 + t57) + 2.0 * t65) * appint_ros_example_B.qD[0])
    + t40) * appint_ros_example_B.qD[1];
  appint_ros_example_B.tauc[1] = ((((((t56 + t57) * appint_ros_example_B.qD[0] +
    t40) * appint_ros_example_B.qD[0] / 2.0 - ((((-t25 * t38 - t47 * t26) *
    (-2.0 * t7) + t3 * t29) + (-t39 - t59) * appint_ros_example_B.qD[0]) * t28 +
    t5 * appint_ros_example_B.qD[0]) * t7 / 2.0) + ((((appint_ros_example_B.qD[0]
    * t11 - t23 * t38) * (2.0 * t29) - t3 * t7) + (-t55 - t58) *
    appint_ros_example_B.qD[0]) * t28 + t22 * appint_ros_example_B.qD[0]) * t60)
    - (t1 + t34) * t47 / 2.0) + (((t12 * t7 - t23 * t14) * t28 + t9 *
    appint_ros_example_B.qD[0]) * t61 + ((-t12 * t29 + t15 * t25) * t28 + t10 *
    appint_ros_example_B.qD[0]) * t62) * appint_ros_example_B.qD[1]) - (((t17 +
    t35) * t7 + 2.0 * t24) + (-t10 * t7 + t9 * t29) * appint_ros_example_B.qD[1])
    * appint_ros_example_B.qD[0] / 2.0;

  /* Sum: '<S2>/Sum3' */
  appint_ros_example_B.tau_acc[0] = (appint_ros_example_B.Add2[0] -
    appint_ros_example_B.taug[0]) - appint_ros_example_B.tauc[0];
  appint_ros_example_B.tau_acc[1] = (appint_ros_example_B.Add2[1] -
    appint_ros_example_B.taug[1]) - appint_ros_example_B.tauc[1];

  /* MATLAB Function: '<S2>/mFcn_Minv' */
  if (fabs(appint_ros_example_B.Mq[1]) > fabs(appint_ros_example_B.Mq[0])) {
    i = 1;
    r2 = 0;
  } else {
    i = 0;
    r2 = 1;
  }

  t7 = appint_ros_example_B.Mq[r2] / appint_ros_example_B.Mq[i];
  appint_ros_example_B.q_ddot[1] = (appint_ros_example_B.tau_acc[r2] -
    appint_ros_example_B.tau_acc[i] * t7) / (appint_ros_example_B.Mq[2 + r2] -
    appint_ros_example_B.Mq[2 + i] * t7);
  appint_ros_example_B.q_ddot[0] = (appint_ros_example_B.tau_acc[i] -
    appint_ros_example_B.Mq[2 + i] * appint_ros_example_B.q_ddot[1]) /
    appint_ros_example_B.Mq[i];

  /* End of MATLAB Function: '<S2>/mFcn_Minv' */
  /* RelationalOperator: '<S3>/Relational Operator1' incorporates:
   *  Constant: '<S3>/Constant'
   */
  appint_ros_example_B.RelationalOperator1 =
    (appint_ros_example_B.ros_rt_interface_pcu2.state ==
     appint_ros_example_P.Constant_Value);

  /* Switch: '<S3>/Switch2' incorporates:
   *  Constant: '<S3>/Constant1'
   */
  if (appint_ros_example_B.RelationalOperator1) {
    appint_ros_example_B.Switch2 =
      appint_ros_example_B.ros_rt_interface_pcu2.state;
  } else {
    appint_ros_example_B.Switch2 = appint_ros_example_P.Constant1_Value;
  }

  /* End of Switch: '<S3>/Switch2' */
}

/* Model update function */
void appint_ros_example_update(void)
{
  /* Update for Delay: '<Root>/Delay' */
  appint_ros_example_DW.Delay_1_DSTATE = appint_ros_example_B.Switch2;
  appint_ros_example_DW.Delay_2_DSTATE[0] = appint_ros_example_B.q[0];
  appint_ros_example_DW.Delay_2_DSTATE[1] = appint_ros_example_B.q[1];
  appint_ros_example_DW.Delay_3_DSTATE[0] = appint_ros_example_B.qD[0];
  appint_ros_example_DW.Delay_3_DSTATE[1] = appint_ros_example_B.qD[1];

  /* Update for DiscreteIntegrator: '<S2>/Discrete-Time Integrator1' */
  appint_ros_example_DW.DiscreteTimeIntegrator1_DSTATE[0] +=
    appint_ros_example_P.DiscreteTimeIntegrator1_gainval *
    appint_ros_example_B.qD[0];
  appint_ros_example_DW.DiscreteTimeIntegrator1_DSTATE[1] +=
    appint_ros_example_P.DiscreteTimeIntegrator1_gainval *
    appint_ros_example_B.qD[1];

  /* Update for DiscreteIntegrator: '<S2>/Discrete-Time Integrator' */
  appint_ros_example_DW.DiscreteTimeIntegrator_DSTATE[0] +=
    appint_ros_example_P.DiscreteTimeIntegrator_gainval *
    appint_ros_example_B.q_ddot[0];
  appint_ros_example_DW.DiscreteTimeIntegrator_DSTATE[1] +=
    appint_ros_example_P.DiscreteTimeIntegrator_gainval *
    appint_ros_example_B.q_ddot[1];

  /* Update for Delay: '<Root>/Delay1' */
  appint_ros_example_DW.Delay1_DSTATE[0] = appint_ros_example_B.q[0];
  appint_ros_example_DW.Delay1_DSTATE[1] = appint_ros_example_B.q[1];

  /* Update for Delay: '<Root>/Delay2' */
  appint_ros_example_DW.Delay2_DSTATE[0] = appint_ros_example_B.qD[0];
  appint_ros_example_DW.Delay2_DSTATE[1] = appint_ros_example_B.qD[1];

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++appint_ros_example_M->Timing.clockTick0)) {
    ++appint_ros_example_M->Timing.clockTickH0;
  }

  appint_ros_example_M->Timing.t[0] = appint_ros_example_M->Timing.clockTick0 *
    appint_ros_example_M->Timing.stepSize0 +
    appint_ros_example_M->Timing.clockTickH0 *
    appint_ros_example_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void appint_ros_example_initialize(void)
{
  /* Start for S-Function (ros_rt_interface_pcu): '<Root>/ros_rt_interface_pcu2' */
  SL_start_func();

  /* InitializeConditions for Delay: '<Root>/Delay' */
  appint_ros_example_DW.Delay_1_DSTATE =
    appint_ros_example_P.Delay_1_InitialCondition;
  appint_ros_example_DW.Delay_2_DSTATE[0] =
    appint_ros_example_P.Delay_2_InitialCondition;
  appint_ros_example_DW.Delay_3_DSTATE[0] =
    appint_ros_example_P.Delay_3_InitialCondition;

  /* InitializeConditions for DiscreteIntegrator: '<S2>/Discrete-Time Integrator1' */
  appint_ros_example_DW.DiscreteTimeIntegrator1_DSTATE[0] =
    appint_ros_example_P.q_t0[0];

  /* InitializeConditions for DiscreteIntegrator: '<S2>/Discrete-Time Integrator' */
  appint_ros_example_DW.DiscreteTimeIntegrator_DSTATE[0] =
    appint_ros_example_P.qD_t0[0];

  /* InitializeConditions for Delay: '<Root>/Delay1' */
  appint_ros_example_DW.Delay1_DSTATE[0] =
    appint_ros_example_P.Delay1_InitialCondition;

  /* InitializeConditions for Delay: '<Root>/Delay2' */
  appint_ros_example_DW.Delay2_DSTATE[0] =
    appint_ros_example_P.Delay2_InitialCondition;

  /* InitializeConditions for Delay: '<Root>/Delay' */
  appint_ros_example_DW.Delay_2_DSTATE[1] =
    appint_ros_example_P.Delay_2_InitialCondition;
  appint_ros_example_DW.Delay_3_DSTATE[1] =
    appint_ros_example_P.Delay_3_InitialCondition;

  /* InitializeConditions for DiscreteIntegrator: '<S2>/Discrete-Time Integrator1' */
  appint_ros_example_DW.DiscreteTimeIntegrator1_DSTATE[1] =
    appint_ros_example_P.q_t0[1];

  /* InitializeConditions for DiscreteIntegrator: '<S2>/Discrete-Time Integrator' */
  appint_ros_example_DW.DiscreteTimeIntegrator_DSTATE[1] =
    appint_ros_example_P.qD_t0[1];

  /* InitializeConditions for Delay: '<Root>/Delay1' */
  appint_ros_example_DW.Delay1_DSTATE[1] =
    appint_ros_example_P.Delay1_InitialCondition;

  /* InitializeConditions for Delay: '<Root>/Delay2' */
  appint_ros_example_DW.Delay2_DSTATE[1] =
    appint_ros_example_P.Delay2_InitialCondition;
}

/* Model terminate function */
void appint_ros_example_terminate(void)
{
  /* Terminate for S-Function (ros_rt_interface_pcu): '<Root>/ros_rt_interface_pcu2' */
  SL_terminate_func();
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/
void MdlOutputs(int_T tid)
{
  appint_ros_example_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  appint_ros_example_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  appint_ros_example_initialize();
}

void MdlTerminate(void)
{
  appint_ros_example_terminate();
}

/* Registration function */
RT_MODEL_appint_ros_example_T *appint_ros_example(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)appint_ros_example_M, 0,
                sizeof(RT_MODEL_appint_ros_example_T));

  /* Initialize timing info */
  {
    int_T *mdlTsMap = appint_ros_example_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    appint_ros_example_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    appint_ros_example_M->Timing.sampleTimes =
      (&appint_ros_example_M->Timing.sampleTimesArray[0]);
    appint_ros_example_M->Timing.offsetTimes =
      (&appint_ros_example_M->Timing.offsetTimesArray[0]);

    /* task periods */
    appint_ros_example_M->Timing.sampleTimes[0] = (0.001);

    /* task offsets */
    appint_ros_example_M->Timing.offsetTimes[0] = (0.0);
  }

  rtmSetTPtr(appint_ros_example_M, &appint_ros_example_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = appint_ros_example_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    appint_ros_example_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(appint_ros_example_M, -1);
  appint_ros_example_M->Timing.stepSize0 = 0.001;

  /* External mode info */
  appint_ros_example_M->Sizes.checksums[0] = (2182886651U);
  appint_ros_example_M->Sizes.checksums[1] = (3610595666U);
  appint_ros_example_M->Sizes.checksums[2] = (2948150583U);
  appint_ros_example_M->Sizes.checksums[3] = (2897780269U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[5];
    appint_ros_example_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(appint_ros_example_M->extModeInfo,
      &appint_ros_example_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(appint_ros_example_M->extModeInfo,
                        appint_ros_example_M->Sizes.checksums);
    rteiSetTPtr(appint_ros_example_M->extModeInfo, rtmGetTPtr
                (appint_ros_example_M));
  }

  appint_ros_example_M->solverInfoPtr = (&appint_ros_example_M->solverInfo);
  appint_ros_example_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&appint_ros_example_M->solverInfo, 0.001);
  rtsiSetSolverMode(&appint_ros_example_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  appint_ros_example_M->blockIO = ((void *) &appint_ros_example_B);
  (void) memset(((void *) &appint_ros_example_B), 0,
                sizeof(B_appint_ros_example_T));

  /* parameters */
  appint_ros_example_M->defaultParam = ((real_T *)&appint_ros_example_P);

  /* states (dwork) */
  appint_ros_example_M->dwork = ((void *) &appint_ros_example_DW);
  (void) memset((void *)&appint_ros_example_DW, 0,
                sizeof(DW_appint_ros_example_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    appint_ros_example_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 17;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize DataMapInfo substructure containing ModelMap for C API */
  appint_ros_example_InitializeDataMapInfo();

  /* Initialize Sizes */
  appint_ros_example_M->Sizes.numContStates = (0);/* Number of continuous states */
  appint_ros_example_M->Sizes.numY = (0);/* Number of model outputs */
  appint_ros_example_M->Sizes.numU = (0);/* Number of model inputs */
  appint_ros_example_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  appint_ros_example_M->Sizes.numSampTimes = (1);/* Number of sample times */
  appint_ros_example_M->Sizes.numBlocks = (46);/* Number of blocks */
  appint_ros_example_M->Sizes.numBlockIO = (26);/* Number of block outputs */
  appint_ros_example_M->Sizes.numBlockPrms = (94);/* Sum of parameter "widths" */
  return appint_ros_example_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
