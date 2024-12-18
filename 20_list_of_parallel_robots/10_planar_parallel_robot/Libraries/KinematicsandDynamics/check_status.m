function [status] = check_status(sigma_dot,sigma,valid_set, gain_check_status)
    %Check whether set-based task is active or inactive with extended tangent
    %cone to valid_set (current task velocity sigma_dot and task value in NEXT iteration
    %sigma_star are relevant)
    %This is a modification of the extended tangent cone from [Moe2016]
    %Input:
    %double sigma_dot: 
    %   Task velocity
    %double sigma: 
    %   Task value 
    %double [1 x 2] valid_set: 
    %   Task lower and upper boundary
    %Output:
    %bool status: 
    %   set-based task status -> Is sigma_dot element of the extended tangent cone? 
    sigma_min=valid_set(1);
    sigma_max=valid_set(2);
    param_status_lbound = gain_check_status(1); % für Rückzug; Geschwid. muss mind. so groß sein 
    param_check_status_zero = gain_check_status(2);
    param_round_check_status_zero = gain_check_status(3);
    if sigma>sigma_min && sigma<sigma_max
        %task value is within valid-set in the next iteration
        status=true;
% %     elseif sigma<=sigma_min && ((sigma_dot>0 && abs(sigma_dot)>param_status_lbound) || abs(sigma_dot)<param_check_status_zero)
%     elseif sigma<=sigma_min && (round(sigma_dot*param_round_check_status_zero)/param_round_check_status_zero==0 || sigma_dot>0)
%         %task value in the next iteration is outside the valid-set, but task
%         %velocity points to the interior of the valid-set
%         status=true;
% %     elseif sigma>=sigma_max && ((sigma_dot<0 && abs(sigma_dot)>param_status_lbound) || abs(sigma_dot)<param_check_status_zero)
%     elseif sigma>=sigma_max && (round(sigma_dot*param_round_check_status_zero)/param_round_check_status_zero==0 || sigma_dot<0) 
%         %task value in the next iteration is outside the valid-set, but task
%         %velocity points to the interior of the valid-set
%         status=true;
    else
        status=false;
    end
end
