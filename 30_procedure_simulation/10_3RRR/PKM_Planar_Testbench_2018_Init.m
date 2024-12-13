%% Delete and Close
clc 
% clear 
% close all 
% slCharacterEncoding('UTF-8');

%% Initialisierung von Pfaden 
this_path = fileparts(which('PKM_3PRRR_Versuchsstand_Init'));
addpath(fullfile(this_path, 'Libraries/EtherCAT_ConfigSlaves'));
addpath(fullfile(this_path, 'Libraries/KinematicsandDynamics')); 
addpath(fullfile(this_path, 'Libraries/Contact'));
addpath(fullfile(this_path, 'Libraries/mujoco_stl_xml_files'));      
addpath(fullfile(this_path, 'Libraries/mujoco210'));
addpath(fullfile(this_path, 'Libraries/Trajectories'));
addpath(fullfile(this_path, 'Libraries/simulink_custLib'));
addpath(fullfile(this_path, 'ros_rt_interface'));
if exist(fullfile(this_path, 'ros_rt_interface', 'build'), 'dir')~=0
    run(fullfile(this_path, 'ros_rt_interface', 'pcu_ros_load_buses.m')); % Load bus definitions for Simulink
    addpath(fullfile(this_path, 'ros_rt_interface', 'build'));
else
    addpath('C:\Users\mohammad_admin\seadrive_root\aran.moh\Für mich freigegeben\imes-projekt-dfg_mrkpkm\03_Entwicklung\10_3RRR\10_Messdaten\Messdaten');    
end
%% Setting kinematic and dynamic parameters
% Selection of dynamic and safety parameters for real-world test bench
param.Exp = 0;
% Selection of simulation with capsule for contact experiments
param.capsule_active = 1;
% Sampling time in s
param.t_sample=0.01; 
% Thresholds for contact detection, leads to the controller being switched off
param.CollDet_limit_MobPlat = [40;40;2]*1.5;
% Thresholds for soft contact detection, leads to reaction
param.CollDet_limit_MobPlat_soft = [10;10;1];
% Threhsolds for collided-body classification (decision tree)
param.min_dist_threshold = 0.05; % Below this distance, link collision (corresponds to the distance of the line of action to one of the three platform coupling points)
param.min_angle_threshold_deg = 35; % Below this value, parallelism is assumed between the line of action and the vector from the elbow to the platform coupling joint
param.min_torque_threshold = 2.5; % Below this value, it is assumed that the corresponding active joint does not sense the contact force
% Base and platform radii
param.r_BasisPla_MobPla = [0.6829, 0.107 ]; % in m 
% General arm lengths
param.l_all = [0.5816 0.6198]; % in m
% Individual radii of the coupling points on the mobile platform 
param.r_mobPlat_j = [param.r_BasisPla_MobPla(2); param.r_BasisPla_MobPla(2); param.r_BasisPla_MobPla(2)]; % in m
% Angle of the platform coupling points around the vertical axis of the mobile platform
param.beta_j = [0;120; 240]*pi/180; % in rad
% Individual arm lengths 
param.l_1i  = [0.58152 0.62002]; % in m
param.l_2i  = [0.58121 0.61964]; % in m
param.l_3i  = [0.58215 0.61975]; % in m
param.l_all_id = [param.l_1i, param.l_2i, param.l_3i]; % in m
% Individual radii of the coupling points on the mobile platform  
param.r_fixPlat_j = [0.6877; 0.6922; 0.6666]; % in m
% Angle of the base points around the vertical axis of the fixed base
param.psi_j =[90.0000; 210.7631; 330.4901]*pi/180; % in rad
% Distance of the center of gravity of the arms 
param.scj1 = 0.29; % in m
param.scj2 = 0.311; % in m
% Vector of general base, platform radii and arm lengths
param.kin_params =  [param.r_BasisPla_MobPla(1); param.r_BasisPla_MobPla(2); param.l_all(1); param.l_all(2)]; % in m
% Masses of the first, second segment and the mobile platform 
param.m = [2.272; 0.75; 0.642]; % in kg 

% Moments of inertia 
% Rows: Link1, Link2, Platform
% Columns: xx, yy, zz, xy, xz, yz
param.Ifges2 = [0, 0, param.m(1)*param.l_all(1)^2*1/12, 0, 0, 0; 
         0, 0, param.m(2)*param.l_all(2)^2*1/12, 0, 0, 0;
         0, 0,  param.m(3)/2*param.r_BasisPla_MobPla(2)^2, 0, 0, 0];     
% Minimum dynamics parameters with new friction coefficients    
if param.Exp
    param.MDP = [param.l_all(1)^2*param.m(2) + param.m(1)*param.scj1^2 + param.m(2)*param.scj2^2 + param.Ifges2(2,3) + param.Ifges2(1,3); 
           param.m(2)*param.scj2^2 + param.Ifges2(2,3);
           param.m(2)*param.l_all(1)*param.scj2;
           param.m(3); 
           param.Ifges2(3,3); 
           0.0031/11.3*6.021; 0.0983; 1.0603/11.3*6.021; 0;       %rva1, rvp1, rca1, rcp1
           0.0013/11.3*6.6116; 0.2236; 1.1018/11.3*6.6116; 0.0381; %rva2, rvp2, rca2, rcp2
           0.0018/11.3*6.7315; 0.0586; 0.9911/11.3*6.7315; 0;       %rva3, rvp3, rca3, rcp3   
    ]; 
else
    param.MDP = [param.l_all(1)^2*param.m(2) + param.m(1)*param.scj1^2 + param.m(2)*param.scj2^2 + param.Ifges2(2,3) + param.Ifges2(1,3); 
           param.m(2)*param.scj2^2 + param.Ifges2(2,3);
           param.m(2)*param.l_all(1)*param.scj2;
           param.m(3); 
           param.Ifges2(3,3); 
           1; 0; 0; 0; %rva1, rvp1, rca1, rcp1
           1; 0; 0; 0; %rva2, rvp2, rca2, rcp2
           1; 0; 0; 0; %rva3, rvp3, rca3, rcp3   
    ];     
end
% Angle offsets of the active joints in rad
param.offset_qa1_rad = -4.556174903196598; 
param.offset_qa2_rad = -4.431818922803402; 
param.offset_qa3_rad = -5.851751371891073; 
% Safety-critical parameters
if param.Exp 
    param.max_regelabweichung_qa_rad = 25*pi/180; % in rad % Maximum permissible control deviation of the active joint coordinates 
    param.max_radius = 0.35; % in m % Maximum possible radius of the task space with respect to x-y
    param.max_phie = 29 * pi/180; % in rad % Maximum angle in the task space  
    param.min_det_JacA_hredx = 0.2; % Limit for the determinant of the Jacobi matrix of direct kinematics
    param.min_det_JacB_hredqa = 0.15; % Limit for the determinant of the Jacobian matrix of inverse kinematics
    param.max_qa = [150; 150; 150]; % in deg % Upper limits of the joint space
    param.min_qa = [-35; -35; -35]; % in deg % Lower limits of the joint space 
else
    param.max_regelabweichung_qa_rad = 25*pi/180; % in rad % Maximum permissible control deviation of the active joint coordinates
    param.max_radius = 0.7; % in m % Maximum possible radius of the task space with respect to x-y
    param.max_phie = 60 * pi/180; % in rad % Maximum angle in the task space  
    param.min_det_JacA_hredx = 0.001; % Limit for the determinant of the Jacobi matrix of direct kinematics
    param.min_det_JacB_hredqa = 0.001; % Limit for the determinant of the Jacobian matrix of inverse kinematics
    param.max_qa = [150; 150; 150]; % in deg % Upper limits of the joint space
    param.min_qa = [-150; -150; -150]; % in deg % Lower limits of the joint space 
end
% Maximum permissible error of the direct kinematics of the three serial chains with respect to x-dimension of task space
param.maxerrx = 0.01; % m 
% Maximum permissible error of the direct kinematics of the three serial chains with respect to y-dimension of task space
param.maxerry = 0.01; % m 
% Permissible minimum distance between two segments of two kinematic chains
param.dmin_SelfColl_m = 0.05; % in m
% Maximum number of iterations of the Newton-Raphson algorithm for direct kinematics 
param.max_iter_find_fk_simulink = 10;
% Maximum number of iterations of a trajectory 
param.len_traj_init = 8000;
% Cut-off frequency of a 1st order low-pass filter
param.f_lp_Hz = 30; % in Hz
% Parameters for z-transforms of the 1st order low-pass filter
param.fz_lp = 2/(2*pi*param.f_lp_Hz*param.t_sample); 
% Observer gain matrix
param.Kox=1e1*diag([2 ,2,1]);

%% ATI Sensor Mini40
% Calibration
param.m_aktor = 0.0; % Sensor mass
param.g = 9.81;
param.GravityForce = zeros(6,1);
param.GravityForce(3) = param.m_aktor*param.g; %(haengend in z-Richtung)

%% Setting the starting values of the platform pose and joint coordinates
% Platform pose in m and rad
param.X0_t = [0 0 zeros(1,3) deg2rad(0)];
% Platform velocity in m/s und rad/s
param.XD0_t = [0 0 zeros(1,3) 0];
% Platform acceleration in m/s^2 und rad/s^2
param.XDD0_t = [0 0 zeros(1,3) 0];

% Inverse kinematics for starting values of the active and passive joint angles
[param.qa0, param.qp0] = calcq(param.X0_t([1,2,6]), param.psi_j, param.beta_j, param.r_fixPlat_j, param.r_mobPlat_j, param.l_all_id);

% Start values for joint coordinates in rad, rad/s
param.q0 = [param.qa0(1); param.qp0(1); param.X0_t(6) - (param.psi_j(1) + param.qa0(1) + param.qp0(1)); ...
      param.qa0(2); param.qp0(2); param.X0_t(6) - (param.psi_j(2) + param.qa0(2) + param.qp0(2)); ...
      param.qa0(3); param.qp0(3); param.X0_t(6) - (param.psi_j(3) + param.qa0(3) + param.qp0(3))];
param.QD0 = zeros(9,1); param.QDD0 = zeros(9,1);

%% Selection of redundancy resolution via phi_z
% 0: From path planning
% 1: Structure opening
% 2: Singularity avoidance
param.sel_redres = 0;
% Angle for the clamping hazard
param.q_p_min = 130 *pi/180;
% limit for redundancy resolution for singularity avoidance
param.min_det_JacA_hredx_redund = 0.3; 
%% FNN for contact body classification
ffnn_ClCollB_param_python = load('ffnn_ClCollB_param.mat');
param.ffnn_ClCollB_param.n_layers = ffnn_ClCollB_param_python.nrhlayers;
param.ffnn_ClCollB_param.weights_InpHL1 = ffnn_ClCollB_param_python.weights{1}';
param.ffnn_ClCollB_param.baises_InpHL1 = ffnn_ClCollB_param_python.bias{1}';

param.ffnn_ClCollB_param.weights_HL12 = ffnn_ClCollB_param_python.weights{2}';
param.ffnn_ClCollB_param.baises_HL12 = ffnn_ClCollB_param_python.bias{2}';

param.ffnn_ClCollB_param.weights_HL23 = ffnn_ClCollB_param_python.weights{3}';
param.ffnn_ClCollB_param.baises_HL23 = ffnn_ClCollB_param_python.bias{3}';

param.ffnn_ClCollB_param.weights_HL34 = ffnn_ClCollB_param_python.weights{4}';
param.ffnn_ClCollB_param.baises_HL34 = ffnn_ClCollB_param_python.bias{4}';

param.ffnn_ClCollB_param.weights_HL4Out = ffnn_ClCollB_param_python.weights{5}';
param.ffnn_ClCollB_param.baises_HL4Out = ffnn_ClCollB_param_python.bias{5}';
param.ffnn_ClCollB_param.sc_X_mean = ffnn_ClCollB_param_python.sc_X_mean';
param.ffnn_ClCollB_param.sc_X_stddev = sqrt(ffnn_ClCollB_param_python.sc_X_var');
%% FNN for clamping classification
ffnn_clamping_param = load('ffnn_ClampingClass.mat');

param.ffnn_clamping_param.n_layers = ffnn_clamping_param.nrhlayers;
param.ffnn_clamping_param.weights_InpHL1 = ffnn_clamping_param.weights{1}';
param.ffnn_clamping_param.baises_InpHL1 = ffnn_clamping_param.bias{1}';

param.ffnn_clamping_param.weights_HL12 = ffnn_clamping_param.weights{2}';
param.ffnn_clamping_param.baises_HL12 = ffnn_clamping_param.bias{2}';

param.ffnn_clamping_param.weights_HL23 = ffnn_clamping_param.weights{3}';
param.ffnn_clamping_param.baises_HL23 = ffnn_clamping_param.bias{3}';

param.ffnn_clamping_param.weights_HL34 = ffnn_clamping_param.weights{4}';
param.ffnn_clamping_param.baises_HL34 = ffnn_clamping_param.bias{4}';

param.ffnn_clamping_param.weights_HL45 = ffnn_clamping_param.weights{5}';
param.ffnn_clamping_param.baises_HL45 = ffnn_clamping_param.bias{5}';

param.ffnn_clamping_param.weights_HL5Out = ffnn_clamping_param.weights{6}';
param.ffnn_clamping_param.baises_HL5Out = ffnn_clamping_param.bias{6}';

param.ffnn_clamping_param.sc_X_mean = ffnn_clamping_param.sc_X_mean';
param.ffnn_clamping_param.sc_X_stddev = sqrt(ffnn_clamping_param.sc_X_var');

%% FNN for classification of the jammed leg chain
ffnn_clamping_chain_param = load('ffnn_ClampingChainClass.mat');
param.ffnn_clamping_chain_param.n_layers = ffnn_clamping_chain_param.nrhlayers;
param.ffnn_clamping_chain_param.weights_InpHL1 = ffnn_clamping_chain_param.weights{1}';
param.ffnn_clamping_chain_param.baises_InpHL1 = ffnn_clamping_chain_param.bias{1}';

param.ffnn_clamping_chain_param.weights_HL12 = ffnn_clamping_chain_param.weights{2}';
param.ffnn_clamping_chain_param.baises_HL12 = ffnn_clamping_chain_param.bias{2}';

param.ffnn_clamping_chain_param.weights_HL23 = ffnn_clamping_chain_param.weights{3}';
param.ffnn_clamping_chain_param.baises_HL23 = ffnn_clamping_chain_param.bias{3}';

param.ffnn_clamping_chain_param.weights_HL34 = ffnn_clamping_chain_param.weights{4}';
param.ffnn_clamping_chain_param.baises_HL34 = ffnn_clamping_chain_param.bias{4}';

param.ffnn_clamping_chain_param.weights_HL45 = ffnn_clamping_chain_param.weights{5}';
param.ffnn_clamping_chain_param.baises_HL45 = ffnn_clamping_chain_param.bias{5}';

param.ffnn_clamping_chain_param.weights_HL5Out = ffnn_clamping_chain_param.weights{6}';
param.ffnn_clamping_chain_param.baises_HL5Out = ffnn_clamping_chain_param.bias{6}';
param.ffnn_clamping_chain_param.sc_X_mean = ffnn_clamping_chain_param.sc_X_mean';
param.ffnn_clamping_chain_param.sc_X_stddev = sqrt(ffnn_clamping_chain_param.sc_X_var');

%% Particle filter
param.x_N_2D = [0.000005; 25; 25]*1e0*0.5; % Noise covariance in the system (i.e. process noise in the state update, here, we'll use a gaussian.)
param.x_CovR_2D = 1e1*eye(3);
param.x_N_3D = [0.000005; 0.0025; 25]*1e0*0.5; % Noise covariance in the system (i.e. process noise in the state update, here, we'll use a gaussian.)
param.x_CovR_3D = 1e1*eye(3);
param.x_CovR_Inv_2D = inv(param.x_CovR_2D);
param.x_CovR_Inv_3D = inv(param.x_CovR_3D);
param.pf_dim = 2; % 2 for 2D and 3 for 3D

%% Parameter for redundancy resolution
%%% General
param.delta_tau_max_Nm = 100;
param.delta_ddqa_radss = 100;
param.delta_intermedVal=0.1;
param.delta_intermedVal_react=0.1;
% param.pos_norm=2;
param.transition = 2;
param.max_iter_rr_dqa = 1;
param.delta_xphiEE_m = 0.0001;
param.delta_xphiEE_rad = deg2rad(1);
param.delta_qa_rad = deg2rad(1);
param.Variante = 1;  
%% MuJoCo Init 
if param.Exp == 0
    param.cam_mode=-1;%default view
    param.monitor_nr=1;%GUI opens on monitor nr. #monitor_nr
    param.xpos_window=2600;
    param.ypos_window=400;
    param.window_width=500;
    param.window_height=500;

    % param.q0_mj=zeros(1,12); % only planar robot
    param.q0_mj=zeros(1,14); % with capsel
    % Start MuJoCo
    mjx('exit');

    % mjx('load', 'mjkey.txt', 'Libraries/mujoco_stl_xml_files/PKM_3RRR_TorqueControl.xml',param.cam_mode,param.monitor_nr, param.xpos_window, param.ypos_window, param.window_width, param.window_height);
    mjx('load', 'mjkey.txt', 'Libraries/mujoco_stl_xml_files/PKM_3RRR_TorqueControl_wBody.xml',param.cam_mode,param.monitor_nr, param.xpos_window, param.ypos_window, param.window_width, param.window_height);
    mjx('set', 'qpos', param.q0_mj);
    mjx('step');
    % mjx('get_visflags')
    mjx('set_visflag', 'Convex Hull', 0)
    mjx('set_visflag', 'Contact Point', 1)
    % mjx('set_visflag', 'Static Body', 0)
end
%%
