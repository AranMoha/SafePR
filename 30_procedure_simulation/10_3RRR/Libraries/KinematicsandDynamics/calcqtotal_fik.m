function q = calcqtotal_fik(x, param)
    [qa, qp] = calcq(x, param.psi_j, param.beta_j, param.r_fixPlat_j, param.r_mobPlat_j, param.l_all_id);
    phie = x(3); 
    q13 = phie - (param.psi_j(1) + qa(1) + qp(1)); 
    q23 = phie - (param.psi_j(2) + qa(2) + qp(2)); 
    q33 = phie - (param.psi_j(3) + qa(3) + qp(3)); 

    q = [qa(1); qp(1); q13; ...
        qa(2); qp(2); q23; ...
        qa(3); qp(3); q33];
end