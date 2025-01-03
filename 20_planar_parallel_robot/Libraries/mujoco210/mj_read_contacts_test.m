function [n, pos, frame, dist, force, geom1, geom2] = mj_read_contacts_test()
  % Output:
% n [1x1]
%   Anzahl der Kontaktpunkte
% pos [nx3]
%   Globale Koordinaten der Kontaktpunkte
% frame [nx9]
%   Kontaktframe in globalen Koordinaten (row-major Format, 1. Achse ist die
%   Kraftnormale)
% dist [nx1]
%   Abstand der involvierten Oberflaechen, negativ bedeutet Durchdringung
% force [nx6]
%   Kraft im Kontaktframe
% geom1 [nx1]
%   Index der ersten Kontaktgeometrie
% geom2 [nx1]
%   Index der zweiten Kontaktgeometrie, die Kraft zeigt von Geometrie 1 zu
%   Geometrie 2

  cd = mjx('get_contacts');
  n = cd.ncon;
  pos = zeros(n,3);
  frame = zeros(n,9);
  dist = zeros(n,1);
  force = zeros(n,6);
  geom1 = zeros(n,1);
  geom2 = zeros(n,1);
  pos(:,:) = cd.pos;
  frame(:,:) = cd.frame;
  dist(:,:) = cd.dist;
  force(:,:) = cd.force;
  geom1(:,:) = cd.geom1;
  geom2(:,:) = cd.geom2;
end