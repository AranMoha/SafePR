% Master 0, Slave 9, "EL5101"
%
function rv = slave9()

%Slave Configuration
rv.SlaveConfig.vendor = 2;
rv.SlaveConfig.product = hex2dec('13ed3052');
rv.SlaveConfig.description = 'EL5101';
% rv.SlaveConfig.revision_no = hex2dec('03fc0000');
rv.SlaveConfig.sm = { ...
    {0, 0, {
        }}, ...
    {1, 1, {
        }}, ...
    {2, 0, {
        {hex2dec('1600'), [
            hex2dec('7000'), hex2dec('01'),   8; ...
            hex2dec('7000'), hex2dec('02'),  16; ...
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1a00'), [
            hex2dec('6000'), hex2dec('01'),   8; ...
            hex2dec('6000'), hex2dec('02'),  16; ...
            hex2dec('6000'), hex2dec('03'),  16; ...
            ]}, ...
        }}, ...
    };

% Port configuration

rv.PortConfig.input(1).pdo = [2, 0, 0, 0];
rv.PortConfig.input(1).pdo_data_type = 1008;

rv.PortConfig.input(2).pdo = [2, 0, 1, 0];
rv.PortConfig.input(2).pdo_data_type = 1016;

rv.PortConfig.output(1).pdo = [3, 0, 0, 0];
rv.PortConfig.output(1).pdo_data_type = 1008;

rv.PortConfig.output(2).pdo = [3, 0, 1, 0];
rv.PortConfig.output(2).pdo_data_type = 1016;

rv.PortConfig.output(3).pdo = [3, 0, 2, 0];
rv.PortConfig.output(3).pdo_data_type = 1016;
end