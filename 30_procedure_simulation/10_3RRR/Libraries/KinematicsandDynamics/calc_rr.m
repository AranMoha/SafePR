function  [mode, tau_soll, dqa_out, ddqa_out, tau_out, e_qa, de_qa, qa_soll,...
          h_kappa_out, dq_all,  ddq_all, tau_all, sigma_activ_list, h_kappa_flag_out, ...
          x_soll_r, x_ist_r, dq_Jkappa, dq_Jdist, mode_nan, M_kappa, M_dist] = ...
            calc_rr(x_soll, x_ist, qa_ist, dqa_ist, dx_soll, J_hredxqa, ddx_soll, ...
                    dJ_hredxqa, param, MMQa_ist, dx_ist, ddqa_prev, dqa_prev, mode_prev, ...
                    D_pose, K_pose, tau_prev, taucX_ist, kappa_ist, min_dist, dkappa, ...
                    dmindist, J_kappa, J_dist, dJ_kappa, dJ_dist, MMX_ist, taucQa_ist, ...
                    tauCQa_ist, xp_soll, dxp_soll, ddxp_soll, xp_KSGj_ist, dxp_KSGj_ist, dRxp_ist, ...
                    R_0Gj, dR_0Gj, J_xpqa, J_xpqa_KS0, dJ_xpqa_KS0, dxp_KS0_ist, xp_KS0_ist, ...
                    dJ_xpqa, predbody, BP_Retr_calc_run_KSGj, rr_level, rueck_KS0, ...
                    lambda_dq, lambda_ddq, lambda_tau, pd_reglerQ, kappa_mindist_lim, priority_x, gain_check_status_kappa, gain_check_status_mindist,...
                    activate_bp_UNB, kappa_traj_soll, mindist_traj_soll, rueckzug_aktiv, reaction_angle_rad,...
                    clamping_predicted, clampingBody_predicted, clampingreaction_aktiv, traj_qap_soll_cl, J_q_qa, dJ_q_qa, q_ist_rad, dq_ist_rads)

    persistent h_kappa_flag h_kappa dqa_pretran ddqa_pretran tau_pretran
    
    if isempty(h_kappa_flag)
        h_kappa_flag=1;
        h_kappa = 0;
        dqa_pretran = zeros(3,1);
        ddqa_pretran = zeros(3,1);
        tau_pretran = zeros(3,1);
    end       
    MMQa_ist_inv = MMQa_ist\ eye(3,3);
    dq_all = zeros(12,1);
    ddq_all = dq_all;
    tau_all = zeros(12,1);
    kappa_lim = kappa_mindist_lim(1);
    kappa_soll = kappa_lim;
    dkappa_soll = 0;
    ddkappa_soll = 0;
    kappa_lim_soft = kappa_mindist_lim(2);
    mindist_lim = kappa_mindist_lim(3);
    mindist_soll = mindist_lim;
    dmindist_soll = 0;
    ddmindist_soll = 0;
    mindist_lim_soft = kappa_mindist_lim(4);
    mode_nan = 0;
    M_kappa = nan;
    M_dist = nan;
    % Trajektorie für Kappa und Mindist
    if activate_bp_UNB == 1 && length(kappa_traj_soll)==3 && length(mindist_traj_soll)==3
        kappa_soll = kappa_traj_soll(1); 
        dkappa_soll = kappa_traj_soll(2);
        ddkappa_soll = kappa_traj_soll(3);
        mindist_soll = mindist_traj_soll(1);
        dmindist_soll = mindist_traj_soll(2);
        ddmindist_soll = mindist_traj_soll(3);
    end
    % Augmented Jacobi und Nullraumprojektoren aufstellen
    % Verstärkungsfaktoren übernehmen
    lambda_posxy = eye([2,2])*lambda_dq(1);
    lambda_z = lambda_dq(2);
    lambda_kappa = lambda_dq(3);
    lambda_dist = lambda_dq(4);
    lambda_xpy = lambda_dq(5);
    lambda_xp_qa = lambda_dq(6);
    lambda_xp = eye([2,2])*lambda_dq(7);
    lambda_clamp_qap = eye([2,2])*lambda_dq(8);
%%% Beschleunigungslevel
    lambda_posxy_ddqa = eye([2,2])*lambda_ddq(1);
    lambda_dposxy_ddqa = eye([2,2])*lambda_ddq(2);
    lambda_z_ddqa = lambda_ddq(3);
    lambda_dz_ddqa = lambda_ddq(4);
    lambda_kappa_ddqa = lambda_ddq(5);
    lambda_dkappa_ddqa = lambda_ddq(6);
    lambda_dist_ddqa = lambda_ddq(7);
    lambda_ddist_ddqa = lambda_ddq(8);
    lambda_xp_qa_ddqa = lambda_ddq(9);
    lambda_dxp_qa_ddqa = lambda_ddq(10);
    lambda_xpy_ddqa = lambda_ddq(11);
    lambda_dxpy_ddqa = lambda_ddq(12);
    lambda_xp_KS0_ddqa = eye([2,2])*lambda_ddq(13);
    lambda_dxp_KS0_ddqa = eye([2,2])*lambda_ddq(14);
    lambda_clamp_qap_ddqa = eye([2,2])*lambda_ddq(15);
    lambda_clamp_dqap_ddqa = eye([2,2])*lambda_ddq(16);
%%% Kraftlevel
    lambda_kappa_tau = lambda_tau(1);
    lambda_dkappa_tau = lambda_tau(2);
    lambda_dist_tau = lambda_tau(3);
    lambda_ddist_tau = lambda_tau(4);
    lambda_xp_qa_tau = lambda_tau(5);
    lambda_dxp_qa_tau = lambda_tau(6);
    lambda_xpy_tau = lambda_tau(7);
    lambda_dxpy_tau = lambda_tau(8);
    lambda_xp_KS0_tau = eye([2,2])*lambda_tau(9);
    lambda_dxp_KS0_tau = eye([2,2])*lambda_tau(10);
    lambda_dkappa_tau_entkoppelt = lambda_tau(11);
    lambda_dmindist_tau_entkoppelt = lambda_tau(12);
    lambda_clamp_qap_tau = lambda_tau(13);
    lambda_clamp_qap_tau_entkoppelt = lambda_tau(14);
    lambda_clamp_dqap_tau_enkoppeln = lambda_tau(15);
    lambda_clamp_dqa_tau = lambda_tau(16);
    lambda_clamp_dqp_tau = lambda_tau(17);

    
    dqa=zeros(3,1);
    ddqa=zeros(3,1);
    h_kappa_out=0;
    h_kappa_flag_out=0;
    hkappa=1;
    tau=zeros(3,1);
    sigma_activ_list = ones(8,1)*(-1);
    qa_soll=zeros(3,1);
    x_soll_r   = x_soll;
    x_ist_r   = x_ist;
    dx_soll_r  = dx_soll;
    dx_ist_r  = dx_ist;
    ddx_soll_r = ddx_soll;
    J_hredxqa_r = J_hredxqa;
%     R_R_0=eye(3,3);
%     sigma_pos=0;
%     dsigma_pos=0;

        %% Rueckzug 
        if rueckzug_aktiv==1 && priority_x == 1
%             n_pos = 1;
%             R_0_E = CalcRot_Eul([0 0 x_ist(3)]);
            R_R_0 = CalcRot_Eul([0 0 reaction_angle_rad]);
%             R_E_R = R_0_E'*R_0_R;
%             R_E_R = R_R_0;
            x_soll_r(1:2,:)   = R_R_0(1:2,1:2)*x_soll(1:2,:);
            dx_soll_r(1:2,:)  = R_R_0(1:2,1:2)*dx_soll(1:2,:);
            ddx_soll_r(1:2,:) = R_R_0(1:2,1:2)*ddx_soll(1:2,:);
            x_ist_r(1:2,:)    = R_R_0(1:2,1:2)*x_ist(1:2,:);
            dx_ist_r(1:2,:)   = R_R_0(1:2,1:2)*dx_ist(1:2,:);
            J_hredxqa_r(1:2,:)= R_R_0(1:2,1:2)*J_hredxqa(1:2,:);
            x_soll   = x_soll_r;
            x_ist   = x_ist_r;
            dx_soll  = dx_soll_r;
            dx_ist  = dx_ist_r;
            ddx_soll = ddx_soll_r;
            J_hredxqa = J_hredxqa_r;
        end
        %% Fehler berechnen
        % Fehler Rotation berechnen
        e = x_soll - x_ist;
        sigma_posxy_tilde = e(1:2); % Entspricht sigma_1_des - sigma_1
        sigma_z_tilde = e(3);


        % Fehler bzgl Kontaktkoordinaten
%         if predbody>0 && predbody<7
            nr_chain = 1;
            if predbody == 1 || predbody == 2
                nr_chain = 1;
            elseif predbody == 3 || predbody == 4
                nr_chain = 2;
            elseif predbody == 5 || predbody == 6
                nr_chain = 3;
            end
            if (predbody==1 || predbody==3 || predbody==5) 
                if isscalar(xp_soll)
                    e_xp = xp_soll(1) - qa_ist(nr_chain);
                else
                    e_xp = xp_soll(nr_chain) - qa_ist(nr_chain);
                end        
                if isscalar(dxp_soll)
                    dsigma_xp = dxp_soll(1);
                else
                    dsigma_xp = dxp_soll(nr_chain);
                end            
                if isscalar(ddxp_soll)
                    ddsigma_xp = ddxp_soll(1);
                else
                    ddsigma_xp = ddxp_soll(nr_chain);
                end
                dsigma_xp_ist = dqa_ist(nr_chain);
                J_xp = J_xpqa(1,:);        
                dJ_xp=dJ_xpqa(1,:);
                lambda_xp_dqa = lambda_xp_qa;     % lambda_xp_qa
                lambda_xp_ddqa = lambda_xp_qa_ddqa;   % lambda_xp_qa_ddqa
                lambda_dxp_ddqa = lambda_dxp_qa_ddqa; % lambda_dxp_qa_ddqa
                lambda_xp_tau = lambda_xp_qa_tau;    % lambda_xp_qa_tau
                lambda_dxp_tau = lambda_dxp_qa_tau;  % lambda_dxp_qa_tau

            else%if predbody==2 || predbody==4 || predbody==6
                if rueck_KS0 == 2
                    if isscalar(xp_soll)
                        e_xp = xp_soll(1) - xp_KSGj_ist(1);
                    else
%                         dRxp_soll = dR_0Gj(1:2,1:2)*R_0Gj(1:2,1:2)*xp_soll(1:2);
%                         e_xp = (xp_soll(2)-dRxp_soll(2)*0) - (xp_KSGj_ist(2)-dRxp_ist(2)*0);
                        e_xp = xp_soll(2) - xp_KSGj_ist(2);
                    end            
                    if isscalar(dxp_soll)
                        dsigma_xp = dxp_soll(1);
                    else
                        dsigma_xp = dxp_soll(2);
                    end            
                    if isscalar(ddxp_soll)
                        ddsigma_xp = ddxp_soll(1);
                    else
                        ddsigma_xp = ddxp_soll(2);
                    end
                    dsigma_xp_ist = dxp_KSGj_ist(2);
                    J_xp = J_xpqa(2,:);        
                    dJ_xp=dJ_xpqa(2,:);
                    lambda_xp_dqa = lambda_xpy;     % lambda_xpy
                    lambda_xp_ddqa = lambda_xpy_ddqa;  % lambda_xpy_ddqa
                    lambda_dxp_ddqa = lambda_dxpy_ddqa; % lambda_dxpy_ddqa
                    lambda_xp_tau = lambda_xpy_tau;    % lambda_xpy_tau
                    lambda_dxp_tau = lambda_dxpy_tau;   % lambda_dxpy_tau
                else
                    if isscalar(xp_soll)
                        e_xp = zeros(2,1);
                    else
                        e_xp = xp_soll(1:2) - xp_KS0_ist(1:2);
                    end
                    if isscalar(dxp_soll)
                        dsigma_xp = zeros(2,1);
                    else
                        dsigma_xp = dxp_soll(1:2);
                    end            
                    if isscalar(ddxp_soll)
                        ddsigma_xp = zeros(2,1);
                    else
                        ddsigma_xp = ddxp_soll(1:2);
                    end

                    dsigma_xp_ist = dxp_KS0_ist(1:2);
                    J_xp = J_xpqa_KS0(1:2,:);    
                    dJ_xp=dJ_xpqa_KS0(1:2,:);
                    lambda_xp_dqa = lambda_xp;     % lambda_xp
                    lambda_xp_ddqa = lambda_xp_KS0_ddqa; % lambda_xp_ddqa
                    lambda_dxp_ddqa = lambda_dxp_KS0_ddqa; % lambda_dxp_ddqa
                    lambda_xp_tau = lambda_xp_KS0_tau;    % lambda_xp_tau
                    lambda_dxp_tau = lambda_dxp_KS0_tau;  % lambda_dxp_tau
                end
            end
        dsigma_posxy_des = dx_soll(1:2); % Setzen der Sollgeschwindigkeit der rotatorischen Freiheitsgrade
        dsigma_z_des = dx_soll(3);
        sigma_kappa_tilde = kappa_soll - kappa_ist;
%             dsigma_kappa_des = dkappa_soll;  % Abweichung Konditionszahl berechnen und analog "normaler Regler" als soll
%             ddsigma_kappa_des = ddkappa_soll;
        sigma_dist_tilde = mindist_soll - min_dist;
%             dsigma_dist_des = dmindist_soll; % Abweichung minimale Distanz berechnen
%             ddsigma_dist_des = ddmindist_soll;
        dqa1_pred = zeros(3,1);
        dqa2_pred = zeros(3,1);
        dqa3_pred = zeros(3,1);
        dqa4_pred = zeros(3,1);
        dqa_1 = zeros(3,1);
        dqa_2 = zeros(3,1);
        dqa_3 = zeros(3,1);
        dqa_4 = zeros(3,1);
        ddqa_1 = zeros(3,1);
        ddqa_2 = zeros(3,1);
        ddqa_3 = zeros(3,1);
        ddqa_4 = zeros(3,1);
        tau_1 = zeros(3,1);
        tau_2 = zeros(3,1);
        tau_3 = zeros(3,1);
        tau_4 = zeros(3,1);
        if rr_level == 1
            % Referenzgroessen berechnen
            dsigma_posxy_ref = dsigma_posxy_des + lambda_posxy * sigma_posxy_tilde;
            dsigma_posy_xp_ref = dsigma_xp + lambda_xp_dqa * e_xp;
            dsigma_z_ref = dsigma_z_des + lambda_z * sigma_z_tilde;
            dsigma_kappa_ref = dkappa_soll + lambda_kappa * sigma_kappa_tilde;
            dsigma_dist_ref = dmindist_soll + lambda_dist * sigma_dist_tilde;
            % Klemmreaktion
            if clampingreaction_aktiv==1 && clamping_predicted==1 && rueckzug_aktiv == 1
                [dqa_1, dqa_2, dqa_3, dqa_4] = calc_rr_dqa_klemmreaktion(q_ist_rad, traj_qap_soll_cl, clampingBody_predicted, lambda_clamp_qap,...
                                               dsigma_posxy_ref, dsigma_z_ref, dsigma_kappa_ref, dsigma_dist_ref,...
                                               J_hredxqa, J_kappa, J_dist, J_q_qa);
            else % Kollisionsreaktion
                %%%%%%%%% Rückzugsrichtung ist parallel zur Wirklinie im Arbeitsraum und diese Richtung hat höhere Prio als in restlichen Koordinaten
                if priority_x == 1 && rueckzug_aktiv==1 
                    [dqa_1, dqa_2, dqa_3, dqa_4] = calc_rr_dqa_rueckzugaktiv_priox(dsigma_posxy_ref, dsigma_z_ref, dsigma_kappa_ref, dsigma_dist_ref,...
                                                                                   J_hredxqa, J_kappa, J_dist);
                else % Rückzugsrichtung ist in Arbeitsraumkoordinaten formuliert
                    [dqa_1, dqa_2, dqa_3, dqa_4] = calc_rr_dqa_rueckzugaktiv(dsigma_posxy_ref, dsigma_z_ref, dsigma_kappa_ref, dsigma_dist_ref, ...
                                                                             J_hredxqa, J_kappa, J_dist);
                end
                %%%%%%%%% Rückzugsbahn des Kontaktortes ist in Kontaktkoordinaten (rueck_KS0=2) oder in Arbeitsraumkoordinaten (rueck_KS0=3) formuliert
                if rueckzug_aktiv == 1 && (rueck_KS0 == 2 || rueck_KS0 == 3) && predbody>0 && predbody<7  
                    [dqa_1, dqa_2, dqa_3, dqa_4] = calc_rr_dqa_rueckzugaktiv_xp(dsigma_posy_xp_ref, dsigma_posxy_ref, dsigma_z_ref, dsigma_kappa_ref, dsigma_dist_ref, ...
                                                                                J_hredxqa, J_kappa, J_dist, J_xp);
                end
            end
            dqa1_pred = dqa_1;
            dqa2_pred = dqa_2;
            dqa3_pred = dqa_3;
            dqa4_pred = dqa_4;
        elseif rr_level == 2
            % Redundanzauflösung und Bestimmung von ddqa
            ddsigma_pose_d = zeros(3,1);
            ddsigma_pose_d(1:2,1) = lambda_posxy_ddqa*e(1:2)+lambda_dposxy_ddqa*(dx_soll(1:2)*1-dx_ist(1:2));
            ddsigma_pose_d(3,1) = lambda_z_ddqa*e(3)+lambda_dz_ddqa*(dx_soll(3)*1-dx_ist(3));
            ddsigma_pose_ref = (ddx_soll*1 + ddsigma_pose_d) - dJ_hredxqa*dqa_ist;

            ddkappa_ref = ddkappa_soll + lambda_kappa_ddqa*sigma_kappa_tilde + lambda_dkappa_ddqa*(dkappa_soll-dkappa);
            ddsigma_kappa_ref = ddkappa_ref - dJ_kappa*dqa_ist*1;

            ddmindist_ref = ddmindist_soll + lambda_dist_ddqa*sigma_dist_tilde + lambda_ddist_ddqa*(dmindist_soll-dmindist);
            ddsigma_mindist_ref = ddmindist_ref - dJ_dist*dqa_ist*1;

            dd_posy_xp_ref = ddsigma_xp + lambda_xp_ddqa*e_xp + lambda_dxp_ddqa * (dsigma_xp - dsigma_xp_ist);
            ddsigma_posy_xp_ref = dd_posy_xp_ref - dJ_xp*dqa_ist;
            % Klemmreaktion
            if clampingreaction_aktiv && clamping_predicted==1 && rueckzug_aktiv == 1
                [ddqa_1, ddqa_2, ddqa_3, ddqa_4] = calc_rr_ddqa_klemmreaktion(q_ist_rad, dq_ist_rads, traj_qap_soll_cl, clampingBody_predicted,...
                                                                              lambda_clamp_qap_ddqa, lambda_clamp_dqap_ddqa,...
                                                                              ddsigma_pose_ref, ddsigma_kappa_ref, ddsigma_mindist_ref,...
                                                                              J_hredxqa, J_kappa, J_dist, J_q_qa);
            else
                %%%%%%%%% Rückzugsrichtung ist parallel zur Wirklinie im Arbeitsraum und diese Richtung hat höhere Prio als in restlichen Koordinaten
                if priority_x == 1 && rueckzug_aktiv==1
                    [ddqa_1, ddqa_2, ddqa_3, ddqa_4] =calc_rr_ddqa_rueckzugaktiv_priox(ddsigma_pose_ref, ddsigma_kappa_ref, ddsigma_mindist_ref, ...
                                                                                       J_hredxqa, J_kappa, J_dist);
                else % Rückzugsrichtung ist in Arbeitsraumkoordinaten formuliert
                    [ddqa_1, ddqa_2, ddqa_3, ddqa_4] = calc_rr_ddqa_rueckzugaktiv(ddsigma_pose_ref, ddsigma_kappa_ref, ddsigma_mindist_ref,...
                                                                                  J_hredxqa, J_kappa, J_dist);
                end
                %%%%%%%%% Rückzugsbahn des Kontaktortes ist in Kontaktkoordinaten (rueck_KS0=2) oder in Arbeitsraumkoordinaten (rueck_KS0=3) formuliert
                if rueckzug_aktiv == 1 && (rueck_KS0 == 2 || rueck_KS0 == 3) && predbody>0 && predbody<7
                    [ddqa_1, ddqa_2, ddqa_3, ddqa_4] = calc_rr_ddqa_rueckzugaktiv_xp(ddsigma_posy_xp_ref, ddsigma_pose_ref, ddsigma_kappa_ref, ddsigma_mindist_ref, ...
                                                                                     J_hredxqa, J_kappa, J_dist, J_xp);
                end
            end    
            dqa1_pred = (ddqa_1*param.t_sample+dqa_ist*1);
            dqa2_pred = (ddqa_2*param.t_sample+dqa_ist*1);
            dqa3_pred = (ddqa_3*param.t_sample+dqa_ist*1);
            dqa4_pred = (ddqa_4*param.t_sample+dqa_ist*1);
        elseif rr_level == 3
            % Referenzgrößen bestimmen
            M_kappa = (J_kappa*MMQa_ist_inv*J_kappa')\ eye(1,1);
            M_dist = (J_dist *MMQa_ist_inv*J_dist')\ eye(1,1);
            D_kappa = calcD(lambda_kappa_tau, M_kappa, lambda_dkappa_tau_entkoppelt);
            D_dist = calcD(lambda_dist_tau, M_dist, lambda_dmindist_tau_entkoppelt);
%                 D_kappa = lambda_dkappa_tau;
%                 D_dist = lambda_ddist_tau;
            c_kappa = M_kappa*(J_kappa*MMQa_ist_inv*taucQa_ist-dJ_kappa*dqa_ist);
            c_dist = M_dist*(J_dist*MMQa_ist_inv*taucQa_ist-dJ_dist*dqa_ist);
            % C_kappa = PInv_J_kappa'*(tauCQa_ist - MMQa_ist_inv*PInv_J_kappa*dJ_kappa)*PInv_J_kappa;
%         %         D_kappa = lambda_dkappa_tau;
%         %         D_dist = lambda_ddist_tau;        
            F_pose_ref  = MMX_ist*ddx_soll      + K_pose*e                           + D_pose*(dx_soll-dx_ist)        ;%+ taucX_ist;
            F_kappa_ref = M_kappa*ddkappa_soll  + lambda_kappa_tau*sigma_kappa_tilde + D_kappa*(dkappa_soll-dkappa)   ;%+ C_kappa*dkappa_soll;
            F_dist_ref  = M_dist*ddmindist_soll + lambda_dist_tau*sigma_dist_tilde   + D_dist*(dmindist_soll-dmindist);% + c_dist;


            % Klemmreaktion
            if clampingreaction_aktiv && clamping_predicted==1 && rueckzug_aktiv == 1
                [tau_1, tau_2, tau_3, tau_4] = calc_rr_tau_klemmreaktion(q_ist_rad, dq_ist_rads, traj_qap_soll_cl, clampingBody_predicted, ...
                                                                         F_pose_ref, F_kappa_ref, F_dist_ref, ...
                                                                         lambda_clamp_qap_tau, lambda_clamp_qap_tau_entkoppelt, lambda_clamp_dqap_tau_enkoppeln, lambda_clamp_dqa_tau, lambda_clamp_dqp_tau,...
                                                                         J_hredxqa, J_kappa, J_dist, J_q_qa,...
                                                                         MMQa_ist, MMQa_ist_inv);
            else
                if priority_x == 1 && rueckzug_aktiv==1
                    [tau_1, tau_2, tau_3, tau_4] = calc_rr_tau_rueckzugaktiv_priox(F_pose_ref, F_kappa_ref, F_dist_ref, ...
                                                                                   J_hredxqa, J_kappa, J_dist,...
                                                                                   MMQa_ist_inv);
                else
                    [tau_1, tau_2, tau_3, tau_4] = calc_rr_tau_rueckzugaktiv(F_pose_ref, F_kappa_ref, F_dist_ref, ...
                                                                             J_hredxqa, J_kappa, J_dist,...
                                                                             MMQa_ist_inv);                    
                end
                if rueckzug_aktiv == 1 && (rueck_KS0 == 2 || rueck_KS0 == 3) && predbody>0 && predbody<7   
                    M_xp = (J_xp *MMQa_ist_inv*J_xp')\ eye(size(J_xp,1),size(J_xp,1));
                    D_xp = calcD(lambda_xp_tau, M_xp, 1);
                    %                     D_xp = lambda_dxp_tau;
                    F_xp_ref    = M_xp*ddsigma_xp         + lambda_xp_tau*e_xp                       + D_xp*(dsigma_xp - dsigma_xp_ist);  
                    [tau_1, tau_2, tau_3, tau_4] = calc_rr_tau_rueckzugaktiv_xp(F_xp_ref, F_pose_ref, F_kappa_ref, F_dist_ref, ...
                                                                                J_hredxqa, J_kappa, J_dist, J_xp,...
                                                                                MMQa_ist_inv);
                end
            end
            dqa1_pred = (MMQa_ist_inv*(tau_1-taucQa_ist)*param.t_sample+dqa_ist*1);
            dqa2_pred = (MMQa_ist_inv*(tau_2-taucQa_ist)*param.t_sample+dqa_ist*1);
            dqa3_pred = (MMQa_ist_inv*(tau_3-taucQa_ist)*param.t_sample+dqa_ist*1);
            dqa4_pred = (MMQa_ist_inv*(tau_4-taucQa_ist)*param.t_sample+dqa_ist*1);
        end

        %% Prüfen, ob inequality Tasks erfüllt sind / Mode wählen
%         if J_kappa*dqa1_pred>0 && kappa_ist > param.kappa_grenz
%             a=dqa1_pred;
%         else
%             b=dqa1_pred;
%         end
        dkappa_dq1 = J_kappa*dqa1_pred;
        dkappa_dq2 = J_kappa*dqa2_pred;
        dkappa_dq3 = J_kappa*dqa3_pred;
        dkappa_dq4 = J_kappa*dqa4_pred;
        dmindist_dq1 = J_dist*dqa1_pred;
        dmindist_dq2 = J_dist*dqa2_pred;
        dmindist_dq3 = J_dist*dqa3_pred;
        dmindist_dq4 = J_dist*dqa4_pred;
        
        if rr_level == 2
            dkappa_dq1 = (dJ_kappa*dqa_ist + J_kappa*ddqa_1)*param.t_sample+dkappa*0;
            dkappa_dq2 = (dJ_kappa*dqa_ist + J_kappa*ddqa_2)*param.t_sample+dkappa*0;
            dkappa_dq3 = (dJ_kappa*dqa_ist + J_kappa*ddqa_3)*param.t_sample+dkappa*0;
            dkappa_dq4 = (dJ_kappa*dqa_ist + J_kappa*ddqa_4)*param.t_sample+dkappa*0;
            dmindist_dq1 = (dJ_dist*dqa_ist + J_dist*ddqa_1)*param.t_sample+dmindist*0;
            dmindist_dq2 = (dJ_dist*dqa_ist + J_dist*ddqa_2)*param.t_sample+dmindist*0;
            dmindist_dq3 = (dJ_dist*dqa_ist + J_dist*ddqa_3)*param.t_sample+dmindist*0;
            dmindist_dq4 = (dJ_dist*dqa_ist + J_dist*ddqa_4)*param.t_sample+dmindist*0;
        end
        
        dq_Jkappa = [dkappa_dq1; dkappa_dq2; dkappa_dq3; dkappa_dq4];
        dq_Jdist  = [dmindist_dq1;  dmindist_dq2;  dmindist_dq3;  dmindist_dq4];
        sigma_a1 = check_status(dkappa_dq1,    kappa_ist + 0*dkappa_dq1*param.t_sample,[0 kappa_lim_soft], gain_check_status_kappa);   % a korrekt bei dq1?
        sigma_b1 = check_status(dmindist_dq1,  min_dist  + 0*dmindist_dq1*param.t_sample,[mindist_lim_soft 100], gain_check_status_mindist); % b korrekt bei dq1?
        sigma_a2 = check_status(dkappa_dq2,    kappa_ist + 0*dkappa_dq2*param.t_sample,[0 kappa_lim_soft], gain_check_status_kappa);   % a korrekt bei dq2?
        sigma_b2 = check_status(dmindist_dq2,  min_dist  + 0*dmindist_dq2*param.t_sample,[mindist_lim_soft 100], gain_check_status_mindist); % b korrekt bei dq2?
        sigma_a3 = check_status(dkappa_dq3,    kappa_ist + 0*dkappa_dq3*param.t_sample,[0 kappa_lim_soft], gain_check_status_kappa);   % a korrekt bei dq3?
        sigma_b3 = check_status(dmindist_dq3,  min_dist  + 0*dmindist_dq3*param.t_sample,[mindist_lim_soft 100], gain_check_status_mindist); % b korrekt bei dq3?
        sigma_a4 = check_status(dkappa_dq4,    kappa_ist + 0*dkappa_dq4*param.t_sample,[0 kappa_lim_soft], gain_check_status_kappa);   % a korrekt bei dq3?
        sigma_b4 = check_status(dmindist_dq4,  min_dist  + 0*dmindist_dq4*param.t_sample,[mindist_lim_soft 100], gain_check_status_mindist); % b korrekt bei dq3?
        sigma_activ_list(:,:) = [sigma_a1; sigma_a2; sigma_a3; sigma_a4; sigma_b1; sigma_b2; sigma_b3; sigma_b4];
        
        if sigma_a1&&sigma_b1
            mode_tmp=1;
        elseif (~sigma_a1&&sigma_b2) 
            mode_tmp=2;
        elseif sigma_a3&&~sigma_b1
            mode_tmp=3;
        else
            mode_tmp=4;
        end


        %% Intermediate Values
        if mode_tmp ~= mode_prev %&& mode_tmp ~= 1
            h_kappa_flag = 1;
            h_kappa = 0;
            dqa_pretran = dqa_prev;
            ddqa_pretran = ddqa_prev;
            tau_pretran = tau_prev;
        elseif mode_tmp == mode_prev && h_kappa>0.99
            h_kappa_flag = 0; 
%             dqa_pretran = zeros(3,1);
%             ddqa_pretran = zeros(3,1);
        end

        if h_kappa_flag
%             if h_kappa>1
%                 h_kappa=0;
%                 h_kappa_flag = 0;
%             end
            if param.transition==1
                hkappa = 0.5*tanh(5*h_kappa-2.75)+0.5;
            else
                hkappa = h_kappa;
                if hkappa>1
                    hkappa=1;
                end
            end
            h_kappa = h_kappa+param.delta_intermedVal;
        end
        hkappa_=hkappa;
        %% Stellgroesse entsprechend Mode zuweisen
        switch mode_tmp
            case 1
                for j=1:length(dqa_ist)
                    if h_kappa_flag % abs(dqa_ist(j))>1e-1
                        dqa(j) = hkappa_*dqa_1(j)+(1-hkappa_)*dqa_pretran(j); % Orientierungsregelung, Kappa iO, MinDist iO
                        ddqa(j) = hkappa_*ddqa_1(j)+(1-hkappa_)*ddqa_pretran(j);
                        tau(j) = hkappa_*tau_1(j)+(1-hkappa_)*tau_pretran(j);             
                    else
                        dqa(j) = dqa_1(j);
                        ddqa(j) = ddqa_1(j);
                        tau(j) = tau_1(j);
                    end
                end
%                     dqa = dqa_1;
%                     ddqa = ddqa_1;
%                     tau = tau_1;
            case 2
                dqa = hkappa_*dqa_2+(1-hkappa_)*dqa_pretran; % MinDist iO, Orientierungsregelung, Kappa niO, 
                ddqa = hkappa_*ddqa_2+(1-hkappa_)*ddqa_pretran;              
                tau = hkappa_*tau_2+(1-hkappa_)*tau_pretran;          
%                 dqa = dqa_2;
%                 ddqa = ddqa_2;
%                 tau = tau_2;
            case 3
                dqa = hkappa_*dqa_3+(1-hkappa_)*dqa_pretran; % Kappa iO, Orientierungsregelung, MinDist niO     
                ddqa = hkappa_*ddqa_3+(1-hkappa_)*ddqa_pretran;            
                tau = hkappa_*tau_3+(1-hkappa_)*tau_pretran;                       
%                 dqa = dqa_3; % Kappa niO, Orientierungsregelung, MinDist iO
%                 ddqa = ddqa_3;
%                 tau = tau_3;
            case 4
                dqa = hkappa_*dqa_4+(1-hkappa_)*dqa_pretran; % Kappa niO, MinDist niO, Orientierungsregelung
                ddqa = hkappa_*ddqa_4+(1-hkappa_)*ddqa_pretran;        
                tau = hkappa_*tau_4+(1-hkappa_)*tau_pretran;               
%                 dqa = dqa_4; % Kappa niO, MinDist niO, Orientierungsregelung
%                 ddqa = ddqa_4;
%                 tau = tau_4;
            otherwise
                dqa = dqa_1;
                ddqa = ddqa_1;
                tau = tau_1;
        end


        % Formulierung auf Beschleunigungsebene
        if (sum(isnan(dqa))>0 && rr_level==1) || ...
           (sum(isnan(ddqa))>0 && rr_level==2) ||...
           (sum(isnan(tau))>0 && rr_level==3)
           mode=0;
           mode_nan = 1;
           tau_soll=zeros(3,1);
           e_qa = zeros(3,1);
           de_qa = zeros(3,1);
           dqa_out=zeros(3,1);
           ddqa_out=zeros(3,1);
           tau_out=zeros(3,1);
           return
        end
%         if max(abs(ddqa-ddqa_prev))>10
%             a=1;
%         end
        ddqa_ = ddqa;%lim_in(ddqa, ddqa_prev, param.delta_ddqa_radss);
        ddqa_out = ddqa_;
        tau_out=tau;

        if rr_level == 1
        % Formulierung auf Geschwindigkeitsebene
        dqa_out = dqa;
        qa_next = qa_ist + dqa * param.t_sample;    
        elseif rr_level == 2
        dqa_out = dqa_ist + ddqa_*param.t_sample;   
        qa_next = qa_ist  + dqa_ist*param.t_sample + 0.5*ddqa_*param.t_sample^2;  
        else
        dqa_out = dqa_ist + MMQa_ist_inv*(tau)*param.t_sample;   
        qa_next = qa_ist  + dqa_ist*param.t_sample + 0.5*MMQa_ist_inv*(tau)*param.t_sample^2;     
        end

%         [x_next , ~, ~]= find_dk_simulink(qa_next, x_ist, param.kin_params, param.psi_j, param.beta_j, param.r_fixPlat_j, ...
%                                      param.r_mobPlat_j, param.l_all_id, param.l_all, param.r_BasisPla_MobPla, param.max_iter_find_dk_simulink, param.max_radius, ...
%                                      param.max_phie, param.min_det_JacA_hredx, param.min_det_JacB_hredqa);    
%         q_next  = calcQtotal(qa_next, zeros(1,3), x_next, param.psi_j);
%         JacA_hredx = JacA_hredx_ind_3RRR(q_next, xEE_3dTo6D(x_next), param.l_all_id, param.r_fixPlat_j, param.r_mobPlat_j, param.psi_j, param.beta_j);
%         JacB_hredqa = JacB_hredqa_ind_3RRR(q_next, xEE_3dTo6D(x_next), param.l_all_id, param.r_fixPlat_j, param.r_mobPlat_j, param.psi_j, param.beta_j);
%         Jinv_hredqax = -inv(JacB_hredqa)*JacA_hredx;
%         J_hredxqa_next = inv(Jinv_hredqax);   

%         x_ist = x_next;
%         qa_tmp = qa_next;
%         q_tmp = q_next;
%         J_hredxqa = J_hredxqa_next;
%         dx_soll = J_hredxqa*dqa;


%     end
    mode = mode_tmp;
    h_kappa_out=hkappa_;
    h_kappa_flag_out=h_kappa_flag;
    dq_all=[dqa_1; dqa_2; dqa_3; dqa_4];
%     ddq_all=[ddqa_1; ddqa_2; ddqa_3; ddqa_4];
%     tau_all=[tau_1; tau_2; tau_3; tau_4];
%     qa_soll = qa_ist + dqa * param.t_sample;
    qa_soll = qa_next;
    e_qa = (qa_soll-qa_ist);
    de_qa = (dqa_out-dqa_ist);
    if rr_level == 1
        tau_soll = eye(3,3)*e_qa*pd_reglerQ(1) + eye(3,3)*de_qa*pd_reglerQ(2); 
    elseif rr_level == 2
        tau_soll = MMQa_ist * ddqa_;
    else
        tau_soll = tau;
    end
end



% function y=mysigmoid(x)
%     y=1/(1+exp(-x));
% end

% function D_out = calcD(K_d, M, D)
% K_d1=sqrtm(K_d);
% M1 = sqrtm(M);
% D_d_=K_d1*D*M1+M1*D*K_d1;
% D_out=real(D_d_);
% end

function dRz = calcTimeDerivRot(phi, dphi)
    cphi = cos(phi);
    sphi = sin(phi);
    dRz = [-sphi*dphi -cphi*dphi 0;
            cphi*dphi -sphi*dphi 0;
            0          0         0];
end
