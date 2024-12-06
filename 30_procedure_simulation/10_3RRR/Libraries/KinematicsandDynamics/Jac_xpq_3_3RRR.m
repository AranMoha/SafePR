function Jac_xpq_3_3RRRreturn = Jac_xpq_3_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, l_all, r_BasisPla_MobPla, contactpoint)
  Jac_xpq_3 = [0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0;];
  t1 = psi_beta_rad(1);
  t2 = qjj_rad(1);
  t4 = t1 + t2 + qjj_rad(2);
  t5 = sin(t4);
  t6 = l_all(2);
  t7 = t6 * t5;
  t8 = t1 + t2;
  t9 = sin(t8);
  t11 = -1 + contactpoint(1);
  t13 = l_all(1);
  Jac_xpq_3(1,1) = -t11 * t13 * t9 + t7;
  Jac_xpq_3(1,2) = t7;
  Jac_xpq_3(1,3) = 0.0e0;
  Jac_xpq_3(1,4) = 0.0e0;
  Jac_xpq_3(1,5) = 0.0e0;
  Jac_xpq_3(1,6) = 0.0e0;
  t15 = psi_beta_rad(3);
  t16 = qji_rad(1);
  t18 = t15 + t16 + qji_rad(2);
  t19 = sin(t18);
  t20 = t6 * t19;
  t21 = r_BasisPla_MobPla(2);
  t22 = xEE(6);
  t24 = t22 + psi_beta_rad(6);
  t25 = sin(t24);
  t28 = t22 + psi_beta_rad(4);
  t29 = sin(t28);
  t31 = t16 + t15;
  t32 = sin(t31);
  Jac_xpq_3(1,7) = -t13 * t32 + t25 * t21 - t21 * t29 - t20;
  t34 = t29 - t25;
  Jac_xpq_3(1,8) = -t21 * t34 - t20;
  Jac_xpq_3(1,9) = -t21 * t34;
  t37 = cos(t4);
  t38 = t6 * t37;
  t39 = cos(t8);
  Jac_xpq_3(2,1) = t11 * t13 * t39 - t38;
  Jac_xpq_3(2,2) = -t38;
  Jac_xpq_3(2,3) = 0.0e0;
  Jac_xpq_3(2,4) = 0.0e0;
  Jac_xpq_3(2,5) = 0.0e0;
  Jac_xpq_3(2,6) = 0.0e0;
  t42 = cos(t18);
  t43 = t6 * t42;
  t44 = cos(t24);
  t46 = cos(t28);
  t48 = cos(t31);
  Jac_xpq_3(2,7) = t13 * t48 - t21 * t44 + t21 * t46 + t43;
  t51 = (t46 - t44) * t21;
  Jac_xpq_3(2,8) = t43 + t51;
  Jac_xpq_3(2,9) = t51;
  Jac_xpq_3(3,1) = 0.0e0;
  Jac_xpq_3(3,2) = -0.1e1;
  Jac_xpq_3(3,3) = -0.1e1;
  Jac_xpq_3(3,4) = 0.0e0;
  Jac_xpq_3(3,5) = 0.0e0;
  Jac_xpq_3(3,6) = 0.0e0;
  Jac_xpq_3(3,7) = 0.1e1;
  Jac_xpq_3(3,8) = 0.1e1;
  Jac_xpq_3(3,9) = 0.1e1;
  Jac_xpq_3_3RRRreturn = Jac_xpq_3;