function pred_body  ... 
    = localize_chain_link_thresholddecision(Fext_obs, Tauext_qa, distances, angles, param)
    % Funktion für die Kontaktkörperklassifikation 
    % Eingabe:
    % Fext_obs in N und Nm: Geschätzte externe Kräfte und Momente in Plattformkoordinaten (3x1)
    % Tauext_qa in Nm: Geschätzte externe Momente in Antriebskoordinaten (3x1)
    % distances in m: Array mit minimalen Distanzen von der Wirklinie zu den Plattformkoppelgelenken (3x1)
    % angles in rad: Array mit Winkelm zwischen Wirklinie und Unterarmen (3x1)
    %
    % Ausgabe:
    % pred_body: 0=Kein Körper, 1=C1L1, 2=C1L2, 3=C2L1, 4=C2L2, 5=C3L1, 6=C3L2, 7=mP (1x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institut für Mechatronische Systeme, Universität Hannover
                      
%     if abs(Fext_obs(1)) >= param.CollDet_limit_MobPlat(1) || abs(Fext_obs(2)) >= param.CollDet_limit_MobPlat(2) || abs(Fext_obs(3)) >= param.CollDet_limit_MobPlat(3) 
        % Lokalisation - Start
        [min_dist, sel_chain] = min(distances);
        if min_dist > param.min_dist_threshold 
            pred_body = 7;
        else
            angle = angles(sel_chain);
            if sum(abs(Tauext_qa)>param.min_torque_threshold)<2 && (abs(angle)<param.min_angle_threshold_grad || abs(angle)>(180-param.min_angle_threshold_grad))
                pred_body = 2*sel_chain-1;            
            else
                pred_body = 2*sel_chain;                        
            end
        end 
%     else
%         pred_body = 0;
%     end
end


function distance = GetPointLineDistance(x3,y3,x1,y1,x2,y2)
% Get the distance from a point (x3, y3) to
% a line defined by two points (x1, y1) and (x2, y2);
% Reference: http://mathworld.wolfram.com/Point-LineDistance2-Dimensional.html
% try
	
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
% catch ME
% 	callStackString = GetCallStack(ME);
% 	errorMessage = sprintf('Error in program %s.\nTraceback (most recent at top):\n%s\nError Message:\n%s',...
% 		mfilename, callStackString, ME.message);
% 	uiwait(warndlg(errorMessage))
% end
% return; % from GetPointLineDistance()
end

