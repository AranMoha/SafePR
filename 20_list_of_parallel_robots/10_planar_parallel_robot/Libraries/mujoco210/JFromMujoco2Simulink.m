% Uebersetze Gelenkdaten von MuJoCo in die Simulinkwelt (Umsortieren in richtige
% Reihenfolge (s. atlas_const)).
% 
% Input:
% in [30x1]
%   Gelenkdaten aus MuJoCo
% 
% Output:
% out [30x1]
%   Gelenkdaten in Simulink (umgeordnet)
% 
% Sources:
% [1] atlas.urdf.xml (Stand 06.07.2017), atlas_const

% Jonathan Vorndamme, vorndamme@irt.uni-hannover.de, 2017-07
% (c) Institut fuer Regelungstechnik, Leibniz Universitaet Hannover

function out = JFromMujoco2Simulink(in)
  out = in([1:3 11 19:30 4:10 12:18]);
end