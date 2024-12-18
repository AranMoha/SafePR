% Master 0, Slave 5, "EL2004"
%
function rv = slave5()

% Slave configuration

rv.SlaveConfig.vendor = 2;
rv.SlaveConfig.product = hex2dec('07d43052');
rv.SlaveConfig.description = 'EL2004';
rv.SlaveConfig.sm = { ...
    {0, 0, {
        {hex2dec('1600'), [
            hex2dec('7000'), hex2dec('01'),   1; ...
            ]}, ...
        {hex2dec('1601'), [
            hex2dec('7010'), hex2dec('01'),   1; ...
            ]}, ...
        {hex2dec('1602'), [
            hex2dec('7020'), hex2dec('01'),   1; ...
            ]}, ...
        {hex2dec('1603'), [
            hex2dec('7030'), hex2dec('01'),   1; ...
            ]}, ...
        }}, ...
    };

% Port configuration

rv.PortConfig.input(1).pdo = [0, 0, 0, 0];
rv.PortConfig.input(1).pdo_data_type = 1001;

rv.PortConfig.input(2).pdo = [0, 1, 0, 0];
rv.PortConfig.input(2).pdo_data_type = 1001;

rv.PortConfig.input(3).pdo = [0, 2, 0, 0];
rv.PortConfig.input(3).pdo_data_type = 1001;

rv.PortConfig.input(4).pdo = [0, 3, 0, 0];
rv.PortConfig.input(4).pdo_data_type = 1001;

end
%