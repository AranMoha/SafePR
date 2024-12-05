function [xEE_1, xEE_2, xEE_3] = calcEE_eachChain(q, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)
    % Funktion für die Bestimmung der direkten Kinematik über alle drei Beinketten
    % Eingabe:
    % q in rad: Ist-Gelenkkoordinaten (9x1)
    %
    % Ausgabe:
    % xEE_1 in m und rad: Plattformkoordinaten über erste Beinkette (3x1)
    % xEE_2 in m und rad: Plattformkoordinaten über zweite Beinkette (3x1)
    % xEE_3 in m und rad: Plattformkoordinaten über dritte Beinkette (3x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
    
    qa = q([1,4,7]);   
    qp = q([2,5,8]);   
    
%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
    
    l_1i  = l_all_id([1 2]);
    l_2i  = l_all_id([3 4]);
    l_3i  = l_all_id([5 6]);
    
    % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
    P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat_j(1) + ... % Inertial zu Basisgelenk 1
         [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l_1i(1) + ...% Basisgelenk1 zu Elle 1
         [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l_1i(2); % Elle 1 zu Koppelgelenk 1

    % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
    P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat_j(2) + ... % Inertial zu Basisgelenk 2
         [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l_2i(1) +... % Basisgelenk 2 zu Elle 2
         [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l_2i(2); % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
     
    % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
    P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat_j(3) + ... % Inertial zu Basisgelenk 3
         [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l_3i(1) + ... % Basisgelenk 3 zu Elle 3
         [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l_3i(2); % Elle 3 zu Koppelgelenk 3
    

    phie_1 = psi_j(1)+q(1)+q(2)+q(3);
    phie_2 = psi_j(2)+q(4)+q(5)+q(6);
    phie_3 = psi_j(3)+q(7)+q(8)+q(9);

    % Endeffektorpose über erste und dritte Kette berechnet
    pos_xEE_1 = P1 - [cos(beta_j(1)+phie_1); sin(beta_j(1)+phie_1)]*r_mobPlat_j(1);
    pos_xEE_2 = P2 - [cos(beta_j(2)+phie_2); sin(beta_j(2)+phie_2)]*r_mobPlat_j(2);   
    pos_xEE_3 = P3 - [cos(beta_j(3)+phie_3); sin(beta_j(3)+phie_3)]*r_mobPlat_j(3);

    
    % Ausgabe der EE-Pose über alle drei Ketten und qp2_correct
     xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie_1];
     xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie_2];
     xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie_3];
end