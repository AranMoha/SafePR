function [ddqa_1, ddqa_2, ddqa_3, ddqa_4] = calc_rr_ddqa_klemmreaktion(q_ist_rad, dq_ist_rads, traj_qap_soll_cl, clampingBody_predicted, lambda_clamp_qap_ddqa, lambda_clamp_dqap_ddqa,...
                                                                       ddsigma_pose_ref, ddsigma_kappa_ref, ddsigma_mindist_ref,...
                                                                       J_hredxqa, J_kappa, J_dist, J_q_qa)    
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
    ddsigma_qap_d = ddqap_soll_cl + lambda_clamp_qap_ddqa*sigma_qap_tilde + lambda_clamp_dqap_ddqa*sigma_dqap_tilde;
    ddsigma_qap_ref = ddsigma_qap_d;
    
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
    
    PInv_J_posxy = pinv(J_posxy);    
    PInv_J_z = pinv(J_z);          
    PInv_J_qa = pinv(J_qa); 
    PInv_J_qp = pinv(J_qp);       
    PInv_J_kappa = pinv(J_kappa);
    PInv_J_dist = pinv(J_dist);
    
    PInv_J_A_kappa_dist = pinv(J_A_kappa_dist);
    PInv_J_A_qa_qp = pinv(J_A_qa_qp);
    PInv_J_A_qa_qp_posxy = pinv(J_A_qa_qp_posxy);
    PInv_J_A_kappa_qa = pinv(J_A_kappa_qa);
    PInv_J_A_kappa_qa_qp = pinv(J_A_kappa_qa_qp);
    PInv_J_A_kappa_qa_qp_posxy = pinv(J_A_kappa_qa_qp_posxy);
    PInv_J_A_dist_qa = pinv(J_A_dist_qa);
    PInv_J_A_dist_qa_qp = pinv(J_A_dist_qa_qp);
    PInv_J_A_dist_qa_qp_posxy = pinv(J_A_dist_qa_qp_posxy);
    PInv_J_A_kappa_dist_qa = pinv(J_A_kappa_dist_qa);
    PInv_J_A_kappa_dist_qa_qp = pinv(J_A_kappa_dist_qa_qp);
    PInv_J_A_kappa_dist_qa_qp_posxy = pinv(J_A_kappa_dist_qa_qp_posxy);
    
    N_qa = E - PInv_J_qa*J_qa;
    N_kappa = E - PInv_J_kappa*J_kappa; % Nullraumprojektor der Konditionszahl
    N_dist = E - PInv_J_dist*J_dist; % Nullraumprojektor der Konditionszahl
    
    N_A_kappa_dist = E - PInv_J_A_kappa_dist*J_A_kappa_dist;
    N_A_qa_qp = E - PInv_J_A_qa_qp*J_A_qa_qp;
    N_A_qa_qp_posxy = E - PInv_J_A_qa_qp_posxy*J_A_qa_qp_posxy;
    N_A_kappa_qa = E - PInv_J_A_kappa_qa*J_A_kappa_qa;
    N_A_kappa_qa_qp = E - PInv_J_A_kappa_qa_qp*J_A_kappa_qa_qp;
    N_A_kappa_qa_qp_posxy = E - PInv_J_A_kappa_qa_qp_posxy*J_A_kappa_qa_qp_posxy;
    N_A_dist_qa = E - PInv_J_A_dist_qa*J_A_dist_qa;
    N_A_dist_qa_qp = E - PInv_J_A_dist_qa_qp*J_A_dist_qa_qp;
    N_A_dist_qa_qp_posxy = E - PInv_J_A_dist_qa_qp_posxy*J_A_dist_qa_qp_posxy;
    N_A_kappa_dist_qa = E - PInv_J_A_kappa_dist_qa*J_A_kappa_dist_qa;
    N_A_kappa_dist_qa_qp = E - PInv_J_A_kappa_dist_qa_qp*J_A_kappa_dist_qa_qp;
    N_A_kappa_dist_qa_qp_posxy = E - PInv_J_A_kappa_dist_qa_qp_posxy*J_A_kappa_dist_qa_qp_posxy;
    
    
    ddqa_1 = PInv_J_qa * ddsigma_qap_ref(1) + N_qa * PInv_J_qp * ddsigma_qap_ref(2) + N_A_qa_qp * PInv_J_posxy * ddsigma_pose_ref(1:2)  +...
             N_A_qa_qp_posxy * PInv_J_z * ddsigma_pose_ref(3);        
    ddqa_2 = PInv_J_kappa * ddsigma_kappa_ref  + N_kappa * PInv_J_qa * ddsigma_qap_ref(1) + N_A_kappa_qa * PInv_J_qp    * ddsigma_qap_ref(2) +...
             N_A_kappa_qa_qp * PInv_J_posxy * ddsigma_pose_ref(1:2) + N_A_kappa_qa_qp_posxy * PInv_J_z * ddsigma_pose_ref(3);
    ddqa_3 = PInv_J_dist  * ddsigma_mindist_ref   + N_dist  * PInv_J_qa * ddsigma_qap_ref(1) + N_A_dist_qa  * PInv_J_qp    * ddsigma_qap_ref(2) +...
             N_A_dist_qa_qp  * PInv_J_posxy * ddsigma_pose_ref(1:2) + N_A_dist_qa_qp_posxy  * PInv_J_z * ddsigma_pose_ref(3);
    ddqa_4 = PInv_J_kappa * ddsigma_kappa_ref  + N_kappa * PInv_J_dist  * ddsigma_mindist_ref+ N_A_kappa_dist * PInv_J_qa * ddsigma_qap_ref(1) + ...
             N_A_kappa_dist_qa * PInv_J_qp * ddsigma_qap_ref(2) + N_A_kappa_dist_qa_qp * PInv_J_posxy * ddsigma_pose_ref(1:2) +...
             N_A_kappa_dist_qa_qp_posxy * PInv_J_z * ddsigma_pose_ref(3); 