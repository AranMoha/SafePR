function [J_kappa, kappa_J, grad_kappa_dqa, grad_kappa_dx_dqa, grad_kappa_dx] = ...
          calcnumJac_kond(J, q_xtr_virt, q_ytr_virt, q_zrot_virt, x_xtr_virt, x_ytr_virt, x_zrot_virt, ...
          q_qa1_virt, q_qa2_virt, q_qa3_virt, x_qa1_virt, x_qa2_virt, x_qa3_virt, param)
    %% Init
    grad_kappa_dx = zeros(1,3);
    grad_kappa_dqa = zeros(1,3);

    %% Numerische Gradientenbildung
    % Konditionszahl berechnen
    kappa_J = cond(J,2);
    kappa_xtr_virt = calc_condJ(q_xtr_virt, x_xtr_virt, param);
    kappa_ytr_virt = calc_condJ(q_ytr_virt, x_ytr_virt, param);
    kappa_zrot_virt = calc_condJ(q_zrot_virt, x_zrot_virt, param);
    kappa_qa1_virt = calc_condJ(q_qa1_virt, x_qa1_virt, param);
    kappa_qa2_virt = calc_condJ(q_qa2_virt, x_qa2_virt, param);
    kappa_qa3_virt = calc_condJ(q_qa3_virt, x_qa3_virt, param);

    % Konditionszahl - Verschoben im Taskspace
    grad_kappa_dx(1,1) = (kappa_xtr_virt - kappa_J)/param.delta_xphiEE_m;
    grad_kappa_dx(1,2) = (kappa_ytr_virt - kappa_J)/param.delta_xphiEE_m;
    grad_kappa_dx(1,3) = (kappa_zrot_virt - kappa_J)/param.delta_xphiEE_rad;
    
    % Konditionszahl - Verschoben im Jointspace
    grad_kappa_dqa(1,1) = (kappa_qa1_virt - kappa_J)/param.delta_qa_rad;
    grad_kappa_dqa(1,2) = (kappa_qa2_virt - kappa_J)/param.delta_qa_rad;
    grad_kappa_dqa(1,3) = (kappa_qa3_virt - kappa_J)/param.delta_qa_rad;

    %% Aufstellen der Jakobi Matrizen
    % Jacobi Matrix der rotatorischen Freiheitsgrade (equality Nebenbedingung)
    J_z = J(3,:);
    % Nullraumprojektoren aufstellen
    E = eye(3);
    N_tr = E - pinv(J(1:2,:))*J(1:2,:);
    N_tr_z = E - pinv(J(3,:))*J(3,:);
    % Auswahl der Variante in der die Jakobi Matrizen erstellt werden
    % sollen (erste Test´s zeigen keinen Unterschied zwischen den Varianten
    % was unrealistisch ist
    Variante = 1;
    Variante = param.Variante;
    J_kappa = zeros(1,3);
    switch Variante
        case 1
            % ohne Nullraumprojektor alle rotatorischen FHG   
            J_kappa = grad_kappa_dx * J + grad_kappa_dqa;
        case 2
            % ohne Nullraumprojektor nur Z-Rotation (vermutlich andere Komponenten in grad_****_dqa!)    
            J_kappa = grad_kappa_dx(3) * J_z + grad_kappa_dqa;
        case 3
            % mit Nullraumprojektor alle rotatorischen FHG
            J_kappa = grad_kappa_dx * J + transpose(N_tr * transpose(grad_kappa_dqa));
        case 4
            % mit Nullraumprojektor nur Z-Rotation (auch Nullraumprojektor anpassen!)
            J_kappa = grad_kappa_dx(3) * J_z + transpose(N_tr_z * transpose(grad_kappa_dqa));
    end
    grad_kappa_dx_dqa = grad_kappa_dx * J;    
end

function cond_J = calc_condJ(qj_rad, xEE_, param)
    xEE = [xEE_(1); xEE_(2); 0; 0; 0; xEE_(3)];
    JacA_hredx_ind_3RRRreturn = JacA_hredx_ind_3RRR(qj_rad, xEE, param.l_all_id, param.r_fixPlat_j, param.r_mobPlat_j, param.psi_j, param.beta_j);
    JacB_hredqa_ind_3RRRreturn = JacB_hredqa_ind_3RRR(qj_rad, xEE, param.l_all_id, param.r_fixPlat_j, param.r_mobPlat_j, param.psi_j, param.beta_j);
    Jinv_hredqax_ind_3RRRreturn = -inv(JacB_hredqa_ind_3RRRreturn)*JacA_hredx_ind_3RRRreturn;
    J_hredxqa_ind_3RRRreturn = inv(Jinv_hredqax_ind_3RRRreturn);
    cond_J = cond(J_hredxqa_ind_3RRRreturn,2);
end