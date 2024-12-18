function q  = calcQtotal(qa, qp, xEE, psi_j)
phie = xEE(3); 
q13 = phie - (psi_j(1) + qa(1) + qp(1)); 
q23 = phie - (psi_j(2) + qa(2) + qp(2)); 
q33 = phie - (psi_j(3) + qa(3) + qp(3)); 

q = [qa(1); qp(1); q13; ...
    qa(2); qp(2); q23; ...
    qa(3); qp(3); q33];
end