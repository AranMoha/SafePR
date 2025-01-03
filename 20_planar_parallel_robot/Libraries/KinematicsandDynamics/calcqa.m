function qa = calcqa(xEE, param_chain, pos_Gi_KS0, pos_Pi_KSEE, qp_deg, nrchain)

    gamma = (xEE(3));
    qp_rad = deg2rad(qp_deg);
    cgamma = cos(gamma);
    sgamma = sin(gamma);
    pos_Pi_KS0 = [cgamma -sgamma ; sgamma cgamma] * pos_Pi_KSEE ;

    THETA_ = [];
    xEE = reshape(xEE, 3,1);
    for chain=1:nrchain
        h1i = -pos_Gi_KS0(:, chain) + xEE(1:2) + pos_Pi_KS0(:,chain);
        li1 = param_chain(1, chain); 
        li2 = param_chain(2, chain);
        cpsi = cos(qp_rad(chain)); 
        spsi = sin(qp_rad(chain)); 

        Pi_x = h1i(1);
        Pi_y = h1i(2);

        theta = atan2( ((li1+li2*cpsi)*Pi_y - li2*spsi*Pi_x), ((li1+li2*cpsi)*Pi_x + li2*spsi*Pi_y) );

        THETA_ = [THETA_; rad2deg(theta)];
    end
    qa = THETA_;
end
