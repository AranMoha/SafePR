/*
 * appint_ros_example_types.h
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

#ifndef RTW_HEADER_appint_ros_example_types_h_
#define RTW_HEADER_appint_ros_example_types_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#include "zero_crossing_types.h"
#include "SL_func.h"
#ifndef DEFINED_TYPEDEF_FOR_struct_idxjOXAN4M7VaCLZjzTfzF_
#define DEFINED_TYPEDEF_FOR_struct_idxjOXAN4M7VaCLZjzTfzF_

typedef struct {
  real_T m[3];
  real_T r_S[9];
  real_T I_S[18];
} struct_idxjOXAN4M7VaCLZjzTfzF;

#endif

/* Parameters (default storage) */
typedef struct P_appint_ros_example_T_ P_appint_ros_example_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_appint_ros_example_T RT_MODEL_appint_ros_example_T;

#endif                                 /* RTW_HEADER_appint_ros_example_types_h_ */
