% Master 0, Slave 0, "S300/S400/S600/S700"
%
function rv = slave0()

% Slave configuration

rv.SlaveConfig.vendor = 106;
rv.SlaveConfig.product = hex2dec('03000600');
rv.SlaveConfig.description = 'S300/S400/S600/S700';
rv.SlaveConfig.sm = { ...
    {0, 0, {
        }}, ...
    {1, 1, {
        }}, ...
    {2, 0, {
        {hex2dec('1702'), [
            hex2dec('606b'), hex2dec('00'),  32; ... % Geschwindigkeitssollwert
            hex2dec('6040'), hex2dec('00'),  16; ... % Steuerwort
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1b03'), [
            hex2dec('6064'), hex2dec('00'),  32; ... % Positionsistwert in SI Einheiten
            hex2dec('6077'), hex2dec('00'),  16; ... % Stromistwert 
            hex2dec('6041'), hex2dec('00'),  16; ... % Statuswort
%             hex2dec('606c'), hex2dec('00'),  32; ... % Geschwindigkeitsistwert in SI
            ]}, ...
        }}, ...
    };

% Port configuration

rv.PortConfig.input(1).pdo = [2, 0, 0, 0];
rv.PortConfig.input(1).pdo_data_type = 1032;

rv.PortConfig.input(2).pdo = [2, 0, 1, 0];
rv.PortConfig.input(2).pdo_data_type = 1016;

rv.PortConfig.output(1).pdo = [3, 0, 0, 0];
rv.PortConfig.output(1).pdo_data_type = 1032;

rv.PortConfig.output(2).pdo = [3, 0, 1, 0];
rv.PortConfig.output(2).pdo_data_type = 1016;

rv.PortConfig.output(3).pdo = [3, 0, 2, 0];
rv.PortConfig.output(3).pdo_data_type = 1016;

rv.PortConfig.output(4).pdo = [3, 0, 0, 0];
rv.PortConfig.output(4).pdo_data_type = 2032;
% rv.PortConfig.output(4).pdo = [3, 0, 3, 0];
% rv.PortConfig.output(4).pdo_data_type = 1032;

end