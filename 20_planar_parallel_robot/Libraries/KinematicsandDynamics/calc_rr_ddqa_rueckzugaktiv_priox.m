function [ddqa_1, ddqa_2, ddqa_3, ddqa_4] =...
    calc_rr_ddqa_rueckzugaktiv_priox(ddsigma_pose_ref, ddsigma_kappa_ref, ddsigma_mindist_ref, J_hredxqa, J_kappa, J_dist)
    
    E = eye(3,3);
    J_posx = J_hredxqa(1,:);
    J_posy = J_hredxqa(2,:);   
    J_z = J_hredxqa(3,:);
    J_A_kappa_dist = [J_kappa; J_dist];
    J_A_posx_posy  = [J_posx; J_posy];
    J_A_kappa_posx = [J_kappa; J_posx];
    J_A_dist_posx  = [J_dist; J_posx];
    J_A_kappa_posx_posy = [J_kappa; J_posx; J_posy];
    J_A_dist_posx_posy = [J_dist; J_posx; J_posy];
    J_A_kappa_dist_posx = [J_kappa; J_dist; J_posx];
    J_A_kappa_dist_posx_posy = [J_kappa; J_dist; J_posx; J_posy];   

    PInv_J_z = pinv_mod(J_z, eye(3,3), 0);
    PInv_J_kappa = pinv_mod(J_kappa, eye(3,3), 0);
    PInv_J_dist = pinv_mod(J_dist, eye(3,3), 0);
    PInv_J_A_kappa_dist = pinv_mod(J_A_kappa_dist, eye(3,3), 0);
    PInv_J_posx = pinv_mod(J_posx, eye(3,3), 0);
    PInv_J_posy = pinv_mod(J_posy, eye(3,3), 0);   
    PInv_J_A_posx_posy = pinv_mod(J_A_posx_posy, eye(3,3), 0);
    PInv_J_A_kappa_posx = pinv_mod(J_A_kappa_posx, eye(3,3), 0);
    PInv_J_A_dist_posx = pinv_mod(J_A_dist_posx, eye(3,3), 0);
    PInv_J_A_kappa_dist_posx = pinv_mod(J_A_kappa_dist_posx, eye(3,3), 0);
    PInv_J_A_kappa_posx_posy = pinv_mod(J_A_kappa_posx_posy, eye(3,3), 0);
    PInv_J_A_dist_posx_posy = pinv_mod(J_A_dist_posx_posy, eye(3,3), 0);
    PInv_J_A_kappa_dist_posx_posy = pinv(J_A_kappa_dist_posx_posy); %pinv_mod(J_A_kappa_dist_posx_posy, eye(3,3), 0);     

    N_kappa = E - PInv_J_kappa*J_kappa; % Nullraumprojektor der Konditionszahl
    N_dist = E - PInv_J_dist*J_dist; % Nullraumprojektor der Konditionszahl
    N_A_kappa_dist = E - PInv_J_A_kappa_dist*J_A_kappa_dist;  
    N_posx = E - PInv_J_posx*J_posx; 
    N_A_posx_posy = E - PInv_J_A_posx_posy*J_A_posx_posy; 
    N_A_kappa_posx = E - PInv_J_A_kappa_posx*J_A_kappa_posx;
    N_A_kappa_posx_posy = E - PInv_J_A_kappa_posx_posy*J_A_kappa_posx_posy;
    N_A_dist_posx = E - PInv_J_A_dist_posx*J_A_dist_posx;
    N_A_dist_posx_posy = E - PInv_J_A_dist_posx_posy*J_A_dist_posx_posy;
    N_A_kappa_dist_posx = E - PInv_J_A_kappa_dist_posx*J_A_kappa_dist_posx;
    N_A_kappa_dist_posx_posy = E - PInv_J_A_kappa_dist_posx_posy*J_A_kappa_dist_posx_posy;    
    
    ddqa_1 = PInv_J_posx  * ddsigma_pose_ref(1) + N_posx  * PInv_J_posy * ddsigma_pose_ref(2) + N_A_posx_posy  * PInv_J_z    * ddsigma_pose_ref(3);        
    ddqa_2 = PInv_J_kappa * ddsigma_kappa_ref   + N_kappa * PInv_J_posx * ddsigma_pose_ref(1) + N_A_kappa_posx * PInv_J_posy * ddsigma_pose_ref(2) + N_A_kappa_posx_posy * PInv_J_z * ddsigma_pose_ref(3);
    ddqa_3 = PInv_J_dist  * ddsigma_mindist_ref + N_dist  * PInv_J_posx * ddsigma_pose_ref(1) + N_A_dist_posx  * PInv_J_posy * ddsigma_pose_ref(2) + N_A_dist_posx_posy  * PInv_J_z * ddsigma_pose_ref(3);
    ddqa_4 = PInv_J_kappa * ddsigma_kappa_ref   + N_kappa * PInv_J_dist  * ddsigma_mindist_ref  + ...
             N_A_kappa_dist * PInv_J_posx * ddsigma_pose_ref(1) + N_A_kappa_dist_posx * PInv_J_posy * ddsigma_pose_ref(2) + N_A_kappa_dist_posx_posy * PInv_J_z * ddsigma_pose_ref(3);      
    
