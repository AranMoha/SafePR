function grad_det_JacA_phi_3RRRreturn = grad_det_JacA_phi_3RRR(qj_rad, xEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_rad, beta_rad)
  grad_det_JacA_phie = [0;];
  t1 = qj_rad(7);
  t2 = psi_rad(3);
  t3 = t1 + t2;
  t4 = cos(t3);
  t5 = xEE(6);
  t6 = psi_rad(1);
  t7 = beta_rad(1);
  t8 = -t5 + t6 - t7;
  t9 = sin(t8);
  t10 = t9 * t4;
  t11 = l_all_id(5);
  t13 = r_fixPlat_j(1);
  t14 = r_mobPlat_j(1);
  t15 = t14 * t13;
  t16 = xEE(2);
  t17 = t16 * t15;
  t19 = qj_rad(4);
  t20 = psi_rad(2);
  t21 = t19 + t20;
  t22 = cos(t21);
  t23 = beta_rad(3);
  t24 = -t5 + t2 - t23;
  t25 = sin(t24);
  t26 = t25 * t22;
  t27 = l_all_id(3);
  t29 = r_fixPlat_j(3);
  t30 = r_mobPlat_j(3);
  t31 = t30 * t29;
  t32 = t31 * t16;
  t37 = cos(t2);
  t38 = t9 * t37;
  t40 = t14 * t29;
  t41 = xEE(1);
  t42 = t41 * t40;
  t44 = t5 + t7;
  t45 = sin(t44);
  t46 = beta_rad(2);
  t47 = -t5 + t20 - t46;
  t48 = sin(t47);
  t50 = r_fixPlat_j(2);
  t52 = r_mobPlat_j(2);
  t53 = t52 * t14;
  t54 = t41 * t53;
  t56 = sin(t2);
  t57 = t9 * t56;
  t59 = t16 * t40;
  t61 = t5 + t46;
  t62 = sin(t61);
  t66 = cos(t20);
  t69 = t14 * t50;
  t70 = t41 * t69;
  t72 = qj_rad(1);
  t73 = t72 + t6;
  t74 = sin(t73);
  t76 = l_all_id(1);
  t78 = t52 * t50;
  t79 = t41 * t78;
  t81 = cos(t73);
  t84 = t16 * t78;
  t88 = sin(t6);
  t92 = sin(t20);
  t95 = t16 * t69;
  t97 = cos(t61);
  t100 = t16 * t53;
  t102 = -t5 + t72 + t6 - t7;
  t103 = sin(t102);
  t107 = cos(t6);
  t108 = t107 * t25;
  t110 = t41 * t31;
  t117 = t30 * t52;
  t118 = t16 * t117;
  t120 = t5 + t23;
  t121 = sin(t120);
  t122 = t9 * t121;
  t124 = t30 * t14;
  t125 = t41 * t124;
  t127 = cos(t120);
  t128 = t103 * t127;
  t131 = -t5 + t19 + t20 - t46;
  t132 = sin(t131);
  t133 = t127 * t132;
  t135 = t41 * t117;
  t140 = t100 * t103 * t62 * t76 + t100 * t13 * t9 * t97 - t118 * t25 * t29 * t97 - t121 * t135 * t48 * t50 + t13 * t48 * t84 * t88 - t13 * t9 * t92 * t95 + t25 * t32 * t50 * t92 - t108 * t110 * t13 + t122 * t125 * t13 - t125 * t128 * t76 + t133 * t135 * t27;
  t149 = sin(t21);
  t150 = t25 * t149;
  t155 = t52 * t29;
  t156 = t41 * t155;
  t158 = sin(t3);
  t159 = t9 * t158;
  t161 = t41 * t15;
  t163 = -t5 + t1 + t2 - t23;
  t164 = sin(t163);
  t168 = cos(t131);
  t172 = cos(t44);
  t173 = cos(t47);
  t177 = cos(t102);
  t178 = t177 * t56;
  t181 = t168 * t56;
  t183 = t16 * t155;
  t187 = t52 * t27;
  t190 = t54 * t76 * t97 * t103 + t79 * t13 * t48 * t107 - t110 * t27 * t150 - t156 * t50 * t48 * t37 - t161 * t11 * t159 - t118 * t11 * t62 * t164 + t54 * t27 * t168 * t45 + t54 * t50 * t173 * t172 + t59 * t76 * t178 - t183 * t27 * t181 - t41 * t187 * t76 * t168 * t74;
  t194 = t41 * t52;
  t195 = t16 * t194;
  t199 = t52 * t13;
  t205 = t172 * t22;
  t207 = t41 * t14;
  t208 = t16 * t207;
  t210 = cos(t8);
  t220 = cos(t24);
  t227 = t74 * t25;
  t230 = t164 * t172;
  t233 = t16 * t168 * t199 * t27 * t88 - t100 * t13 * t210 * t62 + t100 * t177 * t76 * t97 + t118 * t220 * t29 * t62 - t13 * t195 * t88 * t97 - t177 * t76 * t92 * t95 + t195 * t29 * t56 * t97 + t195 * t62 * t74 * t76 + t11 * t125 * t230 + t110 * t227 * t76 + t205 * t208 * t27;
  t237 = t25 * t45;
  t243 = t45 * t37;
  t246 = t168 * t127;
  t271 = t16 * t168 * t187 * t76 * t81 + t100 * t173 * t45 * t50 - t118 * t121 * t173 * t50 - t13 * t210 * t54 * t97 - t149 * t208 * t27 * t45 + t172 * t208 * t50 * t92 - t195 * t76 * t81 * t97 + t208 * t45 * t50 * t66 + t118 * t246 * t27 - t125 * t237 * t29 - t208 * t243 * t29;
  t275 = t14 * t27;
  t278 = t56 * t172;
  t281 = t4 * t172;
  t287 = t81 * t127;
  t289 = t41 * t30;
  t290 = t16 * t289;
  t292 = cos(t163);
  t293 = t88 * t292;
  t295 = t30 * t13;
  t303 = t30 * t50;
  t306 = t177 * t127;
  t308 = t16 * t124;
  t313 = t172 * t292;
  t316 = t11 * t292 * t303 * t41 * t66 + t149 * t177 * t275 * t41 * t76 + t11 * t135 * t292 * t62 - t11 * t158 * t195 * t62 - t11 * t16 * t293 * t295 + t135 * t220 * t29 * t97 - t11 * t208 * t281 + t11 * t308 * t313 - t208 * t278 * t29 + t287 * t290 * t76 - t306 * t308 * t76;
  t319 = t81 * t292;
  t321 = t30 * t11;
  t322 = t16 * t321;
  t324 = t168 * t4;
  t326 = t52 * t11;
  t332 = t210 * t121;
  t341 = t210 * t127;
  t344 = t177 * t121;
  t350 = t45 * t220;
  t353 = t168 * t121;
  t356 = t11 * t195 * t4 * t97 - t121 * t290 * t50 * t66 - t127 * t290 * t50 * t92 - t16 * t27 * t324 * t326 - t183 * t48 * t50 * t56 + t125 * t13 * t341 + t125 * t344 * t76 + t13 * t308 * t332 - t135 * t27 * t353 - t29 * t308 * t350 - t319 * t322 * t76;
  t358 = t88 * t127;
  t380 = t292 * t149;
  t382 = t41 * t321;
  t384 = t121 * t149;
  t387 = t168 * t37;
  t390 = t177 * t158;
  t392 = t14 * t11;
  t395 = t107 * t168 * t199 * t27 * t41 - t100 * t168 * t172 * t27 - t107 * t13 * t195 * t62 - t127 * t135 * t173 * t50 - t177 * t54 * t62 * t76 - t177 * t66 * t70 * t76 - t390 * t392 * t41 * t76 + t13 * t290 * t358 - t156 * t27 * t387 + t27 * t290 * t384 - t27 * t380 * t382;
  t400 = t74 * t292;
  t403 = t107 * t292;
  t414 = t74 * t121;
  t417 = t107 * t121;
  t420 = t292 * t45;
  t423 = t220 * t172;
  t426 = t177 * t4;
  t430 = t292 * t22;
  t435 = t127 * t22;
  t442 = t177 * t37;
  t445 = t45 * t158;
  t451 = t168 * t158;
  t456 = t29 * t76;
  t457 = t53 * t456;
  t460 = t50 * t11;
  t461 = t16 * t14;
  t462 = t461 * t460;
  t464 = t172 * t149;
  t466 = t11 * t27;
  t467 = t207 * t466;
  t469 = t56 * t149;
  t471 = t29 * t27;
  t472 = t461 * t471;
  t474 = t45 * t4;
  t477 = -t290 * t27 * t435 - t16 * t275 * t76 * t177 * t22 + t42 * t76 * t442 + t208 * t11 * t445 + t195 * t29 * t62 * t37 + t41 * t326 * t27 * t451 + t457 * t97 * t442 - t462 * t92 * t445 + t467 * t4 * t464 + t472 * t45 * t469 - t462 * t66 * t474;
  t482 = t13 * t11;
  t483 = t53 * t482;
  t485 = t74 * t4;
  t487 = t27 * t76;
  t488 = t326 * t487;
  t491 = t29 * t50;
  t492 = t124 * t491;
  t494 = t88 * t37;
  t496 = t29 * t13;
  t497 = t16 * t52;
  t498 = t497 * t496;
  t500 = t172 * t158;
  t502 = t53 * t466;
  t505 = t11 * t76;
  t506 = t69 * t505;
  t509 = t199 * t466;
  t512 = t50 * t13;
  t513 = t124 * t512;
  t515 = t74 * t127;
  t517 = t117 * t487;
  t520 = t50 * t76;
  t521 = t117 * t520;
  t525 = t117 * t14 * t76;
  t527 = t210 * t4 * t483 * t97 - t107 * t324 * t509 + t168 * t485 * t488 + t168 * t500 * t502 - t168 * t515 * t517 + t173 * t414 * t521 - t306 * t525 * t62 + t332 * t513 * t66 + t423 * t492 * t92 + t426 * t506 * t66 - t494 * t498 * t62;
  t530 = t124 * t520;
  t533 = t13 * t27;
  t534 = t117 * t533;
  t536 = t127 * t149;
  t538 = t289 * t487;
  t541 = t289 * t533;
  t543 = t172 * t37;
  t545 = t53 * t471;
  t547 = t107 * t56;
  t549 = t194 * t496;
  t553 = t81 * t121;
  t555 = t16 * t30;
  t556 = t555 * t520;
  t558 = t88 * t121;
  t560 = t555 * t512;
  t563 = t461 * t491;
  t567 = t53 * t496;
  t569 = -t210 * t37 * t567 * t62 + t107 * t246 * t534 - t168 * t543 * t545 + t243 * t563 * t92 - t306 * t530 * t66 + t498 * t547 * t62 - t536 * t538 * t81 - t536 * t541 * t88 + t547 * t549 * t97 + t553 * t556 * t66 + t558 * t560 * t66;
  t574 = t40 * t520;
  t577 = t289 * t520;
  t581 = t158 * t22;
  t583 = t392 * t487;
  t586 = t321 * t487;
  t589 = t295 * t466;
  t591 = t81 * t25;
  t593 = t117 * t456;
  t595 = t107 * t127;
  t597 = t117 * t512;
  t605 = t107 * t430 * t589 - t133 * t534 * t88 + t177 * t581 * t583 - t344 * t530 * t92 - t430 * t586 * t74 - t442 * t574 * t92 + t48 * t521 * t553 + t48 * t558 * t597 + t48 * t595 * t597 + t515 * t577 * t92 - t591 * t593 * t62;
  t608 = t124 * t466;
  t610 = t45 * t22;
  t612 = t124 * t471;
  t614 = t37 * t22;
  t616 = t40 * t533;
  t619 = t31 * t487;
  t622 = t124 * t533;
  t625 = t124 * t487;
  t630 = t53 * t491;
  t632 = t107 * t4;
  t634 = t497 * t482;
  t637 = t53 * t460;
  t640 = t207 * t460;
  t642 = t103 * t384 * t625 + t132 * t278 * t545 - t164 * t205 * t608 - t173 * t281 * t637 + t25 * t610 * t612 - t26 * t619 * t74 - t281 * t640 * t66 - t48 * t543 * t630 + t536 * t622 * t9 - t614 * t616 * t9 + t62 * t632 * t634;
  t645 = t127 * t45;
  t647 = t117 * t275;
  t655 = t53 * t505;
  t658 = t303 * t505;
  t661 = t117 * t505;
  t663 = t74 * t56;
  t665 = t155 * t487;
  t668 = t194 * t456;
  t673 = t207 * t491;
  t677 = t158 * t210 * t483 * t62 - t107 * t435 * t541 + t168 * t645 * t647 + t168 * t663 * t665 + t390 * t506 * t92 - t390 * t655 * t97 - t400 * t658 * t92 + t400 * t661 * t97 - t500 * t640 * t92 + t543 * t673 * t92 - t663 * t668 * t97;
  t682 = t81 * t37;
  t684 = t497 * t456;
  t687 = t155 * t533;
  t692 = t497 * t505;
  t700 = t40 * t487;
  t703 = t461 * t466;
  t709 = t210 * t56 * t567 * t97 - t220 * t593 * t62 * t74 - t177 * t614 * t700 - t319 * t62 * t661 - t319 * t658 * t66 + t387 * t687 * t88 + t426 * t62 * t655 - t45 * t581 * t703 - t485 * t62 * t692 - t494 * t549 * t97 - t62 * t682 * t684;
  t716 = t117 * t482;
  t719 = t303 * t482;
  t753 = t289 * t512;
  t762 = t194 * t482;
  t764 = -t220 * t593 * t81 * t97 - t168 * t474 * t502 + t173 * t287 * t521 + t173 * t358 * t597 - t173 * t417 * t597 - t278 * t66 * t673 + t287 * t577 * t66 + t353 * t534 * t88 + t358 * t66 * t753 + t403 * t719 * t92 + t632 * t762 * t97;
  t774 = t207 * t471;
  t778 = t81 * t158;
  t782 = t194 * t505;
  t786 = t4 * t149;
  t791 = t88 * t158;
  t794 = -t168 * t488 * t778 - t173 * t445 * t637 - t177 * t469 * t700 - t177 * t583 * t786 - t341 * t513 * t92 + t344 * t525 * t97 + t45 * t703 * t786 + t464 * t56 * t774 - t595 * t753 * t92 + t62 * t634 * t791 + t778 * t782 * t97;
  t797 = t117 * t392;
  t800 = t124 * t460;
  t807 = t117 * t496;
  t809 = t172 * t121;
  t815 = t45 * t56;
  t826 = t107 * t220 * t62 * t807 + t149 * t220 * t45 * t612 - t220 * t807 * t88 * t97 + t132 * t281 * t502 - t158 * t205 * t467 - t168 * t647 * t809 + t205 * t37 * t774 + t313 * t62 * t797 + t313 * t66 * t800 - t48 * t630 * t815 - t563 * t66 * t815;
  t831 = t78 * t482;
  t838 = t15 * t466;
  t847 = t31 * t533;
  t852 = t117 * t15;
  t856 = -t122 * t513 * t92 + t122 * t852 * t97 + t128 * t530 * t92 - t150 * t172 * t612 + t150 * t619 * t81 + t150 * t847 * t88 - t469 * t616 * t9 + t48 * t500 * t637 - t48 * t632 * t831 - t48 * t791 * t831 - t786 * t838 * t9;
  t864 = t69 * t482;
  t873 = t117 * t40;
  t876 = t155 * t512;
  t881 = t31 * t520;
  t883 = t88 * t25;
  t886 = t103 * t37 * t457 * t62 + t10 * t483 * t62 + t10 * t66 * t864 + t132 * t445 * t502 + t159 * t864 * t92 + t237 * t492 * t92 - t237 * t873 * t97 + t48 * t494 * t876 + t581 * t838 * t9 - t591 * t66 * t881 - t62 * t807 * t883;
  t890 = t31 * t512;
  t892 = t45 * t164;
  t905 = t155 * t520;
  t910 = t172 * t25;
  t919 = -t103 * t457 * t56 * t97 - t107 * t164 * t62 * t716 + t164 * t661 * t81 * t97 + t164 * t716 * t88 * t97 - t451 * t509 * t88 + t48 * t663 * t905 + t492 * t66 * t910 + t62 * t692 * t778 + t62 * t873 * t910 + t66 * t800 * t892 - t66 * t883 * t890;
  t934 = t555 * t487;
  t937 = t555 * t533;
  t940 = t117 * t69;
  t942 = t9 * t127;
  t948 = t164 * t62 * t661 * t74 + t380 * t586 * t81 + t380 * t589 * t88 - t384 * t81 * t934 - t384 * t88 * t937 - t420 * t797 * t97 + t420 * t800 * t92 + t48 * t645 * t940 - t485 * t782 * t97 - t62 * t852 * t942 + t762 * t791 * t97;
  t963 = t40 * t512;
  t986 = t103 * t121;
  t989 = t132 * t121;
  t1001 = t16 ^ 2;
  t1004 = t1001 * t326 * t4 * t62 - t103 * t4 * t655 * t97 + t107 * t534 * t989 - t132 * t243 * t545 - t132 * t414 * t517 + t38 * t567 * t97 - t38 * t92 * t963 - t48 * t515 * t521 - t48 * t547 * t876 - t513 * t66 * t942 - t530 * t66 * t986;
  t1008 = t52 * t76;
  t1009 = t41 ^ 2;
  t1015 = t30 * t27;
  t1024 = t30 * t76;
  t1041 = -t100 * t132 * t27 * t45 - t100 * t172 * t48 * t50 + t1008 * t1009 * t74 * t97 - t1009 * t107 * t199 * t97 + t1009 * t155 * t37 * t97 - t1009 * t158 * t326 * t97 + t118 * t127 * t48 * t50 + t149 * t161 * t27 * t9 + t1001 * t1024 * t553 + t1009 * t1015 * t536 + t118 * t27 * t989;
  t1071 = -t11 * t135 * t164 * t97 + t11 * t158 * t48 * t79 - t11 * t4 * t48 * t84 + t110 * t25 * t50 * t66 - t132 * t172 * t27 * t54 + t135 * t25 * t29 * t62 + t11 * t308 * t892 - t13 * t308 * t942 - t13 * t32 * t883 - t308 * t76 * t986 - t32 * t591 * t76;
  t1079 = t121 * t22;
  t1092 = t78 * t505;
  t1100 = -t149 * t164 * t45 * t608 + t103 * t435 * t625 + t107 * t26 * t847 - t1079 * t622 * t9 + t1092 * t48 * t485 - t1092 * t48 * t778 - t132 * t287 * t517 - t230 * t800 * t92 + t29 * t308 * t910 + t292 * t608 * t610 - t48 * t809 * t940;
  t1124 = -t107 * t1079 * t937 + t1079 * t74 * t934 - t168 * t545 * t815 + t168 * t665 * t682 + t173 * t243 * t630 - t173 * t278 * t630 + t177 * t536 * t625 + t205 * t220 * t612 - t210 * t384 * t622 + t45 * t472 * t614 - t668 * t682 * t97;
  t1150 = -t1001 * t121 * t303 * t92 - t1001 * t1015 * t1079 + t1001 * t275 * t610 - t1009 * t1024 * t515 + t1009 * t392 * t500 - t1009 * t40 * t543 - t1079 * t177 * t625 + t168 * t517 * t553 - t172 * t380 * t608 - t210 * t435 * t622 + t435 * t538 * t74;
  t1180 = -t1001 * t1008 * t62 * t81 + t1001 * t155 * t56 * t62 - t1001 * t199 * t62 * t88 + t1001 * t45 * t69 * t92 - t1009 * t127 * t303 * t66 + t1009 * t172 * t66 * t69 + t1001 * t295 * t558 - t1001 * t392 * t474 - t1001 * t40 * t815 - t1009 * t275 * t464 + t1009 * t295 * t595;
  grad_det_JacA_phie(1,1) = 0.8e1 * t1004 + 0.8e1 * t140 + 0.8e1 * t1180 + 0.8e1 * t1124 + 0.8e1 * t1150 + 0.8e1 * t1071 + 0.8e1 * t1100 + 0.8e1 * t1041 + 0.8e1 * t856 + 0.8e1 * t190 + 0.8e1 * t316 + 0.8e1 * t677 + 0.8e1 * t709 + 0.8e1 * t948 + 0.8e1 * t233 + 0.8e1 * t271 + 0.8e1 * t356 + 0.8e1 * t395 + 0.8e1 * t477 + 0.8e1 * t527 + 0.8e1 * t569 + 0.8e1 * t605 + 0.8e1 * t642 + 0.8e1 * t764 + 0.8e1 * t794 + 0.8e1 * t826 + 0.8e1 * t886 + 0.8e1 * t919 - 0.8e1 * t655 * t62 * t103 * t158 - 0.8e1 * t17 * t27 * t9 * t22 + 0.8e1 * t54 * t50 * t48 * t45 - 0.8e1 * t54 * t13 * t62 * t9 - 0.8e1 * t70 * t13 * t66 * t9 - 0.8e1 * t79 * t76 * t48 * t74 + 0.8e1 * t84 * t76 * t48 * t81 - 0.8e1 * t41 * t295 * t11 * t403 - 0.8e1 * t118 * t11 * t97 * t292 + 0.8e1 * t16 * t392 * t76 * t426 - 0.8e1 * t637 * t48 * t474 - 0.8e1 * t483 * t97 * t159 + 0.8e1 * t567 * t62 * t57 + 0.8e1 * t963 * t66 * t57 - 0.8e1 * t881 * t92 * t227 + 0.8e1 * t593 * t97 * t227 + 0.8e1 * t890 * t92 * t108 - 0.8e1 * t807 * t97 * t108 + 0.8e1 * t905 * t48 * t682 + 0.8e1 * t17 * t11 * t10 + 0.8e1 * t32 * t27 * t26 + 0.8e1 * t42 * t13 * t38 + 0.8e1 * t59 * t13 * t57 + 0.8e1 * t382 * t76 * t400 - 0.8e1 * t290 * t76 * t414 + 0.8e1 * t290 * t13 * t417 - 0.8e1 * t125 * t11 * t420 - 0.8e1 * t125 * t29 * t423 + 0.8e1 * t322 * t27 * t430 - 0.8e1 * t716 * t62 * t293 - 0.8e1 * t719 * t66 * t293 - 0.8e1 * t716 * t97 * t403 + 0.8e1 * t556 * t92 * t414 - 0.8e1 * t560 * t92 * t417 - 0.8e1 * t684 * t62 * t663 + 0.8e1 * t457 * t62 * t178 + 0.8e1 * t574 * t66 * t178 - 0.8e1 * t687 * t107 * t181 - 0.8e1 * t492 * t66 * t350 + 0.8e1 * t16 * t303 * t11 * t92 * t292;
  grad_det_JacA_phi_3RRRreturn = grad_det_JacA_phie;