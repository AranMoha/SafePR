/*
 * appint_ros_example_capi.c
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

#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "appint_ros_example_capi_host.h"
#define sizeof(s)                      ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el)              ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s)               (s)
#else                                  /* HOST_CAPI_BUILD */
#include "builtin_typeid_types.h"
#include "appint_ros_example.h"
#include "appint_ros_example_capi.h"
#include "appint_ros_example_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               (NULL)
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif                                 /* HOST_CAPI_BUILD */

/* Block output signal information */
static const rtwCAPI_Signals rtBlockSignals[] = {
  /* addrMapIndex, sysNum, blockPath,
   * signalName, portNumber, dataTypeIndex, dimIndex, fxpIndex, sTimeIndex
   */
  { 0, 0, TARGET_STRING("appint_ros_example/ros_rt_interface_pcu2"),
    TARGET_STRING(""), 0, 2, 0, 0, 0 },

  { 1, 0, TARGET_STRING("appint_ros_example/Delay"),
    TARGET_STRING("sl_state"), 0, 0, 0, 0, 0 },

  { 2, 0, TARGET_STRING("appint_ros_example/Delay"),
    TARGET_STRING("q_meas"), 0, 1, 1, 0, 0 },

  { 3, 0, TARGET_STRING("appint_ros_example/Delay"),
    TARGET_STRING("qd_meas"), 0, 1, 1, 0, 0 },

  { 4, 0, TARGET_STRING("appint_ros_example/Delay1"),
    TARGET_STRING(""), 0, 1, 1, 0, 0 },

  { 5, 0, TARGET_STRING("appint_ros_example/Delay2"),
    TARGET_STRING(""), 0, 1, 1, 0, 0 },

  { 6, 0, TARGET_STRING("appint_ros_example/PD_Regler/Product"),
    TARGET_STRING(""), 0, 1, 3, 0, 0 },

  { 7, 0, TARGET_STRING("appint_ros_example/PD_Regler/Product1"),
    TARGET_STRING(""), 0, 1, 3, 0, 0 },

  { 8, 0, TARGET_STRING("appint_ros_example/PD_Regler/Add"),
    TARGET_STRING(""), 0, 1, 3, 0, 0 },

  { 9, 0, TARGET_STRING("appint_ros_example/PD_Regler/Add1"),
    TARGET_STRING(""), 0, 1, 3, 0, 0 },

  { 10, 0, TARGET_STRING("appint_ros_example/PD_Regler/Add2"),
    TARGET_STRING(""), 0, 1, 3, 0, 0 },

  { 11, 4, TARGET_STRING(
    "appint_ros_example/forearmbot_fordyn_fixb_vp1/mFcn_Minv"),
    TARGET_STRING("qDD"), 0, 1, 1, 0, 0 },

  { 12, 0, TARGET_STRING(
    "appint_ros_example/forearmbot_fordyn_fixb_vp1/Discrete-Time Integrator"),
    TARGET_STRING("qD"), 0, 1, 1, 0, 0 },

  { 13, 0, TARGET_STRING(
    "appint_ros_example/forearmbot_fordyn_fixb_vp1/Discrete-Time Integrator1"),
    TARGET_STRING("q"), 0, 1, 1, 0, 0 },

  { 14, 0, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/Sum3"),
    TARGET_STRING("tau_acc"), 0, 1, 1, 0, 0 },

  { 15, 0, TARGET_STRING(
    "appint_ros_example/state_manager_dummy/Relational Operator1"),
    TARGET_STRING(""), 0, 3, 0, 0, 0 },

  { 16, 0, TARGET_STRING("appint_ros_example/state_manager_dummy/Switch2"),
    TARGET_STRING(""), 0, 0, 0, 0, 0 },

  { 17, 1, TARGET_STRING(
    "appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_coriolisvec_fixb/coriolisvec_fcn"),
    TARGET_STRING(""), 0, 1, 1, 0, 0 },

  { 18, 2, TARGET_STRING(
    "appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_gravload/MATLAB Function"),
    TARGET_STRING(""), 0, 1, 1, 0, 0 },

  { 19, 3, TARGET_STRING(
    "appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_inertiaJ/inertiajoint_fcn"),
    TARGET_STRING(""), 0, 1, 4, 0, 0 },

  {
    0, 0, (NULL), (NULL), 0, 0, 0, 0, 0
  }
};

static const rtwCAPI_BlockParameters rtBlockParameters[] = {
  /* addrMapIndex, blockPath,
   * paramName, dataTypeIndex, dimIndex, fixPtIdx
   */
  { 20, TARGET_STRING("appint_ros_example/Delay1"),
    TARGET_STRING("DelayLength"), 4, 0, 0 },

  { 21, TARGET_STRING("appint_ros_example/Delay1"),
    TARGET_STRING("InitialCondition"), 1, 0, 0 },

  { 22, TARGET_STRING("appint_ros_example/Delay2"),
    TARGET_STRING("DelayLength"), 4, 0, 0 },

  { 23, TARGET_STRING("appint_ros_example/Delay2"),
    TARGET_STRING("InitialCondition"), 1, 0, 0 },

  { 24, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/Discrete-Time Integrator"),
    TARGET_STRING("gainval"), 1, 0, 0 },

  { 25, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/Discrete-Time Integrator1"),
    TARGET_STRING("gainval"), 1, 0, 0 },

  { 26, TARGET_STRING("appint_ros_example/state_manager_dummy/Constant"),
    TARGET_STRING("Value"), 0, 0, 0 },

  { 27, TARGET_STRING("appint_ros_example/state_manager_dummy/Constant1"),
    TARGET_STRING("Value"), 0, 0, 0 },

  { 28, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_coriolisvec_fixb/Constant5"),
    TARGET_STRING("Value"), 1, 5, 0 },

  { 29, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_coriolisvec_fixb/Constant7"),
    TARGET_STRING("Value"), 1, 6, 0 },

  { 30, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_coriolisvec_fixb/Constant8"),
    TARGET_STRING("Value"), 1, 7, 0 },

  { 31, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_gravload/Constant5"),
    TARGET_STRING("Value"), 1, 6, 0 },

  { 32, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_gravload/Constant7"),
    TARGET_STRING("Value"), 1, 7, 0 },

  { 33, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_inertiaJ/Constant7"),
    TARGET_STRING("Value"), 1, 6, 0 },

  { 34, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_inertiaJ/Constant8"),
    TARGET_STRING("Value"), 1, 7, 0 },

  { 35, TARGET_STRING("appint_ros_example/forearmbot_fordyn_fixb_vp1/forearmbot_inertiaJ/Constant9"),
    TARGET_STRING("Value"), 1, 5, 0 },

  {
    0, (NULL), (NULL), 0, 0, 0
  }
};

/* Tunable variable parameters */
static const rtwCAPI_ModelParameters rtModelParameters[] = {
  /* addrMapIndex, varName, dataTypeIndex, dimIndex, fixPtIndex */
  { 36, TARGET_STRING("g_base"), 1, 6, 0 },

  { 37, TARGET_STRING("pkin"), 1, 0, 0 },

  { 38, TARGET_STRING("qD_t0"), 1, 1, 0 },

  { 39, TARGET_STRING("q_t0"), 1, 1, 0 },

  { 0, (NULL), 0, 0, 0 }
};

#ifndef HOST_CAPI_BUILD

/* Declare Data Addresses statically */
static void* rtDataAddrMap[] = {
  &appint_ros_example_B.ros_rt_interface_pcu2,/* 0: Signal */
  &appint_ros_example_B.sl_state,      /* 1: Signal */
  &appint_ros_example_B.q_meas[0],     /* 2: Signal */
  &appint_ros_example_B.qd_meas[0],    /* 3: Signal */
  &appint_ros_example_B.Delay1[0],     /* 4: Signal */
  &appint_ros_example_B.Delay2[0],     /* 5: Signal */
  &appint_ros_example_B.Product[0],    /* 6: Signal */
  &appint_ros_example_B.Product1[0],   /* 7: Signal */
  &appint_ros_example_B.Add[0],        /* 8: Signal */
  &appint_ros_example_B.Add1[0],       /* 9: Signal */
  &appint_ros_example_B.Add2[0],       /* 10: Signal */
  &appint_ros_example_B.q_ddot[0],     /* 11: Signal */
  &appint_ros_example_B.qD[0],         /* 12: Signal */
  &appint_ros_example_B.q[0],          /* 13: Signal */
  &appint_ros_example_B.tau_acc[0],    /* 14: Signal */
  &appint_ros_example_B.RelationalOperator1,/* 15: Signal */
  &appint_ros_example_B.Switch2,       /* 16: Signal */
  &appint_ros_example_B.tauc[0],       /* 17: Signal */
  &appint_ros_example_B.taug[0],       /* 18: Signal */
  &appint_ros_example_B.Mq[0],         /* 19: Signal */
  &appint_ros_example_P.Delay1_DelayLength,/* 20: Block Parameter */
  &appint_ros_example_P.Delay1_InitialCondition,/* 21: Block Parameter */
  &appint_ros_example_P.Delay2_DelayLength,/* 22: Block Parameter */
  &appint_ros_example_P.Delay2_InitialCondition,/* 23: Block Parameter */
  &appint_ros_example_P.DiscreteTimeIntegrator_gainval,/* 24: Block Parameter */
  &appint_ros_example_P.DiscreteTimeIntegrator1_gainval,/* 25: Block Parameter */
  &appint_ros_example_P.Constant_Value,/* 26: Block Parameter */
  &appint_ros_example_P.Constant1_Value,/* 27: Block Parameter */
  &appint_ros_example_P.Constant5_Value_m[0],/* 28: Block Parameter */
  &appint_ros_example_P.Constant7_Value_c[0],/* 29: Block Parameter */
  &appint_ros_example_P.Constant8_Value_k[0],/* 30: Block Parameter */
  &appint_ros_example_P.Constant5_Value[0],/* 31: Block Parameter */
  &appint_ros_example_P.Constant7_Value_h[0],/* 32: Block Parameter */
  &appint_ros_example_P.Constant7_Value[0],/* 33: Block Parameter */
  &appint_ros_example_P.Constant8_Value[0],/* 34: Block Parameter */
  &appint_ros_example_P.Constant9_Value[0],/* 35: Block Parameter */
  &appint_ros_example_P.g_base[0],     /* 36: Model Parameter */
  &appint_ros_example_P.pkin,          /* 37: Model Parameter */
  &appint_ros_example_P.qD_t0[0],      /* 38: Model Parameter */
  &appint_ros_example_P.q_t0[0],       /* 39: Model Parameter */
};

/* Declare Data Run-Time Dimension Buffer Addresses statically */
static int32_T* rtVarDimsAddrMap[] = {
  (NULL)
};

#endif

/* Data Type Map - use dataTypeMapIndex to access this structure */
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap[] = {
  /* cName, mwName, numElements, elemMapIndex, dataSize, slDataId, *
   * isComplex, isPointer */
  { "unsigned char", "uint8_T", 0, 0, sizeof(uint8_T), SS_UINT8, 0, 0 },

  { "double", "real_T", 0, 0, sizeof(real_T), SS_DOUBLE, 0, 0 },

  { "struct", "SL_IN_type", 6, 1, sizeof(SL_IN_type), SS_STRUCT, 0, 0 },

  { "unsigned char", "boolean_T", 0, 0, sizeof(boolean_T), SS_BOOLEAN, 0, 0 },

  { "unsigned int", "uint32_T", 0, 0, sizeof(uint32_T), SS_UINT32, 0, 0 }
};

#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif

/* Structure Element Map - use elemMapIndex to access this structure */
static TARGET_CONST rtwCAPI_ElementMap rtElementMap[] = {
  /* elementName, elementOffset, dataTypeIndex, dimIndex, fxpIndex */
  { (NULL), 0, 0, 0, 0 },

  { "state", rt_offsetof(SL_IN_type, state), 0, 0, 0 },

  { "param_D", rt_offsetof(SL_IN_type, param_D), 1, 1, 0 },

  { "param_K", rt_offsetof(SL_IN_type, param_K), 1, 1, 0 },

  { "q_set", rt_offsetof(SL_IN_type, q_set), 1, 1, 0 },

  { "qd_set", rt_offsetof(SL_IN_type, qd_set), 1, 1, 0 },

  { "FMext", rt_offsetof(SL_IN_type, FMext), 1, 2, 0 }
};

/* Dimension Map - use dimensionMapIndex to access elements of ths structure*/
static const rtwCAPI_DimensionMap rtDimensionMap[] = {
  /* dataOrientation, dimArrayIndex, numDims, vardimsIndex */
  { rtwCAPI_SCALAR, 0, 2, 0 },

  { rtwCAPI_VECTOR, 2, 2, 0 },

  { rtwCAPI_VECTOR, 4, 2, 0 },

  { rtwCAPI_MATRIX_COL_MAJOR, 2, 2, 0 },

  { rtwCAPI_MATRIX_COL_MAJOR, 6, 2, 0 },

  { rtwCAPI_MATRIX_COL_MAJOR, 8, 2, 0 },

  { rtwCAPI_VECTOR, 10, 2, 0 },

  { rtwCAPI_MATRIX_COL_MAJOR, 12, 2, 0 }
};

/* Dimension Array- use dimArrayIndex to access elements of this array */
static const uint_T rtDimensionArray[] = {
  1,                                   /* 0 */
  1,                                   /* 1 */
  2,                                   /* 2 */
  1,                                   /* 3 */
  6,                                   /* 4 */
  1,                                   /* 5 */
  2,                                   /* 6 */
  2,                                   /* 7 */
  3,                                   /* 8 */
  6,                                   /* 9 */
  3,                                   /* 10 */
  1,                                   /* 11 */
  3,                                   /* 12 */
  3                                    /* 13 */
};

/* C-API stores floating point values in an array. The elements of this  *
 * are unique. This ensures that values which are shared across the model*
 * are stored in the most efficient way. These values are referenced by  *
 *           - rtwCAPI_FixPtMap.fracSlopePtr,                            *
 *           - rtwCAPI_FixPtMap.biasPtr,                                 *
 *           - rtwCAPI_SampleTimeMap.samplePeriodPtr,                    *
 *           - rtwCAPI_SampleTimeMap.sampleOffsetPtr                     */
static const real_T rtcapiStoredFloats[] = {
  0.001, 0.0
};

/* Fixed Point Map */
static const rtwCAPI_FixPtMap rtFixPtMap[] = {
  /* fracSlopePtr, biasPtr, scaleType, wordLength, exponent, isSigned */
  { (NULL), (NULL), rtwCAPI_FIX_RESERVED, 0, 0, 0 },
};

/* Sample Time Map - use sTimeIndex to access elements of ths structure */
static const rtwCAPI_SampleTimeMap rtSampleTimeMap[] = {
  /* samplePeriodPtr, sampleOffsetPtr, tid, samplingMode */
  { (const void *) &rtcapiStoredFloats[0], (const void *) &rtcapiStoredFloats[1],
    0, 0 }
};

static rtwCAPI_ModelMappingStaticInfo mmiStatic = {
  /* Signals:{signals, numSignals,
   *           rootInputs, numRootInputs,
   *           rootOutputs, numRootOutputs},
   * Params: {blockParameters, numBlockParameters,
   *          modelParameters, numModelParameters},
   * States: {states, numStates},
   * Maps:   {dataTypeMap, dimensionMap, fixPtMap,
   *          elementMap, sampleTimeMap, dimensionArray},
   * TargetType: targetType
   */
  { rtBlockSignals, 20,
    (NULL), 0,
    (NULL), 0 },

  { rtBlockParameters, 16,
    rtModelParameters, 4 },

  { (NULL), 0 },

  { rtDataTypeMap, rtDimensionMap, rtFixPtMap,
    rtElementMap, rtSampleTimeMap, rtDimensionArray },
  "float",

  { 2182886651U,
    3610595666U,
    2948150583U,
    2897780269U },
  (NULL), 0,
  0
};

/* Function to get C API Model Mapping Static Info */
const rtwCAPI_ModelMappingStaticInfo*
  appint_ros_example_GetCAPIStaticMap(void)
{
  return &mmiStatic;
}

/* Cache pointers into DataMapInfo substructure of RTModel */
#ifndef HOST_CAPI_BUILD

void appint_ros_example_InitializeDataMapInfo(void)
{
  /* Set C-API version */
  rtwCAPI_SetVersion(appint_ros_example_M->DataMapInfo.mmi, 1);

  /* Cache static C-API data into the Real-time Model Data structure */
  rtwCAPI_SetStaticMap(appint_ros_example_M->DataMapInfo.mmi, &mmiStatic);

  /* Cache static C-API logging data into the Real-time Model Data structure */
  rtwCAPI_SetLoggingStaticMap(appint_ros_example_M->DataMapInfo.mmi, (NULL));

  /* Cache C-API Data Addresses into the Real-Time Model Data structure */
  rtwCAPI_SetDataAddressMap(appint_ros_example_M->DataMapInfo.mmi, rtDataAddrMap);

  /* Cache C-API Data Run-Time Dimension Buffer Addresses into the Real-Time Model Data structure */
  rtwCAPI_SetVarDimsAddressMap(appint_ros_example_M->DataMapInfo.mmi,
    rtVarDimsAddrMap);

  /* Cache the instance C-API logging pointer */
  rtwCAPI_SetInstanceLoggingInfo(appint_ros_example_M->DataMapInfo.mmi, (NULL));

  /* Set reference to submodels */
  rtwCAPI_SetChildMMIArray(appint_ros_example_M->DataMapInfo.mmi, (NULL));
  rtwCAPI_SetChildMMIArrayLen(appint_ros_example_M->DataMapInfo.mmi, 0);
}

#else                                  /* HOST_CAPI_BUILD */
#ifdef __cplusplus

extern "C" {

#endif

  void appint_ros_example_host_InitializeDataMapInfo
    (appint_ros_example_host_DataMapInfo_T *dataMap, const char *path)
  {
    /* Set C-API version */
    rtwCAPI_SetVersion(dataMap->mmi, 1);

    /* Cache static C-API data into the Real-time Model Data structure */
    rtwCAPI_SetStaticMap(dataMap->mmi, &mmiStatic);

    /* host data address map is NULL */
    rtwCAPI_SetDataAddressMap(dataMap->mmi, NULL);

    /* host vardims address map is NULL */
    rtwCAPI_SetVarDimsAddressMap(dataMap->mmi, NULL);

    /* Set Instance specific path */
    rtwCAPI_SetPath(dataMap->mmi, path);
    rtwCAPI_SetFullPath(dataMap->mmi, NULL);

    /* Set reference to submodels */
    rtwCAPI_SetChildMMIArray(dataMap->mmi, (NULL));
    rtwCAPI_SetChildMMIArrayLen(dataMap->mmi, 0);
  }

#ifdef __cplusplus

}
#endif
#endif                                 /* HOST_CAPI_BUILD */

/* EOF: appint_ros_example_capi.c */
