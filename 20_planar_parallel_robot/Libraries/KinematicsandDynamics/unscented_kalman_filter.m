function [x, P_out]   = unscented_kalman_filter(u, y,Q, R, t_sample, x_0, P_0, alpha, beta_ukf, kappa, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, beta_j, kin_params, MDP, l_all, r_BasisPla_MobPla)

n = 9; %%n;     % Laenge von f(x)
o = 6; %%o;      % Anzahl der zurueckgefuehrten Variablen


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
    W_c(1,1) = lambda/(n+lambda)+1-alpha^2+beta_ukf;
%     W_c(1,1) = lambda/(n+lambda)+1-alpha+beta_ukf;
    
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Hier Modellgleichung einfuegen
    xEE = x([1,2,3]);
    xEE_6D = xEE_3dTo6D(xEE)';
    dxEE = x([4,5,6]);
    dxEE_6D = xEE_3dTo6D(dxEE)';
    [qa, qp] = calcq(xEE, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id);
    qj_rad = calcQtotal(qa, qp, xEE, psi_j);

    Jinv_hqx_ind = Jinv_hqx_ind_3RRR(qj_rad, xEE_6D, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, beta_j)';
    J_hredxqa_ind = J_hredxqa_ind_3RRR(qj_rad, xEE_6D, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, beta_j);
    Jinv_hredqax = Jinv_hredqax_ind_3RRR(qj_rad, xEE_6D, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, beta_j);
    
    dqj_rad = Jinv_hqx_ind *dxEE;
    FX = Jinv_hredqax' * u;

    Fext = reshape(x(7:9), [3,1]); 
    cX_mdp = transpose(cvecred_mdp_3RRR(qj_rad, dqj_rad, xEE_6D, dxEE_6D, MDP, l_all, r_BasisPla_MobPla));
    MX_mdp = Mred_mdp_3RRR(qj_rad, xEE_6D, MDP, l_all, r_BasisPla_MobPla);
    tauRaX = tauFrared_mdp_3RRR(qj_rad, dqj_rad, xEE_6D, dxEE_6D, MDP, l_all, r_BasisPla_MobPla)';
    tauRpX = tauFrpred_mdp_3RRR(qj_rad, dqj_rad, xEE_6D, dxEE_6D, MDP, l_all, r_BasisPla_MobPla)';   
    
%     if abs(dxEE(1))<1e-2
%         tauRaX(1)=0;
%     end
%     if abs(dxEE(2))<1e-2
%         tauRaX(2)=0;
%     end
%     if abs(dxEE(3))<1e-2
%         tauRaX(3)=0;
%     end    
    ddx = MX_mdp\ (FX + Fext - (cX_mdp+tauRaX+tauRpX) );
%         ddx = MX_mdp\ (FX + Fext - (cX_mdp+tauRpX) );

     x_sig(1:3,i) = x(1:3) + t_sample*x(4:6);
     x_sig(4:6,i) = x(4:6) + t_sample*ddx;
     x_sig(7:9,i) = x(7:9);
%     x_sig(1,i) = x(1) + T*x(2);
%     x_sig(2,i) = x(2) + T*(-c/m*(x(1) + a*x(1).^3 + b*sign(x(1))) - d/m*x(2) + u/m);
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

y_sig = zeros(o,2*n+1);

for i = 1:(2*n+1)
    xtmp = x0_sig(1:3,i);
    dxtmp = x0_sig(4:6,i);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Hier Messgleichung einfuegen
%     y_sig(1,i) =  x(1);
    [qa, qp] = calcq(xtmp, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id);
    qj_rad = calcQtotal(qa, qp, xtmp, psi_j);
    xEE_6D = xEE_3dTo6D(xtmp)';

    Jinv_hredqax = Jinv_hredqax_ind_3RRR(qj_rad, xEE_6D, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, beta_j);
    dqja_rad_tmp = Jinv_hredqax * dxtmp;
    
    y_sig(1,i) =  qa(1);
    y_sig(2,i) =  qa(2);
    y_sig(3,i) =  qa(3);    
    y_sig(4,i) =  dqja_rad_tmp(1);
    y_sig(5,i) =  dqja_rad_tmp(2);
    y_sig(6,i) =  dqja_rad_tmp(3);          
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
P_out = P_est;
end


function q  = calcQtotal(qa, qp, xEE, psi_j)
phie = xEE(3); 
q13 = phie - (psi_j(1) + qa(1) + qp(1)); 
q23 = phie - (psi_j(2) + qa(2) + qp(2)); 
q33 = phie - (psi_j(3) + qa(3) + qp(3)); 

q = [qa(1); qp(1); q13; ...
    qa(2); qp(2); q23; ...
    qa(3); qp(3); q33];
end
