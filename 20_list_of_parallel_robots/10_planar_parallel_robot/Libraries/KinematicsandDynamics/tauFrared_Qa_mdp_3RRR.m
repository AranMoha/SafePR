function [tauFraCoul_red_mdp_direct_3RRRreturn, tauFraVis_red_mdp_direct_3RRRreturn ] = tauFrared_Qa_mdp_3RRR(dqj_rad, mdp)
  tauFraCoul_red_mdp_direct = [0; 0; 0];
  tauFraVis_red_mdp_direct = [0; 0; 0];
  
  tauFraCoul_red_mdp_direct(1) = checkFrCoul(dqj_rad(1), mdp(8));
  tauFraCoul_red_mdp_direct(2) = checkFrCoul(dqj_rad(4), mdp(12));
  tauFraCoul_red_mdp_direct(3) = checkFrCoul(dqj_rad(7), mdp(16));
  
  tauFraVis_red_mdp_direct(1) = checkFrVis(dqj_rad(1), mdp(6));
  tauFraVis_red_mdp_direct(2) = checkFrVis(dqj_rad(4), mdp(10));
  tauFraVis_red_mdp_direct(3) = checkFrVis(dqj_rad(7), mdp(14));  
  
tauFraCoul_red_mdp_direct_3RRRreturn =  tauFraCoul_red_mdp_direct;
tauFraVis_red_mdp_direct_3RRRreturn = tauFraVis_red_mdp_direct;
end

function Fr_out = checkFrCoul(dqj_rad_, mdp_)
    if abs(dqj_rad_) < 10^(-2)
        Fr_out = 0;
    else
        Fr_out = sign(dqj_rad_)*mdp_;
    end
end

function Fr_out = checkFrVis(dqj_rad_, mdp_)
    if abs(dqj_rad_) < 10^(-2)
        Fr_out = 0;
    else
        Fr_out = dqj_rad_*mdp_;
    end
end