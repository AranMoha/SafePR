clc
close all

%% Parameter

r_BasisPla_MobPla = [0.6829, 0.107 ]; % 0.6466, 1.068%  r_BasisPla_MobPla = [1,0.3 ]; % 0.6926 und 0.6732 
l_all = [0.5816 0.6198]; % 0.58 0.625
r_mobPlat_j = [r_BasisPla_MobPla(2); r_BasisPla_MobPla(2); r_BasisPla_MobPla(2)]; beta_j = [0;120; 240]*pi/180;
l_1i  = [0.58152 0.62002];
l_2i  = [0.58121 0.61964];
l_3i  = [0.58215 0.61975];
l_all_id = [l_1i, l_2i, l_3i];
r_fixPlat_j = [0.6877; 0.6922; 0.6666]; psi_j =[90.0000; 210.7631; 330.4901]*pi/180; % gemessen
kin_params =  [r_BasisPla_MobPla(1); r_BasisPla_MobPla(2); l_all(1); l_all(2)];
t_sample = 0.001;
traj_len_max = 8000;
%% Grenzen des Arbeitsraums, Gelenkraums und der Singularitäten
min_det_JacA_hredx = 0.2;
min_det_JacB_hredqa = 0.15;
max_radius = 0.4; % in m, maximaler Radius des Arbeitsraums bzgl x-y
max_phie = 20 * pi/180; % in rad, betragsmäßiger maximaler Winkel im Arbeitsraum 

max_qa = [110; 110; 110]; % Obere Grenzen des Gelenkraums (erste Vermutung)
min_qa = [-40; -40; -40];  % Untere Grenzen des Gelenkraums (erste Vermutung)


%% Viereck
filename_ = ("Trajektorien/Viereck_traj_schnell");
% Start in Grundstellung
k=1; XE = [ 0, 0, zeros(1,3), 0];
k=k+1; XE(k,:) = [  0.15,  0.15, zeros(1,3), 0*pi/180];
k=k+1; XE(k,:) = [  0.15, -0.15, zeros(1,3), 0*pi/180];
k=k+1; XE(k,:) = [ -0.15, -0.15, zeros(1,3), 0*pi/180];
k=k+1; XE(k,:) = [ -0.15,  0.15, zeros(1,3), 0*pi/180];
k=k+1; XE(k,:) = [ 0.15,  0.15, zeros(1,3), 0*pi/180];
k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];

%% Kreuz mit acht Ecken
% filename_ = ("Trajektorien/Kreuz_traj_schnell");
% % Start in Grundstellung
% k=1; XE = [ 0, 0, zeros(1,3), 0];
% k=k+1; XE(k,:) = XE(k-1,:) + [  0.15,  0.15, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [  0.15, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0.15,  -0.15, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0,  -0.15, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ -0.15,  -0.15, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [  -0.15, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ -0.15, 0.15, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0.15, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];

%% Stern
% filename_ = ("Trajektorien/Fuenfstern_traj_mittel");
% % Start in Grundstellung
% k=1; XE = [ 0, 0, zeros(1,3), 0];
% k=k+1; XE(k,:) = XE(k-1,:) + [  0.15,  0, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ -0.12, -0.09, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [  0.05, 0.142, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0.05, -0.142, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0.12,  -0.09, zeros(1,3), 0*pi/180];
% k=k+1; XE(k,:) = [ 0, 0, zeros(1,3), 0*pi/180];


%% Trajektoriengenerierung - Beschleunigungstrapezprofil
% % [XE_traj,XDE_traj,XDDE_traj,t] = traj_trapez2_multipoint(XE, Max Velocity, Anstiegszeit der Geschwindigkeit, Anstiegszeit der Beschleunigung,Sample Time, pause nach jeder Teil-Trajektorie)
% mittel  = 1 
% schnell = 4
% sehr schnell = 8
% sehr sehr schnell = 12
BP_V_lim_gain = 12; 
% v_max=1; a_max=1; T_ruck=1;
v_max=1*BP_V_lim_gain; a_max=1*BP_V_lim_gain; T_ruck=1/BP_V_lim_gain;
T_beschl=v_max/a_max; T_Abt=t_sample; T_pause=0.1;
  
[X_t,XD_t,XDD_t,t] = traj_trapez2_multipoint(XE, v_max, T_beschl, T_ruck, T_Abt, T_pause);


%%
    
len_traj = length(X_t);
if len_traj > traj_len_max
    disp('Trajectory too long');
    return
end

traj.len_traj = len_traj;


valid = zeros(len_traj,1);
for i = 1 : len_traj
    valid(i,1) = tr_validate(X_t(i,1) ,X_t(i,2) , X_t(i,6), kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id,...
                             min_det_JacA_hredx, min_det_JacB_hredqa, max_radius, max_phie, max_qa, min_qa ,i);
    if valid(i,1)==0
        disp('In der Iteration:')
        disp(i)
        return
    end
end
if ~all(valid)
    disp('trajectory not valid')
    return
end

XE_traj = zeros(len_traj,4);%ones(traj_len_selected,4).*[X_t(len_traj,1) X_t(len_traj,2)  X_t(len_traj,6) valid];
XDE_traj = zeros(len_traj,3);
XDDE_traj = XDE_traj;

XE_traj(1:len_traj,:) = [X_t(:,1) X_t(:,2)  X_t(:,6) valid];

XDE_traj(1:len_traj,:) = [XD_t(:,1) XD_t(:,2)  XD_t(:,6) ];
XDDE_traj(1:len_traj,:) = [XDD_t(:,1) XDD_t(:,2)  XDD_t(:,6) ];

XDE_traj(abs(XDE_traj) < 1e-10 ) = 0;       %Verhindert unnötige Nulldurchgänge, Relevant für Vorsteuerung und signum funktionen
XDDE_traj(abs(XDDE_traj) < 1e-10 ) = 0;     %Verhindert unnötige Nulldurchgänge, Relevant für Vorsteuerung und signum funktionen

traj.XE_traj = XE_traj;
traj.XDE_traj = XDE_traj;
traj.XDDE_traj = XDDE_traj;
traj.t = 0:t_sample:(size(traj.XE_traj,1)-1)*t_sample;

filename = append(filename_, '_', num2str(BP_V_lim_gain), '.mat');
% save(filename,'traj');


fprintf('\n v_max [x,y,phi]: \n');
fprintf('%f \n',max(XDE_traj));
fprintf('\n a_max [x,y,phi]: \n');
fprintf('%f \n',max(XDDE_traj));


%% Plots
% plot_traj_xEE(X_t, XD_t, XDD_t, t, [1,2,6])
plot_traj_xEE(traj.XE_traj, traj.XDE_traj, traj.XDDE_traj, traj.t, [1,2,3])

%% Funktionen
function plot_traj_xEE(X_t, XD_t, XDD_t, t, dim)

    figure
    subplot(321)
        plot3(X_t(:,dim(1)),X_t(:,dim(2)),X_t(:,dim(3))*180/pi)
        title('Position')
        xlabel('$x_\mathrm{EE}$ in [m]', 'Interpreter', 'latex')
        ylabel('$y_\mathrm{EE}$ in [m]', 'Interpreter', 'latex')
        zlabel('$\varphi_\mathrm{EE}$ in [$^\circ$]', 'Interpreter', 'latex')

    subplot(323)
        plot3(XD_t(:,dim(1)),XD_t(:,dim(2)),XD_t(:,dim(3)))
        title('Geschwindigkeit')
        xlabel('$\dot{x}_\mathrm{EE}$ in [m/s]', 'Interpreter', 'latex')
        ylabel('$\dot{y}_\mathrm{EE}$ in [m/s]', 'Interpreter', 'latex')
        zlabel('$\dot{\varphi}_\mathrm{EE}$ in [$^\circ$/s]', 'Interpreter', 'latex')

    subplot(325)
        plot3(XDD_t(:,dim(1)),XDD_t(:,dim(2)),XDD_t(:,dim(3)))
        title('Beschleunigung')
        xlabel('$\ddot{x}_\mathrm{EE}$ in [m/s$^2$]', 'Interpreter', 'latex')
        ylabel('$\ddot{y}_\mathrm{EE}$ in [m/s$^2$]', 'Interpreter', 'latex')
        zlabel('$\ddot{\varphi}_\mathrm{EE}$ in [$^\circ$/s$^2$]', 'Interpreter', 'latex')

    subplot(322)
        plot(t, X_t(:,dim(1)), t, X_t(:,dim(2))); hold on; 
        ylabel('x,y in [m]', 'Interpreter', 'latex')
        yyaxis right 
        plot(t, X_t(:,dim(3))*180/pi);
        xlabel('$t$ in [s]', 'Interpreter', 'latex')
        ylabel('$\varphi_\mathrm{EE}$ in [$^\circ$]', 'Interpreter', 'latex')  
        legend('$x_\mathrm{EE}$', '$y_\mathrm{EE}$', '$\varphi_\mathrm{EE}$', 'Interpreter', 'latex')

    subplot(324)
        plot(t, XD_t(:,dim(1)), t, XD_t(:,dim(2))); hold on; 
        ylabel('$\dot{x},\dot{y}$ in [m/s]', 'Interpreter', 'latex')
        yyaxis right 
        plot(t, XD_t(:,dim(3))*180/pi);
        xlabel('$t$ in [s]', 'Interpreter', 'latex')
        ylabel('$\dot{\varphi}_\mathrm{EE}$ in [$^\circ/s$]', 'Interpreter', 'latex')  
        legend('$\dot{x}_\mathrm{EE}$', '$\dot{y}_\mathrm{EE}$', '$\dot{\varphi}_\mathrm{EE}$', 'Interpreter', 'latex')

    subplot(326)
        plot(t, XDD_t(:,dim(1)), t, XDD_t(:,dim(2))); hold on; 
        ylabel('$\ddot{x},\ddot{y}$ in [m/s$^2$]', 'Interpreter', 'latex')
        yyaxis right 
        plot(t, XDD_t(:,dim(3))*180/pi);
        xlabel('$t$ in [s]', 'Interpreter', 'latex')
        ylabel('$\ddot{\varphi}_\mathrm{EE}$ in [$^\circ/s^2$]', 'Interpreter', 'latex')  
        legend('$\ddot{x}_\mathrm{EE}$', '$\ddot{y}_\mathrm{EE}$', '$\ddot{\varphi}_\mathrm{EE}$', 'Interpreter', 'latex')
end



function tr_valid   = tr_validate(xe,ye, phie, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id,...
                                  min_det_JacA_hredx, min_det_JacB_hredqa, max_radius, max_phie, max_qa, min_qa, i)

%Eingang:
%   EE = [xe ye phie]: Endeffektorpose
%   kin_params = [r_BasisPla_MobPla l_all] : Parameter der Kinematik

%Ausgang:
%   tr_valid

% Arbeitsraumgrenzen überprüfen
    r = sqrt(xe^2+ye^2);

    if r <= max_radius && abs(phie)< max_phie
        tr_valid_xEE = 1;
    else
        tr_valid_xEE = 0;
        disp('trajectory not valid - Arbeitsraumgrenzen verletzt')                
    end

% Gelenkraumgrenzen überprüfen
[qa, qp] = calcq([xe,ye, phie], kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id);

    if (qa(1)*180/pi < max_qa(1) && qa(1)*180/pi > min_qa(1)) && ...
       (qa(2)*180/pi < max_qa(2) && qa(2)*180/pi > min_qa(2)) && ...
       (qa(3)*180/pi < max_qa(3) && qa(3)*180/pi > min_qa(3))
        tr_valid_qa=1;
    else
        tr_valid_qa=0;
        disp('trajectory not valid - Gelenkraumgrenzen verletzt')        
    end

% Singualritäten überprüfen
    q13 = phie - (psi_j(1) + qa(1) + qp(1)); 
    q23 = phie - (psi_j(2) + qa(2) + qp(2)); 
    q33 = phie - (psi_j(3) + qa(3) + qp(3)); 

    qj_rad = [qa(1); qp(1); q13; ...
              qa(2); qp(2); q23; ...
              qa(3); qp(3); q33];
    xEE = [xe; ye; 0; 0; 0; phie];
    
    JacA_hredx_3RRRreturn  = JacA_hredx_3RRR(qj_rad, xEE, kin_params([3,4],1), kin_params([1,2],1));
    JacB_hredqa_3RRRreturn = JacB_hredqa_3RRR(qj_rad, xEE, kin_params([3,4],1), kin_params([1,2],1));
    % Determinanten
    det_JacA_hredx_3RRR = det(JacA_hredx_3RRRreturn);
    det_JacB_hredqa_3RRR = det(JacB_hredqa_3RRRreturn);
 
    if abs(det_JacA_hredx_3RRR) >= min_det_JacA_hredx && abs(det_JacB_hredqa_3RRR) >= min_det_JacB_hredqa
        tr_valid_sing = 1;
    else
        tr_valid_sing = 0;
        disp('trajectory not valid - Singularitätsgrenzen verletzt')
    end


    if tr_valid_xEE==1 && tr_valid_qa==1 && tr_valid_sing==1
        tr_valid = true;
    else
        tr_valid = false;
    end

end

