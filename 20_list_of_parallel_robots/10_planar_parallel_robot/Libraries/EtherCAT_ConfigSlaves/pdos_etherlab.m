%
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
            hex2dec('606b'), hex2dec('00'),  32; ...
            hex2dec('6040'), hex2dec('00'),  16; ...
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1b03'), [
            hex2dec('6064'), hex2dec('00'),  32; ...
            hex2dec('6077'), hex2dec('00'),  16; ...
            hex2dec('6041'), hex2dec('00'),  16; ...
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

end
%
% Master 0, Slave 1, "S300/S400/S600/S700"
%
function rv = slave1()

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
            hex2dec('606b'), hex2dec('00'),  32; ...
            hex2dec('6040'), hex2dec('00'),  16; ...
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1b03'), [
            hex2dec('6064'), hex2dec('00'),  32; ...
            hex2dec('6077'), hex2dec('00'),  16; ...
            hex2dec('6041'), hex2dec('00'),  16; ...
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

end
%
% Master 0, Slave 2, "S300/S400/S600/S700"
%
function rv = slave2()

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
            hex2dec('606b'), hex2dec('00'),  32; ...
            hex2dec('6040'), hex2dec('00'),  16; ...
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1b03'), [
            hex2dec('6064'), hex2dec('00'),  32; ...
            hex2dec('6077'), hex2dec('00'),  16; ...
            hex2dec('6041'), hex2dec('00'),  16; ...
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

end
%
% Master 0, Slave 3, "MidiDrive D/ES V4.07"
%
function rv = slave3()

% Slave configuration

rv.SlaveConfig.vendor = 15;
rv.SlaveConfig.product = hex2dec('00001a59');
rv.SlaveConfig.description = 'MidiDrive D/ES V4.07';
rv.SlaveConfig.sm = { ...
    {0, 0, {
        }}, ...
    {1, 1, {
        }}, ...
    {2, 0, {
        {hex2dec('1600'), [
            hex2dec('6040'), hex2dec('00'),  16; ...
            ]}, ...
        }}, ...
    {3, 1, {
        {hex2dec('1a00'), [
            hex2dec('6041'), hex2dec('00'),  16; ...
            ]}, ...
        }}, ...
    };

% Port configuration

rv.PortConfig.input(1).pdo = [2, 0, 0, 0];
rv.PortConfig.input(1).pdo_data_type = 1016;

rv.PortConfig.output(1).pdo = [3, 0, 0, 0];
rv.PortConfig.output(1).pdo_data_type = 1016;

end
%
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
%
% Master 0, Slave 8, "EL5101"
%
function rv = slave8()

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
%
% Master 0, Slave 9, "EL5101"
%
function rv = slave9()

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
