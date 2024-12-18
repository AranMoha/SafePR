function JacA_hredx_3RRRreturn = JacA_hredx_3RRR(qj_rad, xEE, l_all, r_BasisPla_MobPla)
  JacA_hredx = [0 0 0; 0 0 0; 0 0 0;];
  t1 = r_BasisPla_MobPla(1);
  t2 = xEE(1);
  t3 = r_BasisPla_MobPla(2);
  t4 = xEE(6);
  t5 = cos(t4);
  t7 = qj_rad(1);
  t8 = sin(t7);
  t9 = l_all(1);
  JacA_hredx(1,1) = 0.2e1 * t3 * t5 + 0.2e1 * t8 * t9 - (2 * t1) + (2 * t2);
  t12 = xEE(2);
  t13 = sin(t4);
  t15 = cos(t7);
  JacA_hredx(1,2) = 0.2e1 * t13 * t3 - 0.2e1 * t15 * t9 + (2 * t12);
  t19 = cos(-t4 + t7);
  JacA_hredx(1,3) = -0.2e1 * (t9 * t19 + t13 * (-t1 + t2) - t12 * t5) * t3;
  t27 = 2 * t2;
  t28 = pi / 0.6e1;
  t29 = t4 + t28;
  t30 = sin(t29);
  t33 = qj_rad(4);
  t34 = t33 + t28;
  t35 = cos(t34);
  JacA_hredx(2,1) = -0.2e1 * t3 * t30 + 0.2e1 * t35 * t9 + t1 + t27;
  t38 = sqrt(0.3e1);
  t39 = t1 * t38;
  t40 = 2 * t12;
  t41 = cos(t29);
  t44 = sin(t34);
  JacA_hredx(2,2) = 0.2e1 * t3 * t41 + 0.2e1 * t44 * t9 - t39 + t40;
  t50 = cos(-t4 + t33);
  t52 = t13 * t1;
  JacA_hredx(2,3) = -0.2e1 * (t12 * t30 + t2 * t41 + t50 * t9 - t52) * t3;
  t56 = pi / 0.3e1;
  t57 = t4 + t56;
  t58 = cos(t57);
  t61 = qj_rad(7);
  t62 = t61 + t56;
  t63 = sin(t62);
  JacA_hredx(3,1) = -0.2e1 * t3 * t58 - 0.2e1 * t63 * t9 + t1 + t27;
  t66 = sin(t57);
  t69 = cos(t62);
  JacA_hredx(3,2) = -0.2e1 * t3 * t66 + 0.2e1 * t69 * t9 + t39 + t40;
  t75 = cos(-t4 + t61);
  JacA_hredx(3,3) = 0.2e1 * (-t12 * t58 + t2 * t66 - t75 * t9 + t52) * t3;
  JacA_hredx_3RRRreturn = JacA_hredx;
