function [xEE_1, xEE_2, xEE_3] = calcEE_eachChain(q, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)
    % Function for determining the direct kinematics across all three leg chains
    % Input:
    % q in rad: Actual joint coordinates (9x1)
    %
    % Output:
    % xEE_1 in m and rad: Platform coordinates via first leg chain (3x1)
    % xEE_2 in m and rad: Platform coordinates via second leg chain (3x1)
    % xEE_3 in m and rad: Platform coordinates via third leg chain (3x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institute for Mechatronic Systems, Leibniz University Hanover
    
    qa = q([1,4,7]);   
    qp = q([2,5,8]);   

    l_1i  = l_all_id([1 2]);
    l_2i  = l_all_id([3 4]);
    l_3i  = l_all_id([5 6]);
    
    % Direct kinematics of the first serial chain with vector from KS0 to KS_Gj        
    P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat_j(1) + ... 
         [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l_1i(1) + ...
         [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l_1i(2); 

    % Direct kinematics of the second serial chain with vector from KS0 to KS_Gj        
    P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat_j(2) + ... 
         [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l_2i(1) +... 
         [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l_2i(2); 
     
    % Direct kinematics of the third serial chain with vector from KS0 to KS_Gj        
    P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat_j(3) + ...
         [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l_3i(1) + ... 
         [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l_3i(2); 
    

    phie_1 = psi_j(1)+q(1)+q(2)+q(3);
    phie_2 = psi_j(2)+q(4)+q(5)+q(6);
    phie_3 = psi_j(3)+q(7)+q(8)+q(9);

    pos_xEE_1 = P1 - [cos(beta_j(1)+phie_1); sin(beta_j(1)+phie_1)]*r_mobPlat_j(1);
    pos_xEE_2 = P2 - [cos(beta_j(2)+phie_2); sin(beta_j(2)+phie_2)]*r_mobPlat_j(2);   
    pos_xEE_3 = P3 - [cos(beta_j(3)+phie_3); sin(beta_j(3)+phie_3)]*r_mobPlat_j(3);

    xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie_1];
    xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie_2];
    xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie_3];
end