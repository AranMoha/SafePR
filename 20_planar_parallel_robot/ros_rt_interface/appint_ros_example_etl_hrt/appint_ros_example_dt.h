/*
 * appint_ros_example_dt.h
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

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(struct_idxjOXAN4M7VaCLZjzTfzF),
  sizeof(SL_OUT_type),
  sizeof(SL_IN_type)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "struct_idxjOXAN4M7VaCLZjzTfzF",
  "SL_OUT_type",
  "SL_IN_type"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&appint_ros_example_B.ros_rt_interface_pcu2), 16, 0, 1 },

  { (char_T *)(&appint_ros_example_B.BusConversion_InsertedFor_ros_r), 15, 0, 1
  },

  { (char_T *)(&appint_ros_example_B.q_meas[0]), 0, 0, 48 },

  { (char_T *)(&appint_ros_example_B.sl_state), 3, 0, 2 },

  { (char_T *)(&appint_ros_example_B.RelationalOperator1), 8, 0, 1 }
  ,

  { (char_T *)(&appint_ros_example_DW.Delay_2_DSTATE[0]), 0, 0, 12 },

  { (char_T *)(&appint_ros_example_DW.SL_IN_Scope_PWORK.LoggedData[0]), 11, 0, 9
  },

  { (char_T *)(&appint_ros_example_DW.Delay_1_DSTATE), 3, 0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  8U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&appint_ros_example_P.g_base[0]), 0, 0, 86 },

  { (char_T *)(&appint_ros_example_P.Delay_1_DelayLength), 7, 0, 5 },

  { (char_T *)(&appint_ros_example_P.Delay_1_InitialCondition), 3, 0, 3 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  3U,
  rtPTransitions
};

/* [EOF] appint_ros_example_dt.h */
