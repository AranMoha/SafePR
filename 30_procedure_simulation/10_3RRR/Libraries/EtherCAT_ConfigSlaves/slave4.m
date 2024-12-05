% Master 0, Slave 4, "EK1100"
%
function rv = slave4()

% Slave configuration

rv.SlaveConfig.vendor = 2;
rv.SlaveConfig.product = hex2dec('044c2c52');
rv.SlaveConfig.description = 'EK1100';
rv.SlaveConfig.sm = { ...
    };

% Port configuration

end
%