function [min_dist, min_dist_row_col, closestP1, closestP2] = calcShortestDistance(qj_rad, l_all_id, r_fixPlat_j, psi_j)
    % Funktion zur Berechnung der minimalen Abstände zwischen den Segmenten zu den benachbarten Segmenten
    % Eingabe:
    % qj_rad in rad: Gelenkkoordinaten (9x1)
    %
    % Ausgabe:
    % min_dist in m: Minimaler Abstand (1x1)
    % min_dist_row_col: Segmentpaar, die den minimalen Abstand bilden (1x1)
    % closestP1: Punkt auf dem ersten Segment, der den minimalen Abstand bildet (3x1)
    % closestP2: Punkt auf dem zweiten Segment, der den minimalen Abstand bildet (3x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
    
% Given two lines defined by (a0,a1,b0,b1)
% Return the closest points on each segment and their distance
% Quelle: https://de.mathworks.com/matlabcentral/fileexchange/32487-shortest-distance-between-two-line-segments
%%
min_dist = 0;
min_dist_row_col = zeros(1,2);
closestP1 = zeros(3,1);
closestP2 = zeros(3,1);

qa = qj_rad([1,4,7]);   
qp = qj_rad([2,5,8]);   

l_1i  = l_all_id([1 2]);
l_2i  = l_all_id([3 4]);
l_3i  = l_all_id([5 6]);

%% Alles in KS 0 ausgedrueckt
% clc
% Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
r_0G1 = [sin(psi_j(1));                -cos(psi_j(1)); 0]*r_fixPlat_j(1); % Inertial zu Basisgelenk 1
r_G1F1 = [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1)); 0]*l_1i(1); % Basisgelenk1 zu Elle 1
r_F1P1 = [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1)); 0]*l_1i(2); % Elle 1 zu Koppelgelenk 1

% Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
r_0G2 = [sin(psi_j(2));                -cos(psi_j(2)); 0]*r_fixPlat_j(2); % Inertial zu Basisgelenk 2
r_G2F2 = [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2)); 0]*l_2i(1); % Basisgelenk 2 zu Elle 2
r_F2P2 = [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2)); 0]*l_2i(2); % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt

% Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
r_0G3 = [sin(psi_j(3));                -cos(psi_j(3)); 0]*r_fixPlat_j(3); % Inertial zu Basisgelenk 3
r_G3F3 = [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3)); 0]*l_3i(1); % Basisgelenk 3 zu Elle 3
r_F3P3 = [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3)); 0]*l_3i(2); % Elle 3 zu Koppelgelenk 3

r_0F1 = r_0G1 + r_G1F1;
r_0P1 = r_0F1 + r_F1P1;

r_0F2 = r_0G2 + r_G2F2;
r_0P2 = r_0F2 + r_F2P2;

r_0F3 = r_0G3 + r_G3F3;
r_0P3 = r_0F3 + r_F3P3;

% Ausgehend von C1L1 zu 
[dist_13, ~, closestP1_13, closestP2_13] = DistBetween2Segment(r_0G1, r_0F1, r_0G2, r_0F2); % C2L1
[dist_14, ~, closestP1_14, closestP2_14] = DistBetween2Segment(r_0G1, r_0F1, r_0F2, r_0P2); % C2L2
[dist_15, ~, closestP1_15, closestP2_15] = DistBetween2Segment(r_0G1, r_0F1, r_0G3, r_0F3); % C3L1
[dist_16, ~, closestP1_16, closestP2_16] = DistBetween2Segment(r_0G1, r_0F1, r_0F3, r_0P3); % C3L2

% Ausgehend von C1L2 zu 
[dist_23, ~, closestP1_23, closestP2_23] = DistBetween2Segment(r_0F1, r_0P1, r_0G2, r_0F2); % C2L1
[dist_24, ~, closestP1_24, closestP2_24] = DistBetween2Segment(r_0F1, r_0P1, r_0F2, r_0P2); % C2L2
[dist_25, ~, closestP1_25, closestP2_25] = DistBetween2Segment(r_0F1, r_0P1, r_0G3, r_0F3); % C3L1
[dist_26, ~, closestP1_26, closestP2_26] = DistBetween2Segment(r_0F1, r_0P1, r_0F3, r_0P3); % C3L2

% Ausgehend von C2L1 zu 
[dist_35, ~, closestP1_35, closestP2_35] = DistBetween2Segment(r_0G2, r_0F2, r_0G3, r_0F3); % C3L1
[dist_36, ~, closestP1_36, closestP2_36] = DistBetween2Segment(r_0G2, r_0F2, r_0F3, r_0P3); % C3L2

% Ausgehend von C2L2 zu 
[dist_45, ~, closestP1_45, closestP2_45] = DistBetween2Segment(r_0F2, r_0P2, r_0G3, r_0F3); % C3L1
[dist_46, ~, closestP1_46, closestP2_46] = DistBetween2Segment(r_0F2, r_0P2, r_0F3, r_0P3); % C3L2

% Distanzmatrix
dist_matrix = zeros(6,6);

% Erste Zeile (C1L1)
dist_matrix(1,3) = dist_13; % Von C1L1 zu C2L1
dist_matrix(3,1) = dist_13; % Von C2L1 zu C1L1

dist_matrix(1,4) = dist_14; % Von C1L1 zu C2L2
dist_matrix(4,1) = dist_14; % Von C2L2 zu C1L1

dist_matrix(1,5) = dist_15; % Von C1L1 zu C3L1
dist_matrix(5,1) = dist_15; % Von C3L1 zu C1L1

dist_matrix(1,6) = dist_16; % Von C1L1 zu C3L2
dist_matrix(6,1) = dist_16; % Von C3L2 zu C1L1

% Zweite Zeile (C1L2)
dist_matrix(2,3) = dist_23; % Von C1L2 zu C2L1
dist_matrix(3,2) = dist_23; % Von C2L1 zu C1L2

dist_matrix(2,4) = dist_24; % Von C1L2 zu C2L2
dist_matrix(4,2) = dist_24; % Von C2L2 zu C1L2

dist_matrix(2,5) = dist_25; % Von C2L2 zu C3L1
dist_matrix(5,2) = dist_25; % Von C3L1 zu C2L2

dist_matrix(2,6) = dist_26; % Von C1L2 zu C3L2
dist_matrix(6,2) = dist_26; % Von C3L2 zu C1L2

% Dritte Zeile (C2L1)
dist_matrix(3,5) = dist_35; % Von C2L1 zu C3L1
dist_matrix(5,3) = dist_35; % Von C3L1 zu C2L1

dist_matrix(3,6) = dist_36; % Von C2L1 zu C3L2
dist_matrix(6,3) = dist_36; % Von C3L2 zu C2L1

% Vierte Zeile (C2L2)
dist_matrix(4,5) = dist_45; % Von C2L2 zu C3L1
dist_matrix(5,4) = dist_45; % Von C3L1 zu C2L2

dist_matrix(4,6) = dist_46; % Von C2L2 zu C3L2
dist_matrix(6,4) = dist_46; % Von C3L2 zu C2L2

min_dist = min(dist_matrix(dist_matrix>0));

[min_dist_row_, min_dist_col_] = find(dist_matrix==min_dist);
min_dist_row_col = [min_dist_row_(1) min_dist_col_(1)];

if  sum(min_dist_row_col == 1) && sum(min_dist_row_col == 3)
    closestP1 = closestP1_13;
    closestP2 = closestP2_13;
elseif sum(min_dist_row_col == 1) && sum(min_dist_row_col == 4)
    closestP1 = closestP1_14;
    closestP2 = closestP2_14;
elseif sum(min_dist_row_col == 1) && sum(min_dist_row_col == 5)
    closestP1 = closestP1_15;
    closestP2 = closestP2_15;  
elseif sum(min_dist_row_col == 1) && sum(min_dist_row_col == 6)
    closestP1 = closestP1_16;
    closestP2 = closestP2_16;      
    
elseif sum(min_dist_row_col == 2) && sum(min_dist_row_col == 3)
    closestP1 = closestP1_23;
    closestP2 = closestP2_23;
elseif sum(min_dist_row_col == 2) && sum(min_dist_row_col == 4)
    closestP1 = closestP1_24;
    closestP2 = closestP2_24;
elseif sum(min_dist_row_col == 2) && sum(min_dist_row_col == 5)
    closestP1 = closestP1_25;
    closestP2 = closestP2_25;  
elseif sum(min_dist_row_col == 2) && sum(min_dist_row_col == 6)
    closestP1 = closestP1_26;
    closestP2 = closestP2_26;  
    
elseif sum(min_dist_row_col == 3) && sum(min_dist_row_col == 5)
    closestP1 = closestP1_35;
    closestP2 = closestP2_35;  
elseif sum(min_dist_row_col == 3) && sum(min_dist_row_col == 6)
    closestP1 = closestP1_36;
    closestP2 = closestP2_36;        
elseif sum(min_dist_row_col == 4) && sum(min_dist_row_col == 5)
    closestP1 = closestP1_45;
    closestP2 = closestP2_45;  
elseif sum(min_dist_row_col == 4) && sum(min_dist_row_col == 6)
    closestP1 = closestP1_46;
    closestP2 = closestP2_46;  
end

    %%
    % Computes the minimum distance between two line segments. Code
    % is adapted for Matlab from Dan Sunday's Geometry Algorithms originally
    % written in C++
    % http://softsurfer.com/Archive/algorithm_0106/algorithm_0106.htm#dist3D_Segment_to_Segment
    % Usage: Input the start and end x,y,z coordinates for two line segments. 
    % p1, p2 are [x,y,z] coordinates of first line segment and p3,p4 are for
    % second line segment. 
    % Outputs: 
    %    vector connecting the closest points
    %    Closest point on object 1 
    %    Closest point on object 2
    %  Example:
    %	P1 = [0 0 0];     P2 = [1 0 0];
    %   P3 = [0 1 0];     P4 = [1 1 0];
    %	dist = DistBetween2Segment(P1, P2, P3, P4)
    %   dist =
    %
    %    1
    % Quelle: 
    % https://math.stackexchange.com/questions/846054/closest-points-on-two-line-segments
    function [distance, vec_closestPoints, vec_closestPoint1, vec_closestPoint2] = DistBetween2Segment(p1, p2, p3, p4)
        distance = 0;
        vec_closestPoints = zeros(3,1);
        vec_closestPoint1 = vec_closestPoints;
        vec_closestPoint2 = vec_closestPoints;
        
        u = p1 - p2; % Vektor von p1 zu p2 (Segment 1)
        v = p3 - p4; % Vektor von p3 zu p4 (Segment 2)
        w = p2 - p4; % Vektor von p2 zu p4 (Seg1 zweiter punkt zu Seg2 zweiter Punkt)

        a = dot(u,u); % Quadrierte Laenge vom 1. Segmentvektor 
        b = dot(u,v); % Skalarprodukt von beiden Segmentvektoren
        c = dot(v,v); % Quadrierte Länge vom 2. Segmentvektor
        d = dot(u,w); % Skalarprodukt vom ersten Segmentvektor und dem Vektor von p2 zu p4
        e = dot(v,w); % Skalarprodukt vom zweiten Segmentvektor und dem Vektor von p2 zu p4
        D = a*c - b*b; % Produkt beider Längen - Quadrat des Skalarproduktes beider Segmentvektoren
        sD = D;
        tD = D;

        SMALL_NUM = 0.00000001;

        % compute the line parameters of the two closest points
        if (D < SMALL_NUM)  % the lines are almost parallel
            sN = 0.0;       % force using point P0 on segment S1
            sD = 1.0;       % to prevent possible division by 0.0 later
            tN = e;
            tD = c;
        else                % get the closest points on the infinite lines
            sN = (b*e - c*d);
            tN = (a*e - b*d);
            % Ueberpruefe, ob sN (s-Koordinate des Schnittpunkt der Normalen auf Achse 1 (p2-p1) innerhalb von p2-p1 liegt
            if (sN < 0.0)   % sc < 0 => the s=0 edge is visible       
                sN = 0.0;
                tN = e;
                tD = c;
            elseif (sN > sD)% sc > 1 => the s=1 edge is visible
                sN = sD;
                tN = e + b;
                tD = c;
            end
        end

        % Ueberpruefe, ob tN (t-Koordinate des Schnittpunkt der Normalen auf Achse 2 (p4-p3) innerhalb von p4-p3 liegt
        if (tN < 0.0)            % tc < 0 => the t=0 edge is visible
            tN = 0.0;
            % recompute sc for this edge
            if (-d < 0.0)
                sN = 0.0;
            elseif (-d > a)
                sN = sD;
            else
                sN = -d;
                sD = a;
            end
        elseif (tN > tD)       % tc > 1 => the t=1 edge is visible
            tN = tD;
            % recompute sc for this edge
            if ((-d + b) < 0.0)
                sN = 0;
            elseif ((-d + b) > a)
                sN = sD;
            else 
                sN = (-d + b);
                sD = a;
            end
        end

        % finally do the division to get sc and tc
            % sc := Linienvariable vom ersten Segmentvektor bzgl. des closest point
            % tc := Linienvariable vom zweiten Segmentvektor bzgl. des closest point
        if(abs(sN) < SMALL_NUM)
            sc = 0.0;
        else
            sc = sN / sD;
        end

        if(abs(tN) < SMALL_NUM)
            tc = 0.0; 
        else
            tc = tN / tD;
        end

        % get the difference of the two closest points
        dP = w + (sc * u) - (tc * v);  % = S1(sc) - S2(tc)
        distance = norm(dP);
        outV = dP;

        vec_closestPoints = outV;      % vector connecting the closest points
        vec_closestPoint1 = p2+sc*u;   % Closest point on object 1 
        vec_closestPoint2 = p4+tc*v;   % Closest point on object 2

    end

end
