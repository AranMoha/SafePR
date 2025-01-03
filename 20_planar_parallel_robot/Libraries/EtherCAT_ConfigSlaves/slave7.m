% Master 0, Slave 7, "EL5101"
%
function rv = slave7()

% Slave configuration

rv.SlaveConfig.vendor = 2;
rv.SlaveConfig.product = hex2dec('13ed3052');
rv.SlaveConfig.description = 'EL5101';
rv.SlaveConfig.sm = { ...
    {0, 0, {
        }}, ...
    {1, 1, {
        }}, ...
    {2, 0, {
        {hex2dec('1600'), [
            hex2dec('7000'), hex2dec('01'),   8; ... % Controlword
            hex2dec('7000'), hex2dec('02'),  16; ... % Value (der zu setzende Zähler)
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1a00'), [
            hex2dec('6000'), hex2dec('01'),   8; ... % Statusword
            hex2dec('6000'), hex2dec('02'),  16; ... % Zählerstand
            hex2dec('6000'), hex2dec('03'),  16; ... % Latch-Wert
            ]}, ...
        }}, ...
    };

% Port configuration

rv.PortConfig.input(1).pdo = [2, 0, 0, 0];
rv.PortConfig.input(1).pdo_data_type = 1008; % Controlword

rv.PortConfig.input(2).pdo = [2, 0, 1, 0];
rv.PortConfig.input(2).pdo_data_type = 2016; % Value (der zu setzende Zähler)

rv.PortConfig.output(1).pdo = [3, 0, 0, 0];
rv.PortConfig.output(1).pdo_data_type = 1008; % Statusword

rv.PortConfig.output(2).pdo = [3, 0, 1, 0];
rv.PortConfig.output(2).pdo_data_type = 2016; % Zählerstand

rv.PortConfig.output(3).pdo = [3, 0, 2, 0];
rv.PortConfig.output(3).pdo_data_type = 2016; % Latch-Wert

% rv.SlaveConfig.dc = [hex2dec('320'),... %AssignActivate
%     0, ... % Cycle Time Sync0
%     1, ... % Cycle Time Sync0 Factor
%     0, ... % Shift Time Sync0
%     1, ... % Shift Time Sync0 Factor
%     0, ... % Shift Time Sync0 Input
%     0, ... % Cycle Time Sync1
%     1, ... % Cycle Time Sync1 Factor
%     0, ... %  Shift Time Sync1
%     1]; % Shift Time Sync1 Factor

% <Type ProductCode="#x13ed3052" RevisionNo="#x03fb0000">EL5101</Type>
    % Dc>
    % <OpMode>
    % <Name>Synchron</Name>
    % <Desc>FreeRun/SM-Synchron</Desc>
    % <AssignActivate>#x0</AssignActivate>
    % <CycleTimeSync0 Factor="0">0</CycleTimeSync0>
    % <ShiftTimeSync0>0</ShiftTimeSync0>
    % <CycleTimeSync1 Factor="1">0</CycleTimeSync1>
    % <ShiftTimeSync1>0</ShiftTimeSync1>
    % </OpMode>
    % <OpMode>
    % <Name>DC</Name>
    % <Desc>DC-Synchron</Desc>
    % <AssignActivate>#x320</AssignActivate>
    % <CycleTimeSync0 Factor="1">0</CycleTimeSync0>
    % <ShiftTimeSync0>0</ShiftTimeSync0>
    % <CycleTimeSync1 Factor="1">0</CycleTimeSync1>
    % <ShiftTimeSync1>0</ShiftTimeSync1>
    % </OpMode>
    % <OpMode>
    % <Name>DCIN</Name>
    % <Desc>DC-Synchron (input based)</Desc>
    % <AssignActivate>#x320</AssignActivate>
    % <CycleTimeSync0 Factor="1">0</CycleTimeSync0>
    % <ShiftTimeSync0 Input="1">0</ShiftTimeSync0>
    % <CycleTimeSync1 Factor="1">0</CycleTimeSync1>
    % <ShiftTimeSync1>0</ShiftTimeSync1>
    % </OpMode>

% <Type ProductCode="#x13ed3052" RevisionNo="#x03fc0000">EL5101</Type>
    %     <Dc>
    % <OpMode>
    % <Name>Synchron</Name>
    % <Desc>FreeRun/SM-Synchron</Desc>
    % <AssignActivate>#x0</AssignActivate>
    % <CycleTimeSync0 Factor="0">0</CycleTimeSync0>
    % <ShiftTimeSync0>0</ShiftTimeSync0>
    % <CycleTimeSync1 Factor="1">0</CycleTimeSync1>
    % <ShiftTimeSync1>0</ShiftTimeSync1>
    % </OpMode>
    % <OpMode>
    % <Name>DC</Name>
    % <Desc>DC-Synchron</Desc>
    % <AssignActivate>#x320</AssignActivate>
    % <CycleTimeSync0 Factor="1">0</CycleTimeSync0>
    % <ShiftTimeSync0>0</ShiftTimeSync0>
    % <CycleTimeSync1 Factor="1">0</CycleTimeSync1>
    % <ShiftTimeSync1>0</ShiftTimeSync1>
    % </OpMode>
    % <OpMode>
    % <Name>DCIN</Name>
    % <Desc>DC-Synchron (input based)</Desc>
    % <AssignActivate>#x320</AssignActivate>
    % <CycleTimeSync0 Factor="1">0</CycleTimeSync0>
    % <ShiftTimeSync0 Input="1">0</ShiftTimeSync0>
    % <CycleTimeSync1 Factor="1">0</CycleTimeSync1>
    % <ShiftTimeSync1>0</ShiftTimeSync1>
    % </OpMode>
    
end
%