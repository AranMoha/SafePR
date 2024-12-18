function [Jac_xpq_1_3RRRreturn, Jac_xpq_2_3RRRreturn, Jac_xpq_3_3RRRreturn, Jac_xpq_3RRRreturn, dxp_ds_3RRRreturn,...
          dxp_1, dxp_2, dxp_3,dxp, r_0xp_KS0]... 
        = calcJac_colSeg(chain_segment, qj_rad, qJD_rad, xEE_, xEED, l_all, r_BasisPla_MobPla, ...
                         l_all_id, r_fixPlat_j, r_mobPlat_j, whichchain, location, locationchange)
    % Funktion für die Berechnung Kontaktjacobi-Matrizen Kontaktortgeschwindigkeiten und -posen
    % Eingabe:
    % chain_segment: Betroffenes Segment (1x1)
    % qj_rad: Vektor der Gelenkkoordinaten (9x1)
    % qJD_rad: Vektor der Gelenkgeschwindigkeiten (9x1)
    % xEE_: Vektor der Plattformkoordinaten (3x1)
    % xEED: Vektor der Plattformgeschwindigkeiten (3x1)
    % whichchain: Betroffene Beinkette (1x1) 
    % location: Längennormierter Kontaktort im körperfesten KS (1x1)
    % locationchange: Zeitliche Änderung des längennormierten Kontaktortes im körperfesten KS (1x1)
    %
    % Ausgabe:
    % Jac_xpq_1_3RRRreturn: Kontaktjacobi über betroffene Beinkette, um dq auf dxp zu projizieren (3x9)
    % Jac_xpq_2_3RRRreturn: Kontaktjacobi über erste unbetroffene Beinkette, um dq auf dxp zu projizieren (3x9)
    % Jac_xpq_3_3RRRreturn: Kontaktjacobi über zweite unbetroffene Beinkette, um dq auf dxp zu projizieren (3x9)
    % Jac_xpq_3RRRreturn: Kontaktjacobi über alle Beinketten, um dq auf dxp zu projizieren (3x9)
    % dxp_ds_3RRRreturn: 
    % dxp_1: Geschwindigkeit des Kontaktortes in KS0 über betroffene Beinkette (3x1)
    % dxp_2: Geschwindigkeit des Kontaktortes in KS0 über erste unbetroffene Beinkette (3x1)
    % dxp_3: Geschwindigkeit des Kontaktortes in KS0 über zweite unbetroffene Beinkette (3x1)
    % dxp: Geschwindigkeit des Kontaktortes in KS0 über alle Beinketten (3x1)
    % r_0xp_KS0: Pose des KOntaktortes in KS0 (3x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
                         
    psi_rad_tmp = [90.0000; 210.7631; 330.4901]*pi/180;%[90, 210, 330]*pi/180;
    beta_rad_tmp = [0, 120, 240]*pi/180;
    xEE = [xEE_(1); xEE_(2); 0; 0; 0; xEE_(3)];
    % j entspricht die betroffene Kette 
    % k, i die unbetroffenen 
    if whichchain==1
        qjj_rad = [qj_rad(1); qj_rad(2); qj_rad(3)]; 
        qjk_rad = [qj_rad(4); qj_rad(5); qj_rad(6)];
        qji_rad = [qj_rad(7); qj_rad(8); qj_rad(9)];
        
        psi_beta_rad = [psi_rad_tmp(1), psi_rad_tmp(2), psi_rad_tmp(3), ...
                        beta_rad_tmp(1), beta_rad_tmp(2), beta_rad_tmp(3)];
%         qJD_rad = qJD_rad_;    
        idx = [1:3 4:6 7:9]; 
        lj = l_all_id(1:2);
        lk = l_all_id(3:4);
        li = l_all_id(5:6);
        r_0G1_ind = r_fixPlat_j([1,2,3]);
        r_PEP_ind = r_mobPlat_j([1,2,3]);
    elseif whichchain==2
        qjj_rad = [qj_rad(4); qj_rad(5); qj_rad(6)];
        qjk_rad = [qj_rad(7); qj_rad(8); qj_rad(9)];
        qji_rad = [qj_rad(1); qj_rad(2); qj_rad(3)];
        
        psi_beta_rad = [psi_rad_tmp(2), psi_rad_tmp(3), psi_rad_tmp(1), ...
                        beta_rad_tmp(2), beta_rad_tmp(3), beta_rad_tmp(1)];
        
%         qJD_rad = [qJD_rad_(4); qJD_rad_(5); qJD_rad_(6); ...
%                    qJD_rad_(7); qJD_rad_(8); qJD_rad_(9); ...
%                    qJD_rad_(1); qJD_rad_(2); qJD_rad_(3)];
        idx = [7:9 1:3 4:6];                    
        lj = l_all_id(3:4);
        lk = l_all_id(5:6);
        li = l_all_id(1:2);
        r_0G1_ind = r_fixPlat_j([2,3,1]);
        r_PEP_ind = r_mobPlat_j([2,3,1]);
        
    elseif whichchain==3
        qjj_rad = [qj_rad(7); qj_rad(8); qj_rad(9)];
        qjk_rad = [qj_rad(1); qj_rad(2); qj_rad(3)];
        qji_rad = [ qj_rad(4); qj_rad(5); qj_rad(6)];
        
        psi_beta_rad = [psi_rad_tmp(3), psi_rad_tmp(1), psi_rad_tmp(2), ...
                        beta_rad_tmp(3), beta_rad_tmp(1), beta_rad_tmp(2)];
                    
%         qJD_rad = [qJD_rad_(7); qJD_rad_(8); qJD_rad_(9); ...
%                    qJD_rad_(1); qJD_rad_(2); qJD_rad_(3);...
%                    qJD_rad_(4); qJD_rad_(5); qJD_rad_(6)];
        idx = [4:6 7:9 1:3];          
        lj = l_all_id(5:6);
        lk = l_all_id(1:2);
        li = l_all_id(3:4);
        r_0G1_ind = r_fixPlat_j([3,1,2]);
        r_PEP_ind = r_mobPlat_j([3,1,2]);        
        
    else
        Jac_xpq_1_3RRRreturn = zeros(3,9);
        Jac_xpq_2_3RRRreturn = zeros(3,9);
        Jac_xpq_3_3RRRreturn = zeros(3,9);
        Jac_xpq_3RRRreturn = zeros(3,9);
        dxp_ds_3RRRreturn = zeros(3,1);
        dxp_1 = zeros(3,1);
        dxp_2 = zeros(3,1);
        dxp_3 = zeros(3,1);
        dxp = zeros(3,1);
        r_0xp_KS0 = zeros(3,1);
        return
    end
    
    contactpoint = [location; locationchange];
    
    % Kinematisch Parameter sind identisch
%     Jac_xpq_1_3RRRreturn_ = Jac_xpq_1_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, l_all, r_BasisPla_MobPla, contactpoint);
%     Jac_xpq_2_3RRRreturn_ = Jac_xpq_2_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, l_all, r_BasisPla_MobPla, contactpoint);
%     Jac_xpq_3_3RRRreturn_ = Jac_xpq_3_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, l_all, r_BasisPla_MobPla, contactpoint);
%     Jac_xpq_3RRRreturn_ = Jac_xpq_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, l_all, r_BasisPla_MobPla, contactpoint);
    dxp_ds_3RRRreturn = transpose(dxp_ds_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, l_all, r_BasisPla_MobPla, contactpoint));
    lj = l_all; lk=l_all; li=l_all;
%     % Kinematische Parameter sind individuell
    if chain_segment==1
        Jac_xpq_1_3RRRreturn_ = Jac_xpq_1_ind_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
                                                  lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
        Jac_xpq_2_3RRRreturn_ = Jac_xpq_2_ind_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
          lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
        Jac_xpq_3_3RRRreturn_ = Jac_xpq_3_ind_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
          lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
        Jac_xpq_3RRRreturn_ = Jac_xpq_ind_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
                                                  lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
    elseif chain_segment==2
        Jac_xpq_1_3RRRreturn_ = Jac_xpq_1_ind_seg2_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
                                                  lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
        Jac_xpq_2_3RRRreturn_ = Jac_xpq_2_ind_seg2_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
          lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
        Jac_xpq_3_3RRRreturn_ = Jac_xpq_3_ind_seg2_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
          lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
        Jac_xpq_3RRRreturn_ = Jac_xpq_ind_seg2_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, ...
                                                  lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint);
      else
        Jac_xpq_1_3RRRreturn = zeros(3,9);
        Jac_xpq_2_3RRRreturn = zeros(3,9);
        Jac_xpq_3_3RRRreturn = zeros(3,9);
        Jac_xpq_3RRRreturn = zeros(3,9);
        dxp_ds_3RRRreturn = zeros(3,1);
        dxp_1 = zeros(3,1);
        dxp_2 = zeros(3,1);
        dxp_3 = zeros(3,1);
        dxp = zeros(3,1);
        r_0xp_KS0 = zeros(3,1);
    return
    end
    Jac_xpq_1_3RRRreturn = Jac_xpq_1_3RRRreturn_(:, idx);
    Jac_xpq_2_3RRRreturn = Jac_xpq_2_3RRRreturn_(:, idx);
    Jac_xpq_3_3RRRreturn = Jac_xpq_3_3RRRreturn_(:, idx);
    Jac_xpq_3RRRreturn = Jac_xpq_3RRRreturn_(:, idx);
    
    dxp_1 = Jac_xpq_1_3RRRreturn * qJD_rad;
    dxp_2 = Jac_xpq_2_3RRRreturn * qJD_rad;
    dxp_3 = Jac_xpq_3_3RRRreturn * qJD_rad;
    dxp = Jac_xpq_3RRRreturn * qJD_rad;
    test = Jac_xpq_3RRRreturn*3 - (Jac_xpq_1_3RRRreturn+Jac_xpq_2_3RRRreturn+Jac_xpq_3_3RRRreturn);
    psi_j = psi_beta_rad(1);
    qj1 = qjj_rad(1);
    s = contactpoint(1);
    l1 = l_all(1); 
    r_0Gj1 = r_BasisPla_MobPla(1);
%     r_0xp_KS0 = [sin(psi_j)*r_0Gj1 + cos(psi_j + qj1)*s*l1; -cos(psi_j)*r_0Gj1 + sin(psi_j + qj1)*s*l1; psi_j + qj1];
    qa = qj_rad([1,4,7]);   
    qp = qj_rad([2,5,8]);   
    if chain_segment==1
        b = [sin(psi_j);                -cos(psi_j)]*r_fixPlat_j(whichchain);% Inertial zu Basisgelenk 1
        a_=[cos(psi_j+ qa(whichchain));         sin(psi_j + qa(whichchain))]*l_all_id(whichchain*2-1);% Basisgelenk1 zu Elle 1
        c = psi_j+qa(whichchain);
    elseif chain_segment==2
        b = [sin(psi_j);                -cos(psi_j)]*r_fixPlat_j(whichchain)+...% Inertial zu Basisgelenk 1
            [cos(psi_j + qa(whichchain));         sin(psi_j + qa(whichchain))]*l_all_id(whichchain*2-1);% Basisgelenk1 zu Elle 1
        a_ = [cos(psi_j + qa(whichchain) + qp(whichchain)); sin(psi_j + qa(whichchain) + qp(whichchain))]*l_all_id(whichchain*2); % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
        c = psi_j+qa(whichchain)+qp(whichchain);
    else
        a_=zeros(2,1);
        b=a_;
        c=0;
    end
    r_0xp_KS0_ = s*a_+b;
    r_0xp_KS0 = [r_0xp_KS0_(1); r_0xp_KS0_(2); c]; 
end
    

