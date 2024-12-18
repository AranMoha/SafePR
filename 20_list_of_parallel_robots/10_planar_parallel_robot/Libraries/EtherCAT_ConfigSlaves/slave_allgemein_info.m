% Master 0, Slave 1, "EL7221-9014" (Klemmennummer/-name)
%
function slave = slave_allgemein_info()

%% Einführung
% Dieser Struct ist ein für das Aufsetzen eines Slaves und hat zwei Felder
% auf höchster Ebene: 
%   slave.SlaveConfig
%   slave.PortConfig 

% SlaveConfig
    % SlaveConfig beschreibt die Eigenschaften des Slaves, die fürs Einbinden
    % des Slaves durch den Master ins Netzwerk nötig sind. Diese Info steckt in
    % der EtherCATInfo xml-Datei, welche vom Hersteller bereitgestellt wird.
    % Wir lesen sie aber über den Befehl 
    % /opt/etherlab/bin/ethercat pdos --skin etherlab > ~/pdos_etherlab.m
    % aus der Anleitung https://github.com/SchapplM/etherlab-examples aus

% ethercat pdos
    % die Funktion ethercat pdos listet die SyncManagers, PDO-Zuweisung und
    % -Mapping auf. Durch den Zusatz --skin etherlab werden 
    % Konfigurationsvorlagen der Slaves generiert, die kompatibel mit dem
    % generisch EtherCAT slave block von EtherLab sind. 

% PortConfig
    % PortConfig wird verwendet, um Ein-Ausgänge eines SImulink-Blocks auf
    % Basis der SlaveConfig zu spezifizieren. Hat die Felder input und
    % output
    
% Prozessdatenobjekte (PDO)
    % Prozessdaten, die in Segmente, auch Prozessdatenobjekte, zerteilt werden.
    % PDO dienen dem schnellen Austausch von Echtzeitdaten (zB E/A-Daten, Soll-
    % oder Istwerte)
    
% SyncManager
% SyncManager sorgen für konsisten und sicheren Datenaustausch zwischen
% EtherCAT-Master und der lokalen Applikation des SLave-Gerätes. In der
% Konfiguration des SyncManagers werden PDO und Einträge darin spezifiziert. 
% Nach der Spezifikation kann dieser PDO-Eintrag einem Input oder Output zugewiesen werden.  

% Konfiguration der SyncManagers durch slave.SlaveConfig.sm ein Cell Array
% zugeordnert wird. Dieser Cell Array hat soviele Elemente wie der slave
% SyncManagers hat, die konfiguriert werden müssen. Die Elemente des Cell
% Arrays sind ebenfalls Cell Arrays und haben je 3 Elemente:
% {SmIndex, SmDirection, SmPDO}

% Konfiguration der PDO-Einträge
% Das dritte Element des Cell Arrays vom jeweiligen SyncManager ist ein
% weiterer Cell Array. Jedes Element darin ist ein Cell Array und entspricht jedem einzelnen einkludierten PDO. 
% Jedes Element/Cell Array hat zwei Elemente: 
% {PDOIndex, PDOEntries}

% Das zweite Element PDOEntries ist ein Array und listet die Einträge des
% PDO auf. Dieser numerische Array  hat Nx3 Zeilen und Spalten mit
% N=Gesamtanzahl aller Einträge. Die Spalten entsprechen 
% [EintragsIndex, EintragsSubindex, BitLen]

%% Beispiel
slave.SlaveConfig.sm = {Sm2, Sm3};
Sm2 = {2, 0, Sm2PDO}; % SyncManager mit Index 2, Output vom Master zum Slave (=Input in Slave), Cell Array der 2PDO
Sm2 = {3, 1, Sm3PDO}; % SyncManager mit Index 3, Input in Master vom Slave (=Output aus Slave), Cell Array der 3PDO

Sm3PDO = {TxPDO1, TxPDO2}; % Jedes Element entspricht einem PDO, welches in diesen SyncManager inkludiert werden muss.
TxPDO1 = {hex2dec('1a00'), Entries_1a00}; % {PDO Index, PDO Entries/Einträge}
TxPDO2 = {hex2dec('1a01'), Entries_1a01}; 

Entries_1a00 = [hex2dec('6000') 1 1; ... % [EintragsIndex, EintragsSubindex, BitLen]
                hex2dec('6000') 2 1; ...
                hex2dec('6000') 3 2; ...
                hex2dec('6000') 5 2; ...
                hex2dec('6000') 7 1; ...
                0               0 7; ... 
                hex2dec('6000') 7 1; ...
                hex2dec('6000') 9 1; ...
                hex2dec('6000') 17 6];

%% Slave configuration
slave.SlaveConfig.vendor = 2;                      % Verkäufer ID (2=Beckhoff), Liste unter https://www.ethercat.org/de/vendor_id_list.html
slave.SlaveConfig.product = hex2dec('1c353052');   % Produkt Code
slave.SlaveConfig.description = 'EL7221-9014';     % Beschreibung

slave.SlaveConfig.sm = ... % SyncManager Konfiguration 
    { 
        { 0, 0, {} }, ...  % SyncManager mit Index 0, Output vom Master zum Slave, leerer PDO Cell
        { 1, 1, {} }, ... % SyncManager mit Index 1, Input in Master vom Slave, leerer PDO Cell
        { 2, 0, { ...     % SyncManager mit Index 2, Output vom Master zum Slave, SyncManager Cell Array (hier mit einem PDO)
                    {hex2dec('1600'), [... % PDO Index, PDOEntries
                                        hex2dec('7000'), hex2dec('01'),   8; ... % [EntryIndex, EntrySubindex, BitLen]
                                        hex2dec('7000'), hex2dec('02'),  16; ...
                                       ]...
                    }, ...
                }...
        }, ...
        {3, 1, { ... % SyncManager mit Index 3, Input in Master vom Slave, SyncManager Cell Array (Hier mit einem PDO)
            {hex2dec('1a00'), [ % PDO Index, PDOEntries
                hex2dec('6000'), hex2dec('01'),   8; ... % [EntryIndex, EntrySubindex, BitLen]
                hex2dec('6000'), hex2dec('02'),  16; ...
                hex2dec('6000'), hex2dec('03'),  16; ...
                ]}, ...
            }}, ...
    };

%% Port Configuration
% Nummer hinter input, output gibt die Anzahl und das jeweilige
% input/output an 

% slave.PortConfig.output(nr).pdo 
% slave.PortConfig.output(nr).pdo ist ein Nx4 array, der spezifiziert,
% welche PDO Einträge auf den Output-Port nr gemappt werden. Die 4 Spalten
% sind: SyncManagerIndex, PDOIndex, EntryIndex, ElementIndex

slave.PortConfig.input(1).pdo = [2, 0, 0, 0]; % SyncManagerIndex, PDOIndex, EntryIndex, ElementIndex
slave.PortConfig.input(1).pdo_data_type = 1008;

slave.PortConfig.input(2).pdo = [2, 0, 1, 0];
slave.PortConfig.input(2).pdo_data_type = 1016;

slave.PortConfig.output(1).pdo = [3, 0, 0, 0];
slave.PortConfig.output(1).pdo_data_type = 1008;

slave.PortConfig.output(2).pdo = [3, 0, 1, 0];
slave.PortConfig.output(2).pdo_data_type = 1016;

slave.PortConfig.output(3).pdo = [3, 0, 2, 0];
slave.PortConfig.output(3).pdo_data_type = 1016;

% Manuelle Ergänzungen

slave.SlaveConfig.sdo = {
        hex2dec('1c32'),2,32,1000000;      
        hex2dec('1c33'),2,32,1000000;  
        hex2dec('1C12'),-1,  0,  [02,00,00,22,01,22]; 
        hex2dec('1C13'),-1,  0,  [05,00,00,26,01,26,02,26,03,26,06,26]; 
        hex2dec('F081'),hex2dec('01'),32, 1844022; % % AuSKOMENNTIERT
        hex2dec('8011'),hex2dec('11'),32,48000; % Max Current
        hex2dec('8011'),hex2dec('12'),32,8000; % Rated current
        hex2dec('8011'),hex2dec('13'),8,3; % Motor pole pairs
        hex2dec('8011'),hex2dec('15'),16,270; % Commutation Offset
        hex2dec('8011'),hex2dec('16'),32,100; % Torque constant
        hex2dec('8011'),hex2dec('18'),32,329; % Rotor moment of inertia
        hex2dec('8011'),hex2dec('19'),16,7; % Winding inductance
        hex2dec('8012'),hex2dec('12'),16,25; % Application delay
        hex2dec('8012'),hex2dec('11'),16,8; % Release delay
        hex2dec('8011'),hex2dec('1B'),32,5592; % Motor speed limitation
        hex2dec('8011'),hex2dec('2D'),16,1110; % Motor thermal time constant
        hex2dec('8012'),hex2dec('13'),16,500; % Emergency Application Timeout
        hex2dec('8010'),hex2dec('33'),16,10; % Stand still window
        hex2dec('8010'),hex2dec('12'),16,5; % Current loop integral time
        hex2dec('8010'),hex2dec('13'),16,83; % Current loop proportional gain
        hex2dec('8010'),hex2dec('14'),32,150; % Velocity loop integral time
        hex2dec('8010'),hex2dec('15'),32,291; % Velocity loop proportional gain
        hex2dec('8010'),hex2dec('17'),32,10; % Position loop proportional gain

    };


% Aus der Slave Doku von etherlab_lib bzgl DC
% 1. Assign Activate
% 2. Cycle Time Sync0
% 3. Cycle Time Sync0 Factor
% 4. Shift Time Sync0
% 5. Shift Time Sync0 Factor
% 6. Shift Time Sync0 Input
% 7. Cycle Time Sync1
% 8. Cycle Time Sync1 Factor
% 9. Shift Time Sync1
% 10. Shift Time Sync1 Factor

% Aus der XML-Datei der Klemme EL7221-9014

% <Dc>
%   <OpMode>
        % <Name>DC</Name>
        % <Desc>DC-Synchron</Desc>
        % <AssignActivate>#x700</AssignActivate>
        % <CycleTimeSync0 Factor="1">0</CycleTimeSync0>
        % <ShiftTimeSync0 Input="0">30000</ShiftTimeSync0>
        % <CycleTimeSync1 Factor="-1">0</CycleTimeSync1>
        % <ShiftTimeSync1>1000</ShiftTimeSync1>
%    </OpMode>
% </Dc>

slave.SlaveConfig.dc = [hex2dec('700'),... %AssignActivate
    0, ... % Cycle Time Sync0
    1, ... % Cycle Time Sync0 Factor
    30000, ... % Shift Time Sync0
    1, ... % Shift Time Sync0 Factor
    0, ... % Shift Time Sync0 Input
    0, ... % Cycle Time Sync1
    -1, ... % Cycle Time Sync1 Factor
    1000, ... %  Shift Time Sync1
    1]; % Shift Time Sync1 Factor

% Aus der XML-Datei der Klemme S600

% -<OpMode>
    % <Name>DcSync</Name>
    % <Desc>DC for synchronization</Desc>
    % <AssignActivate>#x0300</AssignActivate>
    % <CycleTimeSync0 Factor="1">0</CycleTimeSync0>
    % <ShiftTimeSync0>0</ShiftTimeSync0>
    % -<Sm No="2">
        % <SyncType>2</SyncType>
        % <CycleTime Factor="1">0</CycleTime>
        % <ShiftTime MinAfterSync="0">0</ShiftTime>
    % </Sm>
    % -<Sm No="3">
        % <SyncType>2</SyncType>
        % <CycleTime Factor="1">0</CycleTime>
        % <ShiftTime MinBeforeFrame="100">0</ShiftTime>
    % </Sm>
% </OpMode>

slave.SlaveConfig.dc = [hex2dec('300'),... %AssignActivate
    0, ... % Cycle Time Sync0
    1, ... % Cycle Time Sync0 Factor
    0, ... % Shift Time Sync0
    1, ... % Shift Time Sync0 Factor
    0, ... % Shift Time Sync0 Input
    0, ... % Cycle Time Sync1
    1, ... % Cycle Time Sync1 Factor
    100, ... %  Shift Time Sync1
    1]; % Shift Time Sync1 Factor


end