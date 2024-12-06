function y_aUKFreturn = y_aUKF(xE, dxE, ddxE, Rot_SE, p_SE)
  a_imu_T = [0 0 0;];
  t1 = Rot_SE(1,2);
  t2 = p_SE(2);
  t4 = 0.1e1 * t2 * t1;
  t5 = Rot_SE(1,3);
  t6 = p_SE(3);
  t8 = 0.1e1 * t6 * t5;
  t10 = dxE(4);
  t11 = t10 ^ 2;
  t13 = xE(6);
  t14 = cos(t13);
  t15 = t14 ^ 2;
  t17 = p_SE(1);
  t18 = t17 * t1;
  t20 = Rot_SE(1,1);
  t21 = t2 * t20;
  t25 = sin(t13);
  t26 = t14 * t25;
  t29 = 0.1e1 * t17 * t20;
  t32 = t25 ^ 2;
  t35 = xE(5);
  t36 = cos(t35);
  t37 = t36 ^ 2;
  t39 = dxE(5);
  t40 = t39 * t10;
  t41 = t21 + t18;
  t44 = t39 * t20;
  t47 = t39 * t1;
  t57 = sin(t35);
  t59 = ddxE(4);
  t60 = t59 * t1;
  t63 = t59 * t5;
  t65 = ddxE(1);
  t67 = t10 * t5;
  t68 = dxE(6);
  t69 = t17 * t68;
  t74 = t17 * t47;
  t77 = 0.1e1 * t2 * t44;
  t88 = t59 * t20;
  t94 = t2 * t68;
  t99 = ddxE(3);
  t100 = t99 + 0.981e1;
  t102 = xE(4);
  t103 = cos(t102);
  t105 = sin(t102);
  t107 = ddxE(2);
  t114 = t39 ^ 2;
  t120 = 0.1e1 * t6 * t114 * t5;
  t126 = -0.1e1 * t99 - 0.981e1;
  t132 = t6 * t39;
  t139 = t100 * t1;
  t141 = t39 * t5;
  t144 = ddxE(5);
  t147 = t144 * t5;
  t180 = t57 ^ 2;
  t196 = ddxE(6);
  t199 = t68 ^ 2;
  t202 = -0.1e1 * t2 * t196 - 0.1e1 * t17 * t199;
  t207 = t17 * t196 - 0.1e1 * t2 * t199;
  a_imu_T(1,1) = t37 * (t15 * t11 * (-t4 - t8) + t26 * t11 * (-0.1e1 * t18 - 0.1e1 * t21) + t32 * t11 * (-t29 - t8)) + t36 * (t15 * t41 * t40 + t14 * (t25 * t10 * (0.2e1 * t17 * t44 - 0.2e1 * t2 * t47) + t57 * (t17 * t5 + t20 * t6) * t11 - 0.1e1 * t6 * t60 + t2 * t63 + t65 * t20 + 0.2e1 * t69 * t67) + t32 * t10 * (-0.1e1 * t74 - t77) + t25 * (t57 * t11 * (-0.1e1 * t6 * t1 - 0.1e1 * t2 * t5) - 0.1e1 * t6 * t88 + t17 * t63 - 0.1e1 * t65 * t1 - 0.2e1 * t94 * t67) + t103 * t5 * t100 - 0.1e1 * t107 * t105 * t5 + t10 * (-t77 + t74)) + t15 * (-0.1e1 * t17 * t114 * t20 - t120) + t14 * (t25 * t41 * t114 + t57 * (t103 * t20 * t126 + t107 * t105 * t20 + 0.2e1 * t132 * t10 * t1) + t107 * t103 * t1 + t105 * t139 + 0.2e1 * t94 * t141 + t6 * t144 * t20 - 0.1e1 * t17 * t147) + t32 * (-0.1e1 * t2 * t114 * t1 - t120) + t25 * (t57 * (t103 * t139 - 0.1e1 * t107 * t105 * t1 + 0.2e1 * t132 * t10 * t20) + t107 * t103 * t20 + t105 * t20 * t100 + 0.2e1 * t69 * t141 - 0.1e1 * t6 * t144 * t1 + t2 * t147) + t180 * t11 * (-t29 - t4) + t57 * (t10 * (-0.2e1 * t17 * t68 * t20 - 0.2e1 * t2 * t68 * t1) + t65 * t5 - 0.1e1 * t2 * t88 + t17 * t60) + t20 * t202 + t1 * t207;
  t209 = Rot_SE(2,2);
  t211 = 0.1e1 * t2 * t209;
  t212 = Rot_SE(2,3);
  t214 = 0.1e1 * t212 * t6;
  t218 = t17 * t209;
  t220 = Rot_SE(2,1);
  t221 = t2 * t220;
  t227 = 0.1e1 * t17 * t220;
  t233 = t221 + t218;
  t250 = t59 * t209;
  t253 = t59 * t212;
  t256 = t10 * t212;
  t262 = t17 * t39 * t209;
  t266 = 0.1e1 * t2 * t39 * t220;
  t277 = t59 * t220;
  t301 = 0.1e1 * t6 * t114 * t212;
  t317 = t209 * t100;
  t319 = t39 * t212;
  t324 = t144 * t212;
  a_imu_T(1,2) = t37 * (t15 * t11 * (-t211 - t214) + t26 * t11 * (-0.1e1 * t218 - 0.1e1 * t221) + t32 * t11 * (-t227 - t214)) + t36 * (t15 * t233 * t40 + t14 * (t25 * t10 * (0.2e1 * t220 * t39 * t17 - 0.2e1 * t209 * t39 * t2) + t57 * (t17 * t212 + t220 * t6) * t11 - 0.1e1 * t6 * t250 + t2 * t253 + t65 * t220 + 0.2e1 * t69 * t256) + t32 * t10 * (-0.1e1 * t262 - t266) + t25 * (t57 * t11 * (-0.1e1 * t209 * t6 - 0.1e1 * t212 * t2) - 0.1e1 * t6 * t277 + t17 * t253 - 0.1e1 * t65 * t209 - 0.2e1 * t94 * t256) + t103 * t212 * t100 - 0.1e1 * t107 * t105 * t212 + t10 * (-t266 + t262)) + t15 * (-0.1e1 * t17 * t114 * t220 - t301) + t14 * (t25 * t233 * t114 + t57 * (t103 * t220 * t126 + t107 * t105 * t220 + 0.2e1 * t132 * t10 * t209) + t107 * t103 * t209 + t105 * t317 + 0.2e1 * t94 * t319 + t6 * t144 * t220 - 0.1e1 * t17 * t324) + t32 * (-0.1e1 * t2 * t114 * t209 - t301) + t25 * (t57 * (t103 * t317 - 0.1e1 * t107 * t105 * t209 + 0.2e1 * t132 * t10 * t220) + t107 * t103 * t220 + t105 * t220 * t100 + 0.2e1 * t69 * t319 - 0.1e1 * t6 * t144 * t209 + t2 * t324) + t180 * t11 * (-t227 - t211) + t57 * (t10 * (-0.2e1 * t17 * t68 * t220 - 0.2e1 * t2 * t68 * t209) + t65 * t212 - 0.1e1 * t2 * t277 + t17 * t250) + t220 * t202 + t207 * t209;
  t374 = Rot_SE(3,2);
  t376 = 0.1e1 * t2 * t374;
  t377 = Rot_SE(3,3);
  t379 = 0.1e1 * t6 * t377;
  t383 = t17 * t374;
  t385 = Rot_SE(3,1);
  t386 = t2 * t385;
  t392 = 0.1e1 * t17 * t385;
  t398 = t386 + t383;
  t401 = t39 * t385;
  t404 = t39 * t374;
  t415 = t59 * t374;
  t418 = t59 * t377;
  t421 = t10 * t377;
  t426 = t17 * t404;
  t429 = 0.1e1 * t2 * t401;
  t440 = t59 * t385;
  t464 = 0.1e1 * t6 * t114 * t377;
  t480 = t374 * t100;
  t482 = t39 * t377;
  t487 = t144 * t377;
  a_imu_T(1,3) = t37 * (t15 * t11 * (-t376 - t379) + t26 * t11 * (-0.1e1 * t383 - 0.1e1 * t386) + t32 * t11 * (-t392 - t379)) + t36 * (t15 * t398 * t40 + t14 * (t25 * t10 * (0.2e1 * t17 * t401 - 0.2e1 * t2 * t404) + t57 * (t17 * t377 + t385 * t6) * t11 - 0.1e1 * t6 * t415 + t2 * t418 + t65 * t385 + 0.2e1 * t69 * t421) + t32 * t10 * (-0.1e1 * t426 - t429) + t25 * (t57 * t11 * (-0.1e1 * t6 * t374 - 0.1e1 * t2 * t377) - 0.1e1 * t6 * t440 + t17 * t418 - 0.1e1 * t65 * t374 - 0.2e1 * t94 * t421) + t103 * t377 * t100 - 0.1e1 * t107 * t105 * t377 + t10 * (-t429 + t426)) + t15 * (-0.1e1 * t17 * t114 * t385 - t464) + t14 * (t25 * t398 * t114 + t57 * (t103 * t385 * t126 + t107 * t105 * t385 + 0.2e1 * t132 * t10 * t374) + t107 * t103 * t374 + t105 * t480 + 0.2e1 * t94 * t482 + t6 * t144 * t385 - 0.1e1 * t17 * t487) + t32 * (-0.1e1 * t2 * t114 * t374 - t464) + t25 * (t57 * (t103 * t480 - 0.1e1 * t107 * t105 * t374 + 0.2e1 * t132 * t10 * t385) + t107 * t103 * t385 + t105 * t385 * t100 + 0.2e1 * t69 * t482 - 0.1e1 * t6 * t144 * t374 + t2 * t487) + t180 * t11 * (-t392 - t376) + t57 * (t10 * (-0.2e1 * t17 * t68 * t385 - 0.2e1 * t2 * t68 * t374) + t65 * t377 - 0.1e1 * t2 * t440 + t17 * t415) + t385 * t202 + t374 * t207;
  y_aUKFreturn = a_imu_T;