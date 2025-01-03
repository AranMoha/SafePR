function [tau_1, tau_2, tau_3, tau_4] =calc_rr_tau_rueckzugaktiv_xp(F_xp_ref, F_pose_ref, F_kappa_ref, F_dist_ref, ...
                                                                    J_hredxqa, J_kappa, J_dist, J_xp,...
                                                                    MMQa_ist_inv)

    E = eye(3,3);
    J_z = J_hredxqa(3,:);
    PInv_J_kappa_F = pinv_mod(J_kappa, MMQa_ist_inv, 0);
    PInv_J_dist_F = pinv_mod(J_dist, MMQa_ist_inv, 0);
    J_A_kappa_dist = [J_kappa; J_dist];
    PInv_J_A_kappa_dist_F = pinv_mod(J_A_kappa_dist, MMQa_ist_inv, 0);     


    N_kappa_F = E - J_kappa'*PInv_J_kappa_F'; % Nullraumprojektor der Konditionszahl
    N_dist_F = E - J_dist'*PInv_J_dist_F'; % Nullraumprojektor der Konditionszahl
    N_A_kappa_dist_F = E - J_A_kappa_dist'*PInv_J_A_kappa_dist_F';   
    MQa_ist_inv_sqrt = real(sqrtm(MMQa_ist_inv));

    J_posx = J_hredxqa(1,:);
    J_posy = J_hredxqa(2,:);   
    J_A_xp_posx = [J_xp; J_posx];
    J_A_xp_posx_posy = [J_xp; J_posx; J_posy];
    J_A_kappa_xp = [J_kappa; J_xp];
    J_A_kappa_xp_posx = [J_kappa; J_xp; J_posx];
    J_A_kappa_xp_posx_posy = [J_kappa; J_xp; J_posx; J_posy];
    J_A_dist_xp = [J_dist; J_xp];
    J_A_dist_xp_posx = [J_dist; J_xp; J_posx];
    J_A_dist_xp_posx_posy = [J_dist; J_xp; J_posx; J_posy];
    J_A_kappa_dist_xp = [J_kappa; J_dist; J_xp];
    J_A_kappa_dist_xp_posx = [J_kappa; J_dist; J_xp; J_posx];
    J_A_kappa_dist_xp_posx_posy = [J_kappa; J_dist; J_xp; J_posx; J_posy];
    
    PInv_J_xp_F = MQa_ist_inv_sqrt*pinv(J_xp*MQa_ist_inv_sqrt); 
    Pinv_J_A_xp_posx_F = MQa_ist_inv_sqrt*pinv(J_A_xp_posx*MQa_ist_inv_sqrt);
    PInv_J_A_xp_posx_posy_F = MQa_ist_inv_sqrt*pinv(J_A_xp_posx_posy*MQa_ist_inv_sqrt);
    Pinv_J_A_kappa_xp_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_xp*MQa_ist_inv_sqrt);
    PInv_J_A_kappa_xp_posx_F = MQa_ist_inv_sqrt*pinv(J_A_kappa_xp_posx*MQa_ist_inv_sqrt);
    Pinv_J_A_dist_xp_F = MQa_ist_inv_sqrt*pinv(J_A_dist_xp*MQa_ist_inv_sqrt);
    PInv_J_A_dist_xp_posx_F = MQa_ist_inv_sqrt*pinv(J_A_dist_xp_posx*MQa_ist_inv_sqrt);
    PInv_J_A_kappa_dist_xp_F =  MQa_ist_inv_sqrt*pinv(J_A_kappa_dist_xp*MQa_ist_inv_sqrt);
    PInv_J_A_kappa_xp_posx_posy_F =  MQa_ist_inv_sqrt*pinv(J_A_kappa_xp_posx_posy*MQa_ist_inv_sqrt);        
    PInv_J_A_dist_xp_posx_posy_F =  MQa_ist_inv_sqrt*pinv(J_A_dist_xp_posx_posy*MQa_ist_inv_sqrt);        
    PInv_J_A_kappa_dist_xp_posx_F =  MQa_ist_inv_sqrt*pinv(J_A_kappa_dist_xp_posx*MQa_ist_inv_sqrt);
    PInv_J_A_kappa_dist_xp_posx_posy_F =  MQa_ist_inv_sqrt*pinv(J_A_kappa_dist_xp_posx_posy*MQa_ist_inv_sqrt);
    
    N_xp_F = E - J_xp'*PInv_J_xp_F';
    N_A_xp_posx_F = E - J_A_xp_posx'*Pinv_J_A_xp_posx_F';
    N_A_xp_posx_posy_F = E - J_A_xp_posx_posy'*PInv_J_A_xp_posx_posy_F';
    N_A_kappa_xp_F = E - J_A_kappa_xp'*Pinv_J_A_kappa_xp_F';
    N_A_kappa_xp_posx_F = E - J_A_kappa_xp_posx'*PInv_J_A_kappa_xp_posx_F';
    N_A_kappa_xp_posx_posy_F = E - J_A_kappa_xp_posx_posy'*PInv_J_A_kappa_xp_posx_posy_F';
    N_A_dist_xp_F = E - J_A_dist_xp'*Pinv_J_A_dist_xp_F';
    N_A_dist_xp_posx_F = E - J_A_dist_xp_posx'*PInv_J_A_dist_xp_posx_F';
    N_A_dist_xp_posx_posy_F = E - J_A_dist_xp_posx_posy'*PInv_J_A_dist_xp_posx_posy_F';
    N_A_kappa_dist_xp_F =  E - J_A_kappa_dist_xp'*PInv_J_A_kappa_dist_xp_F';
    N_A_kappa_dist_xp_posx_F =  E - J_A_kappa_dist_xp_posx'*PInv_J_A_kappa_dist_xp_posx_F';
    N_A_kappa_dist_xp_posx_posy_F =  E - J_A_kappa_dist_xp_posx_posy'*PInv_J_A_kappa_dist_xp_posx_posy_F';
    
    tau_1 = J_xp'   * F_xp_ref   + N_xp_F   * J_posx' * F_pose_ref(1) + N_A_xp_posx_F   * J_posy' * F_pose_ref(2) + N_A_xp_posx_posy_F  * J_z'    * F_pose_ref(3);
    tau_2 = J_kappa' * F_kappa_ref + N_kappa_F * J_xp'  * F_xp_ref     + N_A_kappa_xp_F  * J_posx' * F_pose_ref(1) + N_A_kappa_xp_posx_F * J_posy' * F_pose_ref(2) + N_A_kappa_xp_posx_posy_F * J_z'    * F_pose_ref(3);
    tau_3 = J_dist'  * F_dist_ref  + N_dist_F  * J_xp'  * F_xp_ref     + N_A_dist_xp_F   * J_posx' * F_pose_ref(1) + N_A_dist_xp_posx_F  * J_posy' * F_pose_ref(2) + N_A_dist_xp_posx_posy_F  * J_z'    * F_pose_ref(3);
    tau_4 = J_kappa' * F_kappa_ref + N_kappa_F * J_dist' * F_dist_ref    + N_A_kappa_dist_F * J_xp'  * F_xp_ref     + N_A_kappa_dist_xp_F * J_posx' * F_pose_ref(1) + N_A_kappa_dist_xp_posx_F * J_posy' * F_pose_ref(2)  + N_A_kappa_dist_xp_posx_posy_F * J_z' * F_pose_ref(3);


