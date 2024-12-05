function u_filt = TP1_DiffEq(u_raw, u_prev, a, y_prev)
% Tiefpassfilter 1. Ordnung 
% Entspricht PT1-Glied im Laplace-Bereich --> z-Bereich über bilineare
% Transformation --> Differenzengleichung
% Grund hierfürim Vergleich zur Anwendung des Simulink-Blocks 'Discrete
% Filter' ist die manchmalige Ausgabe von NaN Werten in Anwendung mit
% Etherlab

u_filt = ( -(1-a)*y_prev + u_raw + u_prev) / (1+a);
