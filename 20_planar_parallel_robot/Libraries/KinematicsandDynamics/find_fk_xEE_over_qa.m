%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This Program is being used to Compute an iterative DKS
% by using lsqnonlin.m for minimizing the function solve_dk 
function e = find_dk_xEE_over_qa(e0, theta_k, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)

    %Positionsvektor muss Dimension 3 haben
%     if size(e0,2) ~= 3 
%         error('Positionsvektor muss die Dimension 3x1 haben') 
%     end


    %Grenzen f�r die Parameter festlegen (lb <= X <= ub)
    %Die Filterung durch Grenzen erfolgt im Hauptprogramm, deshalb hier keine
    %Definition von Nebenbedingungen
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lb = [];
    ub = [];
    
    %Optionen definieren
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    myoptions=optimset('lsqnonlin');
    myoptions=optimset(myoptions,'Display','iter','MaxFunEvals',500,'MaxIter',500,'TolFun',1e-200,'TolX',1e-200);
        %'Display', 'off': keine Bildschirmausgaben ==> Zeitersparnis
        %,'LevenbergMarquardt','off'
        %'LargeScale','off': wechseln in ein "mitteldimensionales" Problem
        %'MaxFunEvals' und 'MaxIter': Abbruchkriterium �ber Funktionsaufrufe
        %                             bzw. Iterationsschritte
        %'TolFun' und 'TolX': Abbruchkriterium bei minimaler �nderung
        
    %lsqnonlin aufrufen
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Minimizing the function solve_dk(ee) to compute an iterative DKS
    [e] = lsqnonlin(@solve_dk, e0, lb, ub, myoptions, theta_k, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id);

end 

%% ------------------------------------------------------------------------
function diff_i = solve_dk(e0,theta_k, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id)


    [qa, qp] = calcq(e0, kin_params, psi_j, beta_j, r_fixPlat_j, r_mobPlat_j, l_all_id);

    
    %Warnungen werden ausgeschaltet, ansonsten kommt es zu
    %Verz�gerungen. "Schlechte" Werte von psi werden sowieso
    %"wegoptimiert"
    warning off all

    %Compute the Difference between Computed theta & Measured theta
    e = qa - reshape(theta_k,3,1);


    diff_i = e;
end