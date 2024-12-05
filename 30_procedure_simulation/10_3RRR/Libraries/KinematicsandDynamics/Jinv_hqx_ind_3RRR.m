function Jinv_hqx_ind_3RRRreturn = Jinv_hqx_ind_3RRR(qj_rad, xEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_rad, beta_rad)
    % Funktion für die Bestimmung der Jacobi-Matrix basierend auf vollständigen Zwangsbedingungen h - (dh/dq)^-1 *dh/dx  
    % Eingabe:
    % qj_rad in rad: Gelenkkoordinaten (9x1)
    % xEE in m und rad: Plattform-Koordinaten im Basis-KS (6x1)
    %
    % Ausgabe:
    % Jinv_hqx_ind_3RRRreturn: Jacobi-Matrix (3x9)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
  Jinv_hqx_indT = [0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0;];
  t1 = l_all_id(1);
  t2 = 0.1e1 / t1;
  t3 = psi_rad(1);
  t4 = qj_rad(1);
  t5 = qj_rad(2);
  t6 = t3 + t4 + t5;
  t7 = cos(t6);
  t9 = sin(t5);
  t10 = 0.1e1 / t9;
  Jinv_hqx_indT(1,1) = t10 * t7 * t2;
  t11 = l_all_id(2);
  t13 = t3 + t4;
  t14 = cos(t13);
  t17 = 0.1e1 / t11;
  t19 = t10 * t2;
  Jinv_hqx_indT(1,2) = -t19 * t17 * (t1 * t14 + t11 * t7);
  Jinv_hqx_indT(1,3) = t10 * t14 * t17;
  t22 = l_all_id(3);
  t23 = 0.1e1 / t22;
  t24 = qj_rad(4);
  t25 = qj_rad(5);
  t26 = psi_rad(2);
  t27 = t24 + t25 + t26;
  t28 = cos(t27);
  t30 = sin(t25);
  t31 = 0.1e1 / t30;
  Jinv_hqx_indT(1,4) = t31 * t28 * t23;
  t32 = l_all_id(4);
  t34 = t24 + t26;
  t35 = cos(t34);
  t39 = 0.1e1 / t32;
  t40 = t31 * t39;
  Jinv_hqx_indT(1,5) = -t40 * t23 * (t22 * t35 + t32 * t28);
  Jinv_hqx_indT(1,6) = t31 * t35 * t39;
  t43 = l_all_id(5);
  t44 = 0.1e1 / t43;
  t45 = qj_rad(7);
  t46 = qj_rad(8);
  t47 = psi_rad(3);
  t48 = t45 + t46 + t47;
  t49 = cos(t48);
  t51 = sin(t46);
  t52 = 0.1e1 / t51;
  Jinv_hqx_indT(1,7) = t52 * t49 * t44;
  t53 = l_all_id(6);
  t55 = t45 + t47;
  t56 = cos(t55);
  t60 = 0.1e1 / t53;
  t61 = t52 * t60;
  Jinv_hqx_indT(1,8) = -t61 * t44 * (t43 * t56 + t49 * t53);
  Jinv_hqx_indT(1,9) = t52 * t56 * t60;
  t64 = sin(t6);
  Jinv_hqx_indT(2,1) = t10 * t64 * t2;
  t66 = sin(t13);
  Jinv_hqx_indT(2,2) = -t19 * t17 * (t1 * t66 + t11 * t64);
  Jinv_hqx_indT(2,3) = t10 * t66 * t17;
  t73 = sin(t27);
  Jinv_hqx_indT(2,4) = t31 * t73 * t23;
  t75 = sin(t34);
  Jinv_hqx_indT(2,5) = -t40 * t23 * (t22 * t75 + t32 * t73);
  Jinv_hqx_indT(2,6) = t31 * t75 * t39;
  t82 = sin(t48);
  Jinv_hqx_indT(2,7) = t52 * t82 * t44;
  t85 = sin(t55);
  Jinv_hqx_indT(2,8) = -t61 * t44 * (t43 * t85 + t53 * t82);
  Jinv_hqx_indT(2,9) = t52 * t85 * t60;
  t91 = r_mobPlat_j(1);
  t92 = t2 * t91;
  t93 = xEE(6);
  t94 = beta_rad(1);
  t96 = sin(-t93 - t94 + t3 + t4 + t5);
  Jinv_hqx_indT(3,1) = t10 * t96 * t92;
  t99 = sin(-t93 + t4 + t3 - t94);
  Jinv_hqx_indT(3,2) = t10 * (-t1 * t99 - t11 * t96) * t17 * t92;
  Jinv_hqx_indT(3,3) = -t10 * t17 * (-t11 * t9 - t91 * t99);
  t110 = r_mobPlat_j(2);
  t111 = t23 * t110;
  t112 = beta_rad(2);
  t114 = sin(-t93 - t112 + t24 + t25 + t26);
  Jinv_hqx_indT(3,4) = t31 * t114 * t111;
  t118 = sin(-t93 + t24 + t26 - t112);
  Jinv_hqx_indT(3,5) = t31 * (-t114 * t32 - t118 * t22) * t39 * t111;
  Jinv_hqx_indT(3,6) = t31 * (t110 * t118 + t30 * t32) * t39;
  t127 = r_mobPlat_j(3);
  t128 = t44 * t127;
  t129 = beta_rad(3);
  t131 = sin(t45 + t46 + t47 - t93 - t129);
  Jinv_hqx_indT(3,7) = t52 * t131 * t128;
  t134 = sin(-t93 + t45 + t47 - t129);
  Jinv_hqx_indT(3,8) = t52 * (-t131 * t53 - t134 * t43) * t60 * t128;
  Jinv_hqx_indT(3,9) = -t52 * t60 * (-t127 * t134 - t51 * t53);
  Jinv_hqx_ind_3RRRreturn = Jinv_hqx_indT;
