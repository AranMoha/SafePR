function JacA_hredx_ind_3RRRreturn = JacA_hredx_ind_3RRR(qj_rad, xEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_rad, beta_rad)
    % Funktion für die Bestimmung der Jacobi-Matrix der direkten Kinematik basierend auf reduzierten Zwangsbedingungen hred (dhred/dx) 
    % Eingabe:
    % qj_rad in rad: Gelenkkoordinaten (9x1)
    % xEE in m und rad: Plattform-Koordinaten im Basis-KS (6x1)
    %
    % Ausgabe:
    % JacA_hredx_ind_3RRRreturn: Jacobi-Matrix (3x3)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
  JacA_hredx_ind = [0 0 0; 0 0 0; 0 0 0;];
  t1 = psi_rad(1);
  t2 = sin(t1);
  t3 = r_fixPlat_j(1);
  t5 = xEE(6);
  t6 = beta_rad(1);
  t7 = t5 + t6;
  t8 = cos(t7);
  t9 = r_mobPlat_j(1);
  t11 = qj_rad(1);
  t12 = t1 + t11;
  t13 = cos(t12);
  t14 = l_all_id(1);
  t16 = xEE(1);
  JacA_hredx_ind(1,1) = -0.2e1 * t13 * t14 - 0.2e1 * t2 * t3 + 0.2e1 * t8 * t9 + (2 * t16);
  t18 = cos(t1);
  t20 = sin(t7);
  t22 = sin(t12);
  t24 = xEE(2);
  JacA_hredx_ind(1,2) = -0.2e1 * t14 * t22 + 0.2e1 * t18 * t3 + 0.2e1 * t20 * t9 + (2 * t24);
  t27 = cos(-t5 + t1 - t6);
  t31 = sin(-t5 + t11 + t1 - t6);
  JacA_hredx_ind(1,3) = 0.2e1 * (-t14 * t31 - t16 * t20 + t24 * t8 + t27 * t3) * t9;
  t36 = psi_rad(2);
  t37 = sin(t36);
  t38 = r_fixPlat_j(2);
  t40 = beta_rad(2);
  t41 = t5 + t40;
  t42 = cos(t41);
  t43 = r_mobPlat_j(2);
  t45 = qj_rad(4);
  t46 = t45 + t36;
  t47 = cos(t46);
  t48 = l_all_id(3);
  JacA_hredx_ind(2,1) = -0.2e1 * t37 * t38 + 0.2e1 * t42 * t43 - 0.2e1 * t47 * t48 + (2 * t16);
  t51 = cos(t36);
  t53 = sin(t41);
  t55 = sin(t46);
  JacA_hredx_ind(2,2) = 0.2e1 * t38 * t51 + 0.2e1 * t43 * t53 - 0.2e1 * t55 * t48 + (2 * t24);
  t61 = cos(-t5 + t36 - t40);
  t64 = sin(-t5 + t45 + t36 - t40);
  JacA_hredx_ind(2,3) = 0.2e1 * (-t16 * t53 + t24 * t42 + t38 * t61 - t48 * t64) * t43;
  t68 = psi_rad(3);
  t69 = sin(t68);
  t70 = r_fixPlat_j(3);
  t72 = beta_rad(3);
  t73 = t5 + t72;
  t74 = cos(t73);
  t75 = r_mobPlat_j(3);
  t77 = qj_rad(7);
  t78 = t77 + t68;
  t79 = cos(t78);
  t80 = l_all_id(5);
  JacA_hredx_ind(3,1) = -0.2e1 * t69 * t70 + 0.2e1 * t74 * t75 - 0.2e1 * t79 * t80 + (2 * t16);
  t83 = cos(t68);
  t85 = sin(t73);
  t87 = sin(t78);
  JacA_hredx_ind(3,2) = 0.2e1 * t70 * t83 + 0.2e1 * t75 * t85 - 0.2e1 * t80 * t87 + (2 * t24);
  t93 = sin(-t5 + t77 + t68 - t72);
  t96 = cos(-t5 + t68 - t72);
  JacA_hredx_ind(3,3) = -0.2e1 * (t16 * t85 - t74 * t24 - t70 * t96 + t80 * t93) * t75;
  JacA_hredx_ind_3RRRreturn = JacA_hredx_ind;
