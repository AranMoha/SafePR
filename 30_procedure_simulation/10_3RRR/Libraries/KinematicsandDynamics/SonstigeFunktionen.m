
function calcFFT(Fs, L, X)
%     Fs = 1000;            % Sampling frequency                    
%     T = 1/Fs;             % Sampling period       
%     L = 1500;             % Length of signal
%     t = (0:L-1)*T;        % Time vector

    Y = fft(X);

    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);

    f = Fs*(0:(L/2))/L;
    plot(f,P1) 
    title('Single-Sided Amplitude Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')

end


%%
% startPoint=1; endPoint=size(data_.t,1);

% Qrel = deg2rad(data_.Q_ist_grad(startPoint:endPoint,:)); 
% QDrel =  deg2rad(data_.QD_ist_grad_s(startPoint:endPoint,:)); 
% X_rel = toX_t6(data_.xEE_ist_m_rad(startPoint:endPoint,:)); 
% XD_rel = toX_t6(data_.xDEE_ist_ms_rads(startPoint:endPoint,:)); 
% % XD_rel = toX_t6(filter(Lowpass_XD_to_XDD(500), data_.xDEE_ist_ms_rads(startPoint:endPoint,:)));
% XDDrel = toX_t6(data_.xDDEE_ist_mss_radss(startPoint:endPoint,:));
% 
% tauQrel = data_.tauQa_ist_Nm(startPoint:endPoint,:);
% C = zeros(size(tauQrel,2)*size(Qrel,1), size(MDP,1));
% tauQrel_vert = zeros(size(tauQrel,2)*size(Qrel,1), size(MDP,2));
% tauQa_pred_regmatred = zeros(size(tauQrel));
% tic
% 
% for i = 1 : 1 : (endPoint - startPoint)+1
%     J_hredxqa = J_hredxqa_3RRR(Qrel(i,:), X_rel(i,:),l_all, r_BasisPla_MobPla);
%     regmatred_mdp_delta_QaRaum = transpose(J_hredxqa) * regmatred_mdp_3RRR(Qrel(i,:), QDrel(i,:), X_rel(i,:), XD_rel(i,:), XDDrel(i,:), MDP, l_all, r_BasisPla_MobPla); 
% %     C = [C;regmatred_mdp_delta_QaRaum];
% %     tauQrel_vert = [tauQrel_vert;tauQrel(i,:)'];
%     C( (i*3-2):i*3, :) = regmatred_mdp_delta_QaRaum;
%     tauQrel_vert( (i*3-2):i*3, 1) = tauQrel(i,:)';
%     tauQa_pred_regmatred(i,:)=regmatred_mdp_delta_QaRaum*MDP;
% end
% 
% % for i = 1 : 1 : length(Qrel)
% %     
% %     C = [C;regmatred_mdp_delta(Qrel(i,:)*pi/180, QDrel(i,:)*pi/180, XD_rel(i,:), XDDrel(i,:), kin_params, 9.81) ];
% %     tauQrel_vert = [tauQrel_vert;tauQrel(i,:)'];
% % end
% toc
% 
% 
% rank(C)
% 
% psi = pinv(C);
% % psi2 = (transpose(C)*C)^(-1)*transpose(C);
% MDP_neu = psi*tauQrel_vert;
% MDP_neu
% % MDP_neu2 = psi2*tauQrel_vert

% D_Opt = -log(det(transpose(C)*C))
%% 
xEE_list = zeros(length(data_.t),3);
dxEE_list = zeros(length(data_.t),3);
ddxEE_list = zeros(length(data_.t),3);
dqj_rad_list = zeros(length(data_.t),9);
% ddqj_rad_list = zeros(length(data_.t),9);

mdp = MDP;

qj_rad_list_filt = rad2deg(filter(Lowpass_XD_to_XDD(100), deg2rad(data_.Q_ist_grad)));
qj_rad_list = deg2rad(data_.Q_ist_grad);
% data_.xEE_ist_m_rad = filter(Lowpass_XD_to_XDD(1500), data_.xEE_ist_m_rad);
dqj_rad_list_filt = diff([qj_rad_list(1,:);qj_rad_list])*1000;

% qj_rad_list = deg2rad(data_.Q_ist_grad);
% dqj_rad_list_filt = filter(Lowpass_XD_to_XDD(2000), dqj_rad_list);
ddqj_rad_list = diff([dqj_rad_list_filt(1,:);dqj_rad_list_filt])*1000;


for i = 1:length(data_.t)

    qj_rad = qj_rad_list(i,:)';    
%     qja_rad = filter(Lowpass_XD_to_XDD(30), qj_rad_list(i,[1,4,7]))';

%     dqj_rad = dqj_rad_list_filt(i,:)';   
    dqja_rad = dqj_rad_list_filt(i, [1,4,7])';
    ddqja_rad = ddqj_rad_list(i,[1,4,7])';
    
    
    [xEE_, ~, ~] = calcEE(qj_rad, kin_params, psi_j, beta_j);
    xEE = toX_t6_single(xEE_')';
%     xEE = toX_t6_single(data_.xEE_ist_m_rad(i,:));

    J_hredxqa_3RRRreturn = J_hredxqa_3RRR(qj_rad, xEE, l_all, r_BasisPla_MobPla);
    Jinv_hqx_3RRRreturn = Jinv_hqx_3RRR(qj_rad, xEE, l_all, r_BasisPla_MobPla)';    
    dxEE = J_hredxqa_3RRRreturn*dqja_rad;
    dq_rad_tmp = Jinv_hqx_3RRRreturn*dxEE; 
    
    dJ_hredxqa_3RRRreturn = dJ_hredxqa_3RRR(qj_rad, dq_rad_tmp, xEE, toX_t6_single(dxEE'), l_all, r_BasisPla_MobPla);
    ddxEE = dJ_hredxqa_3RRRreturn*dqja_rad + J_hredxqa_3RRRreturn*ddqja_rad;

    xEE_list(i,:) = xEE_';
    dxEE_list(i,:) = dxEE';
    ddxEE_list(i,:) = ddxEE';
    dqj_rad_list(i,:) = dq_rad_tmp';
    
   
end

% data_.Q_ist_grad = rad2deg(qj_rad_list);
% qj_rad_list_grad = rad2deg(qj_rad_list);

% data_.QD_ist_grad_s = rad2deg(dqj_rad_list);
% data_.xEE_ist_m_rad = xEE_list;
% data_.xDEE_ist_ms_rads = dxEE_list;
% data_.xDDEE_ist_mss_radss = ddxEE_list;
% data_.xDDEE_ist_mss_radss = diff([dxEE_list(1,:);dxEE_list])*1000;

% plot(data_.t, qj_rad_list_grad(:,1), data_.t, data_.Q_ist_grad(:,1))
% figure; plot(data_.t(1000:end), data_.xDDEE_ist_mss_radss(1000:end,1));
% figure; plot(data_.t, (diag([300,300,90])*(data_.xEE_ist_m_rad-data_.xEE_soll_m_rad)')')
% hold on; plot(data_.t, (diag([300,300,90])*(xEE_list-data_.xEE_soll_m_rad)')')

% figure
% plot(data_.xEE_ist_m_rad(:,3)); hold on; plot(data_.xDEE_ist_ms_rads(:,3));

%%
% figure
% subplot(3,1,1)
% plot(data_.t(startPoint_plot:endPoint_plot), data_.xEE_soll_m_rad(startPoint_plot:endPoint_plot,1),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% plot(data_.t(startPoint_plot:endPoint_plot), data_.xEE_ist_m_rad(startPoint_plot:endPoint_plot,1),'LineWidth',lw, 'Color', '#0504aa');hold on; 
% grid on; 
% % xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$x_\mathrm{e}$ in $\mathrm{m}$', 'Interpreter', 'latex', 'FontSize',fs);
% xlim([345.4 347.6]) 
% ylim([-0.06 0.06])
% 
% subplot(3,1,2)
% plot(data_.t(startPoint_plot:endPoint_plot), data_.xEE_soll_m_rad(startPoint_plot:endPoint_plot,2),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% plot(data_.t(startPoint_plot:endPoint_plot), data_.xEE_ist_m_rad(startPoint_plot:endPoint_plot,2),'LineWidth',lw, 'Color', '#0504aa');hold on; 
% grid on; 
% % xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$y_\mathrm{e}$ in $\mathrm{m}$', 'Interpreter', 'latex', 'FontSize',fs);
% xlim([345.4 347.6]) 
% ylim([-0.06 0.06])
% 
% subplot(3,1,3)
% plot(data_.t(startPoint_plot:endPoint_plot), 180/pi*data_.xEE_soll_m_rad(startPoint_plot:endPoint_plot,3),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% plot(data_.t(startPoint_plot:endPoint_plot), 180/pi*data_.xEE_ist_m_rad(startPoint_plot:endPoint_plot,3),'LineWidth',lw, 'Color', '#0504aa');hold on; 
% grid on; 
% xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$\varphi_\mathrm{e}$ in $^\circ$', 'Interpreter', 'latex', 'FontSize',fs);
% legend('Soll', 'Ist')
% xlim([345.4 347.6]) 
% ylim([-2 0.2])

% figure
% subplot(3,1,1)
% plot(data_.t(startPoint_plot:endPoint_plot), 1000*(data_.xEE_soll_m_rad(startPoint_plot:endPoint_plot,1)-data_.xEE_ist_m_rad(startPoint_plot:endPoint_plot,1)),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% grid on; 
% % xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$e_x$ in $\mathrm{mm}$', 'Interpreter', 'latex', 'FontSize',fs);
% xlim([345.4 347.6]) 
% % ylim([-0.06 0.06])
% 
% subplot(3,1,2)
% plot(data_.t(startPoint_plot:endPoint_plot), 1000*(data_.xEE_soll_m_rad(startPoint_plot:endPoint_plot,2)-data_.xEE_ist_m_rad(startPoint_plot:endPoint_plot,2)),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% grid on; 
% % xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$e_y$ in $\mathrm{mm}$', 'Interpreter', 'latex', 'FontSize',fs);
% xlim([345.4 347.6]) 
% % ylim([-0.06 0.06])
% 
% subplot(3,1,3)
% plot(data_.t(startPoint_plot:endPoint_plot), 180/pi*data_.xEE_soll_m_rad(startPoint_plot:endPoint_plot,3)-180/pi*data_.xEE_ist_m_rad(startPoint_plot:endPoint_plot,3),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% grid on; 
% xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$e_\varphi$ in $^\circ$', 'Interpreter', 'latex', 'FontSize',fs);
% % legend('Soll', 'Ist')
% xlim([345.4 347.6]) 
% ylim([-2 0.2])

%%
% figure
% data_fft = data_.xEE_ist_m_rad(startPoint:endPoint,3); 
% data_fft = data_.xDEE_ist_ms_rads(startPoint:endPoint,3); 
% data_fft2 = dxEE_list(startPoint:endPoint,3); 
% data_fft3 = diff([data_.xEE_ist_m_rad(startPoint,3);data_.xEE_ist_m_rad(startPoint:endPoint,3)])*1000;

% data_fft = rad2deg(data_.QD_ist_rad_s(startPoint:endPoint,1)); % GLEICH
% data_fft2 = rad2deg(dqj_rad_list(startPoint:endPoint,1)); % UNGLEICH
% data_fft3 = rad2deg(dqj_rad_list_filt(startPoint:endPoint,1)); % GLEICH
% data_fft = data_.tauQa_ist_Nm(startPoint:endPoint,1); 

% data_fft = (data_.Q_ist_grad(startPoint:endPoint,1)); % GLEICH
% data_fft = data_fft - data_fft(1); % GLEICH


% plot(data_fft); hold on; 
% plot(data_fft2); hold on;
% plot(data_fft3, '--');
% legend('QD_ist', 'dqj_Jac', 'dqj_filt');
% figure
% calcFFT(1000, length(data_fft), data_fft)
% hold on; calcFFT(1000, length(data_fft3), data_fft3)


% return

%%
% figure
% % xEE_ist_filt = filter(Lowpass_XD_to_XDD(30),([data_.xEE_ist_m_rad(1,3); data_.xEE_ist_m_rad(:,3)]));
% % plot(xEE_ist_filt);
% % xDEE_ist_numdif = diff(xEE_ist_filt )*1000;
% plot(data_.t(startPoint:endPoint), 180/pi*data_.xEE_ist_m_rad((startPoint:endPoint),3),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% 
% % plot(data_.t(startPoint:endPoint), 180*pi*data_.xEE_ist_m_rad((startPoint:endPoint),3),'LineWidth',lw, 'Color', '#0504aa');hold on; 
% 
% % yyaxis right
% % plot(data_.t(startPoint:endPoint), data_.xEE_ist_m_rad((startPoint:endPoint),3)); ylabel('tauQa_soll_PD_Nm');
% grid on; 
% xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$ \varphi_\mathrm{e}$ in $^\circ$', 'Interpreter', 'latex', 'FontSize',fs);
% 
% figure
% plot(data_.t(startPoint:endPoint), 180/pi*out.simout.signals.values(6, startPoint:endPoint),'LineWidth',lw, 'Color', '#fdaa48');hold on; 
% plot(data_.t(startPoint:endPoint), 180/pi*out.simout.signals.values(3, startPoint:endPoint),'LineWidth',lw, 'Color', '#0504aa');hold on; 
% grid on; 
% xlabel('$t$ in s', 'Interpreter', 'latex', 'FontSize',fs);
% ylabel('$\varphi_\mathrm{e}$ in $^\circ$', 'Interpreter', 'latex', 'FontSize',fs);
% legend('Geometrische DK', 'Numerische DK')
%%
% clc

% qa0_tmp = qa0+ones(3,1)*(0.4014 - 0.4017); % 0.4014 bei qa0_tmp=[1,1,1]*deg2rad(23.0)
% qa0_tmp = ones(3,1)*deg2rad(23);
% qa0_tmp = [23.08 23.7 21.7]*pi/180;
% [xEE_1, xEE_2, xEE_3, qp2_cort] = calcEE_qp2Corrected(qa0, qp0, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id); xEE1 = xEE_1', xEE2 = xEE_2', xEE3 = xEE_3', qp2_cr = qp2_cort
% qp0(2)=qp2_cort;
% xEE_tmp = xEE_1;
% q13 = xEE_tmp(3) - (psi_j(1) + qa0_tmp(1) + qp0(1)); 
% q23 = xEE_tmp(3) - (psi_j(2) + qa0_tmp(2) + qp0(2)); 
% q33 = xEE_tmp(3) - (psi_j(3) + qa0_tmp(3) + qp0(3)); 
% qa0_tmp = qa0;
% q0 = [qa0_tmp(1); qp0(1); q13; ...
%      qa0_tmp(2); qp0(2); q23; ...
%      qa0_tmp(3); qp0(3); q33];
% 
% [xEE_1, xEE_2, xEE_3] = calcEE_eachChain(q0, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id); xEEchain1 = xEE_1', xEEchain2 = xEE_2', xEEchain3 = xEE_3'
% Point_tmp=180650;
% [test1, test2, test3, test4] = calcEE2(qa0, qp0, kin_params,  psi_j, beta_j);
% [test1, test2, test3, test4] = calcEE2(pi/180*data_.Q_ist_grad(90000, [1,4,7]), pi/180*data_.Q_ist_grad(90000, [2,5,8]), kin_params,  psi_j, beta_j);
% [test1, test2, test3, test4] = calcEE2(pi/180*data_.Q_ist_grad(Point_tmp, [1,4,7]), pi/180*data_.Q_ist_grad(Point_tmp, [2,5,8]), kin_params,  psi_j, beta_j);
% [qa_tmp, qp_tmp] = calcq(test1, kin_params, psi_j, beta_j);
% [test11, test22, test33, test44] = calcEE2(qa_tmp, qp_tmp, kin_params,  psi_j, beta_j);
% 
% data_.xEE_ist_m_rad(Point_tmp,:)
% qa_mess = pi/180*data_.Q_ist_grad(Point_tmp, [1,4,7])
% qa_tmp
% test1
% test11
% qp_mess = pi/180*data_.Q_ist_grad(Point_tmp, [2,5,8])
% qp_tmp
% 
% [xEE_1, xEE_2, xEE_3] = calcEE(pi/180*data_.Q_ist_grad(1,:), kin_params, psi_j, beta_j)
% % test1'
% % test2'
% test3'
% test1(3)*180/pi

% qa0*180/pi
% qp0*180/pi

% [test1, test2, test3, testqp2] = calcEE4(qa0, qp0, kin_params,  psi_j, beta_j);


% function [xEE_1, xEE_2, xEE_3, qp2_cort] = calcEE2(qa, qp, kin_params, psi_j, beta_j)
%     % Eingänge
%     %   qa=[qa1; qa2; qa3; delta] sind aktive Gelenkwinkel in rad bzw. m 
%     %   qp=[qp1; qp2; qp3] sind passive Gelenkwinkel in rad
%     %   kin_params=[Motorradius=1; 
%     %     Radius Mob Plat=0.3; 
%     %     Erster Arm=0.6; 
%     %     Zweiter Arm= 0.6] in m
% %     psi_j = [90, 210, 330]*pi/180; % Rotationswinkel um z-Achse, um von KS_0 in KS_Gj zu rotieren
% %     beta_j = [0, 120, 240]*pi/180; % Rotationswinkel um z-Achse, um von KS_Pj in KS_P zu rotieren
%     % Ausgänge
%     %   xEE_=[xe;ye;phie] in m bzw. rad und für alle drei Ketten berechnet
%     % Achtung: Aktuell wird die direkte Kinematik von zwei seriellen Ketten
%     % (1 und 3) verwendent, um qp2 (=qp2_cort) und xee_ zu berechnen. Grund: Da der Sensor am zweiten passiven Gelenk defekt ist
%     % Daher wird qp2_cort zusätzlich mit ausgegeben
%     
% % [pos_Mi_KS0_output, pos_Pi_KS0_output, xEE_]= calcEE(qa_deg, qp_deg, param_chain, pos_Gi_KS0, pos_Pi_KSEE, nrchain)
%        
%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
%     
%     R_initKS_ZwischenKS = [-1 0 0; 0 -1 0; 0 0 1];
%         
%     % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat + ... % Inertial zu Basisgelenk 1
%          [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l1 + ...% Basisgelenk1 zu Elle 1
%          [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l2; % Elle 1 zu Koppelgelenk 1
% 
%     % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat + ... % Inertial zu Basisgelenk 2
%          [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l1; % Basisgelenk 2 zu Elle 2
% %          [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l2; % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
%      
%     % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
%     P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat + ... % Inertial zu Basisgelenk 3
%          [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l1 + ... % Basisgelenk 3 zu Elle 3
%          [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l2; % Elle 3 zu Koppelgelenk 3
%     
% 
% %     phie = pi/3 - atan2( P3(1)-P1(1), P3(2)-P1(2));
% %     if P3(2)-P1(2) < 0 
% %         phie = pi*5/6 + atan2( P3(2)-P1(2), P3(1)-P1(1));
% %     elseif P3(2)-P1(2) > 0 
% %         phie = -pi*5/6 + atan2( P3(2)-P1(2), P3(1)-P1(1));
% %     end
%     
%     P3_new = R_initKS_ZwischenKS(1:2, 1:2)*P3;
%     P1_new = R_initKS_ZwischenKS(1:2, 1:2)*P1;
%     phie = atan2(P3_new(2)-P1_new(2), P3_new(1)-P1_new(1)) - 30*pi/180;
% %     phie = pi/3 - atan( (P3(1)-P1(1)) / (P3(2)-P1(2)) );
% 
%     % Endeffektorpose über erste und dritte Kette berechnet
%     pos_xEE_1 = P1 - [cos(beta_j(1)+phie); sin(beta_j(1)+phie)]*r_mobPlat;
%     pos_xEE_3 = P3 - [cos(beta_j(3)+phie); sin(beta_j(3)+phie)]*r_mobPlat;
% 
%     % Verwende berechnete EE-Pose, um qp2 nun zu berechnen
%     tmp = pos_xEE_1 + [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
% %     qp2_correct = pi/2 + atan2( tmp(1)-P2(1), tmp(2)-P2(2));
% %     qp2_correct = atan2( tmp(1)-P2(1), tmp(2)-P2(2)) +60*pi/180 - qa(2);
%     qp2_correct = atan2( tmp(2)-P2(2), tmp(1)-P2(1)) +150*pi/180 - qa(2);
% 
%     % Berechne direkte Kinematik der zweiten Kette mit neu berechnetem qp2
%     P2_correct = P2 + [cos(psi_j(2) + qa(2) + qp2_correct); sin(psi_j(2) + qa(2) + qp2_correct)]*l2;
%     pos_xEE_2 = P2_correct - [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
%     
%     % Ausgabe der EE-Pose über alle drei Ketten und qp2_correct
%      xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie];
%      xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie];
%      xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie];
%      qp2_cort = qp2_correct;
% end
% 
% 
% function [xEE_1, xEE_2, xEE_3] = calcEE(q, kin_params, psi_j, beta_j)
%     % Eingänge
%     %   qa=[qa1; qa2; qa3] sind aktive Gelenkwinkel in rad
%     %   qp=[qp1; qp2; qp3] sind passive Gelenkwinkel in rad
%     %   kin_params=[Motorradius=1; 
%     %     Radius Mob Plat=0.3; 
%     %     Erster Arm=0.6; 
%     %     Zweiter Arm= 0.6] in m
% %     psi_j = [90, 210, 330]*pi/180; % Rotationswinkel um z-Achse, um von KS_0 in KS_Gj zu rotieren
% %     beta_j = [0, 120, 240]*pi/180; % Rotationswinkel um z-Achse, um von KS_Pj in KS_P zu rotieren
%     % Ausgänge
%     %   xEE_=[xe;ye;phie] in m bzw. rad und für alle drei Ketten berechnet
%     
%     qa = q([1,4,7]);   
%     qp = q([2,5,8]);   
%     
%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
%         
%     % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat + ... % Inertial zu Basisgelenk 1
%          [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l1 + ...% Basisgelenk1 zu Elle 1
%          [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l2; % Elle 1 zu Koppelgelenk 1
% 
%     % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat + ... % Inertial zu Basisgelenk 2
%          [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l1 +... % Basisgelenk 2 zu Elle 2
%          [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l2; % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
%      
%     % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
%     P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat + ... % Inertial zu Basisgelenk 3
%          [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l1 + ... % Basisgelenk 3 zu Elle 3
%          [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l2; % Elle 3 zu Koppelgelenk 3
%     
% 
%     phie_1 = psi_j(1)+q(1)+q(2)+q(3);
%     phie_2 = psi_j(2)+q(4)+q(5)+q(6);
%     phie_3 = psi_j(3)+q(7)+q(8)+q(9);
% 
%     % Endeffektorpose über erste und dritte Kette berechnet
%     pos_xEE_1 = P1 - [cos(beta_j(1)+phie_1); sin(beta_j(1)+phie_1)]*r_mobPlat;
%     pos_xEE_2 = P2 - [cos(beta_j(2)+phie_2); sin(beta_j(2)+phie_2)]*r_mobPlat;   
%     pos_xEE_3 = P3 - [cos(beta_j(3)+phie_3); sin(beta_j(3)+phie_3)]*r_mobPlat;
% 
%     
%     % Ausgabe der EE-Pose über alle drei Ketten und qp2_correct
%      xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie_1];
%      xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie_2];
%      xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie_3];
% end
% 
% function [xEE_1, xEE_2, xEE_3, qp2_cort] = calcEE3(qa, qp, kin_params, psi_j, beta_j)
%     % Eingänge
%     %   qa=[qa1; qa2; qa3; delta] sind aktive Gelenkwinkel in rad bzw. m 
%     %   qp=[qp1; qp2; qp3] sind passive Gelenkwinkel in rad
%     %   kin_params=[Motorradius=1; 
%     %     Radius Mob Plat=0.3; 
%     %     Erster Arm=0.6; 
%     %     Zweiter Arm= 0.6] in m
% %     psi_j = [90, 210, 330]*pi/180; % Rotationswinkel um z-Achse, um von KS_0 in KS_Gj zu rotieren
% %     beta_j = [0, 120, 240]*pi/180; % Rotationswinkel um z-Achse, um von KS_Pj in KS_P zu rotieren
%     % Ausgänge
%     %   xEE_=[xe;ye;phie] in m bzw. rad und für alle drei Ketten berechnet
%     % Achtung: Aktuell wird die direkte Kinematik von zwei seriellen Ketten
%     % (1 und 3) verwendent, um qp2 (=qp2_cort) und xee_ zu berechnen. Grund: Da der Sensor am zweiten passiven Gelenk defekt ist
%     % Daher wird qp2_cort zusätzlich mit ausgegeben
%     
% % [pos_Mi_KS0_output, pos_Pi_KS0_output, xEE_]= calcEE(qa_deg, qp_deg, param_chain, pos_Gi_KS0, pos_Pi_KSEE, nrchain)
%        
%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
%         
%     % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat + ... % Inertial zu Basisgelenk 1
%          [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l1 + ...% Basisgelenk1 zu Elle 1
%          [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l2; % Elle 1 zu Koppelgelenk 1
% 
%     % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat + ... % Inertial zu Basisgelenk 2
%          [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l1; % Basisgelenk 2 zu Elle 2
% %          [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l2; % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
%      
%     % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
%     P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat + ... % Inertial zu Basisgelenk 3
%          [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l1 + ... % Basisgelenk 3 zu Elle 3
%          [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l2; % Elle 3 zu Koppelgelenk 3
%     
% 
% %     phie = pi/3 - atan2( P3(1)-P1(1), P3(2)-P1(2));
%     phie = pi/3 - atan( (P3(1)-P1(1)) / (P3(2)-P1(2)) );
%     
% 
%     % Endeffektorpose über erste und dritte Kette berechnet
%     pos_xEE_1 = P1 - [cos(beta_j(1)+phie); sin(beta_j(1)+phie)]*r_mobPlat;
%     pos_xEE_3 = P3 - [cos(beta_j(3)+phie); sin(beta_j(3)+phie)]*r_mobPlat;
% 
%     % Verwende berechnete EE-Pose, um qp2 nun zu berechnen
%     tmp = pos_xEE_1 + [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
% %     qp2_correct = pi/2 + atan2( tmp(1)-P2(1), tmp(2)-P2(2));
% %     qp2_correct = -qa(2) - psi_j(2) + wrapTo2Pi( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1))));
%     qp2_correct = -qa(2) - psi_j(2) +mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) )+2*pi, 2*pi);
%     
%     
%     % Berechne direkte Kinematik der zweiten Kette mit neu berechnetem qp2
%     P2_correct = P2 + [cos(psi_j(2) + qa(2) + qp2_correct); sin(psi_j(2) + qa(2) + qp2_correct)]*l2;
%     pos_xEE_2 = P2_correct - [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
%     
%     % Ausgabe der EE-Pose über alle drei Ketten und qp2_correct
%      xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie];
%      xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie];
%      xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie];
%      qp2_cort = qp2_correct;
% end
% 
% function [xEE_1, xEE_2, xEE_3, qp2_cort] = calcEE4(qa, qp, kin_params, psi_j, beta_j)
%     % Eingänge
%     %   qa=[qa1; qa2; qa3; delta] sind aktive Gelenkwinkel in rad bzw. m 
%     %   qp=[qp1; qp2; qp3] sind passive Gelenkwinkel in rad
%     %   kin_params=[Motorradius=1; 
%     %     Radius Mob Plat=0.3; 
%     %     Erster Arm=0.6; 
%     %     Zweiter Arm= 0.6] in m
% %     psi_j = [90, 210, 330]*pi/180; % Rotationswinkel um z-Achse, um von KS_0 in KS_Gj zu rotieren
% %     beta_j = [0, 120, 240]*pi/180; % Rotationswinkel um z-Achse, um von KS_Pj in KS_P zu rotieren
%     % Ausgänge
%     %   xEE_=[xe;ye;phie] in m bzw. rad und für alle drei Ketten berechnet
%     % Achtung: Aktuell wird die direkte Kinematik von zwei seriellen Ketten
%     % (1 und 3) verwendent, um qp2 (=qp2_cort) und xee_ zu berechnen. Grund: Da der Sensor am zweiten passiven Gelenk defekt ist
%     % Daher wird qp2_cort zusätzlich mit ausgegeben
%     
% % [pos_Mi_KS0_output, pos_Pi_KS0_output, xEE_]= calcEE(qa_deg, qp_deg, param_chain, pos_Gi_KS0, pos_Pi_KSEE, nrchain)
%        
%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
%         
%     % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat + ... % Inertial zu Basisgelenk 1
%          [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l1 + ...% Basisgelenk1 zu Elle 1
%          [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l2; % Elle 1 zu Koppelgelenk 1
% 
%     % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat + ... % Inertial zu Basisgelenk 2
%          [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l1; % Basisgelenk 2 zu Elle 2
% %          [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l2; % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
%      
%     % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
%     P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat + ... % Inertial zu Basisgelenk 3
%          [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l1 + ... % Basisgelenk 3 zu Elle 3
%          [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l2; % Elle 3 zu Koppelgelenk 3
%     
% 
% %     phie = pi/3 - atan2( P3(1)-P1(1), P3(2)-P1(2));
%     phie = pi/3 - atan( (P3(1)-P1(1)) / (P3(2)-P1(2)) );
% 
%     % Endeffektorpose über erste und dritte Kette berechnet
%     pos_xEE_1 = P1 - [cos(beta_j(1)+phie); sin(beta_j(1)+phie)]*r_mobPlat;
%     pos_xEE_3 = P3 - [cos(beta_j(3)+phie); sin(beta_j(3)+phie)]*r_mobPlat;
% 
%     % Verwende berechnete EE-Pose, um qp2 nun zu berechnen
%     tmp = pos_xEE_1 + [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
% %     qp2_correct = pi/2 + atan2( tmp(1)-P2(1), tmp(2)-P2(2));
% %     qp2_correct = -qa(2) - psi_j(2) + mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) +2*pi ), 2*pi);
% %     qp2_correct = -qa(2) - psi_j(2) +mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) )+2*pi, 2*pi);
%     qp2_correct =mod( -qa(2) - psi_j(2) +mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) )+2*pi, 2*pi)+2*pi,2*pi);
% 
%     % Berechne direkte Kinematik der zweiten Kette mit neu berechnetem qp2
%     P2_correct = P2 + [cos(psi_j(2) + qa(2) + qp2_correct); sin(psi_j(2) + qa(2) + qp2_correct)]*l2;
%     pos_xEE_2 = P2_correct - [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
%     
%     % Ausgabe der EE-Pose über alle drei Ketten und qp2_correct
%      xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie];
%      xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie];
%      xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie];
%      qp2_cort = qp2_correct;
% end
% 
% function [x,y,r] = calcCircle_in_3circles(qa, psi_j, kin_params)
% 
%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
%     % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat + ... % Inertial zu Basisgelenk 1
%          [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l1 ;
% 
%     % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat + ... % Inertial zu Basisgelenk 2
%          [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l1;
% 
%     % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
%     P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat + ... % Inertial zu Basisgelenk 3
%          [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l1 ;
% 
%     %Three circles
%     x_1=P1(1); y_1=P1(2); r_1 = l2;
%     x_2=P2(1); y_2=P2(2); r_2 = l2;
%     x_3=P3(1); y_3=P3(2); r_3 = l2;
% 
%     % Find constant of circle #2- cirlce #1
%     K_a = -r_1^2+r_2^2+x_1^2-x_2^2+y_1^2-y_2^2;
%     % Find constant of circle #3- cirlce #1
%     K_b = -r_1^2+r_3^2+x_1^2-x_3^2+y_1^2-y_3^2;
% 
%     % Find constants of [x=A_0+A_1*r, y=B_0+B_1*r]
%     D = x_1*(y_2-y_3)+x_2*(y_3-y_1)+x_3*(y_1-y_2);
%     A_0=(K_a*(y_1-y_3)+K_b*(y_2-y_1))/(2*D);
%     B_0=-(K_a*(x_1-x_3)+K_b*(x_2-x_1))/(2*D);
%     % A_1=-(r_1*(y_2-y_3)+r_2*(y_3-y_1)+r_3*(y_1-y_2))/D;
%     % B_1=(r_1*(x_2-x_3)+r_2*(x_3-x_1)+r_3*(x_1-x_2))/D;
%     A_1=-(r_1*(y_2-y_3)+r_2*(y_3-y_1)+r_3*(y_1-y_2))/D;
%     B_1=(r_1*(x_2-x_3)+r_2*(x_3-x_1)+r_3*(x_1-x_2))/D;
% 
%     % Find constants of C_0 + 2*C_1*r + C_2^2 = 0
%     C_0=A_0^2-2*A_0*x_1+B_0^2-2*B_0*y_1-r_1^2+x_1^2+y_1^2;
%     C_1=A_0*A_1-A_1*x_1+B_0*B_1-B_1*y_1-r_1;
%     C_2=A_1^2+B_1^2-1;
% 
%     % Solve for r
%     r=(-sqrt(C_1^2-C_0*C_2)-C_1)/C_2;
%     % r=r_mobPlat;
% 
%     % Solve for [x,y]
%     x = A_0+A_1*r;
%     y = B_0+B_1*r;
% 
%     r;
% 
%     A= 2*[x_2-x_1, y_2-y_1; ...
%           x_3-x_1, y_3-y_1]; 
%     b= [x_2^2+y_2^2-x_1^2-y_1^2;...
%         x_3^2+y_3^2-x_1^2-y_1^2];
% 
%     inv(A)*b;
% 
%     R=sqrt((x-x_1)^2+(y-y_1)^2);
%     xintsec1 = 0.5*(x_1+x)+(x-x_1)*(r_1^2-r^2)/(2*R^2) + 0.5*sqrt(2*(r_1^2+r^2)/R^2-(r_1^2-r^2)^2*1/R^4-1)*(y-y_1);
%     yintsec1 = 0.5*(y_1+y)+(y-y_1)*(r_1^2-r^2)/(2*R^2) + 0.5*sqrt(2*(r_1^2+r^2)/R^2-(r_1^2-r^2)^2*1/R^4-1)*(x-x_1);
% 
% %     phiintsec_grad = rad2deg(atan2(yintsec1, xintsec1))
%     phiintsec_grad = 0; % Funktioniert nicht
% end
% 
% function h = draw_circle(x,y,r)
%     hold on
%     t = 0:pi/100:2*pi;
%     x_p = r*cos(t)+x;
%     y_p = r*sin(t)+y;
%     h = plot(x_p,y_p);
%     grid on
%     hold off
% end