  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (appint_ros_example_P)
    ;%
      section.nData     = 18;
      section.data(18)  = dumData; %prealloc
      
	  ;% appint_ros_example_P.g_base
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% appint_ros_example_P.pkin
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 3;
	
	  ;% appint_ros_example_P.qD_t0
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 4;
	
	  ;% appint_ros_example_P.q_t0
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 6;
	
	  ;% appint_ros_example_P.Delay_2_InitialCondition
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 8;
	
	  ;% appint_ros_example_P.Delay_3_InitialCondition
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 9;
	
	  ;% appint_ros_example_P.DiscreteTimeIntegrator1_gainval
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 10;
	
	  ;% appint_ros_example_P.DiscreteTimeIntegrator_gainval
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 11;
	
	  ;% appint_ros_example_P.Constant7_Value
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 12;
	
	  ;% appint_ros_example_P.Constant8_Value
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 15;
	
	  ;% appint_ros_example_P.Constant9_Value
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 24;
	
	  ;% appint_ros_example_P.Delay1_InitialCondition
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 42;
	
	  ;% appint_ros_example_P.Delay2_InitialCondition
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 43;
	
	  ;% appint_ros_example_P.Constant5_Value
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 44;
	
	  ;% appint_ros_example_P.Constant7_Value_h
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 47;
	
	  ;% appint_ros_example_P.Constant7_Value_c
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 56;
	
	  ;% appint_ros_example_P.Constant8_Value_k
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 59;
	
	  ;% appint_ros_example_P.Constant5_Value_m
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 68;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% appint_ros_example_P.Delay_1_DelayLength
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
	  ;% appint_ros_example_P.Delay_2_DelayLength
	  section.data(2).logicalSrcIdx = 19;
	  section.data(2).dtTransOffset = 1;
	
	  ;% appint_ros_example_P.Delay_3_DelayLength
	  section.data(3).logicalSrcIdx = 20;
	  section.data(3).dtTransOffset = 2;
	
	  ;% appint_ros_example_P.Delay1_DelayLength
	  section.data(4).logicalSrcIdx = 21;
	  section.data(4).dtTransOffset = 3;
	
	  ;% appint_ros_example_P.Delay2_DelayLength
	  section.data(5).logicalSrcIdx = 22;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% appint_ros_example_P.Delay_1_InitialCondition
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
	  ;% appint_ros_example_P.Constant_Value
	  section.data(2).logicalSrcIdx = 24;
	  section.data(2).dtTransOffset = 1;
	
	  ;% appint_ros_example_P.Constant1_Value
	  section.data(3).logicalSrcIdx = 25;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (appint_ros_example_B)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% appint_ros_example_B.ros_rt_interface_pcu2
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% appint_ros_example_B.BusConversion_InsertedFor_ros_r
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 21;
      section.data(21)  = dumData; %prealloc
      
	  ;% appint_ros_example_B.q_meas
	  section.data(1).logicalSrcIdx = 2;
	  section.data(1).dtTransOffset = 0;
	
	  ;% appint_ros_example_B.qd_meas
	  section.data(2).logicalSrcIdx = 3;
	  section.data(2).dtTransOffset = 2;
	
	  ;% appint_ros_example_B.param_D
	  section.data(3).logicalSrcIdx = 4;
	  section.data(3).dtTransOffset = 4;
	
	  ;% appint_ros_example_B.param_K
	  section.data(4).logicalSrcIdx = 5;
	  section.data(4).dtTransOffset = 6;
	
	  ;% appint_ros_example_B.q_set
	  section.data(5).logicalSrcIdx = 6;
	  section.data(5).dtTransOffset = 8;
	
	  ;% appint_ros_example_B.qd_set
	  section.data(6).logicalSrcIdx = 7;
	  section.data(6).dtTransOffset = 10;
	
	  ;% appint_ros_example_B.FMext
	  section.data(7).logicalSrcIdx = 8;
	  section.data(7).dtTransOffset = 12;
	
	  ;% appint_ros_example_B.q
	  section.data(8).logicalSrcIdx = 9;
	  section.data(8).dtTransOffset = 18;
	
	  ;% appint_ros_example_B.qD
	  section.data(9).logicalSrcIdx = 10;
	  section.data(9).dtTransOffset = 20;
	
	  ;% appint_ros_example_B.Delay1
	  section.data(10).logicalSrcIdx = 11;
	  section.data(10).dtTransOffset = 22;
	
	  ;% appint_ros_example_B.Add
	  section.data(11).logicalSrcIdx = 12;
	  section.data(11).dtTransOffset = 24;
	
	  ;% appint_ros_example_B.Product
	  section.data(12).logicalSrcIdx = 13;
	  section.data(12).dtTransOffset = 26;
	
	  ;% appint_ros_example_B.Delay2
	  section.data(13).logicalSrcIdx = 14;
	  section.data(13).dtTransOffset = 28;
	
	  ;% appint_ros_example_B.Add1
	  section.data(14).logicalSrcIdx = 15;
	  section.data(14).dtTransOffset = 30;
	
	  ;% appint_ros_example_B.Product1
	  section.data(15).logicalSrcIdx = 16;
	  section.data(15).dtTransOffset = 32;
	
	  ;% appint_ros_example_B.Add2
	  section.data(16).logicalSrcIdx = 17;
	  section.data(16).dtTransOffset = 34;
	
	  ;% appint_ros_example_B.tau_acc
	  section.data(17).logicalSrcIdx = 18;
	  section.data(17).dtTransOffset = 36;
	
	  ;% appint_ros_example_B.q_ddot
	  section.data(18).logicalSrcIdx = 19;
	  section.data(18).dtTransOffset = 38;
	
	  ;% appint_ros_example_B.Mq
	  section.data(19).logicalSrcIdx = 20;
	  section.data(19).dtTransOffset = 40;
	
	  ;% appint_ros_example_B.taug
	  section.data(20).logicalSrcIdx = 21;
	  section.data(20).dtTransOffset = 44;
	
	  ;% appint_ros_example_B.tauc
	  section.data(21).logicalSrcIdx = 22;
	  section.data(21).dtTransOffset = 46;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% appint_ros_example_B.sl_state
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
	  ;% appint_ros_example_B.Switch2
	  section.data(2).logicalSrcIdx = 24;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% appint_ros_example_B.RelationalOperator1
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 5;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (appint_ros_example_DW)
    ;%
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% appint_ros_example_DW.Delay_2_DSTATE
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% appint_ros_example_DW.Delay_3_DSTATE
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 2;
	
	  ;% appint_ros_example_DW.DiscreteTimeIntegrator1_DSTATE
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 4;
	
	  ;% appint_ros_example_DW.DiscreteTimeIntegrator_DSTATE
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 6;
	
	  ;% appint_ros_example_DW.Delay1_DSTATE
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 8;
	
	  ;% appint_ros_example_DW.Delay2_DSTATE
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 10;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% appint_ros_example_DW.SL_IN_Scope_PWORK.LoggedData
	  section.data(1).logicalSrcIdx = 6;
	  section.data(1).dtTransOffset = 0;
	
	  ;% appint_ros_example_DW.SL_OUT_PWORK.LoggedData
	  section.data(2).logicalSrcIdx = 7;
	  section.data(2).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% appint_ros_example_DW.Delay_1_DSTATE
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 2182886651;
  targMap.checksum1 = 3610595666;
  targMap.checksum2 = 2948150583;
  targMap.checksum3 = 2897780269;

