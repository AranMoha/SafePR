function [qa, qp] = calcq(xEE, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)

    % Funktion für die vollständige geometrische inverse Kinematik 
    % Mit dieser Funktion können die aktiven und passiven Gelenkwinkel qa und qp bei bekannter Plattformpose xEE berechnet werden.
    % Eingabe:
    % xEE in m und rad: Plattform-Koordinaten im Basis-KS (3x1)
    %
    % Ausgabe:
    % qa in rad: Aktive Gelenkwinkel (3x1)
    % qp in rad: Passive Gelenkwinkel an den Ellenbögen (3x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover

%     r_fixPlat = kin_params(1);
%     r_mobPlat = kin_params(2);
%     l1 = kin_params(3);
%     l2 = kin_params(4);
      
    l_1i  = l_all_id([1 2]);
    l_2i  = l_all_id([3 4]);
    l_3i  = l_all_id([5 6]);

    xEE_1 = -[sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat_j(1) + ... % Basisgelenk zu Inertial
            +[xEE(1); xEE(2)]... % Inertial zu KS_EE
            +[cos(beta_j(1)+xEE(3)); sin(beta_j(1)+xEE(3))]*r_mobPlat_j(1); % KS_EE zum Koppelpunkt mob Platfform
    
    xEE_2 = -[sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat_j(2) + ... % Basisgelenk zu Inertial
            +[xEE(1); xEE(2)]... % Inertial zu KS_EE
            +[cos(beta_j(2)+xEE(3)); sin(beta_j(2)+xEE(3))]*r_mobPlat_j(2); % KS_EE zum Koppelpunkt mob Platfform
    
    xEE_3 = -[sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat_j(3) + ... % Basisgelenk zu Inertial
            +[xEE(1); xEE(2)]... % Inertial zu KS_EE
            +[cos(beta_j(3)+xEE(3)); sin(beta_j(3)+xEE(3))]*r_mobPlat_j(3); % KS_EE zum Koppelpunkt mob Platfform        
    
        
    psi_1_tmp = (xEE_1(1)^2 + xEE_1(2)^2-(l_1i(1))^2-(l_1i(2))^2)/(2*(l_1i(1))*(l_1i(2)));
    psi_2_tmp = (xEE_2(1)^2 + xEE_2(2)^2-(l_2i(1))^2-(l_2i(2))^2)/(2*(l_2i(1))*(l_2i(2)));
    psi_3_tmp = (xEE_3(1)^2 + xEE_3(2)^2-(l_3i(1))^2-(l_3i(2))^2)/(2*(l_3i(1))*(l_3i(2)));
    psi_1 = acos(max(min(psi_1_tmp,1),-1) );
    psi_2 = acos(max(min(psi_2_tmp,1),-1) );
    psi_3 = acos(max(min(psi_3_tmp,1),-1) );
        
    if psi_1<0; psi_1=-psi_1; end    
    if psi_2<0; psi_2=-psi_2; end    
    if psi_3<0; psi_3=-psi_3; end     
    
    theta_1_tmp = atan2( (l_1i(1)+l_1i(2)*cos(psi_1))*xEE_1(2) - l_1i(2)*sin(psi_1)*xEE_1(1), ...
                     (l_1i(1)+l_1i(2)*cos(psi_1))*xEE_1(1) + l_1i(2)*sin(psi_1)*xEE_1(2) );
    if theta_1_tmp < 0
        theta_1 = theta_1_tmp + (-psi_j(1) + 2*pi);
    else
        theta_1 = theta_1_tmp + (-psi_j(1));
    end        
                 
                 
    theta_2_tmp = atan2( (l_2i(1)+l_2i(2)*cos(psi_2))*xEE_2(2) - l_2i(2)*sin(psi_2)*xEE_2(1), ...
                       (l_2i(1)+l_2i(2)*cos(psi_2))*xEE_2(1) + l_2i(2)*sin(psi_2)*xEE_2(2) );
    if theta_2_tmp > 0
        theta_2 = theta_2_tmp + ( -psi_j(2));
    else
        theta_2 = theta_2_tmp + ( -psi_j(2) + 2*pi);
    end        
    theta_3 = atan2( (l_3i(1)+l_3i(2)*cos(psi_3))*xEE_3(2) - l_3i(2)*sin(psi_3)*xEE_3(1), ...
                       (l_3i(1)+l_3i(2)*cos(psi_3))*xEE_3(1) + l_3i(2)*sin(psi_3)*xEE_3(2) ) + ( -psi_j(3) + 2*pi);
% 
%     xEE_1 = -[sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat + ... % Basisgelenk zu Inertial
%             +[xEE(1); xEE(2)]... % Inertial zu KS_EE
%             +[cos(beta_j(1)+xEE(3)); sin(beta_j(1)+xEE(3))]*r_mobPlat; % KS_EE zum Koppelpunkt mob Platfform
%     
%     xEE_2 = -[sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat + ... % Basisgelenk zu Inertial
%             +[xEE(1); xEE(2)]... % Inertial zu KS_EE
%             +[cos(beta_j(2)+xEE(3)); sin(beta_j(2)+xEE(3))]*r_mobPlat; % KS_EE zum Koppelpunkt mob Platfform
%     
%     xEE_3 = -[sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat + ... % Basisgelenk zu Inertial
%             +[xEE(1); xEE(2)]... % Inertial zu KS_EE
%             +[cos(beta_j(3)+xEE(3)); sin(beta_j(3)+xEE(3))]*r_mobPlat; % KS_EE zum Koppelpunkt mob Platfform        
%     

%     psi_1_tmp = (xEE_1(1)^2 + xEE_1(2)^2-(l1)^2-(l2)^2)/(2*(l1)*(l2));
%     psi_2_tmp = (xEE_2(1)^2 + xEE_2(2)^2-(l1)^2-(l2)^2)/(2*(l1)*(l2));
%     psi_3_tmp = (xEE_3(1)^2 + xEE_3(2)^2-(l1)^2-(l2)^2)/(2*(l1)*(l2));
%     psi_1 = acos(max(min(psi_1_tmp,1),-1) );
%     psi_2 = acos(max(min(psi_2_tmp,1),-1) );
%     psi_3 = acos(max(min(psi_3_tmp,1),-1) );
%         
%     if psi_1<0; psi_1=-psi_1; end    
%     if psi_2<0; psi_2=-psi_2; end    
%     if psi_3<0; psi_3=-psi_3; end     
%     
%     theta_1_tmp = atan2( (l1+l2*cos(psi_1))*xEE_1(2) - l2*sin(psi_1)*xEE_1(1), ...
%                      (l1+l2*cos(psi_1))*xEE_1(1) + l2*sin(psi_1)*xEE_1(2) );
%     if theta_1_tmp < 0
%         theta_1 = theta_1_tmp + (-psi_j(1) + 2*pi);
%     else
%         theta_1 = theta_1_tmp + (-psi_j(1));
%     end        
%                  
%                  
%     theta_2_tmp = atan2( (l1+l2*cos(psi_2))*xEE_2(2) - l2*sin(psi_2)*xEE_2(1), ...
%                        (l1+l2*cos(psi_2))*xEE_2(1) + l2*sin(psi_2)*xEE_2(2) );
%     if theta_2_tmp > 0
%         theta_2 = theta_2_tmp + ( -psi_j(2));
%     else
%         theta_2 = theta_2_tmp + ( -psi_j(2) + 2*pi);
%     end        
%     theta_3 = atan2( (l1+l2*cos(psi_3))*xEE_3(2) - l2*sin(psi_3)*xEE_3(1), ...
%                        (l1+l2*cos(psi_3))*xEE_3(1) + l2*sin(psi_3)*xEE_3(2) ) + ( -psi_j(3) + 2*pi);

    qa = [theta_1; theta_2; theta_3];
    qp = [psi_1; psi_2; psi_3];
end
