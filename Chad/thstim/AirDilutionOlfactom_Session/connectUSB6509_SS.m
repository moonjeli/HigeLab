function [vial_switch,olfSS,ValveState]=connectUSB6509_SS
% Modified from connectToUSB6501_EP
%
% Connect to NI USB-6509
%
%
% Purpose
% Initiate a connection to the USB-6509 box. Configure all DIOs as output
% because it takes a long time to switch between input/output mode in 
% session-based interface. Previously, we read out the current status of
% the valves by usint input mode. We cirmvent this problem by using 
% 'ValveState' as a persistent variable, which remembers the states 
% of the valves. 
%
% Output
%   vial_switch: Look up table for vial-switch-port
%   olfSS: session object for olfactometer
%   ValveState: vector for state of channels added to olfSS
%
% See also FlipValve_SS.m
%

%Look-up table for which vial/valve is connected to which switch
%The first column will be defined as the LineName of each line later

vial_switch={'Vial1',16,'port0/line2';...
    'Vial2',1,'port1/line7';...
    'Vial3',15,'port0/line3';...
    'Vial4',2,'port1/line6';...
    'Vial5',14,'port0/line1';...
    'Vial6',3,'port1/line5';...
    'Vial7',13,'port0/line0';...
    'Vial8',4,'port1/line4';...
    %'Vial9',19,'port1/line6';...
    %'Vial10',21,'port1/line5';...
    %'Vial11',23,'port1/line4';...
    %'Vial12',25,'port1/line3';...
    'NO',12,'port2/line0';...%this is normally open empty vial
    'Final',11,'port2/line1';...%This is final valve
    'Block',10,'port2/line2';...%This is the block valve for calibration
    %'Dilution',4,'port5/line6';...%Valve to shut off 2nd dilution
    'Trigger',6,'port1/line3'}; %Trigger for imaging. Always put this in the last line
                             

HWlist=daq.getDevices;
for i=1:length(HWlist)
    if strcmpi(HWlist(i).Model,'USB-6501')
        NIdaq.dev=HWlist(i).ID;
    end
end
if ~isfield(NIdaq,'dev')
    error('Cannot connect to USB-6501')
end

olfSS=daq.createSession('ni');
warning('off')
olfSS.addDigitalChannel(NIdaq.dev,vial_switch(:,3),'Outputonly');
warning('on')
ValveState=[ones(1,length(olfSS.Channels)-1),0];
outputSingleScan(olfSS,ValveState);%Make sure default is all low-energy state
end