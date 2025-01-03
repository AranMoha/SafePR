function JacB_hredqa_ind_3RRRreturn = JacB_hredqa_ind_3RRR(qj_rad, xEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_rad, beta_rad)
    % Funktion für die Bestimmung der Jacobi-Matrix der inversen Kinematik
    % basierend auf reduzierten Zwangsbedingungen hred (dhred/dqa)
    % Eingabe:
    % qj_rad in rad: Gelenkkoordinaten (9x1)
    % xEE in m und rad: Plattform-Koordinaten im Basis-KS (6x1)
    %
    % Ausgabe:
    % JacB_hredqa_ind_3RRRreturn: Jacobi-Matrix (3x3)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
  JacB_hredqa_ind = [0 0 0; 0 0 0; 0 0 0;];
  t2 = xEE(6);
  t3 = qj_rad(1);
  t4 = psi_rad(1);
  t7 = sin(-t2 + t3 + t4 - beta_rad(1));
  t10 = t3 + t4;
  t11 = cos(t10);
  t12 = xEE(2);
  t14 = sin(t10);
  t15 = xEE(1);
  t17 = cos(t3);
  JacB_hredqa_ind(1,1) = -0.2e1 * (t11 * t12 - t14 * t15 + t17 * r_fixPlat_j(1) - t7 * r_mobPlat_j(1)) * l_all_id(1);
  JacB_hredqa_ind(1,2) = 0.0e0;
  JacB_hredqa_ind(1,3) = 0.0e0;
  JacB_hredqa_ind(2,1) = 0.0e0;
  t24 = qj_rad(4);
  t25 = psi_rad(2);
  t26 = t24 + t25;
  t27 = sin(t26);
  t29 = cos(t26);
  t33 = sin(-t2 + t24 + t25 - beta_rad(2));
  t36 = cos(t24);
  JacB_hredqa_ind(2,2) = 0.2e1 * (-t12 * t29 + t15 * t27 + t33 * r_mobPlat_j(2) - t36 * r_fixPlat_j(2)) * l_all_id(3);
  JacB_hredqa_ind(2,3) = 0.0e0;
  JacB_hredqa_ind(3,1) = 0.0e0;
  JacB_hredqa_ind(3,2) = 0.0e0;
  t42 = qj_rad(7);
  t43 = psi_rad(3);
  t46 = sin(-t2 + t42 + t43 - beta_rad(3));
  t49 = t42 + t43;
  t50 = sin(t49);
  t52 = cos(t49);
  t54 = cos(t42);
  JacB_hredqa_ind(3,3) = -0.2e1 * (t12 * t52 - t15 * t50 - t46 * r_mobPlat_j(3) + t54 * r_fixPlat_j(3)) * l_all_id(5);
  JacB_hredqa_ind_3RRRreturn = JacB_hredqa_ind;
