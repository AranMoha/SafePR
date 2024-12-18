function J_aEKFreturn = J_aEKF_v2(xE, dxE, ddxE, Rot_SE, p_SE, g)
  J_a_imu = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
  J_a_imu(1,1) = 0;
  J_a_imu(1,2) = 0;
  J_a_imu(1,3) = 0;
  t1 = Rot_SE(1,2);
  t2 = ddxE(3);
  t3 = t2 + g;
  t5 = xE(5);
  t6 = cos(t5);
  t8 = sin(t5);
  t9 = ddxE(1);
  t10 = t9 * t8;
  t12 = ddxE(2);
  t13 = Rot_SE(1,3);
  t16 = xE(6);
  t17 = cos(t16);
  t19 = sin(t16);
  t20 = t12 * t8;
  t22 = t13 * t9;
  t26 = xE(4);
  t27 = cos(t26);
  t36 = t1 * t9;
  t40 = sin(t26);
  J_a_imu(1,4) = (t27 * (-t6 * t3 * t1 + t17 * (t10 * t1 + t12 * t13) - (t1 * t20 - t22) * t19) - t40 * (t6 * t3 * t13 + t17 * (t1 * t12 - t10 * t13) + (t13 * t20 + t36) * t19));
  t42 = Rot_SE(1,1);
  t43 = p_SE(3);
  t44 = t43 * t42;
  t45 = p_SE(1);
  t46 = t45 * t13;
  t47 = t44 + t46;
  t49 = t43 * t1;
  t50 = p_SE(2);
  t51 = t50 * t13;
  t52 = t49 + t51;
  t54 = t17 * t47 - t19 * t52;
  t55 = dxE(4);
  t56 = t55 ^ 2;
  t58 = t8 ^ 2;
  t60 = t45 * t42;
  t61 = t1 * t50;
  t62 = t60 - t61;
  t63 = t17 ^ 2;
  t65 = t50 * t42;
  t66 = t45 * t1;
  t67 = t65 + t66;
  t69 = t17 * t67 * t19;
  t70 = t13 * t43;
  t75 = dxE(5);
  t76 = t75 * t55;
  t83 = dxE(6);
  t84 = t45 * t83;
  t85 = t55 * t13;
  t87 = 0.2e1 * t85 * t84;
  t88 = ddxE(4);
  t89 = t88 * t51;
  t90 = t88 * t49;
  t91 = t9 * t42;
  t94 = t19 ^ 2;
  t95 = t55 * t94;
  t96 = t75 * t95;
  t99 = t50 * t83;
  t101 = 0.2e1 * t85 * t99;
  t102 = t43 * t88;
  t103 = t102 + t12;
  t105 = t88 * t46;
  t108 = t40 * t1;
  t109 = t27 * t13;
  t110 = t108 - t109;
  t114 = t6 * t56;
  t116 = t27 * t22;
  t117 = t55 * t43;
  t118 = t75 * t117;
  t119 = t40 * t9;
  t121 = t118 + t119 / 0.2e1;
  t130 = -t108 * t12 + t109 * t12 + 0.2e1 * t44 * t76;
  t132 = t60 + t61;
  t133 = t132 * t83;
  t137 = t50 * t88;
  t138 = -t137 + g + t2;
  J_a_imu(1,5) = (-t58 * t56 * t54 + t8 * (-0.2e1 * t6 * t56 * (t62 * t63 + t61 - t69 - t70) - 0.2e1 * t63 * t76 * t66 + t17 * (-0.2e1 * t19 * t62 * t76 - t87 - t89 + t90 - t91) + 0.2e1 * t96 * t65 + t19 * (t103 * t42 + t101 - t105) + t3 * t110) + t6 * (t54 * t114 + t17 * (0.2e1 * t1 * t121 - t116) + t19 * t130 - 0.2e1 * t55 * t133 + t88 * t66 + t138 * t42));
  t143 = t6 ^ 2;
  t145 = -t62;
  t149 = t75 ^ 2;
  t151 = -t143 * t56 * t67 - 0.2e1 * t145 * t6 * t76 + t149 * t67;
  t165 = -t103;
  t172 = ddxE(5);
  t177 = t172 * t50 + 0.2e1 * t75 * t84;
  t187 = 0.2e1 * t118 + t119;
  t191 = t27 * t1;
  t193 = t40 * t13;
  t195 = t83 * t75;
  t198 = t44 - t46;
  J_a_imu(1,6) = (t63 * t151 + t17 * (t19 * (0.2e1 * t143 * t145 * t56 - 0.4e1 * t6 * t67 * t76 - 0.2e1 * t145 * t149) + t6 * (-t52 * t56 * t8 + t165 * t42 - t101 + t105) + t8 * t130 + t27 * t36 + t40 * t22 - t172 * t49 + t177 * t13) - t19 * (t19 * t151 + t6 * (t47 * t56 * t8 + t87 + t89 - t90 + t91) + t8 * (t1 * t187 - t116) + t12 * t191 + t12 * t193 + 0.2e1 * t195 * t51 + t198 * t172));
  J_a_imu(1,7) = 0;
  J_a_imu(1,8) = 0;
  J_a_imu(1,9) = 0;
  t207 = t63 * t75;
  t214 = t13 * t84;
  t220 = t75 * t19;
  t230 = t75 * t43;
  t231 = t8 * t1;
  t235 = t55 * t58;
  t242 = t45 * t55;
  J_a_imu(1,10) = (-0.2e1 * t143 * t55 * (t145 * t63 + t69 + t70) + t6 * (0.2e1 * t207 * t66 + t17 * (-0.2e1 * t145 * t19 * t75 + 0.2e1 * t47 * t55 * t8 + 0.2e1 * t214) - 0.2e1 * t19 * (t8 * t52 * t55 + (t13 * t83 + t220 * t42) * t50)) + 0.2e1 * t17 * t231 * t230 - 0.2e1 * t61 * t235 + t8 * (0.2e1 * t220 * t44 - 0.2e1 * t133) - 0.2e1 * t42 * t242);
  J_a_imu(1,11) = (0.2e1 * t63 * (t1 * t55 * t6 - t42 * t75) * t45 + t17 * (t19 * (-0.2e1 * t145 * t55 * t6 + 0.2e1 * t67 * t75) + 0.2e1 * t231 * t117 + 0.2e1 * t13 * t99) - 0.2e1 * t94 * (t42 * t55 * t6 + t1 * t75) * t50 + t19 * (0.2e1 * t44 * t55 * t8 + 0.2e1 * t214) - 0.2e1 * t13 * t230);
  t281 = t6 * (t17 * t45 - t19 * t50);
  t283 = t75 * t50;
  J_a_imu(1,12) = (0.2e1 * t13 * t17 * t283 - 0.2e1 * t132 * t55 * t8 + 0.2e1 * t220 * t46 + 0.2e1 * t281 * t85 - 0.2e1 * t133);
  t290 = t8 * t40;
  t295 = -t13 * t27 * t8 + t1 * t290 + t42 * t6;
  t297 = t191 + t193;
  J_a_imu(1,13) = (t17 * t295 + t19 * t297);
  J_a_imu(1,14) = (t17 * t297 - t19 * t295);
  J_a_imu(1,15) = (-t110 * t6 + t42 * t8);
  t305 = -t49 + t51;
  t307 = -t198;
  t311 = -t65 + t66;
  J_a_imu(1,16) = (t6 * (t17 * t305 + t19 * t307) + t8 * t311);
  J_a_imu(1,17) = (-t17 * t307 + t19 * t305);
  J_a_imu(1,18) = t311;
  J_a_imu(1,19) = J_a_imu(1,15);
  J_a_imu(2,1) = 0;
  J_a_imu(2,2) = 0;
  J_a_imu(2,3) = 0;
  t315 = Rot_SE(2,2);
  t319 = Rot_SE(2,3);
  J_a_imu(2,4) = (t27 * (-t6 * t3 * t315 + t17 * (t10 * t315 + t12 * t319) - (t20 * t315 - t319 * t9) * t19) - t40 * (t6 * t3 * t319 + t17 * (-t10 * t319 + t12 * t315) + (t20 * t319 + t315 * t9) * t19));
  t341 = Rot_SE(2,1);
  t342 = t43 * t341;
  t343 = t45 * t319;
  t344 = t342 + t343;
  t346 = t43 * t315;
  t347 = t50 * t319;
  t348 = t346 + t347;
  t350 = t17 * t344 - t19 * t348;
  t353 = t45 * t341;
  t354 = t315 * t50;
  t355 = t353 - t354;
  t357 = t50 * t341;
  t358 = t45 * t315;
  t359 = t357 + t358;
  t361 = t17 * t359 * t19;
  t362 = t319 * t43;
  t367 = t55 * t63;
  t368 = t45 * t75;
  t375 = t83 * t55;
  t377 = 0.2e1 * t343 * t375;
  t378 = t319 * t137;
  t379 = t315 * t102;
  t380 = t341 * t9;
  t387 = 0.2e1 * t347 * t375;
  t389 = t45 * t88;
  t390 = t319 * t389;
  t395 = -t27 * t319 + t315 * t40;
  t400 = t9 * t27;
  t401 = t319 * t400;
  t408 = t12 * t40;
  t410 = t12 * t27;
  t412 = -t315 * t408 + t319 * t410 + 0.2e1 * t342 * t76;
  t414 = t353 + t354;
  t415 = t414 * t83;
  J_a_imu(2,5) = (-t58 * t56 * t350 + t8 * (-0.2e1 * t6 * t56 * (t355 * t63 + t354 - t361 - t362) - 0.2e1 * t315 * t368 * t367 + t17 * (-0.2e1 * t19 * t355 * t76 - t377 - t378 + t379 - t380) + 0.2e1 * t341 * t283 * t95 + t19 * (t103 * t341 + t387 - t390) + t3 * t395) + t6 * (t350 * t114 + t17 * (0.2e1 * t121 * t315 - t401) + t19 * t412 - 0.2e1 * t55 * t415 + t315 * t389 + t138 * t341));
  t424 = -t355;
  t429 = -t143 * t359 * t56 - 0.2e1 * t424 * t6 * t76 + t149 * t359;
  t449 = t43 * t172;
  t466 = t342 - t343;
  J_a_imu(2,6) = (t63 * t429 + t17 * (t19 * (0.2e1 * t143 * t424 * t56 - 0.4e1 * t359 * t6 * t76 - 0.2e1 * t149 * t424) + t6 * (-t348 * t56 * t8 + t165 * t341 - t387 + t390) + t8 * t412 + t315 * t400 + t319 * t119 - t315 * t449 + t177 * t319) - t19 * (t19 * t429 + t6 * (t344 * t56 * t8 + t377 + t378 - t379 + t380) + t8 * (t187 * t315 - t401) + t315 * t410 + t319 * t408 + 0.2e1 * t347 * t195 + t466 * t172));
  J_a_imu(2,7) = 0;
  J_a_imu(2,8) = 0;
  J_a_imu(2,9) = 0;
  t481 = t319 * t84;
  t496 = t8 * t315;
  J_a_imu(2,10) = (-0.2e1 * t143 * t55 * (t424 * t63 + t361 + t362) + t6 * (0.2e1 * t358 * t207 + t17 * (-0.2e1 * t19 * t424 * t75 + 0.2e1 * t344 * t55 * t8 + 0.2e1 * t481) - 0.2e1 * t19 * (t8 * t348 * t55 + (t220 * t341 + t319 * t83) * t50)) + 0.2e1 * t17 * t496 * t230 - 0.2e1 * t354 * t235 + t8 * (0.2e1 * t220 * t342 - 0.2e1 * t415) - 0.2e1 * t341 * t242);
  t534 = t8 * t341;
  J_a_imu(2,11) = (0.2e1 * t63 * (t315 * t55 * t6 - t341 * t75) * t45 + t17 * (t19 * (-0.2e1 * t424 * t55 * t6 + 0.2e1 * t359 * t75) + 0.2e1 * t496 * t117 + 0.2e1 * t319 * t99) - 0.2e1 * t94 * (t341 * t55 * t6 + t315 * t75) * t50 + t19 * (0.2e1 * t117 * t534 + 0.2e1 * t481) - 0.2e1 * t319 * t230);
  J_a_imu(2,12) = (0.2e1 * t17 * t283 * t319 + 0.2e1 * t281 * t319 * t55 - 0.2e1 * t414 * t55 * t8 + 0.2e1 * t220 * t343 - 0.2e1 * t415);
  t553 = -t27 * t319 * t8 + t290 * t315 + t341 * t6;
  t557 = t27 * t315 + t319 * t40;
  J_a_imu(2,13) = (t17 * t553 + t19 * t557);
  J_a_imu(2,14) = (t17 * t557 - t19 * t553);
  J_a_imu(2,15) = (-t395 * t6 + t534);
  t564 = -t346 + t347;
  t566 = -t466;
  t570 = -t357 + t358;
  J_a_imu(2,16) = (t6 * (t17 * t564 + t19 * t566) + t8 * t570);
  J_a_imu(2,17) = (-t17 * t566 + t19 * t564);
  J_a_imu(2,18) = t570;
  J_a_imu(2,19) = J_a_imu(2,15);
  J_a_imu(3,1) = 0;
  J_a_imu(3,2) = 0;
  J_a_imu(3,3) = 0;
  t574 = Rot_SE(3,2);
  t578 = Rot_SE(3,3);
  t583 = t578 * t9;
  J_a_imu(3,4) = (t27 * (-t6 * t3 * t574 + t17 * (t10 * t574 + t12 * t578) - (t20 * t574 - t583) * t19) - t40 * (t6 * t3 * t578 + t17 * (-t10 * t578 + t12 * t574) + (t20 * t578 + t574 * t9) * t19));
  t600 = Rot_SE(3,1);
  t601 = t43 * t600;
  t602 = t45 * t578;
  t603 = t601 + t602;
  t605 = t43 * t574;
  t606 = t50 * t578;
  t607 = t605 + t606;
  t609 = t17 * t603 - t19 * t607;
  t612 = t45 * t600;
  t613 = t574 * t50;
  t614 = t612 - t613;
  t616 = t50 * t600;
  t617 = t45 * t574;
  t618 = t616 + t617;
  t620 = t17 * t618 * t19;
  t621 = t578 * t43;
  t633 = 0.2e1 * t375 * t602;
  t634 = t88 * t606;
  t635 = t88 * t605;
  t636 = t9 * t600;
  t642 = 0.2e1 * t375 * t606;
  t644 = t88 * t602;
  t647 = t40 * t574;
  t648 = t27 * t578;
  t649 = t647 - t648;
  t654 = t27 * t583;
  t663 = -t12 * t647 + t12 * t648 + 0.2e1 * t601 * t76;
  t665 = t612 + t613;
  t666 = t665 * t83;
  J_a_imu(3,5) = (-t58 * t56 * t609 + t8 * (-0.2e1 * t6 * t56 * (t614 * t63 + t613 - t620 - t621) - 0.2e1 * t574 * t368 * t367 + t17 * (-0.2e1 * t19 * t614 * t76 - t633 - t634 + t635 - t636) + 0.2e1 * t96 * t616 + t19 * (t103 * t600 + t642 - t644) + t3 * t649) + t6 * (t609 * t114 + t17 * (0.2e1 * t121 * t574 - t654) + t19 * t663 - 0.2e1 * t55 * t666 + t574 * t389 + t138 * t600));
  t675 = -t614;
  t680 = -t143 * t56 * t618 - 0.2e1 * t6 * t675 * t76 + t149 * t618;
  t716 = t601 - t602;
  J_a_imu(3,6) = (t63 * t680 + t17 * (t19 * (0.2e1 * t143 * t56 * t675 - 0.4e1 * t6 * t618 * t76 - 0.2e1 * t149 * t675) + t6 * (-t56 * t607 * t8 + t165 * t600 - t642 + t644) + t8 * t663 + t574 * t400 + t578 * t119 - t574 * t449 + t177 * t578) - t19 * (t19 * t680 + t6 * (t56 * t603 * t8 + t633 + t634 - t635 + t636) + t8 * (t187 * t574 - t654) + t574 * t410 + t578 * t408 + 0.2e1 * t606 * t195 + t716 * t172));
  J_a_imu(3,7) = 0;
  J_a_imu(3,8) = 0;
  J_a_imu(3,9) = 0;
  t731 = t83 * t602;
  t746 = t8 * t574;
  J_a_imu(3,10) = (-0.2e1 * t143 * t55 * (t63 * t675 + t620 + t621) + t6 * (0.2e1 * t617 * t207 + t17 * (-0.2e1 * t19 * t675 * t75 + 0.2e1 * t55 * t603 * t8 + 0.2e1 * t731) - 0.2e1 * t19 * (t8 * t607 * t55 + (t220 * t600 + t578 * t83) * t50)) + 0.2e1 * t17 * t746 * t230 - 0.2e1 * t613 * t235 + t8 * (0.2e1 * t220 * t601 - 0.2e1 * t666) - 0.2e1 * t600 * t242);
  t784 = t8 * t600;
  J_a_imu(3,11) = (0.2e1 * t63 * (t55 * t574 * t6 - t600 * t75) * t45 + t17 * (t19 * (-0.2e1 * t55 * t6 * t675 + 0.2e1 * t618 * t75) + 0.2e1 * t746 * t117 + 0.2e1 * t83 * t606) - 0.2e1 * t94 * (t55 * t6 * t600 + t574 * t75) * t50 + t19 * (0.2e1 * t117 * t784 + 0.2e1 * t731) - 0.2e1 * t578 * t230);
  J_a_imu(3,12) = (0.2e1 * t17 * t283 * t578 + 0.2e1 * t281 * t55 * t578 - 0.2e1 * t55 * t665 * t8 + 0.2e1 * t220 * t602 - 0.2e1 * t666);
  t803 = -t27 * t578 * t8 + t290 * t574 + t6 * t600;
  t807 = t27 * t574 + t40 * t578;
  J_a_imu(3,13) = (t17 * t803 + t19 * t807);
  J_a_imu(3,14) = (t17 * t807 - t19 * t803);
  J_a_imu(3,15) = (-t6 * t649 + t784);
  t814 = -t605 + t606;
  t816 = -t716;
  t820 = -t616 + t617;
  J_a_imu(3,16) = (t6 * (t17 * t814 + t19 * t816) + t8 * t820);
  J_a_imu(3,17) = (-t17 * t816 + t19 * t814);
  J_a_imu(3,18) = t820;
  J_a_imu(3,19) = J_a_imu(3,15);
  J_aEKFreturn = J_a_imu;