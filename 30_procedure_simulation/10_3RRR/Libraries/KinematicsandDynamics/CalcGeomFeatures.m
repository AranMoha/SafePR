function [u_i, leverage_KSMP_Fext_coord, lineofact_MP_Fext_coord, distances, angles] = ...
    CalcGeomFeatures(Fext_mP, x, q, psi_j, r_fixPlat_j, l_all_id)
    qa = q([1 4 7]);
    qp = q([2 5 8]);
    if norm(Fext_mP(1:2))<1e-3
        u_i =Fext_mP(1:2)/(norm(Fext_mP(1:2))+1e-3); % Direction vector of the straight line (displacement of the force along the line of action)
    else
        u_i =Fext_mP(1:2)/norm(Fext_mP(1:2)); % Direction vector of the straight line (displacement of the force along the line of action)
    end
    S1 = [0       0       Fext_mP(2); 
          0       0      -Fext_mP(1);
         -Fext_mP(2) Fext_mP(1) 0];
 
    mindist_larm2 = pinv(S1')*[0;0;Fext_mP(3)];      
    leverage_KSMP_Fext_coord = [x(1) mindist_larm2(1)+x(1); 
                                x(2) mindist_larm2(2)+x(2)];
    lineofact_MP_Fext_coord = [mindist_larm2(1)+x(1)-u_i(1)*0.2 mindist_larm2(1)+u_i(1)*0.2+x(1);
                               mindist_larm2(2)+x(2)-u_i(2)*0.2 mindist_larm2(2)+u_i(2)*0.2+x(2)];            
    
    rmp_loa = [mindist_larm2(1)+x(1); mindist_larm2(2)+x(2); 0];
    u_i_3d = [u_i;0];                        
    distances = zeros(3,1);
    angles = zeros(3,1);
    for chain=1:3
        b2_chain = [sin(psi_j(chain));                  -cos(psi_j(chain))]*r_fixPlat_j(chain)+...% Inertial-CS to base joint 1
                   [cos(psi_j(chain) + qa(chain));       sin(psi_j(chain) + qa(chain))]*l_all_id(chain*2-1);% Base joint 1 to elbow 1

        a2_chain = [cos(psi_j(chain) + qa(chain) + qp(chain)); 
                    sin(psi_j(chain) + qa(chain) + qp(chain))]*l_all_id(chain*2); 

        x3 = a2_chain(1)+b2_chain(1);
        y3 = a2_chain(2)+b2_chain(2);
        r_cJi = [x3; y3; 0];
        % Ref: https://mathworld.wolfram.com/Point-LineDistance3-Dimensional.html
        if norm(u_i_3d)>1e-5
            % Ref: https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line#:~:text=to%20two%20dimensions.-,Another%20vector%20formulation,-%5Bedit%5D
            distance = norm(cross(r_cJi-rmp_loa, u_i_3d));
        else 
            distance=100;
        end
        distances(chain) = distance;
        
        a2 = [a2_chain;0];
        angle = atan2d(norm(cross(u_i_3d,a2)), dot(u_i_3d,a2));

        angles(chain) = angle;
    end
end

