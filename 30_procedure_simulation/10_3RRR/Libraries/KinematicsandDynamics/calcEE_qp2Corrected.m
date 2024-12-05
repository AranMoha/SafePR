function [xEE_1, xEE_2, xEE_3, qp2_cort] = calcEE_qp2Corrected(qa, qp, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)
    % Funktion für die direkte geometrische Kinematik 
    % Mit dieser Funktion können die Plattformlagen über alle drei
    % Beinketten bei bekannten aktiven und passiven Gelenkwinkel qa und qp
    % berechnet werden. Zusätzlich wird der passive Gelenkwinkel am
    % Ellenbogen mit dem defekten Inkrementalgeber berechnet. 
    % Eingabe:
    % qa: Aktive Gelenkwinkel (Mit Schubachse) (4x1)
    % qp: Passive Gelenkwinkel an den Ellenbögen (3x1)
    %
    % Ausgabe:
    % xEE_1 in m und rad: Direkte Kinematik über die erste Beinkette (3x1)
    % xEE_2 in m und rad: Direkte Kinematik über die zweite Beinkette (3x1)
    % xEE_3 in m und rad: Direkte Kinematik über die dritte Beinkette (3x1)
    % qp2_cort in rad: Passiver Gelenkwinkel am Gelenk mit defektem Inkrementalgeber (1x1)
     
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover

% [pos_Mi_KS0_output, pos_Pi_KS0_output, xEE_]= calcEE(qa_deg, qp_deg, param_chain, pos_Gi_KS0, pos_Pi_KSEE, nrchain)
       
%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
    l_1i  = l_all_id([1 2]);
    l_2i  = l_all_id([3 4]);
    l_3i  = l_all_id([5 6]);
    
    R_initKS_ZwischenKS = [-1 0 0; 0 -1 0; 0 0 1];

    % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
    P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat_j(1) + ... % Inertial zu Basisgelenk 1
         [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l_1i(1) + ...% Basisgelenk1 zu Elle 1
         [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l_1i(2); % Elle 1 zu Koppelgelenk 1

    % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
    P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat_j(2) + ... % Inertial zu Basisgelenk 2
         [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l_2i(1); % Basisgelenk 2 zu Elle 2
%          [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l2; % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
     
    % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
    P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat_j(3) + ... % Inertial zu Basisgelenk 3
         [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l_3i(1) + ... % Basisgelenk 3 zu Elle 3
         [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l_3i(2); % Elle 3 zu Koppelgelenk 3
    

%     phie = pi/3 - atan2( P3(1)-P1(1), P3(2)-P1(2));
%     phie = pi/3 - atan( (P3(1)-P1(1)) / (P3(2)-P1(2)) );
    P3_new = R_initKS_ZwischenKS(1:2, 1:2)*P3;
    P1_new = R_initKS_ZwischenKS(1:2, 1:2)*P1;
    phie = atan2(P3_new(2)-P1_new(2), P3_new(1)-P1_new(1)) - 30*pi/180;
%     phie = atan2(P3_new(2)-P1_new(2), P3_new(1)-P1_new(1)) - 59.9729/2*pi/180;
    
    % Endeffektorpose über erste und dritte Kette berechnet
    pos_xEE_1 = P1 - [cos(beta_j(1)+phie); sin(beta_j(1)+phie)]*r_mobPlat_j(1);
    pos_xEE_3 = P3 - [cos(beta_j(3)+phie); sin(beta_j(3)+phie)]*r_mobPlat_j(3);

    % Verwende berechnete EE-Pose, um qp2 nun zu berechnen
    tmp = pos_xEE_1 + [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat_j(2);
%     qp2_correct = pi/2 + atan2( tmp(1)-P2(1), tmp(2)-P2(2));
%     qp2_correct = -qa(2) - psi_j(2) + mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) +2*pi ), 2*pi);
%     qp2_correct = -qa(2) - psi_j(2) +mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) )+2*pi, 2*pi);
%     qp2_correct =mod( -qa(2) - psi_j(2) +mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) )+2*pi, 2*pi)+2*pi,2*pi);
%     qp2_correct = atan2( tmp(2)-P2(2), tmp(1)-P2(1)) +150*pi/180 - qa(2);
      qp2_correct = atan2( tmp(2)-P2(2), tmp(1)-P2(1)) + (2*pi - psi_j(2)) - qa(2);

    % Berechne direkte Kinematik der zweiten Kette mit neu berechnetem qp2
    P2_correct = P2 + [cos(psi_j(2) + qa(2) + qp2_correct); sin(psi_j(2) + qa(2) + qp2_correct)]*l_2i(2);
    pos_xEE_2 = P2_correct - [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat_j(2);
    
%     
%         % Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P1 = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat + ... % Inertial zu Basisgelenk 1
%          [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l1 + ...% Basisgelenk1 zu Elle 1
%          [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l2; % Elle 1 zu Koppelgelenk 1
% 
%     % Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
%     P2 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat + ... % Inertial zu Basisgelenk 2
%          [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l1; % Basisgelenk 2 zu Elle 2
% %          [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l2; % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
%      
%     % Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
%     P3 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat + ... % Inertial zu Basisgelenk 3
%          [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l1 + ... % Basisgelenk 3 zu Elle 3
%          [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l2; % Elle 3 zu Koppelgelenk 3
%     
% 
% %     phie = pi/3 - atan2( P3(1)-P1(1), P3(2)-P1(2));
% %     phie = pi/3 - atan( (P3(1)-P1(1)) / (P3(2)-P1(2)) );
%     P3_new = R_initKS_ZwischenKS(1:2, 1:2)*P3;
%     P1_new = R_initKS_ZwischenKS(1:2, 1:2)*P1;
%     phie = atan2(P3_new(2)-P1_new(2), P3_new(1)-P1_new(1)) - 30*pi/180;
%     
%     % Endeffektorpose über erste und dritte Kette berechnet
%     pos_xEE_1 = P1 - [cos(beta_j(1)+phie); sin(beta_j(1)+phie)]*r_mobPlat;
%     pos_xEE_3 = P3 - [cos(beta_j(3)+phie); sin(beta_j(3)+phie)]*r_mobPlat;
% 
%     % Verwende berechnete EE-Pose, um qp2 nun zu berechnen
%     tmp = pos_xEE_1 + [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
% %     qp2_correct = pi/2 + atan2( tmp(1)-P2(1), tmp(2)-P2(2));
% %     qp2_correct = -qa(2) - psi_j(2) + mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) +2*pi ), 2*pi);
% %     qp2_correct = -qa(2) - psi_j(2) +mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) )+2*pi, 2*pi);
% %     qp2_correct =mod( -qa(2) - psi_j(2) +mod( atan2( (tmp(2)-P2(2) ), ( tmp(1)-P2(1)) )+2*pi, 2*pi)+2*pi,2*pi);
%     qp2_correct = atan2( tmp(2)-P2(2), tmp(1)-P2(1)) +150*pi/180 - qa(2);
%   
%     % Berechne direkte Kinematik der zweiten Kette mit neu berechnetem qp2
%     P2_correct = P2 + [cos(psi_j(2) + qa(2) + qp2_correct); sin(psi_j(2) + qa(2) + qp2_correct)]*l2;
%     pos_xEE_2 = P2_correct - [cos(beta_j(2)+phie); sin(beta_j(2)+phie)]*r_mobPlat;
%     
    
    
    % Ausgabe der EE-Pose über alle drei Ketten und qp2_correct
     xEE_1 = [pos_xEE_1(1); pos_xEE_1(2); phie];
     xEE_2 = [pos_xEE_2(1); pos_xEE_2(2); phie];
     xEE_3 = [pos_xEE_3(1); pos_xEE_3(2); phie];
     qp2_cort = qp2_correct;
end
