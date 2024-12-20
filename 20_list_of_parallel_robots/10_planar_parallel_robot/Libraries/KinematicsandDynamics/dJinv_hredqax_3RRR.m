function dJinv_hredqax_3RRRreturn = dJinv_hredqax_3RRR(qj_rad, dqj_rad, xEE, dxEE, l_all, r_BasisPla_MobPla)
  dJinv_hredqax = [0 0 0; 0 0 0; 0 0 0;];
  t1 = qj_rad(1);
  t2 = cos(t1);
  t3 = xEE(6);
  t4 = t1 - t3;
  t5 = cos(t4);
  t6 = r_BasisPla_MobPla(2);
  t8 = r_BasisPla_MobPla(1);
  t10 = xEE(1);
  t12 = sin(t1);
  t13 = xEE(2);
  t15 = t10 * t2 + t12 * t13 - t2 * t8 + t5 * t6;
  t16 = 0.1e1 / t15;
  t18 = l_all(1);
  t19 = 0.1e1 / t18;
  t20 = cos(t3);
  t21 = t20 * t6;
  t24 = (t12 * t18 + t10 + t21 - t8) * t19;
  t25 = t15 ^ 2;
  t26 = 0.1e1 / t25;
  t27 = sin(t4);
  t28 = t6 * t27;
  t32 = -t10 * t12 + t12 * t8 + t13 * t2 - t28;
  t33 = t32 * t26;
  t36 = dqj_rad(1);
  t38 = t16 * t19;
  t39 = t2 * t26;
  t42 = dxEE(1);
  t44 = t12 * t26;
  t45 = dxEE(2);
  t48 = t6 * t19;
  t49 = sin(t3);
  t51 = t16 * t49 * t48;
  t53 = t6 * t27 * t26;
  t56 = dxEE(6);
  dJinv_hredqax(1,1) = t36 * (-t16 * t2 + t24 * t33) + t42 * (t24 * t39 - t38) + t45 * t44 * t24 + t56 * (t24 * t53 + t51);
  t59 = t49 * t6;
  t62 = (-t18 * t2 + t13 + t59) * t19;
  t72 = t16 * t20 * t48;
  dJinv_hredqax(1,2) = t36 * (-t12 * t16 + t33 * t62) + t42 * t39 * t62 + t45 * (t44 * t62 - t38) + t56 * (t53 * t62 - t72);
  t77 = t13 * t20;
  t78 = t8 * t49;
  t79 = t49 * t10;
  t81 = -t18 * t5 + t77 + t78 - t79;
  t82 = t81 * t6;
  t83 = t26 * t19;
  t96 = t13 * t49;
  t97 = t8 * t20;
  t98 = t20 * t10;
  t103 = t6 ^ 2;
  dJinv_hredqax(1,3) = t36 * (t32 * t82 * t83 - t16 * t28) + t42 * (t2 * t82 * t83 + t51) + t45 * (t12 * t82 * t83 - t72) + t56 * (-t38 * (-t18 * t27 - t96 + t97 - t98) * t6 + t27 * t83 * t81 * t103);
  t109 = qj_rad(4);
  t110 = sin(t109);
  t111 = t110 * t18;
  t112 = sqrt(0.3e1);
  t113 = t111 * t112;
  t114 = cos(t109);
  t115 = t18 * t114;
  t118 = t110 * t10;
  t120 = t114 * t13;
  t122 = t110 * t13;
  t123 = -t3 + t109;
  t124 = cos(t123);
  t129 = t114 * t10;
  t130 = t112 * t118 - t112 * t120 + 0.2e1 * t114 * t8 - 0.2e1 * t124 * t6 + t122 + t129;
  t131 = 0.1e1 / t130;
  t133 = t112 * t59;
  t134 = t112 * t115;
  t135 = 0.2e1 * t10;
  t137 = t19 * (t133 - t134 + t21 + t111 - t8 - t135);
  t138 = t130 ^ 2;
  t139 = 0.1e1 / t138;
  t142 = sin(t123);
  t143 = t6 * t142;
  t147 = -0.2e1 * t110 * t8 + t112 * t122 + t112 * t129 - t118 + t120 + 0.2e1 * t143;
  t148 = t147 * t139;
  t151 = dqj_rad(4);
  t153 = t131 * t19;
  t154 = 0.2e1 * t153;
  t156 = t110 * t112 + t114;
  t157 = t156 * t139;
  t162 = -t112 * t114 + t110;
  t163 = t162 * t139;
  t166 = t21 * t112;
  t171 = t6 * t142 * t139;
  dJinv_hredqax(2,1) = t151 * (-t131 * t19 * (t115 + t113) + t148 * t137) + t42 * (t137 * t157 + t154) + t45 * t163 * t137 + t56 * (-t131 * t19 * (t166 - t59) - 0.2e1 * t171 * t137);
  t179 = t8 * t112;
  t180 = 0.2e1 * t13;
  t182 = (t166 + t113 - t179 - t59 + t115 + t180) * t19;
  dJinv_hredqax(2,2) = t151 * (t131 * (t134 - t111) * t19 - t148 * t182) - t42 * t157 * t182 + t45 * (-t182 * t163 + t154) + t56 * (t131 * (-t133 - t21) * t19 + 0.2e1 * t171 * t182);
  t200 = t112 * t98;
  t201 = t112 * t96;
  t202 = 0.2e1 * t78;
  t205 = 0.2e1 * t124 * t18 + t200 + t201 - t202 + t77 - t79;
  t206 = t205 * t6;
  t207 = t139 * t19;
  t212 = t112 * t20;
  t220 = t112 * t49;
  t228 = t112 * t79;
  t229 = t112 * t77;
  t230 = 0.2e1 * t97;
  dJinv_hredqax(2,3) = t151 * (t147 * t206 * t207 + 0.2e1 * t131 * t143) + t42 * (-t153 * (t212 - t49) * t6 + t156 * t207 * t206) + t45 * (-t153 * (t220 + t20) * t6 + t162 * t207 * t206) + t56 * (-t153 * (0.2e1 * t142 * t18 - t228 + t229 - t230 - t96 - t98) * t6 - 0.2e1 * t142 * t207 * t205 * t103);
  t242 = qj_rad(7);
  t243 = sin(t242);
  t244 = t243 * t18;
  t245 = t112 * t244;
  t246 = cos(t242);
  t247 = t18 * t246;
  t250 = t243 * t10;
  t252 = t246 * t13;
  t254 = t243 * t13;
  t255 = -t3 + t242;
  t256 = cos(t255);
  t261 = t246 * t10;
  t262 = t112 * t250 - t112 * t252 - 0.2e1 * t246 * t8 + 0.2e1 * t256 * t6 - t254 - t261;
  t263 = 0.1e1 / t262;
  t265 = t112 * t247;
  t267 = (-t133 + t265 + t21 + t244 - t8 - t135) * t19;
  t268 = t262 ^ 2;
  t269 = 0.1e1 / t268;
  t272 = sin(t255);
  t273 = t6 * t272;
  t277 = t112 * t254 + t112 * t261 + 0.2e1 * t243 * t8 + t250 - t252 - 0.2e1 * t273;
  t278 = t277 * t269;
  t281 = dqj_rad(7);
  t284 = 0.2e1 * t263 * t19;
  t286 = t112 * t243 - t246;
  t287 = t286 * t269;
  t292 = -t112 * t246 - t243;
  t293 = t292 * t269;
  t300 = t6 * t272 * t269;
  dJinv_hredqax(3,1) = t281 * (t263 * (-t245 + t247) * t19 - t278 * t267) + t42 * (-t267 * t287 - t284) - t45 * t293 * t267 + t56 * (t263 * (-t166 - t59) * t19 - 0.2e1 * t267 * t300);
  t309 = (t166 + t245 - t179 + t59 - t247 - t180) * t19;
  dJinv_hredqax(3,2) = t281 * (t263 * (t265 + t244) * t19 - t278 * t309) - t42 * t287 * t309 + t45 * (-t293 * t309 - t284) + t56 * (t263 * (-t133 + t21) * t19 - 0.2e1 * t300 * t309);
  t330 = t269 * (-0.2e1 * t18 * t256 + t200 + t201 + t202 - t77 + t79);
  dJinv_hredqax(3,3) = t281 * (t277 * t330 * t48 - 0.2e1 * t263 * t273) + t42 * (-t263 * (t212 + t49) * t48 + t286 * t330 * t48) + t45 * (-t263 * (t220 - t20) * t48 + t292 * t330 * t48) + t56 * (-t263 * (-0.2e1 * t18 * t272 - t228 + t229 + t230 + t96 + t98) * t48 + 0.2e1 * t272 * t330 * t103 * t19);
  dJinv_hredqax_3RRRreturn = dJinv_hredqax;
