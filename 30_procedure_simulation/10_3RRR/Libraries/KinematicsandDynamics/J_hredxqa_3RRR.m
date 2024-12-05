function J_hredxqa_3RRRreturn = J_hredxqa_3RRR(qj_rad, xEE, l_all, r_BasisPla_MobPla)
  J_hredxqa = [0 0 0; 0 0 0; 0 0 0;];
  t1 = r_BasisPla_MobPla(2);
  t2 = l_all(1);
  t3 = sqrt(0.3e1);
  t4 = xEE(2);
  t5 = t4 * t3;
  t6 = xEE(1);
  t7 = r_BasisPla_MobPla(1);
  t8 = 2 * t7;
  t9 = t5 - t6 - t8;
  t10 = t9 * t2;
  t11 = qj_rad(4);
  t12 = qj_rad(1);
  t13 = t11 + t12;
  t14 = sin(t13);
  t16 = t5 + t6 + t8;
  t17 = t16 * t2;
  t18 = qj_rad(7);
  t19 = t18 + t12;
  t20 = sin(t19);
  t22 = t3 * t6;
  t23 = t22 + t4;
  t24 = t23 * t2;
  t25 = cos(t13);
  t27 = t22 - t4;
  t28 = t27 * t2;
  t29 = cos(t19);
  t34 = sin(t12);
  t36 = cos(t12);
  t44 = t7 * t3;
  t45 = t6 - t7;
  t46 = t45 * t1;
  t47 = xEE(6);
  t48 = 2 * t47;
  t49 = t48 + t12;
  t50 = sin(t49);
  t54 = t6 + t7;
  t56 = -t48 + t12;
  t57 = cos(t56);
  t61 = t4 * t1;
  t62 = cos(t49);
  t66 = t2 ^ 2;
  t67 = t5 + t6 - t7;
  t68 = t67 * t66;
  t69 = t47 - t11 + t18 + t12;
  t70 = cos(t69);
  t72 = t5 - t6 + t7;
  t73 = t72 * t66;
  t74 = -t47 + t11 - t18 + t12;
  t75 = cos(t74);
  t77 = t7 ^ 2;
  t78 = t77 * t7;
  t79 = 2 * t78;
  t80 = t6 * t77;
  t81 = t6 ^ 2;
  t82 = t4 ^ 2;
  t83 = t1 ^ 2;
  t84 = t81 + t82 - t83;
  t85 = t7 * t84;
  t86 = t82 * t6;
  t87 = 0.4e1 * t86;
  t90 = t12 + t47;
  t91 = sin(t90);
  t94 = t4 * t44;
  t95 = 0.2e1 * t81;
  t96 = t6 * t7;
  t97 = 0.2e1 * t82;
  t99 = (t94 + t95 - t96 - t97 - t77) * t2;
  t100 = t12 + t47 + t18;
  t101 = sin(t100);
  t104 = t3 * t45 * t7;
  t108 = 0.4e1 * (t6 - t7 / 0.4e1) * t4;
  t110 = t2 * (t104 + t108);
  t111 = t12 + t47 + t11;
  t112 = cos(t111);
  t115 = t2 * (-t108 + t104);
  t116 = cos(t100);
  t119 = (t94 - t95 + t96 + t97 + t77) * t2;
  t120 = sin(t111);
  t122 = t3 * t45;
  t123 = t122 - t4;
  t124 = t123 * t66;
  t125 = sin(t69);
  t127 = t122 + t4;
  t128 = t66 * t127;
  t129 = t47 + t11 - t18 + t12;
  t130 = sin(t129);
  t132 = 0.2e1 * t96;
  t133 = 3 * t77;
  t135 = t3 * (t81 + t132 + t82 - t133 - t83);
  t136 = t45 * t4;
  t137 = 0.4e1 * t136;
  t140 = t12 - t47 + t11;
  t141 = cos(t140);
  t144 = t3 * (t96 - t77 + t83);
  t145 = t4 * t7;
  t146 = 0.3e1 * t145;
  t148 = t2 * (t144 - t146);
  t149 = t12 - t47 - t11;
  t150 = cos(t149);
  t153 = (t144 + t146) * t2;
  t154 = t12 - t47 - t18;
  t155 = cos(t154);
  t157 = (t14 * t10 + t20 * t17 + t25 * t24 + t29 * t28 - 0.6e1 * t7 * t3 * (t34 * (-t6 / 0.3e1 - 0.2e1 / 0.3e1 * t7) + t4 * t36)) * t1 - 0.2e1 * t50 * t46 * t44 - 0.4e1 * t57 * t54 * t1 * t5 + 0.2e1 * t62 * t61 * t44 - t70 * t68 + t75 * t73 + 0.2e1 * t91 * t3 * (-t79 + t80 + t85 - t87) + t101 * t99 + t112 * t110 + t116 * t115 + t120 * t119 + t125 * t124 + t130 * t128 - t141 * t2 * (t135 + t137) + t150 * t148 + t155 * t153;
  t158 = cos(t129);
  t160 = -t47 - t11 + t18 + t12;
  t161 = cos(t160);
  t164 = t3 * t54 * t4;
  t165 = t81 / 0.2e1;
  t166 = 0.5e1 / 0.2e1 * t82;
  t167 = t77 / 0.2e1;
  t168 = t83 / 0.2e1;
  t171 = t12 + t47 - t18;
  t172 = sin(t171);
  t177 = t12 - t47 + t18;
  t178 = cos(t177);
  t182 = t12 + t47 - t11;
  t183 = sin(t182);
  t187 = t3 * (t81 + t132 - t82 - t133 - t83);
  t188 = 0.6e1 * t136;
  t191 = cos(t182);
  t195 = cos(t171);
  t197 = t1 * t66;
  t198 = t12 - t48 - t18 + t11;
  t199 = cos(t198);
  t200 = t199 * t197;
  t201 = t12 - t48 + t18 - t11;
  t202 = cos(t201);
  t203 = t202 * t197;
  t204 = t12 + t18 - t11;
  t205 = cos(t204);
  t206 = t205 * t197;
  t207 = t12 - t18 + t11;
  t208 = cos(t207);
  t209 = t208 * t197;
  t211 = (t94 - t95 + t96 - t97 + t77 + t83) * t2;
  t212 = sin(t154);
  t214 = sin(t160);
  t216 = t81 / 0.4e1;
  t217 = t96 / 0.2e1;
  t218 = 0.5e1 / 0.4e1 * t82;
  t219 = t77 / 0.4e1;
  t220 = t83 / 0.4e1;
  t223 = sin(t140);
  t228 = sin(t177);
  t232 = (t94 + t95 - t96 + t97 - t77 - t83) * t2;
  t233 = sin(t149);
  t235 = sin(t74);
  t237 = -t158 * t73 + t161 * t68 - 0.2e1 * t172 * t2 * (t164 + t165 - t96 - t166 + t167 + t168) - t178 * (t135 - t137) * t2 - 0.2e1 * t183 * t2 * (t164 - t165 + t96 + t166 - t167 - t168) - t191 * t2 * (t187 + t188) - t195 * (t187 - t188) * t2 - t200 + t203 - t206 + t209 + t212 * t211 - t214 * t124 - 0.4e1 * t223 * t2 * (t94 + t216 - t217 + t218 + t219 - t220) - 0.4e1 * t228 * t2 * (t94 - t216 + t217 - t218 - t219 + t220) + t233 * t232 - t235 * t128;
  t239 = t83 * t2;
  t240 = 3 * t47;
  t241 = t12 - t240 + t18;
  t242 = sin(t241);
  t243 = t242 * t239;
  t244 = -t240 + t11 + t12;
  t245 = sin(t244);
  t246 = t245 * t239;
  t247 = t1 * t127;
  t248 = -t18 + t48 + t12;
  t249 = cos(t248);
  t252 = t1 * t2;
  t253 = t44 - t4;
  t254 = -t18 + t12;
  t255 = cos(t254);
  t259 = sin(t248);
  t262 = t44 + t4;
  t263 = -t11 + t12;
  t264 = cos(t263);
  t268 = t48 - t11 + t12;
  t269 = cos(t268);
  t272 = 0.2e1 * t4;
  t273 = t44 - t272;
  t274 = -t18 - t48 + t12;
  t275 = cos(t274);
  t278 = t44 + t272;
  t279 = -t48 - t11 + t12;
  t280 = cos(t279);
  t283 = -t48 + t11 + t12;
  t284 = cos(t283);
  t288 = t3 * t66;
  t289 = t47 - t11 - t18 + t12;
  t290 = sin(t289);
  t294 = t18 - t48 + t12;
  t295 = cos(t294);
  t299 = -t47 + t11 + t18 + t12;
  t300 = sin(t299);
  t304 = 0.3e1 / 0.2e1 * t77;
  t305 = t82 - t304;
  t307 = sin(t56);
  t311 = 0.3e1 * t82;
  t312 = 2 * t77;
  t313 = t81 + t96 + t311 - t312;
  t314 = t12 - t47;
  t315 = sin(t314);
  t319 = t7 / 0.2e1;
  t320 = t6 + t319;
  t321 = t320 * t1;
  t322 = sin(t274);
  t325 = 0.2e1 * t322 * t2 * t321;
  t326 = t243 - t246 + t249 * t2 * t247 - 0.4e1 * t255 * t253 * t252 + t259 * t72 * t252 - 0.4e1 * t264 * t262 * t252 + t269 * t123 * t252 + t275 * t273 * t252 + t280 * t278 * t252 - 0.4e1 * t284 * t262 * t252 - 0.2e1 * t290 * t45 * t288 - 0.4e1 * t295 * t253 * t252 + 0.2e1 * t300 * t45 * t288 + 0.4e1 * t307 * t3 * t305 * t1 - 0.2e1 * t315 * t313 * t44 - t325;
  t327 = sin(t279);
  t330 = 0.2e1 * t327 * t2 * t321;
  t331 = sin(t283);
  t335 = sin(t294);
  t339 = sin(t201);
  t341 = t339 * t1 * t288;
  t342 = sin(t198);
  t344 = t342 * t1 * t288;
  t345 = t12 - t48 + t18 + t11;
  t346 = sin(t345);
  t348 = t346 * t1 * t288;
  t350 = t12 - t240;
  t351 = sin(t350);
  t355 = t2 * t3;
  t356 = cos(t241);
  t358 = t356 * t83 * t355;
  t360 = cos(t90);
  t364 = sin(t268);
  t367 = cos(t244);
  t369 = t367 * t83 * t355;
  t370 = cos(t299);
  t374 = cos(t289);
  t378 = sin(t204);
  t380 = t378 * t1 * t288;
  t381 = t12 - t18 - t11;
  t382 = sin(t381);
  t384 = t382 * t1 * t288;
  t386 = sin(t207);
  t388 = t386 * t1 * t288;
  t391 = cos(t314);
  t395 = t330 + 0.2e1 * t331 * t72 * t252 + 0.2e1 * t335 * t67 * t252 - t341 - t344 + 0.2e1 * t348 + 0.2e1 * t351 * t83 * t44 + t358 - 0.4e1 * t360 * (t81 - t82 + t167) * t5 + t364 * t67 * t252 + t369 - 0.2e1 * t370 * t4 * t288 + 0.2e1 * t374 * t4 * t288 + t380 - 0.2e1 * t384 + t388 - 0.4e1 * t391 * t3 * (t81 - t96 + t82 - t304 - t83) * t4;
  t399 = t18 - t47 + t11;
  t400 = cos(t399);
  t402 = t400 * t4 * t288;
  t403 = 0.4e1 * t402;
  t404 = t2 * t320;
  t408 = t6 + t8;
  t411 = t57 * t408 * t1 * t355;
  t412 = 0.4e1 * t411;
  t414 = t307 * t61 * t355;
  t415 = 0.4e1 * t414;
  t417 = t66 * t2 * t3;
  t418 = t75 * t417;
  t419 = 0.4e1 * t418;
  t420 = t374 * t417;
  t421 = 0.4e1 * t420;
  t422 = t161 * t417;
  t423 = 0.4e1 * t422;
  t424 = t320 * t4;
  t425 = t3 * t424;
  t426 = 0.3e1 / 0.2e1 * t81;
  t427 = 0.3e1 / 0.2e1 * t96;
  t428 = 0.3e1 / 0.2e1 * t82;
  t431 = t47 + t11;
  t432 = sin(t431);
  t433 = t432 * t2 * (t425 - t426 + t427 + t428);
  t434 = 0.4e1 * t433;
  t436 = t3 * (t81 + t96 - t82 - t312);
  t437 = t6 - t319;
  t438 = t437 * t4;
  t439 = 0.6e1 * t438;
  t442 = cos(t431);
  t443 = t442 * t2 * (t436 + t439);
  t444 = 0.2e1 * t443;
  t447 = t18 + t47;
  t448 = cos(t447);
  t449 = t448 * (t436 - t439) * t2;
  t450 = 0.2e1 * t449;
  t452 = t3 * (t81 + t96 + t82 - t312 - t83);
  t453 = t452 - t146;
  t455 = -t47 + t11;
  t456 = cos(t455);
  t457 = t456 * t2 * t453;
  t458 = 0.4e1 * t457;
  t459 = t452 + t146;
  t461 = -t47 + t18;
  t462 = cos(t461);
  t463 = t462 * t2 * t459;
  t464 = 0.4e1 * t463;
  t465 = t3 * t408;
  t466 = 0.3e1 * t4;
  t468 = t66 * (t465 + t466);
  t469 = t183 * t468;
  t470 = 0.2e1 * t469;
  t472 = t66 * (t465 - t466);
  t473 = t172 * t472;
  t474 = 0.2e1 * t473;
  t475 = 0.3e1 * t6;
  t476 = t5 - t475;
  t477 = t476 * t66;
  t478 = t191 * t477;
  t479 = 0.2e1 * t478;
  t480 = t5 + t475;
  t481 = t480 * t66;
  t482 = t195 * t481;
  t483 = 0.2e1 * t482;
  t484 = t150 * t477;
  t485 = 0.2e1 * t484;
  t486 = t155 * t481;
  t487 = 0.2e1 * t486;
  t488 = t141 * t477;
  t489 = 0.2e1 * t488;
  t490 = t178 * t481;
  t491 = 0.2e1 * t490;
  t492 = -0.8e1 * t404 * t5 * t91 - t403 - t412 + t415 + t419 + t421 + t423 + t434 + t444 + t450 - t458 - t464 - t470 - t474 + t479 + t483 + t485 + t487 + t489 + t491;
  t493 = t1 * t7;
  t494 = sin(t48);
  t496 = sin(t47);
  t497 = t81 + t82 - t77 - t83;
  t499 = t493 * t494 + t496 * t497;
  t504 = sin(t447);
  t505 = t504 * t2 * (t425 + t426 - t427 - t428);
  t506 = 0.4e1 * t505;
  t507 = t233 * t468;
  t508 = 0.2e1 * t507;
  t509 = t212 * t472;
  t510 = 0.2e1 * t509;
  t511 = t223 * t468;
  t512 = 0.2e1 * t511;
  t513 = t228 * t472;
  t514 = 0.2e1 * t513;
  t515 = t11 - t48;
  t516 = sin(t515);
  t518 = t516 * t480 * t252;
  t519 = 0.2e1 * t518;
  t520 = -t18 - t47 + t11;
  t521 = sin(t520);
  t523 = t521 * t45 * t288;
  t524 = 0.4e1 * t523;
  t525 = t18 - t48;
  t526 = sin(t525);
  t528 = t526 * t476 * t252;
  t529 = 0.2e1 * t528;
  t530 = sin(t399);
  t532 = t530 * t45 * t288;
  t533 = 0.4e1 * t532;
  t535 = t335 * t1 * t288;
  t536 = 0.4e1 * t535;
  t537 = -t48 + t11 + t18;
  t538 = sin(t537);
  t540 = t538 * t1 * t288;
  t541 = 0.4e1 * t540;
  t543 = t331 * t1 * t288;
  t544 = 0.4e1 * t543;
  t547 = t3 * (t6 - (4 * t7));
  t550 = cos(t525);
  t552 = t550 * t2 * (t547 + t466) * t1;
  t553 = 0.2e1 * t552;
  t554 = -t18 + t47 + t11;
  t555 = sin(t554);
  t557 = t555 * t45 * t288;
  t558 = 0.4e1 * t557;
  t560 = t391 * (t81 - t132 + t82 - t312 - t83);
  t561 = t560 * t355;
  t562 = 0.4e1 * t561;
  t563 = t81 + t96 - t82 + t77;
  t565 = t360 * t563 * t355;
  t566 = 0.4e1 * t565;
  t569 = cos(t515);
  t571 = t569 * t2 * (t547 - t466) * t1;
  t572 = 0.2e1 * t571;
  t573 = cos(t520);
  t575 = t573 * t4 * t288;
  t576 = 0.4e1 * t575;
  t577 = cos(t554);
  t579 = t577 * t4 * t288;
  t580 = 0.4e1 * t579;
  t581 = 0.12e2 * t44 * t499 + t506 + t508 + t510 - t512 - t514 - t519 - t524 - t529 + t533 + t536 + t541 + t544 + t553 + t558 - t562 - t566 + t572 - t576 - t580;
  J_hredxqa(1,1) = -0.1e1 / (t492 + t581) * t2 * (t157 + t237 + t326 + t395);
  t585 = t81 + t132 + t82 - t83;
  t591 = t48 + t11 - t18;
  t592 = sin(t591);
  t595 = -t48 + t11 - t18;
  t596 = cos(t595);
  t601 = t81 + t82 - t77;
  t604 = 0.4e1 * t4;
  t605 = t44 - t604;
  t606 = cos(t537);
  t609 = 0.4e1 / 0.3e1 * t4;
  t611 = (t44 + t609) * t1;
  t612 = t284 * t2;
  t619 = cos(t591);
  t622 = t11 - t18;
  t623 = cos(t622);
  t626 = 3 * t7;
  t627 = t5 - t475 - t626;
  t628 = t11 + t48;
  t629 = cos(t628);
  t632 = t122 + t466;
  t633 = t632 * t1;
  t634 = sin(t628);
  t637 = t264 * t2;
  t640 = t7 * t2;
  t641 = sin(t263);
  t645 = -t240 + t11;
  t646 = sin(t645);
  t649 = t191 * t585 * t355 - 0.4e1 * t112 * t2 * t424 - t592 * t9 * t252 + t596 * t123 * t252 - t364 * t16 * t252 - t573 * t601 * t355 + t606 * t605 * t252 + 0.3e1 * t612 * t611 - t269 * t27 * t252 + t280 * t273 * t252 - t619 * t23 * t252 + t623 * t605 * t252 - t629 * t627 * t493 + t634 * t7 * t633 + 0.3e1 * t637 * t611 + 0.3e1 * t641 * t1 * t640 - t646 * t83 * t44;
  t650 = t3 * t320;
  t654 = sin(t595);
  t657 = t5 - t6 - t319;
  t659 = t538 * t2;
  t663 = (t5 + t6 + t319) * t1;
  t664 = t331 * t2;
  t667 = sin(t622);
  t670 = 0.3e1 * t667 * t1 * t640;
  t675 = 0.4e1 * t3 * (t81 + t217 + t82 - 0.3e1 / 0.4e1 * t77 - t83) * t4;
  t676 = 0.2e1 * t83;
  t679 = 0.3e1 * (t81 - t96 - t82 - t676) * t7;
  t682 = t4 * t81;
  t684 = t82 * t4;
  t686 = t77 * t4;
  t688 = t3 * (0.2e1 * t682 - 0.2e1 * t684 + t686);
  t689 = 0.3e1 * t80;
  t690 = 0.3e1 * t84;
  t691 = t7 * t690;
  t692 = 0.12e2 * t86;
  t695 = t2 * t127;
  t697 = t72 * t2;
  t699 = t278 * t2;
  t700 = t11 + t18;
  t701 = cos(t700);
  t703 = sin(t700);
  t705 = 0.2e1 * t703 * t404;
  t706 = cos(t11);
  t707 = t4 * t706;
  t708 = sin(t11);
  t714 = t708 * t4;
  t722 = t83 * t7;
  t723 = cos(t645);
  t726 = t12 + t48 - t18 - t11;
  t727 = cos(t726);
  t729 = 0.2e1 * t727 * t197;
  t730 = cos(t345);
  t732 = 0.3e1 * t730 * t197;
  t733 = cos(t381);
  t734 = t733 * t197;
  t735 = 0.3e1 / 0.2e1 * t7;
  t737 = t66 * (t5 - t735);
  t740 = 0.2e1 * t214 * t66 * t650 - t654 * t67 * t252 + 0.2e1 * t659 * t657 * t1 + 0.2e1 * t664 * t663 - t670 + t456 * (-t675 - t679) + t442 * (t688 - t689 + t691 + t692) - (t25 * t695 + t14 * t697 + t701 * t699 - t705 + 0.3e1 * (t3 * (t707 + t408 * t708 / 0.3e1) + t706 * t408 + t714) * t7) * t1 + t200 + 0.3e1 * t206 + 0.2e1 * t209 + t246 - 0.3e1 * t723 * t722 + t729 + t732 + t734 + 0.2e1 * t161 * t737;
  t742 = t23 * t66;
  t745 = t3 * (t81 + t96 + t311 - t312 - t83);
  t746 = 0.2e1 * t424;
  t750 = t6 - t8;
  t752 = t3 * t750 * t4;
  t757 = t9 * t66;
  t759 = t66 * t320;
  t760 = -t47 - t11 - t18 + t12;
  t761 = cos(t760);
  t763 = 0.2e1 * t761 * t759;
  t766 = t3 * (t96 - t97 - t77);
  t770 = 0.2e1 * (t6 + 0.7e1 / 0.2e1 * t7) * t4;
  t774 = t18 + t47 + t11;
  t775 = sin(t774);
  t777 = cos(t774);
  t779 = t563 * t2;
  t782 = t4 * t22;
  t783 = t82 / 0.4e1;
  t789 = t3 * (t81 - t311 - t77);
  t790 = 0.6e1 * t145;
  t795 = t3 * (t96 - t97 + t312 + t83);
  t796 = 0.6e1 * t424;
  t801 = (t81 - t132 + t82 - t312 + t83) * t2;
  t803 = t627 * t66;
  t807 = t290 * t742 + t141 * t2 * (t745 - t746) + 0.2e1 * t569 * t1 * (t752 - t311 + t304) + t158 * t757 - t763 - t130 * t742 + t400 * (t766 + t770) * t2 - t775 * t99 - t777 * t115 + 0.2e1 * t120 * t779 + 0.4e1 * t555 * t2 * (t782 + t216 - t217 + t783 + t219 - t168) + t577 * t2 * (t789 + t790) - t150 * t2 * (t795 + t796) - t183 * t801 + t370 * t803 + t75 * t68 + t374 * t757;
  t808 = t11 + t18 - t240;
  t809 = sin(t808);
  t811 = 0.2e1 * t809 * t239;
  t812 = t3 * t54;
  t813 = t812 - t4;
  t814 = t66 * t813;
  t816 = 0.5e1 / 0.2e1 * t96;
  t817 = t82 / 0.2e1;
  t822 = t3 * t438;
  t827 = t3 * t305;
  t828 = t4 * t6;
  t829 = 0.3e1 * t828;
  t834 = t3 * t313;
  t837 = sin(t455);
  t839 = t273 * t66;
  t840 = sin(t760);
  t847 = t2 * (t94 - t165 + t96 - t817 - t167 + t83);
  t850 = t66 * t632;
  t852 = -t84;
  t855 = t3 * (t7 * t852 + t79 - t80 + t87);
  t856 = 0.6e1 * t682;
  t857 = 0.6e1 * t684;
  t858 = 0.3e1 * t686;
  t861 = t811 - t235 * t814 - 0.2e1 * t223 * (t425 - t165 + t816 + t817 + t77 + t168) * t2 + 0.2e1 * t530 * t2 * (t822 + t81 - t217 + t97 - t167 - t83) - 0.2e1 * t516 * t1 * (t827 + t829) + t837 * t7 * (t834 + t796) - t840 * t839 + 0.2e1 * t233 * (t425 - t81 + t217 + t97 - t77 + t168) * t2 + 0.2e1 * t521 * t847 - t300 * t850 - t330 + t344 - t348 - t369 - t380 + t384 + t432 * (t855 - t856 + t857 - t858);
  t865 = -t403 - t412 + t415 + t419 + t421 + t423 + t434 + t444 + t450 - t458 - t464 - t470 - t474 + t479 + t483 + t485 + t487 + t489 + t491;
  t868 = t91 * t2 * t424;
  t870 = t499 * t7;
  t873 = t3 * (t360 * t779 + 0.2e1 * t868 - 0.3e1 * t870);
  t875 = t506 + t508 + t510 - t512 - t514 - t519 - t524 - t529 + t533 + t536 + t541 + t544 + t553 + t558 - t562 + t572 - t576 - t580 - 0.4e1 * t873;
  t877 = 0.1e1 / (t865 + t875);
  J_hredxqa(1,2) = -t877 * t2 * (t649 + t740 + t807 + t861);
  t880 = -t7 * t690;
  t883 = sin(t254);
  t892 = t44 + t604;
  t896 = (t44 - t609) * t1;
  t897 = t295 * t2;
  t912 = t5 + t475 + t626;
  t913 = t18 + t48;
  t914 = cos(t913);
  t917 = t122 - t466;
  t918 = t1 * t917;
  t919 = sin(t913);
  t924 = t255 * t2;
  t927 = t448 * (t688 + t689 + t880 - t692) - t670 - 0.3e1 * t883 * t1 * t640 - t259 * t9 * t252 + 0.4e1 * t116 * t2 * t424 + t606 * t892 * t252 + 0.3e1 * t897 * t896 - t577 * t601 * t355 + t592 * t72 * t252 + t195 * t585 * t355 - t596 * t27 * t252 - t249 * t23 * t252 + t275 * t278 * t252 - t914 * t912 * t493 + t919 * t7 * t918 + t623 * t892 * t252 + 0.3e1 * t924 * t896;
  t930 = t18 - t240;
  t931 = sin(t930);
  t946 = cos(t930);
  t950 = t66 * (t5 + t735);
  t953 = t16 * t252 * t654 + t2 * t247 * t619 + 0.2e1 * t235 * t650 * t66 + 0.2e1 * t252 * t335 * t657 - t44 * t83 * t931 + 0.2e1 * t659 * t663 + 0.3e1 * t722 * t946 + 0.2e1 * t75 * t950 - t203 - 0.2e1 * t206 - 0.3e1 * t209 - t243 - t729 - t732 - t734 + t763 - t811;
  t962 = t2 * (t94 + t165 - t96 + t817 + t167 - t83);
  t970 = t16 * t66;
  t972 = t27 * t66;
  t987 = t912 * t66;
  t989 = t66 * t917;
  t991 = t178 * t2 * (t745 + t746) + t400 * t2 * (t766 - t770) - 0.2e1 * t555 * t962 + t172 * t801 - t155 * t2 * (t795 - t796) + t161 * t73 + t374 * t970 + t290 * t972 + 0.2e1 * t550 * (t752 + t311 - t304) * t1 - t125 * t972 - t777 * t110 - 0.2e1 * t101 * t779 + t70 * t970 - t775 * t119 + t573 * (t789 - t790) * t2 + t370 * t987 - t300 * t989;
  t1004 = t812 + t4;
  t1005 = t66 * t1004;
  t1011 = t278 * t66;
  t1019 = sin(t461);
  t1023 = t123 * t2;
  t1025 = t67 * t2;
  t1027 = t273 * t2;
  t1029 = cos(t18);
  t1030 = t4 * t1029;
  t1031 = sin(t18);
  t1038 = t1031 * t4;
  t1046 = -0.2e1 * t228 * t2 * (t425 + t165 - t816 - t817 - t77 - t168) + 0.2e1 * t530 * t2 * (t822 - t81 + t217 - t97 + t167 + t83) - 0.4e1 * t521 * (t782 - t216 + t217 - t783 - t219 + t168) * t2 - t214 * t1005 + 0.2e1 * t212 * t2 * (t425 + t81 - t217 - t97 + t77 - t168) - t840 * t1011 - 0.2e1 * t526 * (t827 - t829) * t1 + t1019 * (t834 - t796) * t7 + t325 + t341 - t348 - t358 + t384 - t388 + t462 * (-t675 + t679) - (t29 * t1023 + t20 * t1025 + t701 * t1027 + t705 + 0.3e1 * t7 * (t3 * (t1030 + t408 * t1031 / 0.3e1) - t1029 * t408 - t1038)) * t1 + t504 * (t855 + t856 - t857 + t858);
  J_hredxqa(1,3) = -t877 * t2 * (t927 + t953 + t991 + t1046);
  t1058 = t242 * t83 * t355;
  t1070 = t245 * t83 * t355;
  t1073 = 0.2e1 * t275 * t2 * t321;
  t1074 = cos(t350);
  t1080 = 0.2e1 * t280 * t2 * t321;
  t1082 = t730 * t1 * t288;
  t1088 = t202 * t1 * t288;
  t1090 = t733 * t1 * t288;
  t1093 = t208 * t1 * t288;
  t1096 = -0.2e1 * t1074 * t44 * t83 + 0.2e1 * t23 * t252 * t331 + 0.2e1 * t252 * t27 * t335 + t252 * t273 * t322 + t252 * t278 * t327 + 0.2e1 * t288 * t290 * t4 + 0.2e1 * t288 * t300 * t4 - 0.2e1 * t44 * t50 * t61 - 0.4e1 * t321 * t637 + t1058 + t1070 + t1073 - t1080 + 0.2e1 * t1082 + t1088 + 0.2e1 * t1090 + t1093;
  t1123 = t199 * t1 * t288;
  t1125 = t205 * t1 * t288;
  t1127 = t641 * t493 * t355;
  t1133 = t1 * t3;
  t1138 = t883 * t493 * t355;
  t1143 = 0.4e1 * t924 * t321 + 0.2e1 * t370 * t45 * t288 + t269 * t67 * t252 + t249 * t72 * t252 - 0.4e1 * t57 * t3 * (t81 + t96 - t167) * t1 - t364 * t123 * t252 - 0.4e1 * t612 * t321 - t259 * t2 * t247 + 0.4e1 * t897 * t321 + 0.2e1 * t374 * t45 * t288 + t1123 + t1125 - 0.2e1 * t1127 - 0.4e1 * t315 * t320 * t7 * t5 + 0.4e1 * t307 * t828 * t1133 - 0.2e1 * t1138 - 0.2e1 * t62 * t46 * t44;
  t1145 = t367 * t239;
  t1146 = t386 * t197;
  t1147 = t378 * t197;
  t1148 = t356 * t239;
  t1154 = t80 / 0.2e1;
  t1157 = t81 * t6;
  t1168 = t84 * t6;
  t1173 = 0.5e1 / 0.2e1 * t81;
  t1183 = t1145 - t1146 + t1147 - t1148 + t91 * t3 * (-0.8e1 * t682 + 0.2e1 * t686) - 0.4e1 * t360 * t3 * (-t1154 + t7 * t852 / 0.2e1 + t1157 - t86) + t112 * t119 + t116 * t99 - t120 * t110 - t101 * t115 - 0.4e1 * t391 * t3 * (-t1154 + t7 * (-t165 + t817 - t83) + t1168) - 0.2e1 * t178 * t2 * (t94 - t1173 + t132 - t817 + t167 + t168) + t130 * t73 - t150 * t232 + t125 * t68 + t158 * t128 + t70 * t124;
  t1195 = t3 * (t81 - t82 - t77 + t83);
  t1196 = 0.6e1 * t828;
  t1208 = t342 * t197;
  t1209 = t339 * t197;
  t1211 = t3 * t497;
  t1212 = 0.4e1 * t424;
  t1227 = t4 * t34;
  t1234 = -t155 * t211 + 0.2e1 * t191 * t2 * (t782 - t1173 + t132 + t817 + t167 + t168) + t75 * t128 - 0.2e1 * t141 * t2 * (t94 + t1173 - t132 + t817 - t167 - t168) - t172 * t2 * (t1195 - t1196) - t183 * t2 * (t1195 + t1196) + 0.2e1 * t195 * (t782 + t1173 - t132 - t817 - t167 - t168) * t2 + t161 * t124 - t1208 + t1209 + t214 * t68 + t228 * t2 * (t1211 + t1212) + t223 * (t1211 - t1212) * t2 + t233 * t148 + t212 * t153 + t235 * t73 + t1 * (t25 * t10 + t29 * t17 - t14 * t24 - t20 * t28 - 0.2e1 * t7 * t3 * (t36 * t408 - t1227));
  t1240 = t3 * (t868 - 0.3e1 / 0.2e1 * t870);
  t1242 = t506 + t508 + t510 - t512 - t514 - t519 - t524 - t529 + t533 + t536 + t541 + t544 + t553 + t558 - t562 - t566 + t572 - t576 - t580 - 0.8e1 * t1240;
  J_hredxqa(2,1) = 0.1e1 / (t865 + t1242) * t2 * (t1096 + t1143 + t1183 + t1234);
  t1248 = t3 * (t80 + t85 - 0.2e1 * t1157 + 0.2e1 * t86);
  t1249 = 0.12e2 * t682;
  t1257 = t3 * (-0.5e1 * t80 + t7 * (t81 - t82 + t676) + 0.4e1 * t1168);
  t1259 = 0.6e1 * t320 * t145;
  t1265 = 0.2e1 * t701 * t404;
  t1268 = t6 - 0.2e1 / 0.5e1 * t7;
  t1283 = t3 * (-0.4e1 * t682 + t686);
  t1284 = 6 * t78;
  t1285 = 0.6e1 * t1157;
  t1286 = 0.6e1 * t86;
  t1291 = t3 * t437;
  t1306 = t1070 - t1080 + t1082 + t1090 + t1123 + t1125 + t1127 + t442 * (t1248 - t1249 + t858) + t456 * (t1257 - t1259) + t1 * (t25 * t697 - t14 * t695 - t1265 - t703 * t699 + 0.5e1 * (t3 * (t706 * t1268 + t714 / 0.5e1) + 0.3e1 / 0.5e1 * t707 - 0.3e1 / 0.5e1 * t750 * t708) * t7) + t432 * (t1283 - t1284 - t689 + t691 + t1285 - t1286) - t723 * t83 * t44 - 0.2e1 * t659 * t1 * (t1291 + t4) - 0.2e1 * t664 * (t650 - t4) * t1 - t654 * t123 * t252 - t327 * t273 * t252 + t521 * t601 * t355;
  t1309 = t1 * (t6 - 0.7e1 / 0.4e1 * t7);
  t1312 = 0.4e1 * t623 * t2 * t1309;
  t1315 = 0.4e1 * t606 * t2 * t1309;
  t1320 = (t6 + 0.5e1 / 0.4e1 * t7) * t1;
  t1344 = t82 / 0.3e1;
  t1347 = (t81 - 0.2e1 / 0.3e1 * t96 - t1344 - t77 / 0.3e1) * t3;
  t1348 = t555 * t2;
  t1354 = t1312 + t1315 + t269 * t16 * t252 - 0.4e1 * t612 * t1320 - 0.4e1 * t120 * t2 * t424 + t619 * t9 * t252 - t629 * t7 * t633 - t596 * t67 * t252 - t634 * t627 * t493 - 0.4e1 * t637 * t1320 - t364 * t27 * t252 - t592 * t23 * t252 - 0.2e1 * t161 * t66 * t650 - 0.3e1 * t1348 * t1347 + t183 * t585 * t355 + t1145 + 0.2e1 * t1146;
  t1357 = 0.5e1 / 0.2e1 * t77;
  t1362 = sin(t726);
  t1364 = 0.2e1 * t1362 * t197;
  t1365 = t382 * t197;
  t1366 = cos(t808);
  t1368 = 0.2e1 * t1366 * t239;
  t1369 = 0.7e1 / 0.2e1 * t96;
  t1377 = t3 * (t81 - t132 - t167);
  t1385 = 0.5e1 / 0.4e1 * t77;
  t1395 = 0.3e1 * t1147 - t1208 + 0.2e1 * t400 * t2 * (t822 - t95 - t217 - t82 + t1357 + t83) + t1364 - t1365 + t1368 - 0.2e1 * t150 * (t425 - t95 - t1369 + t82 - t312 - t168) * t2 + t158 * t742 - t761 * t839 - 0.2e1 * t569 * t1 * (t1377 - t829) + t191 * t801 + 0.2e1 * t573 * t847 + 0.4e1 * t577 * t2 * (t822 - t216 - t96 - t783 + t1385 + t168) + t370 * t850 - t75 * t814 + t777 * t99 - 0.2e1 * t112 * t779;
  t1405 = 0.2e1 * t840 * t759;
  t1407 = 0.3e1 * t346 * t197;
  t1409 = t3 * (t81 + t217 - t168);
  t1410 = 0.3e1 * t424;
  t1415 = 0.3e1 * t81;
  t1416 = 0.9e1 / 0.2e1 * t77;
  t1422 = 0.9e1 / 0.2e1 * t81;
  t1432 = t3 * (t81 + t96 + t1344 - t83 / 0.3e1);
  t1433 = 0.2e1 / 0.3e1 * t424;
  t1439 = t3 * t437 * t45;
  t1442 = (t6 - 0.5e1 / 0.2e1 * t7) * t4;
  t1450 = t667 * t493 * t355;
  t1451 = -t775 * t115 - t374 * t742 + t290 * t757 - 0.2e1 * t141 * t2 * (t425 - t165 - t1369 + t817 - t312 - t168) + t130 * t757 + t1405 + t1407 - 0.2e1 * t233 * t2 * (t1409 + t1410) + 0.2e1 * t516 * (t782 + t1415 - t1416) * t1 + t300 * t803 - 0.2e1 * t837 * t7 * (t425 + t1422 - t427 + t428 - t133) - t235 * t68 + 0.2e1 * t214 * t737 + 0.3e1 * t223 * t2 * (t1432 + t1433) - 0.2e1 * t530 * t2 * (t1439 + t1442) + 0.3e1 * t646 * t722 - t1450;
  J_hredxqa(2,2) = -t877 * t2 * (t1306 + t1354 + t1395 + t1451);
  t1490 = t290 * t970 - t161 * t1005 - 0.2e1 * t178 * t2 * (t425 + t165 + t1369 - t817 + t312 + t168) - t761 * t1011 - t775 * t110 + t370 * t989 + t777 * t119 + 0.2e1 * t116 * t779 + t70 * t972 + t125 * t970 + 0.2e1 * t400 * t2 * (t822 + t95 + t217 + t82 - t1357 - t83) - 0.2e1 * t550 * (t1377 + t829) * t1 - t374 * t972 - 0.2e1 * t155 * t2 * (t425 + t95 + t1369 - t82 + t312 + t168) + 0.4e1 * t573 * t2 * (t822 + t216 + t96 + t783 - t1385 - t168) - t195 * t801 + 0.2e1 * t577 * t962;
  t1520 = -t214 * t73 + 0.2e1 * t235 * t950 - 0.2e1 * t1019 * t7 * (t425 - t1422 + t427 - t428 + t133) + 0.2e1 * t526 * (t782 - t1415 + t1416) * t1 - 0.2e1 * t212 * t2 * (t1409 - t1410) + 0.3e1 * t228 * t2 * (t1432 - t1433) - 0.2e1 * t530 * t2 * (t1439 - t1442) + t300 * t987 - 0.3e1 * t931 * t722 + t1058 + t1073 + t1082 + t1088 + t1090 + t1093 + t1138 - 0.2e1 * t75 * t66 * t650;
  t1526 = t521 * t2;
  t1563 = 0.4e1 * t897 * t1320 - t259 * t23 * t252 + 0.3e1 * t1526 * t1347 - 0.2e1 * t659 * t1 * (t1291 - t4) - 0.2e1 * t335 * t2 * t1 * (t650 + t4) + t654 * t27 * t252 - t322 * t278 * t252 + t172 * t585 * t355 - t555 * t601 * t355 + t596 * t16 * t252 + t592 * t2 * t247 - t619 * t72 * t252 + t249 * t9 * t252 + 0.4e1 * t101 * t2 * t424 - t914 * t7 * t918 - t919 * t912 * t493 + 0.4e1 * t924 * t1320;
  t1589 = -t946 * t83 * t44 - t1312 - t1315 - 0.3e1 * t1146 - 0.2e1 * t1147 - t1148 + t1209 - t1364 + t1365 - t1368 - t1405 - t1407 + t1450 + t462 * (t1257 + t1259) + t1 * (t29 * t1025 - t20 * t1023 + t1265 - t703 * t1027 + 0.5e1 * t7 * (t3 * (t1029 * t1268 + t1038 / 0.5e1) - 0.3e1 / 0.5e1 * t1030 + 0.3e1 / 0.5e1 * t750 * t1031)) + t448 * (t1248 + t1249 - t858) + t504 * (t1283 + t1284 + t689 + t880 - t1285 + t1286);
  J_hredxqa(2,3) = -t877 * t2 * (t1490 + t1520 + t1563 + t1589);
  t1595 = t75 * t1 * t288;
  t1597 = t161 * t1 * t288;
  t1598 = t83 * t3;
  t1602 = t81 - t82 - t77;
  t1607 = t641 * t497 * t355;
  t1609 = t883 * t497 * t355;
  t1641 = t295 * t239;
  t1642 = t284 * t239;
  t1644 = t1595 + t1597 - 0.2e1 * t57 * t54 * t1598 - 0.2e1 * t360 * t1602 * t1133 + t1607 + t1609 - 0.2e1 * t560 * t1133 + t191 * t72 * t252 + t195 * t67 * t252 - t172 * t123 * t252 + t150 * t72 * t252 + t155 * t67 * t252 - t183 * t2 * t247 - 0.2e1 * t141 * t45 * t252 + 0.2e1 * t178 * t45 * t252 + 0.4e1 * t3 * (-t91 * t4 * t6 * t1 + t7 * (t36 * (t81 - t217 - t167 - t83) + t320 * t1227)) + t1641 - t1642 + t208 * t124;
  t1646 = t386 * t68;
  t1647 = t378 * t73;
  t1649 = t2 * (t94 + t165 - t96 + t817 + t167 + t168);
  t1653 = (t94 - t165 + t96 - t817 - t167 - t168) * t2;
  t1659 = (t6 - t4 - t7) * (t6 + t4 - t7) / 0.2e1;
  t1668 = t3 * t1602;
  t1669 = 0.2e1 * t136;
  t1676 = t235 * t197;
  t1677 = t214 * t197;
  t1685 = t335 * t83 * t355;
  t1687 = t331 * t83 * t355;
  t1688 = t1 * t813;
  t1691 = t1004 * t1;
  t1700 = t205 * t128 + t1646 + t1647 - 0.2e1 * t264 * t1649 - 0.2e1 * t255 * t1653 + 0.2e1 * t25 * t2 * (t782 - t1659) + 0.2e1 * t29 * t2 * (t782 + t1659) - t14 * t2 * (t1668 + t1669) - t20 * (t1668 - t1669) * t2 + t1676 - t1677 - 0.4e1 * t315 * t61 * t44 + 0.2e1 * t307 * t4 * t1598 + t1685 + t1687 + t212 * t2 * t1688 + t233 * t2 * t1691 - 0.2e1 * t223 * t262 * t252 - 0.2e1 * t228 * t253 * t252;
  t1703 = 0.1e1 / t1;
  t1714 = -t402 - t411 + t414 + t418 + t420 + t422 + t433 + t443 / 0.2e1 + t449 / 0.2e1 - t457 - t463 - t469 / 0.2e1 - t473 / 0.2e1 + t478 / 0.2e1 + t482 / 0.2e1 + t484 / 0.2e1 + t486 / 0.2e1 + t488 / 0.2e1 + t490 / 0.2e1;
  t1715 = t507 / 0.2e1;
  t1716 = t509 / 0.2e1;
  t1717 = t511 / 0.2e1;
  t1718 = t513 / 0.2e1;
  t1719 = t518 / 0.2e1;
  t1720 = t528 / 0.2e1;
  t1721 = t552 / 0.2e1;
  t1722 = t571 / 0.2e1;
  t1724 = t505 + t1715 + t1716 - t1717 - t1718 - t1719 - t523 - t1720 + t532 + t535 + t540 + t543 + t1721 + t557 - t561 - t565 + t1722 - t575 - t579 - 0.2e1 * t1240;
  J_hredxqa(3,1) = 0.1e1 / (t1714 + t1724) * t1703 * t2 * (t1644 + t1700) / 0.2e1;
  t1743 = t374 * t1 * t288;
  t1755 = t3 * t750;
  t1758 = t530 * t2;
  t1761 = t538 * t83 * t355;
  t1763 = t81 + t96 + t311 - t312 - 0.4e1 * t83;
  t1771 = t81 - t96 - t82;
  t1776 = -t1595 + t1607 - t1348 * t1688 + 0.2e1 * t150 * t2 * t321 + 0.2e1 * t191 * t2 * t321 + t577 * t67 * t252 + t573 * t67 * t252 + t400 * t9 * t252 - t1743 + t521 * t123 * t252 + t223 * t2 * t1 * (t465 + t4) + t233 * t273 * t252 - 0.2e1 * t837 * t480 * t493 - t1758 * t1 * (t1755 + t4) - t1761 - t7 * (t3 * (t1763 * t706 - 0.2e1 * t320 * t714) - 0.6e1 * t706 * t424 + 0.3e1 * t1771 * t708) - t1642 + t1646 + t1676;
  t1778 = t667 * t497 * t355;
  t1783 = t290 * t197;
  t1784 = t606 * t239;
  t1789 = 0.2e1 * t382 * t759;
  t1799 = (t81 + 0.4e1 * t96 + t82 + t77 + t83) * t2;
  t1802 = t3 * (t81 - t82 + t312);
  t1814 = t3 * t563;
  t1822 = -t1778 - t141 * t9 * t252 + t183 * t278 * t252 + t1783 + t1784 - 0.2e1 * t623 * t1653 + t733 * t839 - t1789 - t569 * (t1755 - t466) * t83 + t208 * t814 + 0.2e1 * t456 * t453 * t1 - t264 * t1799 - t442 * t1 * (t1802 + t1196) - 0.2e1 * t432 * (t782 - t426 + t428) * t1 + 0.2e1 * t25 * t2 * (t425 - t165 - t217 + t817 - t167) - t14 * t2 * (t1814 + t746) - t701 * t99 + t703 * t115 + t516 * t480 * t83 - t1687;
  t1825 = t505 + t1715 + t1716 - t1717 - t1718 - t1719 - t523 - t1720 + t532 + t535 + t540 + t543 + t1721 + t557 - t561 + t1722 - t575 - t579 - t873;
  t1828 = t1703 / (t1714 + t1825);
  J_hredxqa(3,2) = -t1828 * t2 * (t1776 + t1822) / 0.2e1;
  t1871 = -t1597 + t1609 - t550 * (t1755 + t466) * t83 + t205 * t1005 + 0.2e1 * t462 * t459 * t1 - 0.2e1 * t623 * t1649 + t255 * t1799 - t448 * (t1802 - t1196) * t1 - 0.2e1 * t504 * (t782 + t426 - t428) * t1 + 0.2e1 * t29 * (t425 + t165 + t217 - t817 + t167) * t2 - t20 * t2 * (t1814 - t746) - t701 * t119 + t703 * t110 + t733 * t1011 + t526 * t476 * t83 - t1743 - t1761 - t7 * (t3 * (t1029 * t1763 - 0.2e1 * t1031 * t424) + 0.6e1 * t1029 * t424 - 0.3e1 * t1771 * t1031) + t1641;
  t1902 = t1647 - t1677 + t1778 - t178 * t16 * t252 + t577 * t72 * t252 - t1783 - t1784 + t1789 - t1685 + t573 * t72 * t252 - 0.2e1 * t195 * t2 * t321 - 0.2e1 * t155 * t2 * t321 + t400 * t16 * t252 + t172 * t273 * t252 - t1348 * t247 + t228 * t2 * (t465 - t4) * t1 + t1526 * t1691 + t212 * t278 * t252 - t1758 * (t1755 - t4) * t1 - 0.2e1 * t1019 * t476 * t493;
  J_hredxqa(3,3) = -t1828 * t2 * (t1871 + t1902) / 0.2e1;
  J_hredxqa_3RRRreturn = J_hredxqa;
