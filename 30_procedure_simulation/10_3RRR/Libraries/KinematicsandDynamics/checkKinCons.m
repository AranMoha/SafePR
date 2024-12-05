function KinConsat = checkKinCons(xEE_chain1, xEE_chain2, xEE_chain3, ...
                                  maxerrx, maxerry)
    % Funktion zur Überprüfung, ob die direkte Kinematik der drei seriellen Ketten zur selben Plattformpose fuehren
    % Eingabe:
    % xEE_chain1 in m und rad: Plattformkoordinaten über erste Beinkette (3x1)
    % xEE_chain2 in m und rad: Plattformkoordinaten über zweite Beinkette (3x1)
    % xEE_chain3 in m und rad: Plattformkoordinaten über dritte Beinkette (3x1)
    %
    % Ausgabe:
    % KinConsat: =1, falls alle drei Plattformposen identisch sind (1x1)
    
    % Aran Mohammad, aran.mohammad@imes.uni-hannover.de, 2022-12                           
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
        KinConsat = 1; % Zulässig
    else
        KinConsat = 0;
    end
    
end