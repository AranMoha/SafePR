function JacB_hredqa_3RRRreturn = JacB_hredqa_3RRR(qj_rad, xEE, l_all, r_BasisPla_MobPla)
  JacB_hredqa = [0 0 0; 0 0 0; 0 0 0;];
  t1 = l_all(1);
  t2 = qj_rad(1);
  t3 = cos(t2);
  t4 = xEE(1);
  t6 = sin(t2);
  t7 = xEE(2);
  t9 = r_BasisPla_MobPla(1);
  t11 = r_BasisPla_MobPla(2);
  t12 = xEE(6);
  t14 = cos(-t12 + t2);
  JacB_hredqa(1,1) = 0.2e1 * (t11 * t14 + t3 * t4 - t3 * t9 + t6 * t7) * t1;
  JacB_hredqa(1,2) = 0.0e0;
  JacB_hredqa(1,3) = 0.0e0;
  JacB_hredqa(2,1) = 0.0e0;
  t18 = qj_rad(4);
  t20 = cos(-t12 + t18);
  t23 = t18 + pi / 0.6e1;
  t24 = sin(t23);
  t26 = cos(t23);
  t28 = cos(t18);
  JacB_hredqa(2,2) = 0.2e1 * (t11 * t20 - t24 * t4 + t26 * t7 - t28 * t9) * t1;
  JacB_hredqa(2,3) = 0.0e0;
  JacB_hredqa(3,1) = 0.0e0;
  JacB_hredqa(3,2) = 0.0e0;
  t32 = qj_rad(7);
  t33 = cos(t32);
  t36 = cos(-t12 + t32);
  t39 = t32 + pi / 0.3e1;
  t40 = cos(t39);
  t42 = sin(t39);
  JacB_hredqa(3,3) = -0.2e1 * (-t11 * t36 + t33 * t9 + t4 * t40 + t42 * t7) * t1;
  JacB_hredqa_3RRRreturn = JacB_hredqa;
