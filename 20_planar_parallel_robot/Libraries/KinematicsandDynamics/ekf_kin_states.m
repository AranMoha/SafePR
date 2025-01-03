function x   = ekf_kin_states(y, param)
% Speicherplatz für x_ reservieren
x_=zeros(18,1); % für Nulldynamik der Beschleunigung
% x_=zeros(24,1); % für Nulldynamik des Rucks

% Uebergabe der Parameterwerte
R_imu = param.R_imu;
p_imu = param.p_imu;
Q = param.Q_ekf;
R = param.R_ekf;
x_0 = param.x_0_ekf;
P_0 = param.P_0_ekf;
T = param.t_sample;

persistent x_est P_est K
if isempty(x_est)
    x_est = x_0;
    P_est = P_0;
    
end

%% Discrete Kalman filter time update equations

x=x_est;

% Zustandsraumdarstellung
A_c = [zeros(6), eye(6), zeros(6);
    zeros(6), zeros(6), eye(6);
    zeros(6), zeros(6), zeros(6)];
A = A_c*T + eye(18);

% Erweitertes Modell mit Nulldynamik des Rucks
% A_c = [zeros(6), eye(6), zeros(6), zeros(6);
%     zeros(6), zeros(6), eye(6), zeros(6);
%     zeros(6), zeros(6), zeros(6), eye(6);
%     zeros(6), zeros(6), zeros(6), zeros(6)];
% A = A_c*T + eye(24);
 
% Prädiktion der Zustände
x_ = A*x;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacobi-Matrix der Messgleichung (Maple-Funktionen)
J_omega = J_omegaEKF([x_(1), x_(2), x_(3), x_(4), x_(5), x_(6)], [x_(7), x_(8), x_(9), x_(10), x_(11), x_(12)], R_imu);
J_a = J_aEKF([x_(1), x_(2), x_(3), x_(4), x_(5), x_(6)], [x_(7), x_(8), x_(9), x_(10), x_(11), x_(12)], [x_(13), x_(14), x_(15), x_(16), x_(17), x_(18)],R_imu, p_imu);

C_J = [eye(6), zeros(6,12);J_a;J_omega];

% Erweitertes Modell mit Nulldynamik des Rucks
% C_J = [eye(6), zeros(6,18);J_a, zeros(3,6);J_omega, zeros(3,6)];

% Übergabe der linearisierten C-Matrix
C = C_J;

% Messgleichung
y_ = [x_(1); x_(2); x_(3); x_(4); x_(5); x_(6); transpose(y_aUKF(x_(1:6), x_(7:12), x_(13:18), R_imu, p_imu)); transpose(y_omegaUKF(x_(1:6), x_(7:12), R_imu))];
%% Discrete Kalman filter measurement update equations
P_  = A * P_est * A' + Q;
% if cond(C * P_ * C' + R)>10^15
%     disp("Hier");
% end
K   = P_ * C'/( C * P_ * C' + R);
x   = x_ +  K * ( y - y_);
% P_est  = P_ - K *( C * P_ * C' + R)* K';
P_est  = (eye(size(A)) - K * C) * P_;
x_est  = x;