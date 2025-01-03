function J_hq_ind_3RRRreturn = J_hq_ind_3RRR(qj_rad, xEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_rad, beta_rad)
  J_hq_ind = [0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0;];
  t1 = qj_rad(1);
  t2 = psi_rad(1);
  t3 = t1 + t2;
  t4 = sin(t3);
  t5 = l_all_id(1);
  t8 = t2 + t1 + qj_rad(2);
  t9 = sin(t8);
  t10 = l_all_id(2);
  t11 = t10 * t9;
  J_hq_ind(1,1) = t4 * t5 + t11;
  J_hq_ind(1,2) = t11;
  J_hq_ind(1,3) = 0.0e0;
  J_hq_ind(1,4) = 0.0e0;
  J_hq_ind(1,5) = 0.0e0;
  J_hq_ind(1,6) = 0.0e0;
  J_hq_ind(1,7) = 0.0e0;
  J_hq_ind(1,8) = 0.0e0;
  J_hq_ind(1,9) = 0.0e0;
  t12 = cos(t3);
  t14 = cos(t8);
  t15 = t14 * t10;
  J_hq_ind(2,1) = -t12 * t5 - t15;
  J_hq_ind(2,2) = -t15;
  J_hq_ind(2,3) = 0.0e0;
  J_hq_ind(2,4) = 0.0e0;
  J_hq_ind(2,5) = 0.0e0;
  J_hq_ind(2,6) = 0.0e0;
  J_hq_ind(2,7) = 0.0e0;
  J_hq_ind(2,8) = 0.0e0;
  J_hq_ind(2,9) = 0.0e0;
  J_hq_ind(3,1) = 0.1e1;
  J_hq_ind(3,2) = 0.1e1;
  J_hq_ind(3,3) = 0.1e1;
  J_hq_ind(3,4) = 0.0e0;
  J_hq_ind(3,5) = 0.0e0;
  J_hq_ind(3,6) = 0.0e0;
  J_hq_ind(3,7) = 0.0e0;
  J_hq_ind(3,8) = 0.0e0;
  J_hq_ind(3,9) = 0.0e0;
  J_hq_ind(4,1) = 0.0e0;
  J_hq_ind(4,2) = 0.0e0;
  J_hq_ind(4,3) = 0.0e0;
  t16 = qj_rad(4);
  t17 = psi_rad(2);
  t18 = t16 + t17;
  t19 = sin(t18);
  t20 = l_all_id(3);
  t23 = t16 + qj_rad(5) + t17;
  t24 = sin(t23);
  t25 = l_all_id(4);
  t26 = t24 * t25;
  J_hq_ind(4,4) = t19 * t20 + t26;
  J_hq_ind(4,5) = t26;
  J_hq_ind(4,6) = 0.0e0;
  J_hq_ind(4,7) = 0.0e0;
  J_hq_ind(4,8) = 0.0e0;
  J_hq_ind(4,9) = 0.0e0;
  J_hq_ind(5,1) = 0.0e0;
  J_hq_ind(5,2) = 0.0e0;
  J_hq_ind(5,3) = 0.0e0;
  t27 = cos(t18);
  t29 = cos(t23);
  t30 = t25 * t29;
  J_hq_ind(5,4) = -t20 * t27 - t30;
  J_hq_ind(5,5) = -t30;
  J_hq_ind(5,6) = 0.0e0;
  J_hq_ind(5,7) = 0.0e0;
  J_hq_ind(5,8) = 0.0e0;
  J_hq_ind(5,9) = 0.0e0;
  J_hq_ind(6,1) = 0.0e0;
  J_hq_ind(6,2) = 0.0e0;
  J_hq_ind(6,3) = 0.0e0;
  J_hq_ind(6,4) = 0.1e1;
  J_hq_ind(6,5) = 0.1e1;
  J_hq_ind(6,6) = 0.1e1;
  J_hq_ind(6,7) = 0.0e0;
  J_hq_ind(6,8) = 0.0e0;
  J_hq_ind(6,9) = 0.0e0;
  J_hq_ind(7,1) = 0.0e0;
  J_hq_ind(7,2) = 0.0e0;
  J_hq_ind(7,3) = 0.0e0;
  J_hq_ind(7,4) = 0.0e0;
  J_hq_ind(7,5) = 0.0e0;
  J_hq_ind(7,6) = 0.0e0;
  t31 = qj_rad(7);
  t33 = psi_rad(3);
  t34 = t31 + qj_rad(8) + t33;
  t35 = sin(t34);
  t36 = l_all_id(6);
  t37 = t35 * t36;
  t38 = t31 + t33;
  t39 = sin(t38);
  t40 = l_all_id(5);
  J_hq_ind(7,7) = t40 * t39 + t37;
  J_hq_ind(7,8) = t37;
  J_hq_ind(7,9) = 0.0e0;
  J_hq_ind(8,1) = 0.0e0;
  J_hq_ind(8,2) = 0.0e0;
  J_hq_ind(8,3) = 0.0e0;
  J_hq_ind(8,4) = 0.0e0;
  J_hq_ind(8,5) = 0.0e0;
  J_hq_ind(8,6) = 0.0e0;
  t42 = cos(t38);
  t44 = cos(t34);
  t45 = t36 * t44;
  J_hq_ind(8,7) = -t40 * t42 - t45;
  J_hq_ind(8,8) = -t45;
  J_hq_ind(8,9) = 0.0e0;
  J_hq_ind(9,1) = 0.0e0;
  J_hq_ind(9,2) = 0.0e0;
  J_hq_ind(9,3) = 0.0e0;
  J_hq_ind(9,4) = 0.0e0;
  J_hq_ind(9,5) = 0.0e0;
  J_hq_ind(9,6) = 0.0e0;
  J_hq_ind(9,7) = 0.1e1;
  J_hq_ind(9,8) = 0.1e1;
  J_hq_ind(9,9) = 0.1e1;
  J_hq_ind_3RRRreturn = J_hq_ind;
