function J_hqa_3RRRreturn = J_hqa_3RRR(qj_rad, xEE, l_all, r_BasisPla_MobPla)
  J_hqaT = [0 0 0; 0 0 0; 0 0 0;];
  t1 = qj_rad(1);
  t2 = cos(t1);
  t3 = l_all(1);
  t6 = t1 + qj_rad(2);
  t7 = cos(t6);
  t8 = l_all(2);
  J_hqaT(1,1) = t2 * t3 + t7 * t8;
  t10 = sin(t1);
  t12 = sin(t6);
  J_hqaT(1,2) = t3 * t10 + t12 * t8;
  J_hqaT(1,3) = 0.1e1;
  t14 = qj_rad(4);
  t15 = pi / 0.6e1;
  t16 = t15 + t14;
  t17 = sin(t16);
  t20 = t14 + qj_rad(5) + t15;
  t21 = sin(t20);
  J_hqaT(2,1) = -t17 * t3 - t21 * t8;
  t23 = cos(t16);
  t25 = cos(t20);
  J_hqaT(2,2) = t23 * t3 + t25 * t8;
  J_hqaT(2,3) = 0.1e1;
  t27 = qj_rad(7);
  t28 = pi / 0.3e1;
  t29 = t27 + t28;
  t30 = cos(t29);
  t33 = t27 + qj_rad(8) + t28;
  t34 = cos(t33);
  J_hqaT(3,1) = -t30 * t3 - t8 * t34;
  t36 = sin(t29);
  t38 = sin(t33);
  J_hqaT(3,2) = -t3 * t36 - t38 * t8;
  J_hqaT(3,3) = 0.1e1;
  J_hqa_3RRRreturn = J_hqaT;