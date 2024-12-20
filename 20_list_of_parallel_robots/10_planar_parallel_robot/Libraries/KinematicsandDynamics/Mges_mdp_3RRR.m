function Mges_mdp_3RRRreturn = Mges_mdp_3RRR(qj_rad, xEE, mdp, l_all, r_BasisPla_MobPla)
  Mges = [0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0;];
  t2 = cos(qj_rad(2));
  t3 = mdp(3);
  t4 = t2 * t3;
  t6 = mdp(1);
  Mges(1,1) = 0.2e1 * t4 + t6;
  t7 = mdp(2);
  Mges(1,2) = t4 + t7;
  Mges(1,3) = 0.0e0;
  Mges(1,4) = 0.0e0;
  Mges(1,5) = 0.0e0;
  Mges(1,6) = 0.0e0;
  Mges(1,7) = 0.0e0;
  Mges(1,8) = 0.0e0;
  Mges(1,9) = 0.0e0;
  Mges(2,1) = Mges(1,2);
  Mges(2,2) = t7;
  Mges(2,3) = 0.0e0;
  Mges(2,4) = 0.0e0;
  Mges(2,5) = 0.0e0;
  Mges(2,6) = 0.0e0;
  Mges(2,7) = 0.0e0;
  Mges(2,8) = 0.0e0;
  Mges(2,9) = 0.0e0;
  Mges(3,1) = 0.0e0;
  Mges(3,2) = 0.0e0;
  t9 = cos(qj_rad(5));
  t10 = t3 * t9;
  Mges(3,3) = 0.2e1 * t10 + t6;
  Mges(3,4) = t10 + Mges(2,2);
  Mges(3,5) = 0.0e0;
  Mges(3,6) = 0.0e0;
  Mges(3,7) = 0.0e0;
  Mges(3,8) = 0.0e0;
  Mges(3,9) = 0.0e0;
  Mges(4,1) = 0.0e0;
  Mges(4,2) = 0.0e0;
  Mges(4,3) = Mges(3,4);
  Mges(4,4) = Mges(2,2);
  Mges(4,5) = 0.0e0;
  Mges(4,6) = 0.0e0;
  Mges(4,7) = 0.0e0;
  Mges(4,8) = 0.0e0;
  Mges(4,9) = 0.0e0;
  Mges(5,1) = 0.0e0;
  Mges(5,2) = 0.0e0;
  Mges(5,3) = 0.0e0;
  Mges(5,4) = 0.0e0;
  t13 = cos(qj_rad(8));
  t14 = t3 * t13;
  Mges(5,5) = 0.2e1 * t14 + t6;
  Mges(5,6) = t14 + Mges(4,4);
  Mges(5,7) = 0.0e0;
  Mges(5,8) = 0.0e0;
  Mges(5,9) = 0.0e0;
  Mges(6,1) = 0.0e0;
  Mges(6,2) = 0.0e0;
  Mges(6,3) = 0.0e0;
  Mges(6,4) = 0.0e0;
  Mges(6,5) = Mges(5,6);
  Mges(6,6) = Mges(4,4);
  Mges(6,7) = 0.0e0;
  Mges(6,8) = 0.0e0;
  Mges(6,9) = 0.0e0;
  Mges(7,1) = 0.0e0;
  Mges(7,2) = 0.0e0;
  Mges(7,3) = 0.0e0;
  Mges(7,4) = 0.0e0;
  Mges(7,5) = 0.0e0;
  Mges(7,6) = 0.0e0;
  Mges(7,7) = mdp(4);
  Mges(7,8) = 0.0e0;
  Mges(7,9) = 0.0e0;
  Mges(8,1) = 0.0e0;
  Mges(8,2) = 0.0e0;
  Mges(8,3) = 0.0e0;
  Mges(8,4) = 0.0e0;
  Mges(8,5) = 0.0e0;
  Mges(8,6) = 0.0e0;
  Mges(8,7) = 0.0e0;
  Mges(8,8) = Mges(7,7);
  Mges(8,9) = 0.0e0;
  Mges(9,1) = 0.0e0;
  Mges(9,2) = 0.0e0;
  Mges(9,3) = 0.0e0;
  Mges(9,4) = 0.0e0;
  Mges(9,5) = 0.0e0;
  Mges(9,6) = 0.0e0;
  Mges(9,7) = 0.0e0;
  Mges(9,8) = 0.0e0;
  Mges(9,9) = mdp(5);
  Mges_mdp_3RRRreturn = Mges;
