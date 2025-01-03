function [tau_1, tau_2, tau_3, tau_4] =...
    calc_rr_tau_rueckzugaktiv(F_pose_ref, F_kappa_ref, F_dist_ref, ...
                              J_hredxqa, J_kappa, J_dist,...
                              MMQa_ist_inv)
    
    E = eye(3,3);
    J_z = J_hredxqa(3,:);
    PInv_J_kappa_F = pinv_mod(J_kappa, MMQa_ist_inv, 0);
    PInv_J_dist_F = pinv_mod(J_dist, MMQa_ist_inv, 0);
    J_A_kappa_dist = [J_kappa; J_dist];
    PInv_J_A_kappa_dist_F = pinv_mod(J_A_kappa_dist, MMQa_ist_inv, 0);    
    MQa_ist_inv_sqrt = real(sqrtm(MMQa_ist_inv));    


    N_kappa_F = E - J_kappa'*PInv_J_kappa_F'; % Nullraumprojektor der Konditionszahl
    N_dist_F = E - J_dist'*PInv_J_dist_F'; % Nullraumprojektor der Konditionszahl
    N_A_kappa_dist_F = E - J_A_kappa_dist'*PInv_J_A_kappa_dist_F';
    J_posxy = J_hredxqa(1:2,:); 
    J_A_kappa_posxy = [J_kappa; J_posxy];
    J_A_kappa_dist_posxy = [J_kappa; J_dist; J_posxy];
    J_A_dist_posxy = [J_dist; J_posxy];
    PInv_J_posxy_F = pinv_mod(J_posxy, MMQa_ist_inv, 0);
    PInv_J_A_kappa_posxy_F = pinv_mod(J_A_kappa_posxy, MMQa_ist_inv, 0);
%                     PInv_J_A_kappa_dist_posxy_F = pinv_mod(J_A_kappa_dist_posxy, MMQa_ist_inv, 0); 
    PInv_J_A_dist_posxy_F = pinv_mod(J_A_dist_posxy, MMQa_ist_inv, 0);
    if isreal(MQa_ist_inv_sqrt)%==1
        PInv_J_A_kappa_dist_posxy_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_dist_posxy*MQa_ist_inv_sqrt);            
    else
        PInv_J_A_kappa_dist_posxy_F = pinv_mod(J_A_kappa_dist_posxy, MMQa_ist_inv, 0); 
    end
    N_posxy_F = E - J_posxy'*PInv_J_posxy_F'; 
    N_A_kappa_posxy_F = E - J_A_kappa_posxy'*PInv_J_A_kappa_posxy_F';
    N_A_kappa_dist_posxy_F = E - J_A_kappa_dist_posxy'*PInv_J_A_kappa_dist_posxy_F';
    N_A_dist_posxy_F = E - J_A_dist_posxy'*PInv_J_A_dist_posxy_F';

    tau_1 = J_posxy'*F_pose_ref(1:2) + N_posxy_F*J_z'*F_pose_ref(3);
    tau_2 = J_kappa'*F_kappa_ref     + N_kappa_F*J_posxy'*F_pose_ref(1:2) + N_A_kappa_posxy_F*J_z'*F_pose_ref(3);
    tau_3 = J_dist'*F_dist_ref       + N_dist_F*J_posxy'*F_pose_ref(1:2)  + N_A_dist_posxy_F*J_z'*F_pose_ref(3);
    tau_4 = J_kappa'*F_kappa_ref     + N_kappa_F*J_dist'*F_dist_ref       + N_A_kappa_dist_F*J_posxy'*F_pose_ref(1:2) + N_A_kappa_dist_posxy_F*J_z'*F_pose_ref(3);