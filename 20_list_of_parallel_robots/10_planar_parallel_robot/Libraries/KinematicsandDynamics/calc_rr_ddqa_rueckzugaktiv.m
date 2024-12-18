function [ddqa_1, ddqa_2, ddqa_3, ddqa_4] = calc_rr_ddqa_rueckzugaktiv(ddsigma_pose_ref, ddsigma_kappa_ref, ddsigma_mindist_ref, J_hredxqa, J_kappa, J_dist)
    
    E = eye(3,3);


    J_z = J_hredxqa(3,:);
    J_A_kappa_dist = [J_kappa; J_dist];
    PInv_J_z = pinv_mod(J_z, eye(3,3), 0);
    PInv_J_kappa = pinv_mod(J_kappa, eye(3,3), 0);
    PInv_J_dist = pinv_mod(J_dist, eye(3,3), 0);
    PInv_J_A_kappa_dist = pinv_mod(J_A_kappa_dist, eye(3,3), 0);
    N_kappa = E - PInv_J_kappa*J_kappa; % Nullraumprojektor der Konditionszahl
    N_dist = E - PInv_J_dist*J_dist; % Nullraumprojektor der Konditionszahl
    N_A_kappa_dist = E - PInv_J_A_kappa_dist*J_A_kappa_dist;

    J_posxy = J_hredxqa(1:2,:); 
    J_A_kappa_posxy = [J_kappa; J_posxy];
    J_A_kappa_dist_posxy = [J_kappa; J_dist; J_posxy];
    J_A_dist_posxy = [J_dist; J_posxy];
    PInv_J_posxy = pinv_mod(J_posxy, eye(3,3), 0);       
    PInv_J_A_kappa_posxy = pinv_mod(J_A_kappa_posxy, eye(3,3), 0);
    PInv_J_A_kappa_dist_posxy = pinv(J_A_kappa_dist_posxy);
    PInv_J_A_dist_posxy = pinv_mod(J_A_dist_posxy, eye(3,3), 0);
    N_posxy = E - PInv_J_posxy*J_posxy; 
    N_A_dist_posxy = E - PInv_J_A_dist_posxy*J_A_dist_posxy;
    N_A_kappa_posxy = E - PInv_J_A_kappa_posxy*J_A_kappa_posxy;
    N_A_kappa_dist_posxy = E - PInv_J_A_kappa_dist_posxy*J_A_kappa_dist_posxy;
    ddqa_1 = PInv_J_posxy * ddsigma_pose_ref(1:2) + N_posxy * PInv_J_z     * ddsigma_pose_ref(3);
    ddqa_2 = PInv_J_kappa * ddsigma_kappa_ref     + N_kappa * PInv_J_posxy * ddsigma_pose_ref(1:2) + N_A_kappa_posxy * PInv_J_z * ddsigma_pose_ref(3);
    ddqa_3 = PInv_J_dist  * ddsigma_mindist_ref   + N_dist  * PInv_J_posxy * ddsigma_pose_ref(1:2) + N_A_dist_posxy  * PInv_J_z * ddsigma_pose_ref(3);
    ddqa_4 = PInv_J_kappa * ddsigma_kappa_ref     + N_kappa * PInv_J_dist  * ddsigma_mindist_ref + ...
             N_A_kappa_dist * PInv_J_posxy * ddsigma_pose_ref(1:2) + N_A_kappa_dist_posxy * PInv_J_z * ddsigma_pose_ref(3);  