function [predLoc, predForce, x_P,tauext_est_mean] = LocIsol_particleFilter(trigger, Tauext, predBody, q, dq, x, dx, Jinv_hqx_ind, J_hredxqa,...
    n_particle, l_all, r_BasisPla_MobPla, l_all_id, r_fixPlat_j, r_mobPlat_j, psi_j, x_N_3D, x_CovR_Inv_3D)
    
    persistent x_P_est
    
    if predBody == 2 
        pred_chain = 1; 
    elseif predBody == 4 
        pred_chain = 2; 
    elseif predBody == 6 
        pred_chain = 3; 
    else
        predLoc = 0;
        predForce = zeros(1,2);
        tauext_est_mean = zeros(3,1);
        x_P = zeros(n_particle,3);
        return
    end
    
    if isempty(x_P_est) || trigger
        x_P_est = init_particleFilter(n_particle);
    end
    
    pred_link = 2;
    qa = q([1 4 7]);
    qp = q([2 5 8]);
    qseg = qa(pred_chain) + psi_j(pred_chain)+qp(pred_chain);    
    R_0Gj = [cos(qseg) -sin(qseg) 0 ; sin(qseg) cos(qseg) 0 ;0 0 1]; 
    z=Tauext;
    x_P_update=nan(n_particle,3);
    z_update=nan(n_particle,3);
    P_w=nan(1,n_particle);
    for k = 1:n_particle

        x_P_update(k,1) = (x_P_est(k,1) + sqrt(x_N_3D(1))*randn);
        x_P_update(k,2) = (x_P_est(k,2) + sqrt(x_N_3D(2))*randn);
        x_P_update(k,3) = (x_P_est(k,3) + sqrt(x_N_3D(3))*randn);

        jj = x_P_update(k,1);
        [~, ~, ~, Jac_xpq, ~, ~, ~, ~,~, ~]... 
        = calcJac_colSeg(pred_link, q, dq, x, dx, l_all, r_BasisPla_MobPla, ...
                         l_all_id, r_fixPlat_j, r_mobPlat_j, pred_chain,...
                         jj, 0); 
        Jac_xpx = Jac_xpq*Jinv_hqx_ind;
        Jac_xpqa = Jac_xpx*J_hredxqa;
        Jac_xpqa_t = Jac_xpqa';
        z_update(k,:) = (Jac_xpqa_t(:,1:2) * R_0Gj(1:2,1:2) * [x_P_update(k,2);x_P_update(k,3)])'; 
        
        P_wtmp = 1; % As weights are standardized later, this variable has no influence
        P_w(k) = P_wtmp * exp(-0.5*(z-z_update(k,:)')'*x_CovR_Inv_3D*(z-z_update(k,:)'));
    end

        P_w = P_w./sum(P_w);

        indx = resampleSystematic(P_w);
        x_P_est = x_P_update(indx,:);

        x_P=x_P_est;
        x_mean = mean(x_P_est);
        [~, ~, ~, Jac_xpq_mean, ~, ~, ~, ~,~, ~]... 
        = calcJac_colSeg(pred_link, q, dq, x, dx, l_all, r_BasisPla_MobPla, ...
                         l_all_id, r_fixPlat_j, r_mobPlat_j, pred_chain,...
                         x_mean(1), 0); 
        Jac_xpx_mean = Jac_xpq_mean*Jinv_hqx_ind;
        Jac_xpqa_mean = Jac_xpx_mean*J_hredxqa;
        Jac_xpqa_t_mean = Jac_xpqa_mean';
        tauext_est_mean = (Jac_xpqa_t_mean(:,1:2) * R_0Gj(1:2,1:2) * [x_mean(2);x_mean(3)])'; 
%         x_mean = P_w'*x_P;
        predLoc=x_mean(1);
        predForce=x_mean(2:3);
end

function x_P = init_particleFilter(N)
    % make the randomly generated particles from the initial prior gaussian distribution
    x_P=nan(N,3);
    for i = 1:N
            x_P(i,1) = unifrnd(0,1);
            x_P(i,2) = unifrnd(-10,10);
            x_P(i,3) = unifrnd(-40,40);
    end
end

function indx = resampleSystematic(w)
    indx = zeros(size(w));
    N = length(w);
    Q = cumsum(w);
    T = linspace(0,1-1/N,N+1) + rand(1)/N;
    T(N+1) = 1;
    i=1;
    j=1;
    while (i<=N)
        if (T(i)<Q(j))
            indx(i)=j;
            i=i+1;
        else
            j=j+1;        
        end
    end
end
