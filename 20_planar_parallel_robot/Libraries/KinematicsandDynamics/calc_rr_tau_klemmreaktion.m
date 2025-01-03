function [tau_1, tau_2, tau_3, tau_4] = calc_rr_tau_klemmreaktion(q_ist_rad, dq_ist_rads, traj_qap_soll_cl, clampingBody_predicted, ...
                                                                  F_pose_ref, F_kappa_ref, F_dist_ref, ...
                                                                  lambda_clamp_qap_tau, lambda_clamp_qap_tau_entkoppelt, lambda_clamp_dqap_tau_enkoppeln, lambda_clamp_dqa_tau, lambda_clamp_dqp_tau, ...
                                                                  J_hredxqa, J_kappa, J_dist, J_q_qa,...
                                                                  MMQa_ist, MMQa_ist_inv)        
    qa_ist = q_ist_rad([1 4 7]);
    qp_ist = q_ist_rad([2 5 8]);
    dqa_ist = dq_ist_rads([1 4 7]);
    dqp_ist = dq_ist_rads([2 5 8]);
    qap_soll_cl = traj_qap_soll_cl([1 2]);
    dqap_soll_cl = traj_qap_soll_cl([3 4]);
    ddqap_soll_cl = traj_qap_soll_cl([5 6]);
    sigma_qap_tilde = (qap_soll_cl - [qa_ist(clampingBody_predicted); qp_ist(clampingBody_predicted)]);
    sigma_dqap_tilde = (dqap_soll_cl - [dqa_ist(clampingBody_predicted); dqp_ist(clampingBody_predicted)]);
    if clampingBody_predicted <1
        clampingBody_predicted = 1;
    end
    
    J_qp = J_q_qa(2+3*(clampingBody_predicted-1),:);
    
    M_qa = MMQa_ist(clampingBody_predicted, clampingBody_predicted);
    M_qp = (J_qp *MMQa_ist_inv* J_qp')\ eye(1,1);
    if lambda_clamp_dqap_tau_enkoppeln == 1
        D_qa = calcD(lambda_clamp_qap_tau, M_qa, lambda_clamp_qap_tau_entkoppelt);
        D_qp = calcD(lambda_clamp_qap_tau, M_qp, lambda_clamp_qap_tau_entkoppelt);
    else
        D_qa = lambda_clamp_dqa_tau;
        D_qp = lambda_clamp_dqp_tau;
    end
    
    F_qa = M_qa*ddqap_soll_cl(1) + D_qa*sigma_dqap_tilde(1) + lambda_clamp_qap_tau*sigma_qap_tilde(1);
    F_qp = M_qp*ddqap_soll_cl(2) + D_qp*sigma_dqap_tilde(2) + lambda_clamp_qap_tau*sigma_qap_tilde(2);
    
    E = eye(3,3);
    
    J_posxy = J_hredxqa(1:2,:); 
    J_z = J_hredxqa(3,:);
    J_qa = zeros(1,3);
    J_qa(clampingBody_predicted) = 1;
    J_qp = J_q_qa(2+3*(clampingBody_predicted-1),:);
    J_A_qa_qp = [J_qa; J_qp];
    J_A_qa_qp_posxy = [J_qa; J_qp; J_posxy];
    J_A_kappa_qa = [J_kappa; J_qa];
    J_A_kappa_qa_qp = [J_kappa; J_qa; J_qp];
    J_A_kappa_qa_qp_posxy = [J_kappa; J_qa; J_qp; J_posxy];
    J_A_dist_qa = [J_dist; J_qa]; 
    J_A_dist_qa_qp = [J_dist; J_qa; J_qp];
    J_A_dist_qa_qp_posxy = [J_dist; J_qa; J_qp; J_posxy];
    J_A_kappa_dist = [J_kappa; J_dist];
    J_A_kappa_dist_qa = [J_kappa; J_dist; J_qa]; 
    J_A_kappa_dist_qa_qp = [J_kappa; J_dist; J_qa; J_qp];
    J_A_kappa_dist_qa_qp_posxy = [J_kappa; J_dist; J_qa; J_qp; J_posxy];
    
    MQa_ist_inv_sqrt = real(sqrtm(MMQa_ist_inv));
    PInv_J_qa_F = MQa_ist_inv_sqrt*pinv(J_qa*MQa_ist_inv_sqrt); 
    PInv_J_kappa_F = pinv_mod(J_kappa, MMQa_ist_inv, 0);
    PInv_J_dist_F = pinv_mod(J_dist, MMQa_ist_inv, 0);                
    PInv_J_A_qa_qp_F = MQa_ist_inv_sqrt*pinv(J_A_qa_qp*MQa_ist_inv_sqrt); 
    PInv_J_A_qa_qp_posxy_F = MQa_ist_inv_sqrt*pinv(J_A_qa_qp_posxy*MQa_ist_inv_sqrt); 
    PInv_J_A_kappa_qa_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_qa*MQa_ist_inv_sqrt); 
    PInv_J_A_kappa_qa_qp_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_qa_qp*MQa_ist_inv_sqrt); 
    PInv_J_A_kappa_qa_qp_posxy_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_qa_qp_posxy*MQa_ist_inv_sqrt); 
    PInv_J_A_dist_qa_F = MQa_ist_inv_sqrt*pinv(J_A_dist_qa*MQa_ist_inv_sqrt); 
    PInv_J_A_dist_qa_qp_F = MQa_ist_inv_sqrt*pinv(J_A_dist_qa_qp*MQa_ist_inv_sqrt); 
    PInv_J_A_dist_qa_qp_posxy_F = MQa_ist_inv_sqrt*pinv(J_A_dist_qa_qp_posxy*MQa_ist_inv_sqrt); 
    PInv_J_A_kappa_dist_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_dist*MQa_ist_inv_sqrt); 
    PInv_J_A_kappa_dist_qa_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_dist_qa*MQa_ist_inv_sqrt); 
    PInv_J_A_kappa_dist_qa_qp_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_dist_qa_qp*MQa_ist_inv_sqrt); 
    PInv_J_A_kappa_dist_qa_qp_posxy_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_dist_qa_qp_posxy*MQa_ist_inv_sqrt); 
    
    
    N_qa_F = E - J_qa'*PInv_J_qa_F'; % Nullraumprojektor der Konditionszahl
    N_kappa_F = E - J_kappa'*PInv_J_kappa_F'; % Nullraumprojektor der Konditionszahl
    N_dist_F = E - J_dist'*PInv_J_dist_F'; % Nullraumprojektor der Konditionszahl
    N_A_kappa_dist_F = E - J_A_kappa_dist'*PInv_J_A_kappa_dist_F';   
    N_A_qa_qp_F = E - J_A_qa_qp'*PInv_J_A_qa_qp_F';   
    N_A_qa_qp_posxy_F = E - J_A_qa_qp_posxy'*PInv_J_A_qa_qp_posxy_F';   
    N_A_kappa_qa_F = E - J_A_kappa_qa'*PInv_J_A_kappa_qa_F';   
    N_A_kappa_qa_qp_F = E - J_A_kappa_qa_qp'*PInv_J_A_kappa_qa_qp_F';   
    N_A_kappa_qa_qp_posxy_F = E - J_A_kappa_qa_qp_posxy'*PInv_J_A_kappa_qa_qp_posxy_F';   
    N_A_dist_qa_F = E - J_A_dist_qa'*PInv_J_A_dist_qa_F';   
    N_A_dist_qa_qp_F = E - J_A_dist_qa_qp'*PInv_J_A_dist_qa_qp_F'; 
    N_A_dist_qa_qp_posxy_F = E - J_A_dist_qa_qp_posxy'*PInv_J_A_dist_qa_qp_posxy_F';   
    N_A_kappa_dist_qa_F = E - J_A_kappa_dist_qa'*PInv_J_A_kappa_dist_qa_F';   
    N_A_kappa_dist_qa_qp_F = E - J_A_kappa_dist_qa_qp'*PInv_J_A_kappa_dist_qa_qp_F';   
    N_A_kappa_dist_qa_qp_posxy_F = E - J_A_kappa_dist_qa_qp_posxy'*PInv_J_A_kappa_dist_qa_qp_posxy_F';   
    
    
    tau_1 = J_qa'*F_qa + N_qa_F*J_qp'*F_qp + N_A_qa_qp_F*J_posxy'*F_pose_ref(1:2) + N_A_qa_qp_posxy_F*J_z'*F_pose_ref(3);
    tau_2 = J_kappa'*F_kappa_ref + N_kappa_F*J_qa'*F_qa + N_A_kappa_qa_F*J_qp'*F_qp + N_A_kappa_qa_qp_F*J_posxy'*F_pose_ref(1:2) ...
            + N_A_kappa_qa_qp_posxy_F*J_z'*F_pose_ref(3);
    tau_3 = J_dist'*F_dist_ref + N_dist_F*J_qa'*F_qa + N_A_dist_qa_F*J_qp'*F_qp + N_A_dist_qa_qp_F*J_posxy'*F_pose_ref(1:2)...
            + N_A_dist_qa_qp_posxy_F*J_z'*F_pose_ref(3);
    tau_4 = J_kappa'*F_kappa_ref + N_kappa_F*J_dist'*F_dist_ref + N_A_kappa_dist_F*J_qa'*F_qa + N_A_kappa_dist_qa_F*J_qp'*F_qp...
            + N_A_kappa_dist_qa_qp_F*J_posxy'*F_pose_ref(1:2) + N_A_kappa_dist_qa_qp_posxy_F*J_z'*F_pose_ref(3);
end