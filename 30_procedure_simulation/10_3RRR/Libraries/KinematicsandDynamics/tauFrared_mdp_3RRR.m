function tauFrared_mdp_3RRRreturn = tauFrared_mdp_3RRR(qj_rad, dqj_rad, xEE, dxEE, mdp, l_all, r_BasisPla_MobPla)
    % Funktion für die Bestimmung des Vektors der Reibeffekte der aktiven Gelenke in Plattformkoordinaten
    % Eingabe:
    % qj_rad in rad: Gelenkkoordinaten (9x1)
    % dqj_rad in rad: Gelenkgeschwindigkeiten (9x1)
    % xEE in m und rad: Plattform-Koordinaten im Basis-KS (6x1)
    % dxEE in m und rad: Plattform-Geschwindigkeiten (6x1)
    %
    % Ausgabe:
    % tauFrared_mdp_3RRRreturn: Vektor der Reibeffekte der aktiven Gelenke in Plattformkoordinaten (1x3)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
  tauFraredT = [0 0 0;];
  t2 = 0.1e1 / l_all(1);
  t3 = qj_rad(1);
  t4 = qj_rad(2);
  t5 = t3 + t4;
  t6 = sin(t5);
  t8 = sin(t4);
  t9 = 0.1e1 / t8;
  t10 = dqj_rad(1);
  t11 = sign(t10);
  t16 = t10 * mdp(6) + t11 * mdp(8);
  t17 = t16 * t9;
  t19 = qj_rad(4);
  t20 = qj_rad(5);
  t22 = t19 + t20 + pi / 0.6e1;
  t23 = cos(t22);
  t25 = sin(t20);
  t26 = 0.1e1 / t25;
  t27 = dqj_rad(4);
  t28 = sign(t27);
  t33 = t27 * mdp(10) + t28 * mdp(12);
  t34 = t26 * t33;
  t36 = qj_rad(7);
  t37 = qj_rad(8);
  t39 = t36 + t37 + pi / 0.3e1;
  t40 = sin(t39);
  t42 = sin(t37);
  t43 = 0.1e1 / t42;
  t44 = dqj_rad(7);
  t45 = sign(t44);
  t50 = t44 * mdp(14) + t45 * mdp(16);
  t51 = t50 * t43;
  tauFraredT(1,1) = -t17 * t2 * t6 - t2 * t23 * t34 + t2 * t40 * t51;
  t53 = cos(t5);
  t56 = sin(t22);
  t59 = cos(t39);
  tauFraredT(1,2) = t17 * t2 * t53 - t2 * t34 * t56 - t2 * t51 * t59;
  t63 = t2 * r_BasisPla_MobPla(2);
  t64 = xEE(6);
  t66 = cos(t3 - t64 + t4);
  t71 = cos(t19 + t20 - t64);
  t76 = cos(t36 + t37 - t64);
  tauFraredT(1,3) = t16 * t63 * t66 * t9 + t26 * t33 * t63 * t71 + t43 * t50 * t63 * t76;
  tauFrared_mdp_3RRRreturn = tauFraredT;
