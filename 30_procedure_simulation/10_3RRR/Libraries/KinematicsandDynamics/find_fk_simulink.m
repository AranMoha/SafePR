function [x_out , iter_final, converged_detLimit_OPspaceLimits_check]= find_fk_simulink(qa, x_0, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id,...
                                  max_iter_find_fk_simulink, max_radius, max_phie, min_det_JacA_hredx, min_det_JacB_hredqa)
                              
    % Function for forward kinematics using Newton-Raphson
    % This function can be used to calculate the platform pose with known drive coordinates qa and an initial estimate x0.
    % Input:
    % qa in rad: Active joint's angle (3x1)
    % x_0 in m and rad: Platform coordinates in the base CS (1x3)
    %
    % Output:
    % x_out in m and rad: Result of the optimization (3x1)
    % iter_final: Required number of iterations
    % converged_detLimit_OPspaceLimits_check: 3x1 vector with binary
    % entries, whether 
    % (i) the optimization problem has converged
    % (ii) the determinants of the Jacobian matrices dhred/dqa and dhred/dx based on x_out are satisfied
    % (iii) x_out is within the workspace bounds

    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12
    % (C) Institute for Mechatronic Systems, Leibniz University Hanover
                        
                              
    % Setting initial values
    iter = 0; % Iteration variable for the while loop of the optimization
    lambda = 0;
    x_old = [100; 100; 100]; % Must be unequal to x_0
    qa0_find_dk = [100;100;100]; % Must be unequal to qa
    x = x_0; % Initial value for x
    det_limit_overflow = 1; % Singularity limits are violated
    
    while (norm(x_old-x) > 10^(-7) && iter< max_iter_find_fk_simulink)
        x_old = x;
        [qa0_find_dk, qp0_find_dk] = calcq(x_old, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)   ; 
        f = qa - qa0_find_dk;
        xEE = toX_t6_single(x');
        qj_rad  = calcq9D(qa0_find_dk, qp0_find_dk, x, psi_j);

        J_hredx_3RRRreturn = JacA_hredx_ind_3RRR(qj_rad, xEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, beta_j);
        J_hredqa_3RRRreturn = JacB_hredqa_ind_3RRR(qj_rad, xEE, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, beta_j);

        if abs(det(J_hredx_3RRRreturn)) > min_det_JacA_hredx && abs(det(J_hredqa_3RRRreturn)) >  min_det_JacB_hredqa % Überprüfe, ob EE-Pose entfernt genug einer Singularität ist
            det_limit_overflow = 0; % Output numeric xEE
        else
            det_limit_overflow = 1; % Output geometric xEE (=x_0)
            break
        end
        Jinv = -(J_hredqa_3RRRreturn\ J_hredx_3RRRreturn);
        J = Jinv\ eye(3,3);
        x = x_old + J*f;       
        dhdx = -Jinv;
        x = x_old - (dhdx'*dhdx+lambda*eye(3,3))\dhdx'*f; % Damped-Least-Squares
        
        iter = iter + 1;
    end
    iter_final = iter;
    qa0_find_dk_final = qa0_find_dk;
    
    if (norm(x_old-x) <= 10^(-7)) && (norm(qa0_find_dk_final-qa)<=10^(-3)) && det_limit_overflow == 0 % Ist konvergiert, wenn Änderung über x gering oder Differenz zwischen modelliertem und gemessenen qa
        converged = 1;
    else
        converged = 0;        
    end
    
    if det_limit_overflow == 0 % Singularity conditions are fulfilled
        r = sqrt(x(1)^2+x(2)^2); 
        if r <= max_radius && abs(x(3))<= max_phie % Maximum permitted radius and angle
            x_out = x; % Output numeric xEE
            OPspaceLimits_check = 1;
        else
            x_out = x_0; % Output geometric xEE (=x_0)
            OPspaceLimits_check = 0;
        end
    else
        x_out = x_0;
        OPspaceLimits_check = 0;
    end
    
    if det_limit_overflow==0
        det_limit_check=1;
    else
        det_limit_check=0;
    end
    
    converged_detLimit_OPspaceLimits_check = [converged; det_limit_check; OPspaceLimits_check];
    
    function X_t6 = toX_t6_single(X_t_)
        X_t = reshape(X_t_, [1,3]);
        X_t6 = [X_t(1,1) X_t(1,2) 0 0 0 X_t(1,3)];
    end

    function q  = calcq9D(qa, qp, xEE, psi_j)
    phie = xEE(3); 
    q13 = phie - (psi_j(1) + qa(1) + qp(1)); 
    q23 = phie - (psi_j(2) + qa(2) + qp(2)); 
    q33 = phie - (psi_j(3) + qa(3) + qp(3)); 

    q = [qa(1); qp(1); q13; ...
        qa(2); qp(2); q23; ...
        qa(3); qp(3); q33];
    end
end