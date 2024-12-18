function pred_body = localize_chain_link_thresholddecision(Tauext_qa, distances, angles, min_dist_threshold, min_angle_threshold_deg, min_torque_threshold)
    % Function for contact body classification 
    % Input:
    % Fext_obs in N and Nm: Estimated external forces and moments in platform coordinates (3x1)
    % Tauext_qa in Nm: Estimated external moments in drive coordinates (3x1)
    % distances in m: Array with minimum distances from the line of action to the platform coupling joints (3x1)
    % angles in rad: Array with angles between line of action and lower arms (3x1)
    %
    % Output:
    % pred_body: 0=No body, 1=C1L1, 2=C1L2, 3=C2L1, 4=C2L2, 5=C3L1, 6=C3L2, 7=mP (1x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institute for Mechatronic Systems, Leibniz University Hanover
                      
    % Lokalisation - Start
    [min_dist, sel_chain] = min(distances);
    if min_dist > min_dist_threshold 
        pred_body = 7;
    else
        angle = angles(sel_chain);
        if sum(abs(Tauext_qa)>min_torque_threshold)<2 && (abs(angle)<min_angle_threshold_deg || abs(angle)>(180-min_angle_threshold_deg))
            pred_body = 2*sel_chain-1;            
        else
            pred_body = 2*sel_chain;                        
        end
    end 
end
