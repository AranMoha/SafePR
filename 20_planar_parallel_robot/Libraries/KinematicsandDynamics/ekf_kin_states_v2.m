function x   = ekf_kin_states_v2(y, param)
% Speicherplatz für x_ reservieren
% x_=zeros(19,1); % für Nulldynamik der Beschleunigung
x_=zeros(25,1); % für Nulldynamik des Rucks

% Uebergabe der Parameterwerte
R_imu = param.R_imu;
p_imu = param.p_imu;
Q = param.Q_ekf2;
R = param.R_ekf2;
x_0 = param.x_0_ekf2;
P_0 = param.P_0_ekf2;
T = param.t_sample;

persistent x_est P_est K
if isempty(x_est)
    x_est = x_0;
    P_est = P_0;
    
end

%% Discrete Kalman filter time update equations

x=x_est;

% Zustandsraumdarstellung
% A_c = [zeros(6), eye(6), zeros(6), zeros(6,1);
%     zeros(6), zeros(6), eye(6), zeros(6,1);
%     zeros(6), zeros(6), zeros(6), zeros(6,1); zeros(1,19)];
% A = A_c*T + eye(19);

% Erweitertes Modell mit Nulldynamik des Rucks
A_c = [zeros(6), eye(6), zeros(6), zeros(6), zeros(6,1);
    zeros(6), zeros(6), eye(6), zeros(6), zeros(6,1);
    zeros(6), zeros(6), zeros(6),zeros(6,1), eye(6);zeros(1,25);
    zeros(6), zeros(6), zeros(6), zeros(6), zeros(6,1)];
A = A_c*T + eye(25);
 
% Prädiktion der Zustände
x_ = A*x;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacobi-Matrix der Messgleichung (Maple-Funktionen)
J_omega = J_omegaEKF([x_(1), x_(2), x_(3), x_(4), x_(5), x_(6)], [x_(7), x_(8), x_(9), x_(10), x_(11), x_(12)], R_imu);
% J_a = J_aEKF([x_(1), x_(2), x_(3), x_(4), x_(5), x_(6)], [x_(7), x_(8), x_(9), x_(10), x_(11), x_(12)], [x_(13), x_(14), x_(15), x_(16), x_(17), x_(18)],R_imu, p_imu);
J_a = J_aEKF_v2([x_(1), x_(2), x_(3), x_(4), x_(5), x_(6)], [x_(7), x_(8), x_(9), x_(10), x_(11), x_(12)], [x_(13), x_(14), x_(15), x_(16), x_(17), x_(18)],R_imu, p_imu,9.81);

% C_J = [eye(6), zeros(6,13);J_a;J_omega, zeros(3,1);zeros(1,18),1];

% Erweitertes Modell mit Nulldynamik des Rucks
C_J = [eye(6), zeros(6,19);J_a, zeros(3,6);J_omega, zeros(3,7);zeros(1,18),1,zeros(1,6)];

% Übergabe der linearisierten C-Matrix
C = C_J;
%% Discrete Kalman filter measurement update equations
P_  = A * P_est * A' + Q;
K   = P_ * C'/( C * P_ * C' + R);
x   = x_ +  K * ( y - C * x_);
P_est  = P_ - K *( C * P_ * C' + R)* K';
% P_est  = (eye(size(A)) - K * C) * P_;
x_est  = x;