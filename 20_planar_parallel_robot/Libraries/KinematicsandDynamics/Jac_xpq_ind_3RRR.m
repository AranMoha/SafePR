function Jac_xpq_ind_3RRRreturn = Jac_xpq_ind_3RRR(qjj_rad, qjk_rad, qji_rad, xEE, psi_beta_rad, lj, lk, li, r_0G1_ind, r_PEP_ind, contactpoint)
  Jac_xpq_ind = [0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0;];
  t1 = psi_beta_rad(1);
  t2 = qjj_rad(1);
  t4 = t1 + t2 + qjj_rad(2);
  t5 = sin(t4);
  t6 = lj(2);
  t8 = 0.2e1 / 0.3e1 * t6 * t5;
  t12 = (contactpoint(1) - 0.2e1 / 0.3e1) * lj(1);
  t13 = t1 + t2;
  t14 = sin(t13);
  Jac_xpq_ind(1,1) = -t12 * t14 + t8;
  Jac_xpq_ind(1,2) = t8;
  Jac_xpq_ind(1,3) = 0.0e0;
  t16 = psi_beta_rad(2);
  t17 = qjk_rad(1);
  t19 = t16 + t17 + qjk_rad(2);
  t20 = sin(t19);
  t21 = lk(2);
  t22 = t21 * t20;
  t23 = r_PEP_ind(1);
  t24 = xEE(6);
  t26 = t24 + psi_beta_rad(4);
  t27 = sin(t26);
  t28 = t27 * t23;
  t30 = t24 + psi_beta_rad(5);
  t31 = sin(t30);
  t32 = r_PEP_ind(2);
  t33 = t32 * t31;
  t34 = t16 + t17;
  t35 = sin(t34);
  t36 = lk(1);
  Jac_xpq_ind(1,4) = -t36 * t35 / 0.3e1 - t22 / 0.3e1 - t28 / 0.3e1 + t33 / 0.3e1;
  Jac_xpq_ind(1,5) = -t22 / 0.3e1 - t28 / 0.3e1 + t33 / 0.3e1;
  Jac_xpq_ind(1,6) = -t28 / 0.3e1 + t33 / 0.3e1;
  t41 = psi_beta_rad(3);
  t42 = qji_rad(1);
  t44 = t41 + t42 + qji_rad(2);
  t45 = sin(t44);
  t46 = li(2);
  t47 = t46 * t45;
  t49 = t24 + psi_beta_rad(6);
  t50 = sin(t49);
  t51 = r_PEP_ind(3);
  t52 = t51 * t50;
  t53 = t41 + t42;
  t54 = sin(t53);
  t55 = li(1);
  Jac_xpq_ind(1,7) = -t55 * t54 / 0.3e1 - t28 / 0.3e1 - t47 / 0.3e1 + t52 / 0.3e1;
  Jac_xpq_ind(1,8) = -t47 / 0.3e1 - t28 / 0.3e1 + t52 / 0.3e1;
  Jac_xpq_ind(1,9) = -t28 / 0.3e1 + t52 / 0.3e1;
  t60 = cos(t4);
  t62 = 0.2e1 / 0.3e1 * t6 * t60;
  t63 = cos(t13);
  Jac_xpq_ind(2,1) = t12 * t63 - t62;
  Jac_xpq_ind(2,2) = -t62;
  Jac_xpq_ind(2,3) = 0.0e0;
  t65 = cos(t19);
  t66 = t21 * t65;
  t67 = cos(t26);
  t68 = t67 * t23;
  t69 = cos(t30);
  t70 = t32 * t69;
  t71 = cos(t34);
  Jac_xpq_ind(2,4) = t36 * t71 / 0.3e1 + t66 / 0.3e1 + t68 / 0.3e1 - t70 / 0.3e1;
  Jac_xpq_ind(2,5) = t66 / 0.3e1 + t68 / 0.3e1 - t70 / 0.3e1;
  Jac_xpq_ind(2,6) = t68 / 0.3e1 - t70 / 0.3e1;
  t76 = cos(t44);
  t77 = t46 * t76;
  t78 = cos(t49);
  t79 = t51 * t78;
  t80 = cos(t53);
  Jac_xpq_ind(2,7) = t55 * t80 / 0.3e1 + t68 / 0.3e1 + t77 / 0.3e1 - t79 / 0.3e1;
  Jac_xpq_ind(2,8) = t77 / 0.3e1 + t68 / 0.3e1 - t79 / 0.3e1;
  Jac_xpq_ind(2,9) = t68 / 0.3e1 - t79 / 0.3e1;
  Jac_xpq_ind(3,1) = 0.1e1 / 0.3e1;
  Jac_xpq_ind(3,2) = -0.2e1 / 0.3e1;
  Jac_xpq_ind(3,3) = -0.2e1 / 0.3e1;
  Jac_xpq_ind(3,4) = 0.1e1 / 0.3e1;
  Jac_xpq_ind(3,5) = 0.1e1 / 0.3e1;
  Jac_xpq_ind(3,6) = 0.1e1 / 0.3e1;
  Jac_xpq_ind(3,7) = 0.1e1 / 0.3e1;
  Jac_xpq_ind(3,8) = 0.1e1 / 0.3e1;
  Jac_xpq_ind(3,9) = 0.1e1 / 0.3e1;
  Jac_xpq_ind_3RRRreturn = Jac_xpq_ind;
