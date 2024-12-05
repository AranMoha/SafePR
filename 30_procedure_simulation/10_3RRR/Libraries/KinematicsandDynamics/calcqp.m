function PSI = calcqp(xEE, param_chain, pos_Gi_KS0, pos_Pi_KSEE, nrchain)

    gamma = (xEE(3));
    cgamma = cos(gamma);
    sgamma = sin(gamma);
    pos_Pi_KS0 = [cgamma -sgamma ; sgamma cgamma] * pos_Pi_KSEE ;
    PSI_ = [];
    for chain=1:nrchain
        x_Pi = xEE(1) + pos_Pi_KS0(1, chain);
        y_Pi = xEE(2) + pos_Pi_KS0(2, chain);

        x_Gi = pos_Gi_KS0(1, chain);
        y_Gi = pos_Gi_KS0(2, chain);

        li1 = param_chain(1, chain); li2 = param_chain(2, chain);
        psi = acosd(((x_Pi-x_Gi)^2+(y_Pi-y_Gi)^2-(li1)^2-(li2)^2)/(2*(li1)*(li2)));
        PSI_ = [PSI_; psi];
    end
    PSI = PSI_;
end

