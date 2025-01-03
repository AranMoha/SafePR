% Uebersetze Gelenkdaten von Simulink in die MuJoCowelt (Umsortieren in richtige
% Reihenfolge (s. atlas_const)).
% 
% Input:
% in [30x1]
%   Gelenkdaten aus Simulink
% 
% Output:
% out [30x1]
%   Gelenkdaten in MuJoCo (umgeordnet)
% 
% Sources:
% [1] atlas.urdf.xml (Stand 06.07.2017), atlas_const

% Jonathan Vorndamme, vorndamme@irt.uni-hannover.de, 2017-07
% (c) Institut fuer Regelungstechnik, Leibniz Universitaet Hannover

function out = JFromSimulink2Mujoco(in)
  out = [in([1:3 17:23 4]) in([24:30 5:16])];
end