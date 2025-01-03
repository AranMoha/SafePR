function x   = ukf_kin_states(y, param)

n = 18; %%n;     % Laenge von f(x)
% n = 24;        % für Nulldynamik des Rucks
o = 12; %%o;      % Anzahl der zurueckgefuehrten Variablen

% Uebergabe der Parameterwerte
R_imu = param.R_imu;
p_imu = param.p_imu;
Q = param.Q_ukf;
R = param.R_ukf;
x_0 = param.x_0_ukf;
P_0 = param.P_0_ukf;
T = param.t_sample;
alpha = param.alpha_ukf;
beta = param.beta_ukf;
kappa = param.kappa_ukf;

persistent x_est P_est W_m W_c lambda

if isempty(x_est)
    %     n = numel(x_0);
    %     o = numel(y);
    
    x_est    = x_0;
    P_est    = P_0;
    y_sig    = zeros(o,2*n+1);
    W_m      = zeros(1,2*n+1);
    W_c      = zeros(1,2*n+1);
    
    %% Parameter-Initialization
    lambda   = (alpha^2)*(n+kappa)-n;
    %% Weight calculation
    W_m(1,1) = lambda/(n+lambda);
    W_c(1,1) = lambda/(n+lambda)+1-alpha^2+beta;
    
    for i=2:2*n+1
        W_m(1,i) = 1/(2*(n+lambda));
        W_c(1,i) = 1/(2*(n+lambda));
    end
end

x_    = x_est;
P_    = P_est;
x     = zeros(n,1);
x_sig = zeros(n,2*n+1);


P_an = (sqrt(n+lambda).*chol(P_))'; % Wurzelmatrix mittels Cholesky-Zerlegung

x0_sig   = zeros(n,2*n+1);
x0_sig(:,1) = x_;

for i=2:n+1
    x0_sig(:,i)     = x_ + P_an(:,i-1);
end

for i=n+2:2*n+1
    
    x0_sig(:,i)   = x_ - P_an(:,i-1-n);
end

%% Unscented Kalman filter time update equations
for i = 1:(2*n+1)
    % System equation
    
    x(1) = x0_sig(1,i);
    x(2) = x0_sig(2,i);
    x(3) = x0_sig(3,i);
    x(4) = x0_sig(4,i);
    x(5) = x0_sig(5,i);
    x(6) = x0_sig(6,i);
    x(7) = x0_sig(7,i);
    x(8) = x0_sig(8,i);
    x(9) = x0_sig(9,i);
    x(10) = x0_sig(10,i);
    x(11) = x0_sig(11,i);
    x(12) = x0_sig(12,i);
    x(13) = x0_sig(13,i);
    x(14) = x0_sig(14,i);
    x(15) = x0_sig(15,i);
    x(16) = x0_sig(16,i);
    x(17) = x0_sig(17,i);
    x(18) = x0_sig(18,i);
    % Nur für Nulldynamik Ruck benötigt:
%     x(19) = x0_sig(19,i);
%     x(20) = x0_sig(20,i);
%     x(21) = x0_sig(21,i);
%     x(22) = x0_sig(22,i);
%     x(23) = x0_sig(23,i);
%     x(24) = x0_sig(24,i);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Hier Modellgleichung einfuegen
    % Zustandsraumdarstellung
    A_c = [zeros(6), eye(6), zeros(6);
           zeros(6), zeros(6), eye(6);
           zeros(6), zeros(6), zeros(6)];
    A = A_c*T + eye(18);

    x_sig(:,i) = A*x;

    % Erweitertes Modell mit Nulldynamik des Rucks
%     A_c = [zeros(6), eye(6), zeros(6), zeros(6);
%         zeros(6), zeros(6), eye(6), zeros(6);
%         zeros(6), zeros(6), zeros(6), eye(6);
%         zeros(6), zeros(6), zeros(6), zeros(6)];
%     A = A_c*T + eye(24);
% % 
%     x_sig(:,i) = A*x;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

x_  = x_sig * W_m';
P_ = P_ .* 0;

for i=1:(2*n+1)
    P_ = P_ + ((x_sig(:,i) - x_) * (x_sig(:,i) - x_)' .* W_c(1,i));
end
P_  = P_ + Q;



P_an_y = (sqrt(n+lambda).*chol(P_))'; % Wurzelmatrix mittels Cholesky-Zerlegung

x0_sig   = zeros(n,2*n+1);
x0_sig(:,1) = x_;

for i=2:n+1
    x0_sig(:,i)     = x_ + P_an_y(:,i-1);
end

for i=n+2:2*n+1
    
    x0_sig(:,i)   = x_ - P_an_y(:,i-1-n);
end

for i = 1:(2*n+1)
    x(1) = x0_sig(1,i);
    x(2) = x0_sig(2,i);
    x(3) = x0_sig(3,i);
    x(4) = x0_sig(4,i);
    x(5) = x0_sig(5,i);
    x(6) = x0_sig(6,i);
    x(7) = x0_sig(7,i);
    x(8) = x0_sig(8,i);
    x(9) = x0_sig(9,i);
    x(10) = x0_sig(10,i);
    x(11) = x0_sig(11,i);
    x(12) = x0_sig(12,i);
    x(13) = x0_sig(13,i);
    x(14) = x0_sig(14,i);
    x(15) = x0_sig(15,i);
    x(16) = x0_sig(16,i);
    x(17) = x0_sig(17,i);
    x(18) = x0_sig(18,i);
    % Nur für Nulldynamik Ruck benötigt:
%     x(19) = x0_sig(19,i);
%     x(20) = x0_sig(20,i);
%     x(21) = x0_sig(21,i);
%     x(22) = x0_sig(22,i);
%     x(23) = x0_sig(23,i);
%     x(24) = x0_sig(24,i);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Hier Messgleichung einfuegen (Maple-Funktionen)
    y_a = transpose(y_aUKF(x(1:6),x(7:12),x(13:18),R_imu,p_imu));
    y_omega = transpose(y_omegaUKF(x(1:6),x(7:12),R_imu));

    y_sig(1,i) = x(1);
    y_sig(2,i) = x(2);
    y_sig(3,i) = x(3);
    y_sig(4,i) = x(4);
    y_sig(5,i) = x(5);
    y_sig(6,i) = x(6);
    y_sig(7,i) = y_a(1);
    y_sig(8,i) = y_a(2);
    y_sig(9,i) = y_a(3);
    y_sig(10,i) = y_omega(1);
    y_sig(11,i) = y_omega(2);
    y_sig(12,i) = y_omega(3);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


y_  = y_sig * W_m';

%P_ calculation


%% Unscented Kalman filter measurement update equations
% Pyy calculation
P_yy = zeros(o,o);
for i=1:(2*n+1)
    P_yy = P_yy + ((y_sig(:,i) - y_) * (y_sig(:,i) - y_)' .* W_c(1,i));
end
P_yy = P_yy + R;
% Pxy calculation
P_xy = zeros(n,o);
for i=1:(2*n+1)
    P_xy = P_xy+((x_sig(:,i)-x_)*(y_sig(:,i)-y_)'.*W_c(1,i));
end
% Kalman Gain
K  = P_xy/(P_yy);

P_est = P_ - (K * P_yy * K');
x_est  = x_ +  K * (y - y_);
x=x_est;
end