function KinConsat = checkKinCons(xEE_chain1, xEE_chain2, xEE_chain3, ...
                                  maxerrx, maxerry)
    % Function for checking whether the direct kinematics of the three serial chains lead to the same platform pose
    % Input:
    % xEE_chain1 in m and rad: Platform coordinates via first leg chain (3x1)
    % xEE_chain2 in m and rad: Platform coordinates via second leg chain (3x1)
    % xEE_chain3 in m and rad: Platform coordinates via third leg chain (3x1)
    %
    % Output:
    % KinConsat: =1, if all three platform poses are identical (1x1)
    KinConsat_x = 0;
    KinConsat_y = 0;
    
    err_xEE_chain12_x = abs(xEE_chain1(1)-xEE_chain2(1));
    err_xEE_chain13_x = abs(xEE_chain1(1)-xEE_chain3(1));
    err_xEE_chain23_x = abs(xEE_chain2(1)-xEE_chain3(1));
   
    err_xEE_chain12_y = abs(xEE_chain1(2)-xEE_chain2(2));
    err_xEE_chain13_y = abs(xEE_chain1(2)-xEE_chain3(2));
    err_xEE_chain23_y = abs(xEE_chain2(2)-xEE_chain3(2));
    
    if (err_xEE_chain12_x < maxerrx) && (err_xEE_chain13_x < maxerrx) && (err_xEE_chain23_x < maxerrx)
        KinConsat_x=1;
    end

    if (err_xEE_chain12_y < maxerry) && (err_xEE_chain13_y < maxerry) && (err_xEE_chain23_y < maxerry)
        KinConsat_y=1;
    end
    
    if KinConsat_x==1 && KinConsat_y==1
        KinConsat = 1; % valid
    else
        KinConsat = 0;
    end
    
end