/*
 * appint_ros_example_data.c
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

#include "appint_ros_example.h"
#include "appint_ros_example_private.h"

/* Block parameters (default storage) */
P_appint_ros_example_T appint_ros_example_P = {
  /* Variable: g_base
   * Referenced by: '<S2>/Constant'
   */
  { 0.0, 0.0, -9.81 },

  /* Variable: pkin
   * Referenced by:
   *   '<S4>/Constant6'
   *   '<S5>/Constant6'
   *   '<S6>/Constant6'
   */
  0.4,

  /* Variable: qD_t0
   * Referenced by: '<S2>/Discrete-Time Integrator'
   */
  { 0.0, 0.0 },

  /* Variable: q_t0
   * Referenced by: '<S2>/Discrete-Time Integrator1'
   */
  { 0.0, 0.0 },

  /* Expression: 0.0
   * Referenced by: '<Root>/Delay'
   */
  0.0,

  /* Expression: 0.0
   * Referenced by: '<Root>/Delay'
   */
  0.0,

  /* Computed Parameter: DiscreteTimeIntegrator1_gainval
   * Referenced by: '<S2>/Discrete-Time Integrator1'
   */
  0.001,

  /* Computed Parameter: DiscreteTimeIntegrator_gainval
   * Referenced by: '<S2>/Discrete-Time Integrator'
   */
  0.001,

  /* Expression: m
   * Referenced by: '<S6>/Constant7'
   */
  { 0.0, 1.0, 2.0 },

  /* Expression: r_S
   * Referenced by: '<S6>/Constant8'
   */
  { 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Expression: I_S
   * Referenced by: '<S6>/Constant9'
   */
  { 0.0, 0.0, 0.2, 0.0, 0.1, 0.2, 0.0, 0.1, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0 },

  /* Expression: 0
   * Referenced by: '<Root>/Delay1'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<Root>/Delay2'
   */
  0.0,

  /* Expression: m
   * Referenced by: '<S5>/Constant5'
   */
  { 0.0, 1.0, 2.0 },

  /* Expression: r_S
   * Referenced by: '<S5>/Constant7'
   */
  { 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Expression: m
   * Referenced by: '<S4>/Constant7'
   */
  { 0.0, 1.0, 2.0 },

  /* Expression: r_S
   * Referenced by: '<S4>/Constant8'
   */
  { 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Expression: I_S
   * Referenced by: '<S4>/Constant5'
   */
  { 0.0, 0.0, 0.2, 0.0, 0.1, 0.2, 0.0, 0.1, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0 },

  /* Computed Parameter: Delay_1_DelayLength
   * Referenced by: '<Root>/Delay'
   */
  1U,

  /* Computed Parameter: Delay_2_DelayLength
   * Referenced by: '<Root>/Delay'
   */
  1U,

  /* Computed Parameter: Delay_3_DelayLength
   * Referenced by: '<Root>/Delay'
   */
  1U,

  /* Computed Parameter: Delay1_DelayLength
   * Referenced by: '<Root>/Delay1'
   */
  1U,

  /* Computed Parameter: Delay2_DelayLength
   * Referenced by: '<Root>/Delay2'
   */
  1U,

  /* Computed Parameter: Delay_1_InitialCondition
   * Referenced by: '<Root>/Delay'
   */
  0U,

  /* Computed Parameter: Constant_Value
   * Referenced by: '<S3>/Constant'
   */
  42U,

  /* Computed Parameter: Constant1_Value
   * Referenced by: '<S3>/Constant1'
   */
  5U
};
