function [q_qa1_virt, q_qa2_virt, q_qa3_virt, x_qa1_virt, x_qa2_virt, x_qa3_virt, converged_detLimit_OPspaceLimits_check] = ...
            rr_qavirt(qa_ist, x0, param)

qa1_virt = qa_ist; 
qa2_virt = qa_ist;
qa3_virt = qa_ist;

qa1_virt(1) = qa1_virt(1) + param.delta_qa_rad;
qa2_virt(2) = qa2_virt(2) + param.delta_qa_rad;
qa3_virt(3) = qa3_virt(3) + param.delta_qa_rad;


[q_qa1_virt, x_qa1_virt, converged_detLimit_OPspaceLimits_check1] = calc_qvirt_rad(qa1_virt, x0, param);
[q_qa2_virt, x_qa2_virt, converged_detLimit_OPspaceLimits_check2] = calc_qvirt_rad(qa2_virt, x0, param);
[q_qa3_virt, x_qa3_virt, converged_detLimit_OPspaceLimits_check3] = calc_qvirt_rad(qa3_virt, x0, param);

converged_detLimit_OPspaceLimits_check = [converged_detLimit_OPspaceLimits_check1 converged_detLimit_OPspaceLimits_check2 converged_detLimit_OPspaceLimits_check3];

end

function [q, x, converged_detLimit_OPspaceLimits_check] = calc_qvirt_rad(qa_virt_rad, x0, param)
    [x , ~, converged_detLimit_OPspaceLimits_check]= find_fk_simulink(qa_virt_rad, x0, param.psi_j, param.beta_j, param.r_fixPlat_j, ...
                                     param.r_mobPlat_j, param.l_all_id, param.max_iter_find_fk_simulink, param.max_radius+0.2, ...
                                     param.max_phie+deg2rad(30), param.min_det_JacA_hredx, param.min_det_JacB_hredqa);                    

    % Resultierenden vollständigen Joint-Space berechnen
    q = calcqtotal_fik(x, param);
end
