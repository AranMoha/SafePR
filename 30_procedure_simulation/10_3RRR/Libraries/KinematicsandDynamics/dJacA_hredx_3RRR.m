function dJacA_hredx_3RRRreturn = dJacA_hredx_3RRR(qj_rad, dqj_rad, xEE, dxEE, l_all, r_BasisPla_MobPla)
  dJacA_hredx = [0 0 0; 0 0 0; 0 0 0;];
  t1 = qj_rad(1);
  t2 = cos(t1);
  t3 = l_all(1);
  t5 = dqj_rad(1);
  t7 = dxEE(1);
  t8 = r_BasisPla_MobPla(2);
  t9 = xEE(6);
  t10 = sin(t9);
  t11 = t10 * t8;
  t12 = dxEE(6);
  dJacA_hredx(1,1) = 0.2e1 * t2 * t3 * t5 - 0.2e1 * t11 * t12 + (2 * t7);
  t15 = sin(t1);
  t18 = dxEE(2);
  t19 = cos(t9);
  t20 = t19 * t8;
  dJacA_hredx(1,2) = 0.2e1 * t15 * t3 * t5 + 0.2e1 * t12 * t20 + (2 * t18);
  t24 = sin(-t9 + t1);
  t25 = t3 * t24;
  t30 = xEE(1);
  t31 = r_BasisPla_MobPla(1);
  t34 = xEE(2);
  dJacA_hredx(1,3) = 0.2e1 * t5 * t8 * t25 - 0.2e1 * t7 * t11 + 0.2e1 * t18 * t20 - 0.2e1 * t12 * (t25 + t19 * (t30 - t31) + t34 * t10) * t8;
  t40 = qj_rad(4);
  t41 = pi / 0.6e1;
  t42 = t40 + t41;
  t43 = sin(t42);
  t45 = dqj_rad(4);
  t47 = t9 + t41;
  t48 = cos(t47);
  t49 = t48 * t8;
  dJacA_hredx(2,1) = -0.2e1 * t3 * t43 * t45 - 0.2e1 * t12 * t49 + (2 * t7);
  t52 = cos(t42);
  t55 = sin(t47);
  t56 = t55 * t8;
  dJacA_hredx(2,2) = 0.2e1 * t3 * t45 * t52 - 0.2e1 * t12 * t56 + (2 * t18);
  t60 = sin(-t9 + t40);
  t61 = t3 * t60;
  t68 = t31 * t19;
  dJacA_hredx(2,3) = 0.2e1 * t45 * t8 * t61 - 0.2e1 * t7 * t49 - 0.2e1 * t18 * t56 - 0.2e1 * t12 * (-t30 * t55 + t34 * t48 + t61 - t68) * t8;
  t73 = qj_rad(7);
  t74 = pi / 0.3e1;
  t75 = t73 + t74;
  t76 = cos(t75);
  t78 = dqj_rad(7);
  t80 = t9 + t74;
  t81 = sin(t80);
  t82 = t81 * t8;
  dJacA_hredx(3,1) = -0.2e1 * t3 * t76 * t78 + 0.2e1 * t12 * t82 + (2 * t7);
  t85 = sin(t75);
  t88 = cos(t80);
  t89 = t88 * t8;
  dJacA_hredx(3,2) = -0.2e1 * t3 * t78 * t85 - 0.2e1 * t12 * t89 + (2 * t18);
  t93 = sin(-t9 + t73);
  t94 = t3 * t93;
  dJacA_hredx(3,3) = 0.2e1 * t78 * t8 * t94 + 0.2e1 * t7 * t82 - 0.2e1 * t18 * t89 + 0.2e1 * t12 * (t30 * t88 + t34 * t81 + t68 - t94) * t8;
  dJacA_hredx_3RRRreturn = dJacA_hredx;