function [u_i, leverage_KSMP_Fext_coord, lineofact_MP_Fext_coord, distances, angles] = ...
    CalcGeomFeatures(Fext, xEE, q, param)
    qa = q([1 4 7]);
    qp = q([2 5 8]);
    if norm(Fext(1:2))<1e-3
        u_i =Fext(1:2)/(norm(Fext(1:2))+1e-3); % Richtungsvektor der Geraden (Verschiebung der Kraft entlang der Wirklinie)
    else
        u_i =Fext(1:2)/norm(Fext(1:2)); % Richtungsvektor der Geraden (Verschiebung der Kraft entlang der Wirklinie)
    end
    S1 = [0       0       Fext(2); 
          0       0      -Fext(1);
         -Fext(2) Fext(1) 0];
 
    mindist_larm2 = pinv(S1')*[0;0;Fext(3)];      
    leverage_KSMP_Fext_coord = [xEE(1) mindist_larm2(1)+xEE(1); 
                                xEE(2) mindist_larm2(2)+xEE(2)];
    lineofact_MP_Fext_coord = [mindist_larm2(1)+xEE(1)-u_i(1)*0.2 mindist_larm2(1)+u_i(1)*0.2+xEE(1);
                               mindist_larm2(2)+xEE(2)-u_i(2)*0.2 mindist_larm2(2)+u_i(2)*0.2+xEE(2)];            
    
    rmp_loa = [mindist_larm2(1)+xEE(1); mindist_larm2(2)+xEE(2); 0];
    u_i_3d = [u_i;0];                        
    distances = zeros(3,1);
    angles = zeros(3,1);
    for chain=1:3
        b2_chain = [sin(param.psi_j(chain));                  -cos(param.psi_j(chain))]*param.r_fixPlat_j(chain)+...% Inertial zu Basisgelenk 1
                   [cos(param.psi_j(chain) + qa(chain));       sin(param.psi_j(chain) + qa(chain))]*param.l_all_id(chain*2-1);% Basisgelenk1 zu Elle 1

        a2_chain = [cos(param.psi_j(chain) + qa(chain) + qp(chain)); 
                    sin(param.psi_j(chain) + qa(chain) + qp(chain))]*param.l_all_id(chain*2); 

        x3 = a2_chain(1)+b2_chain(1);
        y3 = a2_chain(2)+b2_chain(2);
        r_cJi = [x3; y3; 0];
%         x11 = lineofact_MP_Fext_coord(1,1); x22 = lineofact_MP_Fext_coord(1,2);
%         y11 = lineofact_MP_Fext_coord(2,1); y22 = lineofact_MP_Fext_coord(2,2);
%         distance = GetPointLineDistance(x3,y3,x11,y11,x22,y22);
        % Quelle: https://mathworld.wolfram.com/Point-LineDistance3-Dimensional.html
        if norm(u_i_3d)>1e-5
            % Quelle: https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line#:~:text=to%20two%20dimensions.-,Another%20vector%20formulation,-%5Bedit%5D
            distance = norm(cross(r_cJi-rmp_loa, u_i_3d));
        else 
            distance=100;
        end
        distances(chain) = distance;
        
%         x1 = u_i(1); y1 = u_i(2);
%         x2 = a2_chain(1); y2 = a2_chain(2);
%         angle2 = atan2d(x1*y2-y1*x2,x1*x2+y1*y2);
        a2 = [a2_chain;0];
        angle = atan2d(norm(cross(u_i_3d,a2)), dot(u_i_3d,a2));
%         angle = atand(norm(cross(u_i_3d,a2))/ dot(u_i_3d,a2));

        angles(chain) = angle;
    end
end



function distance = GetPointLineDistance(x3,y3,x1,y1,x2,y2)
% Get the distance from a point (x3, y3) to
% a line defined by two points (x1, y1) and (x2, y2);
% Reference: http://mathworld.wolfram.com/Point-LineDistance2-Dimensional.html	
	% Find the numerator for our point-to-line distance formula.
	numerator = abs((x2 - x1) * (y1 - y3) - (x1 - x3) * (y2 - y1));
	
	% Find the denominator for our point-to-line distance formula.
	denominator = sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2);
	
	% Compute the distance.
    if denominator > 1e-5
        distance = numerator ./ denominator;
    else
        distance = 100;
    end
end