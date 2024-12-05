function [dqa_1, dqa_2, dqa_3, dqa_4] = calc_rr_dqa_klemmreaktion(q_ist_rad, traj_qap_soll_cl, clampingBody_predicted, lambda_clamp_qap,...
                                   dsigma_posxy_ref, dsigma_z_ref, dsigma_kappa_ref, dsigma_dist_ref,...
                                   J_hredxqa, J_kappa, J_dist, J_q_qa)
    qp_ist = q_ist_rad([2 5 8]);
    qa_ist = q_ist_rad([1 4 7]);
    qap_soll_cl = traj_qap_soll_cl([1 2]);
    dqap_soll_cl = traj_qap_soll_cl([3 4]);
    sigma_qap_tilde = (qap_soll_cl - [qa_ist(clampingBody_predicted); qp_ist(clampingBody_predicted)]);
    if clampingBody_predicted <1
        clampingBody_predicted = 1;
    end
    dsigma_qap_ref = dqap_soll_cl + lambda_clamp_qap*sigma_qap_tilde;
    
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
    
    
    dqa_1 = PInv_J_qa    * dsigma_qap_ref(1) + N_qa * PInv_J_qp * dsigma_qap_ref(2)    + N_A_qa_qp    * PInv_J_posxy * dsigma_posxy_ref  +...
            N_A_qa_qp_posxy * PInv_J_z     * dsigma_z_ref;        
    dqa_2 = PInv_J_kappa * dsigma_kappa_ref  + N_kappa * PInv_J_qa * dsigma_qap_ref(1) + N_A_kappa_qa * PInv_J_qp    * dsigma_qap_ref(2) +...
            N_A_kappa_qa_qp * PInv_J_posxy * dsigma_posxy_ref + N_A_kappa_qa_qp_posxy * PInv_J_z * dsigma_z_ref;
    dqa_3 = PInv_J_dist  * dsigma_dist_ref   + N_dist  * PInv_J_qa * dsigma_qap_ref(1) + N_A_dist_qa  * PInv_J_qp    * dsigma_qap_ref(2) +...
            N_A_dist_qa_qp  * PInv_J_posxy * dsigma_posxy_ref + N_A_dist_qa_qp_posxy  * PInv_J_z * dsigma_z_ref;
    dqa_4 = PInv_J_kappa * dsigma_kappa_ref  + N_kappa * PInv_J_dist  * dsigma_dist_ref+ N_A_kappa_dist * PInv_J_qa * dsigma_qap_ref(1) + ...
            N_A_kappa_dist_qa * PInv_J_qp * dsigma_qap_ref(2) + N_A_kappa_dist_qa_qp * PInv_J_posxy * dsigma_posxy_ref +...
            N_A_kappa_dist_qa_qp_posxy * PInv_J_z * dsigma_z_ref; 
end