% Master 0, Slave 3, "MidiDrive D/ES Sx V4.07"
%
% 
% Betriebsarten: 
%    10   Zyklisch-synchrone Momentenvorgabe
%     9   zyklisch-synchrone Geschwindigkeitsvorgabe
%     8   Zyklisch-synchrone Lagezielvorgabe
%     4   Momentenvorgabe
%    -3   Geschwindigkeitsvorgabe direkt
%     3   Geschwindigkeitsvorgabe
%     1   Lagezielvorgabe
%     6   Referenzfahrbetrieb
%    -1   Elektronisches Getriebe
%    -2   Fliegende Säge
%    -4   Geschwindigkeitsprofil
%    -5   Positionieren mit Zeitvorgabe
%     7   Interpolated Position Mode
   
function rv = slave3()

% Slave configuration

rv.SlaveConfig.vendor = 15;
rv.SlaveConfig.product = hex2dec('00001a59');
rv.SlaveConfig.description = 'MidiDrive D/ES Sx V4.07';
rv.SlaveConfig.sm = { ...
    {0, 0, {
        }}, ...
    {1, 1, {
        }}, ...
    {2, 0, {
        {hex2dec('1603'), [
            hex2dec('6040'), hex2dec('00'),  16; ... % Steuerwort
            hex2dec('6060'), hex2dec('00'),   8; ... % Betriebsart
            hex2dec('6071'), hex2dec('00'),  16; ... % Momentensollwert
            hex2dec('60b2'), hex2dec('00'),  16; ... % Momenten-Offset
            hex2dec('607a'), hex2dec('00'),  32; ... % Lageziel
            hex2dec('6081'), hex2dec('00'),  32; ... % Verfahrgeschwindigkeit (Soll)
            hex2dec('5f54'), hex2dec('01'),   8; ... % Digitale Ausgänge
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1a03'), [
            hex2dec('6041'), hex2dec('00'),  16; ... % Statuswort
            hex2dec('6061'), hex2dec('00'),   8; ... % TODO: Bedeutung herausfinden
            hex2dec('603f'), hex2dec('00'),  16; ... % Störungscode
            hex2dec('6063'), hex2dec('00'),  32; ... % Lagegeber-Istwert
            hex2dec('6064'), hex2dec('00'),  32; ... % Lageistwert Nullsetzen
            hex2dec('606c'), hex2dec('00'),  32; ... % Geschwindigkeits-Istwert
            hex2dec('6078'), hex2dec('00'),  16; ... % Strom-Istwert
            hex2dec('5f56'), hex2dec('01'),   8; ... % Digitale Eingänge
            ]}, ...
        }}, ...
    };

% Port configuration

rv.PortConfig.input(1).pdo = [2, 0, 0, 0];
rv.PortConfig.input(1).pdo_data_type = 1016;

rv.PortConfig.input(2).pdo = [2, 0, 1, 0];
rv.PortConfig.input(2).pdo_data_type = 1008;

rv.PortConfig.input(3).pdo = [2, 0, 5, 0];
rv.PortConfig.input(3).pdo_data_type = 1032;

% rv.PortConfig.input(4).pdo = [2, 0, 3, 0];
% rv.PortConfig.input(4).pdo_data_type = 1016;
% 
% rv.PortConfig.input(5).pdo = [2, 0, 4, 0];
% rv.PortConfig.input(5).pdo_data_type = 1032;
% 
% rv.PortConfig.input(6).pdo = [2, 0, 5, 0];
% rv.PortConfig.input(6).pdo_data_type = 1032;
% 
% rv.PortConfig.input(7).pdo = [2, 0, 6, 0];
% rv.PortConfig.input(7).pdo_data_type = 1008;

rv.PortConfig.output(1).pdo = [3, 0, 0, 0]; % Statuswort
rv.PortConfig.output(1).pdo_data_type = 1016;

rv.PortConfig.output(2).pdo = [3, 0, 3, 0]; % Lagegeber-Istwert
rv.PortConfig.output(2).pdo_data_type = 2032;

rv.PortConfig.output(3).pdo = [3, 0, 5, 0];
rv.PortConfig.output(3).pdo_data_type = 2032; % Geschwindigkeit-Istwert

rv.PortConfig.output(4).pdo = [3, 0, 6, 0];
rv.PortConfig.output(4).pdo_data_type = 2016; % Strom-Istwert

% rv.PortConfig.output(5).pdo = [3, 0, 4, 0];
% rv.PortConfig.output(5).pdo_data_type = 1032;
% 
% rv.PortConfig.output(6).pdo = [3, 0, 5, 0];
% rv.PortConfig.output(6).pdo_data_type = 1032;
% 
% rv.PortConfig.output(7).pdo = [3, 0, 6, 0];
% rv.PortConfig.output(7).pdo_data_type = 1016;
% 
% rv.PortConfig.output(8).pdo = [3, 0, 7, 0];
% rv.PortConfig.output(8).pdo_data_type = 1008;

end
