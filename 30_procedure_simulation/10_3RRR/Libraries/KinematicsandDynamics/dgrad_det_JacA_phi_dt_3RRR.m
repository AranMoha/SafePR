function cg = dgrad_det_JacA_phi_dt_3RRR(qj_rad, dqj_rad, xEE, dxEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_rad, beta_rad)
  dgrad_det_JacA_phie_dt = [0;];
  t1 = l_all_id(1);
  t2 = r_fixPlat_j(2);
  t3 = t2 * t1;
  t4 = r_fixPlat_j(3);
  t5 = t4 * t3;
  t6 = r_mobPlat_j(2);
  t7 = dqj_rad(1);
  t8 = dxEE(6);
  t9 = t7 + t8;
  t11 = xEE(6);
  t12 = psi_rad(2);
  t13 = beta_rad(2);
  t14 = psi_rad(3);
  t15 = qj_rad(1);
  t16 = psi_rad(1);
  t18 = cos(t11 - t12 + t13 - t14 + t15 + t16);
  t22 = l_all_id(3);
  t23 = t22 * t1;
  t24 = l_all_id(5);
  t25 = t24 * t23;
  t26 = r_mobPlat_j(3);
  t27 = dqj_rad(4);
  t28 = dqj_rad(7);
  t29 = t7 - t27 - t28 + t8;
  t31 = qj_rad(4);
  t32 = qj_rad(7);
  t33 = beta_rad(3);
  t35 = cos(t15 + t16 - t31 - t12 + t11 - t32 - t14 + t33);
  t39 = r_fixPlat_j(1);
  t40 = t39 * t24;
  t41 = t2 * t40;
  t42 = t28 + t8;
  t45 = cos(-t11 + t12 - t13 - t32 - t14 + t16);
  t49 = (t24 * t22);
  t50 = t39 * t49;
  t51 = t27 - t28 + t8;
  t54 = sin(t16 - t31 - t12 - t11 + t32 + t14 - t33);
  t58 = t24 * t1;
  t59 = t2 * t58;
  t60 = r_mobPlat_j(1);
  t61 = t7 - t28 - t8;
  t63 = beta_rad(1);
  t65 = sin(t12 - t32 - t14 - t11 + t15 + t16 - t63);
  t69 = t7 - t27 + t28 - t8;
  t72 = cos(-t31 - t12 + t32 + t14 - t11 + t15 + t16 - t63);
  t76 = t28 - t8;
  t79 = cos(-t12 + t32 + t14 - t11 + t16 - t63);
  t83 = (t7 - t8);
  t84 = t83 * t60;
  t86 = cos(-t12 + t14 - t11 + t15 + t16 - t63);
  t92 = cos(t15 + t16 - t31 - t12 - t11 + t32 + t14 - t33);
  t97 = 2 * t8;
  t98 = t7 + t28 - t97;
  t100 = 0.2e1 * t11;
  t102 = cos(t15 + t16 - t100 + t32 + t14 - t33 - t13);
  t106 = t27 - t28 - t8;
  t109 = sin(-t11 + t16 - t63 + t31 + t12 - t32 - t14);
  t115 = sin(-t11 + t16 - t63 - t31 - t12 + t32 + t14);
  t119 = t4 * t23;
  t120 = t7 - t27 - t8;
  t123 = sin(-t31 - t12 + t14 - t11 + t15 + t16 - t63);
  t127 = xEE(2);
  t128 = t127 * t7;
  t129 = t8 * t127;
  t130 = dxEE(1);
  t131 = t128 - t129 + t130;
  t132 = t131 * t60;
  t133 = -t11 + t15 + t16 - t63 + t12;
  t134 = cos(t133);
  t138 = t39 * t22;
  t139 = xEE(1);
  t140 = t139 * t27;
  t141 = t8 * t139;
  t142 = dxEE(2);
  t143 = t140 - t141 - t142;
  t145 = t31 + t12 - t11 + t16 - t63;
  t146 = sin(t145);
  t150 = t4 * t2;
  t151 = t129 - t130;
  t152 = t151 * t26;
  t153 = -t11 + t14 - t33 + t12;
  t154 = sin(t153);
  t158 = t129 + t130;
  t159 = t158 * t26;
  t160 = t11 - t14 + t33 + t12;
  t161 = sin(t160);
  t165 = t26 * t2;
  t167 = t129 + t130 / 0.2e1;
  t168 = t167 * t6;
  t169 = -t100 - t33 + t12 - t13;
  t170 = cos(t169);
  t174 = -0.4e1 * t18 * t9 * t6 * t5 - 0.4e1 * t35 * t29 * t26 * t25 + 0.4e1 * t45 * t42 * t6 * t41 + 0.4e1 * t54 * t51 * t26 * t50 - 0.4e1 * t65 * t61 * t60 * t59 + 0.4e1 * t72 * t69 * t60 * t25 + 0.4e1 * t79 * t76 * t60 * t41 + 0.4e1 * t86 * t84 * t5 - 0.4e1 * t92 * t69 * t26 * t25 + 0.8e1 * t102 * t98 * t26 * t6 * t58 - 0.4e1 * t109 * t106 * t60 * t50 - 0.4e1 * t115 * t51 * t60 * t50 + 0.4e1 * t123 * t120 * t60 * t119 - 0.4e1 * t134 * t132 * t3 + 0.4e1 * t146 * t143 * t60 * t138 - 0.4e1 * t154 * t152 * t150 - 0.4e1 * t161 * t159 * t150 - 0.16e2 * t170 * t168 * t165;
  t175 = t60 * t22;
  t176 = t139 ^ 2;
  t177 = t127 ^ 2;
  t178 = t176 + t177;
  t179 = t27 - t8;
  t180 = t179 * t178;
  t181 = t31 + t12 - t11 - t63;
  t182 = cos(t181);
  t186 = t7 - t28;
  t187 = t127 * t186;
  t188 = -t129 + t187 - t130;
  t190 = -t11 - t13 - t32 - t14 + t15 + t16;
  t191 = sin(t190);
  t195 = t4 * t1;
  t196 = t128 + t129 + t130;
  t197 = t196 * t6;
  t198 = t11 + t13 - t14 + t15 + t16;
  t199 = cos(t198);
  t203 = t127 * t28;
  t204 = t203 + t129 + t130;
  t205 = t204 * t60;
  t206 = -t32 - t14 - t11 + t16 - t63;
  t207 = cos(t206);
  t211 = t128 - t129 - t130;
  t213 = -t11 - t13 - t14 + t15 + t16;
  t214 = cos(t213);
  t218 = t4 * t22;
  t219 = t127 * t27;
  t220 = t219 + t129 + t130;
  t221 = t220 * t60;
  t222 = t11 + t63 + t31 + t12 - t14;
  t223 = cos(t222);
  t227 = t39 * t60;
  t228 = -t100 - t13 + t16 - t63;
  t229 = cos(t228);
  t233 = t2 * t39;
  t234 = t141 + t142;
  t235 = t234 * t60;
  t236 = -t11 + t16 - t63 + t12;
  t237 = cos(t236);
  t241 = t220 * t26;
  t242 = t31 + t12 + t11 - t14 + t33;
  t243 = cos(t242);
  t247 = t158 * t6;
  t248 = -t14 - t11 + t12 - t13;
  t249 = sin(t248);
  t253 = t6 * t26;
  t255 = t141 - t142 / 0.2e1;
  t256 = t255 * t4;
  t257 = -t100 - t13 + t14 - t33;
  t258 = sin(t257);
  t262 = t4 * t39;
  t263 = t11 - t14 + t33 + t16;
  t264 = sin(t263);
  t269 = -t100 - t33 + t16 - t63;
  t270 = sin(t269);
  t275 = t31 + t12 - t11 + t14 - t33;
  t276 = sin(t275);
  t280 = -t11 - t13 - t14 + t16;
  t281 = sin(t280);
  t285 = t60 * t1;
  t286 = 2 * t129;
  t287 = t128 - t286 - t130;
  t289 = -t100 - t13 + t15 + t16 - t63;
  t290 = sin(t289);
  t294 = t26 * t60;
  t295 = -t100 + t14 - t33 - t63;
  t296 = sin(t295);
  t300 = t26 * t22;
  t301 = t31 + t12 - t11 - t33;
  t302 = cos(t301);
  t306 = -0.4e1 * t182 * t180 * t175 + 0.4e1 * t191 * t58 * t6 * t188 - 0.4e1 * t199 * t197 * t195 - 0.4e1 * t207 * t205 * t40 + 0.4e1 * t214 * t211 * t6 * t195 + 0.4e1 * t223 * t221 * t218 - 0.16e2 * t229 * t168 * t227 + 0.4e1 * t237 * t235 * t233 - 0.4e1 * t243 * t241 * t218 - 0.4e1 * t249 * t247 * t150 + 0.16e2 * t258 * t256 * t253 + 0.4e1 * t264 * t159 * t262 + 0.16e2 * t270 * t255 * t26 * t227 - 0.4e1 * t276 * t143 * t26 * t218 - 0.4e1 * t281 * t247 * t262 - 0.8e1 * t290 * t287 * t6 * t285 - 0.16e2 * t296 * t256 * t294 + 0.4e1 * t302 * t180 * t300;
  t308 = t139 * t28;
  t309 = t308 - t141 - t142;
  t311 = t32 + t14 - t11 + t16 - t63;
  t312 = sin(t311);
  t316 = t2 * t60;
  t317 = t255 * t6;
  t318 = -t100 + t12 - t13 - t63;
  t319 = sin(t318);
  t323 = t15 + t16 + t11 - t12 + t13;
  t324 = cos(t323);
  t329 = cos(t269);
  t333 = t309 * t26;
  t334 = -t11 + t32 + t14 - t33 + t16;
  t335 = sin(t334);
  t339 = t203 - t129 + t130;
  t340 = t339 * t26;
  t341 = cos(t334);
  t345 = t151 * t60;
  t346 = t14 - t11 + t16 - t63;
  t347 = sin(t346);
  t351 = t7 + t28;
  t353 = t139 * t351 - t141 - t142;
  t355 = t32 + t14 - t11 + t15 + t16 - t63;
  t356 = cos(t355);
  t360 = t211 * t60;
  t361 = -t11 + t15 + t16 - t63 - t12;
  t362 = cos(t361);
  t366 = t39 * t8;
  t367 = t2 * t366;
  t368 = t6 * t4;
  t370 = sin(t16 - t14 + t11 - t12 + t13);
  t375 = t60 * t4 * t8;
  t377 = sin(-t11 - t63 + t13 + t14 - t33);
  t382 = sin(-t11 + t63 - t13 + t14 - t33);
  t386 = t2 * t8;
  t387 = t4 * t386;
  t389 = cos(-t100 - t63 + t14 - t33 + t12);
  t393 = t26 * t4;
  t395 = sin(t16 - t11 + t14 - t33 - t12);
  t400 = sin(t16 + t11 - t14 + t33 - t12);
  t404 = t7 - t27 + t8;
  t407 = sin(t11 - t31 - t12 + t13 - t14 + t15 + t16);
  t413 = sin(t15 + t16 - t31 - t12 - t11 + t14 - t33);
  t419 = cos(t12 - t32 - t14 - t11 + t16 - t63);
  t423 = -0.4e1 * t312 * t309 * t60 * t40 + 0.16e2 * t319 * t317 * t316 - 0.4e1 * t324 * t197 * t3 + 0.16e2 * t329 * t167 * t26 * t227 + 0.4e1 * t335 * t333 * t40 - 0.4e1 * t341 * t340 * t40 - 0.4e1 * t347 * t345 * t262 - 0.4e1 * t356 * t58 * t353 * t60 + 0.4e1 * t362 * t360 * t3 - 0.4e1 * t370 * t368 * t367 - 0.4e1 * t377 * t253 * t375 + 0.4e1 * t382 * t253 * t375 - 0.16e2 * t389 * t294 * t387 + 0.4e1 * t395 * t393 * t367 + 0.4e1 * t400 * t393 * t367 - 0.4e1 * t407 * t404 * t6 * t119 - 0.4e1 * t413 * t120 * t26 * t119 - 0.4e1 * t419 * t42 * t60 * t41;
  t424 = t7 - t28 + t8;
  t427 = sin(-t12 + t11 - t32 - t14 + t33 + t15 + t16);
  t433 = (t7 + t27 - t97) * t26;
  t435 = cos(t15 + t16 - t100 - t33 + t31 + t12 - t13);
  t441 = cos(-t12 + t11 - t14 + t33 + t15 + t16);
  t446 = t7 - t97;
  t447 = t446 * t26;
  t449 = sin(t15 + t16 - t100 - t33 + t12 - t13);
  t453 = t4 * t138;
  t454 = t179 * t6;
  t456 = cos(t16 + t11 - t31 - t12 + t13 - t14);
  t462 = sin(t15 + t16 - t31 - t12 + t11 - t14 + t33);
  t466 = t60 * t218;
  t467 = t27 - t97;
  t468 = t467 * t26;
  t470 = sin(-t100 - t63 + t31 + t12 + t14 - t33);
  t475 = cos(t16 - t11 + t31 + t12 - t13 - t14);
  t482 = sin(-t100 - t13 + t14 + t15 + t16 - t63);
  t486 = t27 + t28 - t8;
  t489 = sin(t16 + t11 - t31 - t12 + t13 - t32 - t14);
  t493 = t7 + t27 - t28 - t8;
  t496 = cos(t31 + t12 - t32 - t14 - t11 + t15 + t16 - t63);
  t500 = t76 * t26;
  t502 = cos(t16 - t11 + t32 + t14 - t33 - t12);
  t508 = cos(t31 + t12 - t100 - t33 + t15 + t16 - t63);
  t512 = t60 * t49;
  t513 = t27 + t28 - t97;
  t516 = cos(-t100 + t31 + t12 - t13 + t32 + t14 - t63);
  t521 = t8 * t127 * t139;
  t524 = t142 * t127;
  t525 = t521 + t139 * (t128 + t130) - t524;
  t527 = t11 + t13 + t15 + t16;
  t528 = sin(t527);
  t532 = t130 * t139;
  t533 = t532 + t524;
  t534 = t12 - t11 - t33;
  t535 = cos(t534);
  t539 = -t11 - t13 + t14;
  t540 = cos(t539);
  t546 = t521 + t139 * (t219 + t130) - t524;
  t547 = t31 + t12 + t11 + t63;
  t548 = sin(t547);
  t552 = t60 * t24;
  t553 = t32 + t14 - t11 - t63;
  t554 = sin(t553);
  t558 = 0.4e1 * t427 * t424 * t26 * t59 - 0.8e1 * t435 * t433 * t6 * t23 + 0.4e1 * t441 * t9 * t26 * t5 - 0.8e1 * t449 * t447 * t6 * t3 - 0.4e1 * t456 * t454 * t453 + 0.4e1 * t462 * t404 * t26 * t119 - 0.8e1 * t470 * t468 * t466 + 0.4e1 * t475 * t454 * t453 - 0.8e1 * t482 * t446 * t6 * t60 * t195 - 0.4e1 * t489 * t486 * t6 * t50 - 0.4e1 * t496 * t493 * t60 * t25 - 0.4e1 * t502 * t500 * t41 + 0.8e1 * t508 * t433 * t60 * t23 + 0.8e1 * t516 * t513 * t6 * t512 + 0.8e1 * t528 * t1 * t6 * t525 - 0.8e1 * t535 * t533 * t165 + 0.8e1 * t540 * t533 * t368 - 0.8e1 * t548 * t546 * t175 + 0.8e1 * t554 * t533 * t552;
  t561 = t26 * t39;
  t562 = -t11 - t33 + t16;
  t563 = cos(t562);
  t568 = t8 * (t176 - t177);
  t570 = 2 * t139 * t142;
  t572 = 2 * t127 * t130;
  t573 = t568 - t570 - t572;
  t574 = t12 + t11 + t33;
  t575 = sin(t574);
  t581 = t521 + t139 * (t203 + t130) - t524;
  t582 = t32 + t14 + t11 + t63;
  t583 = sin(t582);
  t587 = t6 * t24;
  t588 = -t11 - t13 + t32 + t14;
  t589 = sin(t588);
  t595 = t176 * t7 - t177 * t7 + t568 - t570 - t572;
  t597 = t11 + t33 + t15 + t16;
  t598 = cos(t597);
  t602 = t11 + t33 + t16;
  t603 = sin(t602);
  t607 = t22 * t6;
  t608 = t27 - t28;
  t609 = t127 * t608;
  t611 = t24 * (-t129 + t609 - t130);
  t612 = -t11 + t31 + t12 - t13 - t32 - t14;
  t613 = sin(t612);
  t617 = t4 * t167;
  t618 = cos(t257);
  t623 = cos(t311);
  t627 = t27 + t7;
  t629 = t127 * t627 - t129 + t130;
  t631 = t1 * t6;
  t632 = t15 + t16 - t11 + t31 + t12 - t13;
  t633 = sin(t632);
  t637 = t196 * t26;
  t638 = -t12 + t11 + t33 + t15 + t16;
  t639 = cos(t638);
  t643 = cos(t318);
  t647 = t139 * t7;
  t648 = t647 - t141 - t142;
  t649 = t648 * t60;
  t650 = sin(t133);
  t654 = t27 + t28;
  t656 = t127 * t654 - t129 + t130;
  t658 = t31 + t12 - t11 + t32 + t14 - t33;
  t659 = sin(t658);
  t663 = t11 - t14 + t33 + t15 + t16;
  t664 = cos(t663);
  t668 = t141 - t142;
  t669 = t668 * t60;
  t670 = -t11 + t16 - t63 - t12;
  t671 = cos(t670);
  t675 = t647 + t141 - t142;
  t676 = t675 * t26;
  t677 = sin(t638);
  t681 = t675 * t6;
  t682 = sin(t323);
  t686 = 0.8e1 * t563 * t533 * t561 + 0.4e1 * t575 * t573 * t165 + 0.8e1 * t583 * t581 * t552 - 0.8e1 * t589 * t533 * t587 - 0.4e1 * t598 * t1 * t595 * t26 - 0.4e1 * t603 * t573 * t561 + 0.4e1 * t613 * t611 * t607 + 0.16e2 * t618 * t617 * t253 + 0.4e1 * t623 * t339 * t60 * t40 - 0.4e1 * t633 * t631 * t22 * t629 + 0.4e1 * t639 * t637 * t3 + 0.16e2 * t643 * t168 * t316 + 0.4e1 * t650 * t649 * t3 - 0.4e1 * t659 * t24 * t656 * t300 + 0.4e1 * t664 * t637 * t195 + 0.4e1 * t671 * t669 * t233 - 0.4e1 * t677 * t676 * t3 + 0.4e1 * t682 * t681 * t3;
  t687 = t140 + t141 - t142;
  t688 = t687 * t26;
  t689 = sin(t242);
  t693 = t2 * t24;
  t694 = -t11 + t32 + t14 - t33 + t12;
  t695 = cos(t694);
  t699 = t158 * t60;
  t700 = sin(t670);
  t704 = t139 * t186;
  t705 = -t141 + t704 + t142;
  t707 = cos(t190);
  t714 = (t127 * t351 - t129 + t130) * t1;
  t715 = -t11 + t32 + t14 - t33 + t15 + t16;
  t716 = sin(t715);
  t720 = 2 * t141;
  t721 = t140 - t720 + t142;
  t723 = -t100 - t33 + t31 + t12 - t13;
  t724 = cos(t723);
  t729 = -t12 - t11 - t33 + t15 + t16;
  t730 = cos(t729);
  t734 = t76 * t178;
  t735 = cos(t588);
  t739 = sin(t169);
  t743 = -t11 + t14 - t33 + t16;
  t744 = sin(t743);
  t748 = t234 * t26;
  t749 = cos(t153);
  t753 = t139 * t608;
  t755 = (-t141 + t753 + t142) * t24;
  t756 = -t32 - t14 + t31 + t12 - t11 - t63;
  t757 = cos(t756);
  t761 = t219 - t129 - t130;
  t763 = -t11 - t63 + t31 + t12 - t14;
  t764 = cos(t763);
  t768 = t16 - t31 - t12 - t11 - t33;
  t769 = sin(t768);
  t773 = t16 + t11 - t12 + t13;
  t774 = sin(t773);
  t778 = t129 + t609 + t130;
  t780 = -t32 - t14 + t31 + t12 + t11 + t63;
  t781 = sin(t780);
  t785 = t668 * t6;
  t786 = cos(t280);
  t790 = t141 + t704 - t142;
  t792 = t11 + t13 - t32 - t14 + t15 + t16;
  t793 = cos(t792);
  t797 = t7 - t27;
  t798 = t139 * t797;
  t800 = t1 * (t141 + t798 - t142);
  t801 = t15 + t16 - t31 - t12 + t11 + t33;
  t802 = cos(t801);
  t806 = 0.4e1 * t689 * t688 * t218 + 0.4e1 * t695 * t340 * t693 - 0.4e1 * t700 * t699 * t233 - 0.4e1 * t707 * t58 * t6 * t705 + 0.4e1 * t716 * t714 * t24 * t26 + 0.8e1 * t724 * t721 * t26 * t607 - 0.4e1 * t730 * t211 * t26 * t3 - 0.4e1 * t735 * t734 * t587 - 0.16e2 * t739 * t317 * t165 + 0.4e1 * t744 * t152 * t262 - 0.4e1 * t749 * t748 * t150 + 0.4e1 * t757 * t755 * t175 - 0.4e1 * t764 * t761 * t60 * t218 - 0.4e1 * t769 * t688 * t138 - 0.4e1 * t774 * t247 * t233 + 0.4e1 * t781 * t49 * t778 * t60 + 0.4e1 * t786 * t785 * t262 - 0.4e1 * t793 * t58 * t790 * t6 + 0.4e1 * t802 * t800 * t300;
  t808 = t60 * t4;
  t810 = sin(-t12 + t14 - t11 + t16 - t63);
  t815 = sin(t12 - t14 - t11 + t16 - t63);
  t819 = t4 * t366;
  t821 = cos(-t100 - t13 + t14 - t33 + t16);
  t825 = t6 * t175;
  t826 = t179 * t26;
  t828 = cos(-t11 - t63 + t33 + t31 + t12 - t13);
  t832 = t6 * t552;
  t834 = cos(-t11 + t63 + t32 + t14 - t33 - t13);
  t839 = cos(-t11 + t63 - t33 + t31 + t12 - t13);
  t845 = cos(-t11 + t31 + t12 - t13 - t32 - t14 + t15 + t16);
  t851 = sin(-t100 + t16 - t63 + t31 + t12 - t33);
  t856 = cos(t16 - t31 - t12 + t11 - t14 + t33);
  t862 = sin(t16 - t100 - t33 + t31 + t12 - t13);
  t868 = cos(t11 - t31 - t12 + t13 - t32 - t14 + t15 + t16);
  t874 = sin(-t100 + t31 + t12 - t13 - t63 + t14);
  t880 = sin(t11 - t12 + t13 - t32 - t14 + t15 + t16);
  t886 = cos(-t100 + t32 + t14 - t33 + t31 + t12 - t63);
  t890 = t60 * t693;
  t891 = t28 - t97;
  t892 = t891 * t26;
  t894 = sin(t12 - t100 + t32 + t14 - t33 - t63);
  t901 = cos(-t100 + t15 + t16 - t63 - t13 + t32 + t14);
  t907 = sin(t16 - t31 - t12 + t11 - t32 - t14 + t33);
  t911 = t7 + t28 - t8;
  t914 = sin(-t12 - t11 + t32 + t14 - t33 + t15 + t16);
  t918 = -0.4e1 * t810 * t808 * t367 + 0.4e1 * t815 * t808 * t367 + 0.16e2 * t821 * t253 * t819 - 0.4e1 * t828 * t826 * t825 - 0.4e1 * t834 * t500 * t832 + 0.4e1 * t839 * t826 * t825 + 0.4e1 * t845 * t493 * t6 * t25 + 0.8e1 * t851 * t468 * t60 * t138 + 0.4e1 * t856 * t826 * t453 - 0.8e1 * t862 * t468 * t6 * t138 + 0.4e1 * t868 * t29 * t6 * t25 + 0.8e1 * t874 * t467 * t6 * t466 - 0.4e1 * t880 * t424 * t6 * t59 - 0.8e1 * t886 * t513 * t26 * t512 - 0.8e1 * t894 * t892 * t890 - 0.8e1 * t901 * t98 * t6 * t60 * t58 + 0.4e1 * t907 * t486 * t26 * t50 + 0.4e1 * t914 * t911 * t26 * t59;
  t919 = t308 - t141 + t142;
  t921 = t11 + t13 - t32 - t14 + t16;
  t922 = sin(t921);
  t925 = t14 - t11 + t15 + t16 - t63;
  t926 = sin(t925);
  t929 = t647 - t141 + t142;
  t931 = sin(t213);
  t935 = (-t141 + t798 + t142) * t1;
  t936 = t15 + t16 - t31 - t12 - t11 - t33;
  t937 = cos(t936);
  t940 = t11 + t13 - t14 + t16;
  t941 = sin(t940);
  t944 = t234 * t6;
  t945 = t16 - t11 + t12 - t13;
  t946 = cos(t945);
  t949 = cos(t346);
  t953 = t32 + t14 - t11 + t12 - t13;
  t954 = sin(t953);
  t957 = t14 - t11 + t12 - t13;
  t958 = cos(t957);
  t961 = sin(t355);
  t964 = t140 - t141 + t142;
  t965 = t964 * t6;
  t966 = t11 - t31 - t12 + t13 + t16;
  t967 = sin(t966);
  t971 = -t11 + t15 + t16 - t63 + t31 + t12;
  t972 = sin(t971);
  t975 = t668 * t26;
  t976 = -t12 - t11 - t33 + t16;
  t977 = cos(t976);
  t981 = t16 - t31 - t12 + t11 + t33;
  t982 = cos(t981);
  t985 = t203 - t129 - t130;
  t986 = t985 * t26;
  t987 = t11 - t32 - t14 + t33 + t12;
  t988 = cos(t987);
  t991 = t127 * t797;
  t993 = t1 * (-t129 + t991 - t130);
  t994 = -t11 + t15 + t16 - t63 - t31 - t12;
  t995 = sin(t994);
  t998 = sin(t236);
  t1001 = cos(t248);
  t1004 = t687 * t60;
  t1005 = -t31 - t12 - t11 + t16 - t63;
  t1006 = sin(t1005);
  t1009 = t922 * t919 * t6 * t40 - t926 * t649 * t195 + t931 * t929 * t6 * t195 + t937 * t935 * t300 - t941 * t247 * t262 - t946 * t944 * t233 - t949 * t235 * t262 + t954 * t309 * t6 * t693 + t958 * t944 * t150 - t961 * t714 * t552 + t967 * t965 * t138 + t972 * t23 * t629 * t60 - t977 * t975 * t233 + t982 * t761 * t26 * t138 - t988 * t986 * t693 + t995 * t993 * t175 + t998 * t345 * t233 + t1001 * t785 * t150 + t1006 * t1004 * t138;
  t1014 = t178 * t8;
  t1015 = sin(t539);
  t1019 = -t14 - t11 + t16 - t63;
  t1020 = sin(t1019);
  t1024 = t308 + t141 - t142;
  t1025 = t1024 * t6;
  t1026 = -t32 - t14 - t11 + t12 - t13;
  t1027 = sin(t1026);
  t1031 = t219 - t129 + t130;
  t1032 = t1031 * t6;
  t1033 = -t11 + t31 + t12 - t13 + t14;
  t1034 = cos(t1033);
  t1039 = -t100 - t33 + t15 + t16 - t63;
  t1040 = sin(t1039);
  t1045 = -t32 - t14 - t11 + t15 + t16 - t63;
  t1046 = sin(t1045);
  t1050 = t6 * t39;
  t1051 = t16 + t11 + t13;
  t1052 = cos(t1051);
  t1054 = cos(t602);
  t1056 = t11 + t63 + t12;
  t1057 = cos(t1056);
  t1059 = cos(t574);
  t1061 = t11 + t63 + t14;
  t1062 = cos(t1061);
  t1064 = t11 + t13 + t14;
  t1065 = cos(t1064);
  t1071 = t27 + t8;
  t1074 = cos(-t11 + t16 - t63 - t31 - t12 + t14);
  t1078 = t891 * t6;
  t1080 = sin(-t100 + t12 - t13 + t32 + t14 - t63);
  t1086 = sin(t15 + t16 - t100 - t13 + t14 - t33);
  t1092 = sin(t16 - t11 + t31 + t12 - t13 - t32 - t14);
  t1097 = cos(t16 - t100 - t33 + t12 - t13);
  t1101 = t60 * t386;
  t1103 = sin(-t11 + t63 - t33 + t12 - t13);
  t1108 = sin(-t11 - t63 + t33 + t12 - t13);
  t1112 = t60 * t366;
  t1114 = sin(-t11 + t16 - t63 - t33 + t13);
  t1119 = sin(-t11 + t16 - t63 + t33 - t13);
  t1123 = t6 * t60;
  t1125 = cos(t14 - t100 - t13 + t16 - t63);
  t1130 = cos(t12 - t100 - t33 + t16 - t63);
  t1134 = 0.4e1 * t1015 * t1014 * t368 + 0.4e1 * t1020 * t699 * t262 + 0.4e1 * t1027 * t1025 * t693 - 0.4e1 * t1034 * t1032 * t218 + 0.8e1 * t1040 * t287 * t26 * t285 - 0.4e1 * t1046 * t58 * t188 * t60 - 0.8e1 * (t521 + t532 - t524) * (t1050 * t1052 - t1054 * t561 - t1057 * t316 + t1059 * t165 + t1062 * t808 - t1065 * t368) + 0.4e1 * t1074 * t1071 * t60 * t453 + 0.8e1 * t1080 * t1078 * t890 + 0.8e1 * t1086 * t447 * t6 * t195 + 0.4e1 * t1092 * t106 * t6 * t50 - 0.16e2 * t1097 * t253 * t367 - 0.4e1 * t1103 * t253 * t1101 + 0.4e1 * t1108 * t253 * t1101 + 0.4e1 * t1114 * t253 * t1112 - 0.4e1 * t1119 * t253 * t1112 - 0.16e2 * t1125 * t1123 * t819 + 0.16e2 * t1130 * t294 * t367;
  t1135 = -t11 + t31 + t12 - t13 + t16;
  t1136 = cos(t1135);
  t1139 = t204 * t6;
  t1140 = cos(t1026);
  t1144 = cos(t953);
  t1147 = t15 + t16 + t11 - t31 - t12 + t13;
  t1148 = cos(t1147);
  t1152 = t15 + t16 - t11 + t12 - t13;
  t1153 = sin(t1152);
  t1157 = t1 * (t129 + t991 + t130);
  t1158 = sin(t801);
  t1162 = -t11 + t31 + t12 - t13 + t32 + t14;
  t1163 = sin(t1162);
  t1166 = -t11 + t31 + t12 - t13 - t14;
  t1167 = sin(t1166);
  t1170 = sin(t694);
  t1174 = t139 * t654 - t141 - t142;
  t1176 = cos(t1162);
  t1180 = t139 * t627 - t141 - t142;
  t1182 = cos(t971);
  t1186 = cos(t658);
  t1189 = cos(t773);
  t1192 = -t12 + t11 + t33 + t16;
  t1193 = cos(t1192);
  t1196 = t12 + t11 + t63 - t14;
  t1197 = cos(t1196);
  t1200 = cos(t263);
  t1203 = cos(t160);
  t1206 = t151 * t6;
  t1207 = sin(t945);
  t1211 = cos(t1152);
  t1214 = t1136 * t1032 * t138 + t1140 * t1139 * t693 - t1144 * t339 * t6 * t693 - t1148 * t800 * t607 - t1153 * t648 * t6 * t3 + t1158 * t1157 * t300 + t1163 * t587 * t656 * t22 + t1167 * t965 * t218 - t1170 * t333 * t693 + t1176 * t587 * t1174 * t22 + t1182 * t23 * t1180 * t60 - t1186 * t24 * t1174 * t300 - t1189 * t785 * t233 + t1193 * t975 * t233 + t1197 * t669 * t150 + t1200 * t975 * t262 - t1203 * t975 * t150 - t1207 * t1206 * t233 + t1211 * t131 * t6 * t3;
  t1218 = cos(t275);
  t1223 = t12 - t32 - t14 + t11 + t63;
  t1224 = sin(t1223);
  t1228 = t141 + t753 - t142;
  t1230 = t31 + t12 + t11 - t32 - t14 + t33;
  t1231 = cos(t1230);
  t1235 = t919 * t26;
  t1236 = sin(t987);
  t1240 = t16 - t11 - t13;
  t1241 = sin(t1240);
  t1245 = t178 * t26;
  t1246 = sin(t534);
  t1250 = -t11 - t63 + t12;
  t1251 = sin(t1250);
  t1255 = -t11 - t63 + t14;
  t1256 = sin(t1255);
  t1261 = cos(-t100 + t12 - t13 - t63 + t14);
  t1266 = sin(t16 - t14 - t11 + t12 - t13);
  t1270 = sin(t228);
  t1275 = sin(t981);
  t1279 = t11 - t32 - t14 + t33 + t16;
  t1280 = cos(t1279);
  t1284 = sin(t222);
  t1288 = t12 - t11 - t63 - t14;
  t1289 = cos(t1288);
  t1293 = sin(t957);
  t1297 = cos(t295);
  t1301 = sin(t1196);
  t1305 = 0.4e1 * t1218 * t1031 * t26 * t218 - 0.4e1 * t1224 * t919 * t60 * t693 - 0.4e1 * t1231 * t49 * t26 * t1228 + 0.4e1 * t1236 * t1235 * t693 - 0.4e1 * t1241 * t1014 * t1050 - 0.4e1 * t1246 * t1245 * t386 + 0.4e1 * t1251 * t1014 * t316 - 0.4e1 * t1256 * t1014 * t808 + 0.16e2 * t1261 * t1123 * t387 - 0.4e1 * t1266 * t368 * t367 - 0.16e2 * t1270 * t317 * t227 - 0.4e1 * t1275 * t964 * t26 * t138 + 0.4e1 * t1280 * t986 * t40 - 0.4e1 * t1284 * t1004 * t218 - 0.4e1 * t1289 * t669 * t150 + 0.4e1 * t1293 * t1206 * t150 - 0.16e2 * t1297 * t617 * t294 + 0.4e1 * t1301 * t699 * t150;
  t1306 = t12 - t32 - t14 - t11 - t63;
  t1307 = cos(t1306);
  t1312 = cos(t632);
  t1317 = -t100 + t31 + t12 - t13 - t63;
  t1318 = cos(t1317);
  t1322 = cos(t743);
  t1326 = sin(t1147);
  t1330 = t1024 * t60;
  t1331 = sin(t206);
  t1335 = cos(t553);
  t1339 = sin(t1288);
  t1343 = t219 - t286 - t130;
  t1345 = sin(t723);
  t1349 = sin(t562);
  t1353 = t929 * t60;
  t1354 = -t14 - t11 + t15 + t16 - t63;
  t1355 = sin(t1354);
  t1359 = sin(t1306);
  t1364 = t11 - t32 - t14 + t33 + t15 + t16;
  t1365 = cos(t1364);
  t1369 = cos(t1019);
  t1374 = cos(t1223);
  t1378 = cos(t612);
  t1382 = -t11 - t13 - t32 - t14 + t16;
  t1383 = sin(t1382);
  t1388 = sin(t1230);
  t1392 = t26 * t1;
  t1393 = t83 * t178;
  t1394 = -t11 - t33 + t15 + t16;
  t1395 = cos(t1394);
  t1399 = -0.4e1 * t1307 * t205 * t693 - 0.4e1 * t1312 * t631 * t22 * t1180 - 0.8e1 * t1318 * t721 * t6 * t175 + 0.4e1 * t1322 * t748 * t262 - 0.4e1 * t1326 * t1157 * t607 - 0.4e1 * t1331 * t1330 * t40 + 0.4e1 * t1335 * t734 * t552 + 0.4e1 * t1339 * t699 * t150 - 0.8e1 * t1345 * t1343 * t26 * t607 + 0.4e1 * t1349 * t1245 * t366 - 0.4e1 * t1355 * t1353 * t195 - 0.4e1 * t1359 * t1330 * t693 + 0.4e1 * t1365 * t58 * t790 * t26 - 0.4e1 * t1369 * t669 * t262 + 0.4e1 * t1374 * t985 * t60 * t693 - 0.4e1 * t1378 * t755 * t607 + 0.4e1 * t1383 * t1025 * t40 - 0.4e1 * t1388 * t49 * t26 * t778 - 0.4e1 * t1395 * t1393 * t1392;
  t1402 = cos(t940);
  t1406 = t647 - t720 + t142;
  t1408 = cos(t289);
  t1413 = (t308 - t720 + t142) * t26;
  t1414 = -t100 + t32 + t14 - t33 - t13;
  t1415 = cos(t1414);
  t1420 = cos(t16 + t11 - t32 - t14 + t33 - t12);
  t1424 = t6 * t285;
  t1425 = t83 * t26;
  t1427 = cos(-t11 + t15 + t16 - t63 + t33 - t13);
  t1433 = sin(-t100 - t13 + t32 + t14 + t16 - t63);
  t1439 = sin(-t100 - t13 + t32 + t14 - t33 + t16);
  t1445 = sin(-t12 + t32 + t14 - t11 + t15 + t16 - t63);
  t1450 = cos(-t11 + t15 + t16 - t63 - t33 + t13);
  t1455 = cos(-t11 - t63 + t32 + t14 - t33 + t13);
  t1461 = cos(-t11 + t12 - t13 - t14 + t15 + t16);
  t1467 = cos(t11 - t12 + t13 - t32 - t14 + t16);
  t1473 = sin(-t100 + t15 + t16 - t63 + t12 - t33);
  t1479 = cos(t16 - t31 - t12 - t11 + t14 - t33);
  t1485 = sin(-t11 + t12 - t13 - t32 - t14 + t15 + t16);
  t1491 = cos(-t11 + t16 - t63 + t31 + t12 - t14);
  t1496 = cos(t12 - t14 - t11 + t15 + t16 - t63);
  t1501 = cos(-t12 - t11 + t14 - t33 + t15 + t16);
  t1505 = -0.4e1 * t1402 * t785 * t262 + 0.8e1 * t1408 * t1406 * t6 * t285 - 0.8e1 * t1415 * t1413 * t587 + 0.4e1 * t1420 * t500 * t41 + 0.4e1 * t1427 * t1425 * t1424 - 0.8e1 * t1433 * t1078 * t60 * t40 + 0.8e1 * t1439 * t892 * t6 * t40 - 0.4e1 * t1445 * t911 * t60 * t59 - 0.4e1 * t1450 * t1425 * t1424 + 0.4e1 * t1455 * t500 * t832 + 0.4e1 * t1461 * t83 * t6 * t5 - 0.4e1 * t1467 * t76 * t6 * t41 + 0.8e1 * t1473 * t447 * t60 * t3 - 0.4e1 * t1479 * t1071 * t26 * t453 + 0.4e1 * t1485 * t61 * t6 * t59 - 0.4e1 * t1491 * t179 * t60 * t453 - 0.4e1 * t1496 * t84 * t5 - 0.4e1 * t1501 * t1425 * t5;
  t1506 = t7 + t27 - t8;
  t1509 = sin(t31 + t12 - t14 - t11 + t15 + t16 - t63);
  t1515 = sin(-t11 + t31 + t12 - t13 - t14 + t15 + t16);
  t1520 = cos(t527);
  t1524 = t11 + t13 + t32 + t14;
  t1525 = sin(t1524);
  t1530 = sin(t597);
  t1536 = t176 * t27 - t177 * t27 + t568 - t570 - t572;
  t1537 = t31 + t12 + t11 + t33;
  t1538 = cos(t1537);
  t1542 = cos(t1255);
  t1546 = sin(t1064);
  t1550 = sin(t1056);
  t1554 = sin(t1061);
  t1558 = sin(t301);
  t1562 = cos(t1250);
  t1568 = t176 * t28 - t177 * t28 + t568 - t570 - t572;
  t1570 = cos(t582);
  t1574 = cos(t547);
  t1578 = sin(t1051);
  t1582 = sin(t1537);
  t1586 = -t11 - t13 + t15 + t16;
  t1587 = sin(t1586);
  t1591 = sin(t181);
  t1595 = cos(t1240);
  t1599 = 0.4e1 * t1509 * t1506 * t60 * t119 - 0.4e1 * t1515 * t1506 * t6 * t119 + 0.4e1 * t1520 * t1 * t595 * t6 - 0.8e1 * t1525 * t581 * t587 - 0.8e1 * t1530 * t1 * t26 * t525 + 0.4e1 * t1538 * t1536 * t300 - 0.8e1 * t1542 * t533 * t808 - 0.4e1 * t1546 * t573 * t368 - 0.4e1 * t1550 * t573 * t316 + 0.4e1 * t1554 * t573 * t808 + 0.8e1 * t1558 * t533 * t300 + 0.8e1 * t1562 * t533 * t316 + 0.4e1 * t1570 * t24 * t1568 * t60 - 0.4e1 * t1574 * t1536 * t175 + 0.4e1 * t1578 * t573 * t1050 + 0.8e1 * t1582 * t546 * t300 + 0.8e1 * t1587 * t533 * t631 - 0.8e1 * t1591 * t533 * t175 - 0.8e1 * t1595 * t533 * t1050;
  t1602 = cos(t1039);
  t1606 = sin(t976);
  t1611 = cos(t780);
  t1615 = sin(t1192);
  t1620 = sin(t763);
  t1624 = cos(t1586);
  t1628 = sin(t1279);
  t1633 = (t203 - t286 - t130) * t26;
  t1634 = -t100 + t32 + t14 - t33 - t63;
  t1635 = sin(t1634);
  t1639 = cos(t1634);
  t1643 = t143 * t6;
  t1644 = sin(t1135);
  t1648 = t761 * t6;
  t1649 = cos(t966);
  t1653 = cos(t1005);
  t1657 = cos(t1354);
  t1661 = sin(t663);
  t1666 = cos(t715);
  t1671 = sin(t729);
  t1675 = cos(t925);
  t1680 = -t11 + t14 - t33 + t15 + t16;
  t1681 = sin(t1680);
  t1685 = -0.8e1 * t1602 * t1406 * t26 * t285 + 0.4e1 * t1606 * t159 * t233 + 0.4e1 * t1611 * t49 * t1228 * t60 + 0.4e1 * t1615 * t159 * t233 - 0.4e1 * t1620 * t964 * t60 * t218 + 0.4e1 * t1624 * t1393 * t631 - 0.4e1 * t1628 * t1235 * t40 - 0.8e1 * t1635 * t1633 * t552 + 0.8e1 * t1639 * t1413 * t552 - 0.4e1 * t1644 * t1643 * t138 - 0.4e1 * t1649 * t1648 * t138 + 0.4e1 * t1653 * t221 * t138 - 0.4e1 * t1657 * t360 * t195 - 0.4e1 * t1661 * t676 * t195 + 0.4e1 * t1666 * t58 * t26 * t353 - 0.4e1 * t1671 * t929 * t26 * t3 + 0.4e1 * t1675 * t132 * t195 + 0.4e1 * t1681 * t648 * t26 * t195;
  t1687 = cos(t1045);
  t1691 = sin(t1033);
  t1695 = cos(t768);
  t1699 = sin(t756);
  t1703 = sin(t361);
  t1707 = cos(t994);
  t1711 = t129 + t187 + t130;
  t1713 = sin(t1364);
  t1718 = cos(t921);
  t1723 = sin(t1317);
  t1727 = cos(t1382);
  t1731 = sin(t936);
  t1736 = sin(t792);
  t1740 = sin(t1414);
  t1745 = cos(t1680);
  t1749 = cos(t1166);
  t1754 = cos(t145);
  t1758 = sin(t198);
  t1763 = cos(t1524);
  t1767 = sin(t1394);
  t1771 = 0.4e1 * t1687 * t58 * t705 * t60 + 0.4e1 * t1691 * t1643 * t218 - 0.4e1 * t1695 * t241 * t138 - 0.4e1 * t1699 * t611 * t175 + 0.4e1 * t1703 * t1353 * t3 - 0.4e1 * t1707 * t935 * t175 + 0.4e1 * t1713 * t58 * t1711 * t26 - 0.4e1 * t1718 * t985 * t6 * t40 + 0.8e1 * t1723 * t1343 * t6 * t175 + 0.4e1 * t1727 * t1139 * t40 - 0.4e1 * t1731 * t993 * t300 - 0.4e1 * t1736 * t58 * t6 * t1711 + 0.8e1 * t1740 * t1633 * t587 - 0.4e1 * t1745 * t131 * t26 * t195 + 0.4e1 * t1749 * t1648 * t218 - 0.4e1 * t1754 * t1031 * t60 * t138 + 0.4e1 * t1758 * t681 * t195 - 0.4e1 * t1763 * t24 * t6 * t1568 - 0.8e1 * t1767 * t533 * t1392;
  dgrad_det_JacA_phie_dt(1,1) = t174 + t306 + t423 + t558 + t686 + t806 + t918 + 0.4e1 * t1009 + t1134 + 0.4e1 * t1214 + t1305 + t1399 + t1505 + t1599 + t1685 + t1771;
  cg = dgrad_det_JacA_phie_dt;
