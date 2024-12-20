function Jac_xpq_2_3RRRreturn = Jac_xpq_2_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, l_all, r_BasisPla_MobPla, contactpoint)
  Jac_xpq_2 = [0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0;];
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
  Jac_xpq_2(1,1) = -t11 * t13 * t9 + t7;
  Jac_xpq_2(1,2) = t7;
  Jac_xpq_2(1,3) = 0.0e0;
  t15 = qjk_rad(1);
  t17 = psi_beta_rad(2);
  t18 = t15 + qjk_rad(2) + t17;
  t19 = sin(t18);
  t20 = t6 * t19;
  t21 = r_BasisPla_MobPla(2);
  t22 = xEE(6);
  t24 = t22 + psi_beta_rad(4);
  t25 = sin(t24);
  t28 = t22 + psi_beta_rad(5);
  t29 = sin(t28);
  t31 = t17 + t15;
  t32 = sin(t31);
  Jac_xpq_2(1,4) = -t13 * t32 - t25 * t21 + t21 * t29 - t20;
  t34 = t29 - t25;
  Jac_xpq_2(1,5) = t21 * t34 - t20;
  Jac_xpq_2(1,6) = t21 * t34;
  Jac_xpq_2(1,7) = 0.0e0;
  Jac_xpq_2(1,8) = 0.0e0;
  Jac_xpq_2(1,9) = 0.0e0;
  t38 = cos(t4);
  t39 = t6 * t38;
  t40 = cos(t8);
  Jac_xpq_2(2,1) = t11 * t13 * t40 - t39;
  Jac_xpq_2(2,2) = -t39;
  Jac_xpq_2(2,3) = 0.0e0;
  t43 = cos(t18);
  t44 = t6 * t43;
  t45 = cos(t24);
  t47 = cos(t28);
  t49 = cos(t31);
  Jac_xpq_2(2,4) = t13 * t49 + t21 * t45 - t21 * t47 + t44;
  t51 = t47 - t45;
  Jac_xpq_2(2,5) = -t21 * t51 + t44;
  Jac_xpq_2(2,6) = -t21 * t51;
  Jac_xpq_2(2,7) = 0.0e0;
  Jac_xpq_2(2,8) = 0.0e0;
  Jac_xpq_2(2,9) = 0.0e0;
  Jac_xpq_2(3,1) = 0.0e0;
  Jac_xpq_2(3,2) = -0.1e1;
  Jac_xpq_2(3,3) = -0.1e1;
  Jac_xpq_2(3,4) = 0.1e1;
  Jac_xpq_2(3,5) = 0.1e1;
  Jac_xpq_2(3,6) = 0.1e1;
  Jac_xpq_2(3,7) = 0.0e0;
  Jac_xpq_2(3,8) = 0.0e0;
  Jac_xpq_2(3,9) = 0.0e0;
  Jac_xpq_2_3RRRreturn = Jac_xpq_2;
