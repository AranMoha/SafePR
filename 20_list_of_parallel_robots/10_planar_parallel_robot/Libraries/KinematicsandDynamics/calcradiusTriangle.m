clc
clear
% close all
%%
% Koordinaten nach Kotl-Diss
% psi = 120*pi/180;
% R = [cos(psi) -sin(psi); sin(psi) cos(psi)];
% G1 = [0.6816; 0];
% G2 = R*[0.6816; 0]

% Feste Plattform
% A_1i  = [0 0];
% A_2i  = [1.1996 0];
% A_3i  = [0.59077 1.0053];
% 
% d12_ = norm(A_1i-A_2i);
% % d13_ = norm(A_1i-A_3i);
% d13_ = 1.17;
% d23_ = norm(A_2i-A_3i);

% Mobile Plattform
% Aus diss
% A_1i  = [-0.0928 -0.0535];
% A_2i  = [0.0928 -0.0535];
% A_3i  = [0.0001 0.1070];
% 
% d12_ = norm(A_1i-A_2i); % 0.18557
% d13_ = norm(A_1i-A_3i); % 0.18538
% d23_ = norm(A_2i-A_3i); % 0.18528

% Aus Matlab Initialisierungsskript (unterschied zu vorigen Zeilen beim
% Vorzeichen von A_3i-x Koordinante
d12_ = 0.18557;
d13_ = 0.18528;
d23_ = 0.18538;

alpha1_grad = acosd( (d23_^2-d12_^2-d13_^2) / (-2*d12_*d13_));
alpha2_grad = acosd( (d13_^2-d12_^2-d23_^2) / (-2*d12_*d23_)); 
alpha3_grad = acosd( (d12_^2-d13_^2-d23_^2) / (-2*d13_*d23_));

test1_grad = alpha1_grad+ alpha2_grad+ alpha3_grad

% % Grundseite ist gegenueber von 1
h = sin(deg2rad(alpha3_grad)) * d13_
test2 = h - sin(deg2rad(alpha2_grad)) * d12_

d23_centerL = sqrt(d12_^2 - h^2)
d23_centerR = sqrt(d13_^2 - h^2)

test3 = d23_ - (d23_centerL + d23_centerR)

% Ansatz über Umkreisradius (alle 3 Eckpunkte liegen auf einem Kreis mit
% Radius r) Quelle: https://de.wikipedia.org/wiki/Dreieck
R1 =     d23_ / (2*sin(deg2rad(alpha1_grad)))
R2 =     d13_ / (2*sin(deg2rad(alpha2_grad)))
R3 =     d12_ / (2*sin(deg2rad(alpha3_grad)))

test41 = R1 - R2
test42 = R2 - R3

% Inkreisradius r
r = 4 * R1 * sin(deg2rad(alpha1_grad/2)) * sin(deg2rad(alpha2_grad/2)) *  sin(deg2rad(alpha3_grad/2))

% Länge vom Eckpunkt zum Innenkreismittelpunkt
r1 = r / sin(deg2rad(alpha1_grad/2))
r2 = r / sin(deg2rad(alpha2_grad/2))
r3 = r / sin(deg2rad(alpha3_grad/2))

r_BasPlattj_m = [r1; r2;r3]

% Winkel um z-Achse für Rotation KS0 ins KS_Gj
psi_1 = 180 - (alpha1_grad + alpha2_grad)/2
psi_2 = 180 - (alpha2_grad + alpha3_grad)/2
psi_3 = 180 - (alpha3_grad + alpha1_grad)/2

% psi_j_grad = [90; 90+psi_1; 90+psi_1+psi_2]
psi_j_grad = [0; 0+psi_1; 0+psi_1+psi_2]

test5 = psi_1+psi_2+psi_3

%%
G1 = RotZ(deg2rad(psi_j_grad(1)), r_BasPlattj_m(1))
G2 = RotZ(deg2rad(psi_j_grad(2)), r_BasPlattj_m(2))
G3 = RotZ(deg2rad(psi_j_grad(3)), r_BasPlattj_m(3))

G1_ = RotZ(deg2rad(0), 0.107)
G2_ = RotZ(deg2rad(120), 0.107)
G3_ = RotZ(deg2rad(240), 0.107)

test61 = norm(G1-G2) - d12_
test62 = norm(G2-G3) - d23_
test63 = norm(G1-G3) - d13_

figure;
plot([-G1(2) -G2(2)], [G1(1) G2(1)]); hold on; grid on;
plot([-G2(2) -G3(2)], [G2(1) G3(1)]); hold on;
plot([-G1(2) -G3(2)], [G1(1) G3(1)]); hold on;
plot([0 -G1(2)], [0 G1(1)]); hold on;
plot([0 -G2(2)], [0 G2(1)]); hold on;
plot([0 -G3(2)], [0 G3(1)]); hold on;

circle(0,0,r)

function h = circle(x,y,r)
    hold on
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    h = plot(xunit, yunit);
    hold off
end

function Gj =  RotZ(psi_j, r)
    Rz = [cos(psi_j) -sin(psi_j); sin(psi_j) cos(psi_j)];
    Gj = Rz * [0; -r];
end