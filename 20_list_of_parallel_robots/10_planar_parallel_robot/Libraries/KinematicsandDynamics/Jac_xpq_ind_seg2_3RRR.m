function Jac_xpq_ind_seg2_3RRRreturn = Jac_xpq_ind_seg2_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint)
  Jac_xpq_ind_seg2 = [0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0;];
  t1 = contactpoint(1);
  t3 = -3 * t1 + 2;
  t4 = lj(2);
  t6 = psi_beta_rad(1);
  t7 = qjj_rad(1);
  t9 = t6 + t7 + qjj_rad(2);
  t10 = sin(t9);
  t12 = t6 + t7;
  t13 = sin(t12);
  t14 = lj(1);
  Jac_xpq_ind_seg2(1,1) = t10 * t4 * t3 / 0.3e1 - t13 * t14 / 0.3e1;
  t18 = -t3 * t4;
  Jac_xpq_ind_seg2(1,2) = -t10 * t18 / 0.3e1;
  Jac_xpq_ind_seg2(1,3) = 0.0e0;
  t21 = qjk_rad(1);
  t23 = psi_beta_rad(2);
  t24 = t21 + qjk_rad(2) + t23;
  t25 = sin(t24);
  t26 = lk(2);
  t27 = t26 * t25;
  t28 = r_PEP_ind(1);
  t30 = xEE(6);
  t31 = psi_beta_rad(4) + t30;
  t32 = sin(t31);
  t33 = t32 * t28;
  t35 = t30 + psi_beta_rad(5);
  t36 = sin(t35);
  t37 = r_PEP_ind(2);
  t38 = t37 * t36;
  t39 = t21 + t23;
  t40 = sin(t39);
  t41 = lk(1);
  Jac_xpq_ind_seg2(1,4) = -t41 * t40 / 0.3e1 - t27 / 0.3e1 - t33 / 0.3e1 + t38 / 0.3e1;
  Jac_xpq_ind_seg2(1,5) = -t27 / 0.3e1 - t33 / 0.3e1 + t38 / 0.3e1;
  Jac_xpq_ind_seg2(1,6) = -t33 / 0.3e1 + t38 / 0.3e1;
  t46 = psi_beta_rad(3);
  t47 = qji_rad(1);
  t49 = t46 + t47 + qji_rad(2);
  t50 = sin(t49);
  t51 = li(2);
  t52 = t51 * t50;
  t54 = t30 + psi_beta_rad(6);
  t55 = sin(t54);
  t56 = r_PEP_ind(3);
  t57 = t56 * t55;
  t58 = t46 + t47;
  t59 = sin(t58);
  t60 = li(1);
  Jac_xpq_ind_seg2(1,7) = -t60 * t59 / 0.3e1 - t33 / 0.3e1 - t52 / 0.3e1 + t57 / 0.3e1;
  Jac_xpq_ind_seg2(1,8) = -t52 / 0.3e1 - t33 / 0.3e1 + t57 / 0.3e1;
  Jac_xpq_ind_seg2(1,9) = -t33 / 0.3e1 + t57 / 0.3e1;
  t65 = cos(t9);
  t67 = cos(t12);
  Jac_xpq_ind_seg2(2,1) = t14 * t67 / 0.3e1 + t65 * t18 / 0.3e1;
  Jac_xpq_ind_seg2(2,2) = t65 * (-0.2e1 / 0.3e1 + t1) * t4;
  Jac_xpq_ind_seg2(2,3) = 0.0e0;
  t72 = cos(t24);
  t73 = t26 * t72;
  t74 = cos(t31);
  t75 = t74 * t28;
  t76 = cos(t35);
  t77 = t37 * t76;
  t78 = cos(t39);
  Jac_xpq_ind_seg2(2,4) = t41 * t78 / 0.3e1 + t73 / 0.3e1 + t75 / 0.3e1 - t77 / 0.3e1;
  Jac_xpq_ind_seg2(2,5) = t73 / 0.3e1 + t75 / 0.3e1 - t77 / 0.3e1;
  Jac_xpq_ind_seg2(2,6) = t75 / 0.3e1 - t77 / 0.3e1;
  t83 = cos(t49);
  t84 = t51 * t83;
  t85 = cos(t54);
  t86 = t56 * t85;
  t87 = cos(t58);
  Jac_xpq_ind_seg2(2,7) = t60 * t87 / 0.3e1 + t75 / 0.3e1 + t84 / 0.3e1 - t86 / 0.3e1;
  Jac_xpq_ind_seg2(2,8) = t84 / 0.3e1 + t75 / 0.3e1 - t86 / 0.3e1;
  Jac_xpq_ind_seg2(2,9) = t75 / 0.3e1 - t86 / 0.3e1;
  Jac_xpq_ind_seg2(3,1) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,2) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,3) = -0.2e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,4) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,5) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,6) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,7) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,8) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2(3,9) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_seg2_3RRRreturn = Jac_xpq_ind_seg2;
