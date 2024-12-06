function [xEE_1, xEE_2, xEE_3, qp2_cort] = calcEE_qp2Corrected(qa, qp, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)
    % Function for geometric forward  kinematics 
    % This function can be used to determine the platform positions over all three
    % leg chains with known active and passive joint angles qa and qp.
    % In addition, the passive joint angle at the
    % elbow is calculated with the defective incremental encoder. 
    % input:
    % qa: Active joint angle (with thrust axis) (4x1)
    % qp: Passive joint angles at the elbows (3x1)
    %
    % Output:
    % xEE_1 in m and rad: Direct kinematics via the first leg chain (3x1)
    % xEE_2 in m and rad: Direct kinematics via the second leg chain (3x1)
    % xEE_3 in m and rad: Direct kinematics via the third leg chain (3x1)
    % qp2_cort in rad: Passive joint angle at the joint with defective incremental encoder (1x1)
       
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institute for Mechatronic Systems, Leibniz University Hanover
       
    l_1i  = l_all_id([1 2]);
    l_2i  = l_all_id([3 4]);
    l_3i  = l_all_id([5 6]);
    
    R_initKS_TempKS = [-1 0 0; 0 -1 0; 0 0 1];

    % Forward kinematics of the first serial chain with vector from CS0 to CS_Gj
    P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat_j(1) + ... % Inertial-CS to base joint 1
         [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l_1i(1) + ...% Base joint 1 to elbow 1
         [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l_1i(2); % Elbow 1 to couple joint 1

    % Forward kinematics of the second serial chain with vector from CS0 to CS_Gj
    P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat_j(2) + ... % Inertial-CS to base joint 2
         [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l_2i(1); % Base joint 2 to elbow 2
     
    % Forward kinematics of the third serial chain with vector from CS0 to CS_Gj  
    P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat_j(3) + ... % Inertial-CS to base joint 3
         [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l_3i(1) + ... % Base joint 3 to elbow 3
         [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l_3i(2); % Elbow 3 to couple joint 3
    

    P3_new = R_initKS_TempKS(1:2, 1:2)*P3;
    P1_new = R_initKS_TempKS(1:2, 1:2)*P1;
    phie = atan2(P3_new(2)-P1_new(2), P3_new(1)-P1_new(1)) - 30*pi/180;
    
    % EE-pose calculated via first and third chain
    pos_xEE_1 = P1 - [cos(beta_j(1)+phie); sin(beta_j(1)+phie)]*r_mobPlat_j(1);
    pos_xEE_3 = P3 - [cos(beta_j(3)+phie); sin(beta_j(3)+phie)]*r_mobPlat_j(3);

    % Use calculated EE-pose to determine qp2
    tmp = pos_xEE_1 + [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat_j(2);
    qp2_correct = atan2( tmp(2)-P2(2), tmp(1)-P2(1)) + (2*pi - psi_j(2)) - qa(2);

    % Calculate the direct kinematics of the second chain with determind qp2
    P2_correct = P2 + [cos(psi_j(2) + qa(2) + qp2_correct); sin(psi_j(2) + qa(2) + qp2_correct)]*l_2i(2);
    pos_xEE_2 = P2_correct - [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat_j(2);
        
    % Output of the EE pose across all three chains and qp2_correct
     xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie];
     xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie];
     xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie];
     qp2_cort = qp2_correct;
end
