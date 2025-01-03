% Master 0, Slave 6, "EL1004"
%
function rv = slave6()

% Slave configuration

rv.SlaveConfig.vendor = 2;
rv.SlaveConfig.product = hex2dec('03ec3052');
rv.SlaveConfig.description = 'EL1004';
rv.SlaveConfig.sm = { ...
    {0, 1, {
        {hex2dec('1a00'), [
            hex2dec('6000'), hex2dec('01'),   1; ...
            ]}, ...
        {hex2dec('1a01'), [
            hex2dec('6010'), hex2dec('01'),   1; ...
            ]}, ...
        {hex2dec('1a02'), [
            hex2dec('6020'), hex2dec('01'),   1; ...
            ]}, ...
        {hex2dec('1a03'), [
            hex2dec('6030'), hex2dec('01'),   1; ...
            ]}, ...
        }}, ...
    };

% Port configuration

rv.PortConfig.output(1).pdo = [0, 0, 0, 0];
rv.PortConfig.output(1).pdo_data_type = 1001;

rv.PortConfig.output(2).pdo = [0, 1, 0, 0];
rv.PortConfig.output(2).pdo_data_type = 1001;

rv.PortConfig.output(3).pdo = [0, 2, 0, 0];
rv.PortConfig.output(3).pdo_data_type = 1001;

rv.PortConfig.output(4).pdo = [0, 3, 0, 0];
rv.PortConfig.output(4).pdo_data_type = 1001;

end
%