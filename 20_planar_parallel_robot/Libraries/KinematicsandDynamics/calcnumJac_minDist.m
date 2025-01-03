function [J_dist,  mindist, grad_dist_dqa,  grad_dist_dx_dqa,  grad_dist_dx] = ...
          calcnumJac_minDist(J, q_ist_rad, q_xtr_virt, q_ytr_virt, q_zrot_virt, ...
          q_qa1_virt, q_qa2_virt, q_qa3_virt, param)
    %% Init
    grad_dist_dx = zeros(1,3);
    grad_dist_dqa = zeros(1,3);

    %% Numerische Gradientenbildung
    % Minimalen Segementabstand und minimalen Gelenkwinkel q2 berechnen    
    [mindist, ~] = calcShortestDistance(q_ist_rad, param.l_all_id, param.r_fixPlat_j, param.psi_j);
    [mindist_xtr_virt, ~] = calcShortestDistance(q_xtr_virt, param.l_all_id, param.r_fixPlat_j, param.psi_j);
    [mindist_ytr_virt, ~] = calcShortestDistance(q_ytr_virt, param.l_all_id, param.r_fixPlat_j, param.psi_j);
    [mindist_zrot_virt, ~] = calcShortestDistance(q_zrot_virt, param.l_all_id, param.r_fixPlat_j, param.psi_j);
    [mindist_qa1_virt, ~] = calcShortestDistance(q_qa1_virt, param.l_all_id, param.r_fixPlat_j, param.psi_j);
    [mindist_qa2_virt, ~] = calcShortestDistance(q_qa2_virt, param.l_all_id, param.r_fixPlat_j, param.psi_j);
    [mindist_qa3_virt, ~] = calcShortestDistance(q_qa3_virt, param.l_all_id, param.r_fixPlat_j, param.psi_j);
    % Mindestdistanz - Verschoben im Taskspace
    grad_dist_dx(1) = (mindist_xtr_virt - mindist)/param.delta_xphiEE_m;
    grad_dist_dx(2) = (mindist_ytr_virt - mindist)/param.delta_xphiEE_m;
    grad_dist_dx(3) = (mindist_zrot_virt - mindist)/param.delta_xphiEE_rad;
    % Mindestdistanz - Verschoben im Jointspace
    grad_dist_dqa(1) = (mindist_qa1_virt - mindist)/param.delta_qa_rad;
    grad_dist_dqa(2) = (mindist_qa2_virt - mindist)/param.delta_qa_rad;
    grad_dist_dqa(3) = (mindist_qa3_virt - mindist)/param.delta_qa_rad;
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
    J_dist = zeros(1,3);
    switch Variante
        case 1
            % ohne Nullraumprojektor alle rotatorischen FHG   
            J_dist = grad_dist_dx * J + grad_dist_dqa;
        case 2
            % ohne Nullraumprojektor nur Z-Rotation (vermutlich andere Komponenten in grad_****_dqa!)    
            J_dist = grad_dist_dx(3) * J_z + grad_dist_dqa;
        case 3
            % mit Nullraumprojektor alle rotatorischen FHG
            J_dist = grad_dist_dx * J + transpose(N_tr * transpose(grad_dist_dqa));
        case 4
            % mit Nullraumprojektor nur Z-Rotation (auch Nullraumprojektor anpassen!)
            J_dist = grad_dist_dx(3) * J_z + transpose(N_tr_z * transpose(grad_dist_dqa));
    end
    grad_dist_dx_dqa = grad_dist_dx * J;
    
end