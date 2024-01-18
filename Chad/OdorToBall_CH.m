function OdorToBall_CH
%BasicOdorToBall
%   Find NI USB 6001, establish session/channel, set de-energ'd
%   Timing of delivery based on user input
%   If one repeat, sequence is NO, NC, NO
%   If more repeats, sequence is NO, NC x # then NO

prompt = 'Number of stimuli: ';
reps = input(prompt);

prompt2 = 'Length in seconds of control period: ';
int = input(prompt2);

prompt3 = 'Length of stimulus period: ';
int2 = input(prompt3);

devices = daq.getDevices;

for i=1:length(devices)
    if strcmpi(devices(i).Model,'USB-6501') %23.10.20, DD from 'USB-6001' for new device
        NIdaq.dev=devices(i).ID;
    end
end

parameter.dur = int2;
parameter.iti = int;
parameter.numt = reps
%create session for odor switch valve
% s=daq.createSession('ni');
% warning off
% addDigitalChannel(s,NIdaq.dev,'Port1/Line7','OutputOnly');
% warning on
% outputSingleScan(s,1);

%initiatlize channel for opto LED   
s=daq.createSession('ni');
warning off
ThisChName = {s.Channels.Name}';% Must be called before adding ao channels
addDigitalChannel(s,NIdaq.dev, 'Port1/Line7', 'OutputOnly'); %add odor valve port
addDigitalChannel(s,NIdaq.dev,'Port1/Line6','OutputOnly'); %add opto LED Port


outputSingleScan(s,[1,0]);
LED = 0; %LED stimulation? 1 == yes
npulse = 4; %number of pulses
pulse_dur = 0.001; %pusle length
pulse_freq = 2; %pulse frequency hz
pulse_ft = 1/pulse_freq; %pulse ft (s)

if reps == 1
    disp('N.O. stream')
    pause(parameter.iti);
    outputSingleScan(s,[0,0]);
    disp('N.C. stream')    
    if LED == 1;
        pause(2); %pause for odor delivery delay
        for i =1: npulse
            outputSingleScan(s,[0,1]); %turn on LED 
            pause(pulse_dur); %LED pulse duration; 
            outputSingleScan(s,[0,0]); %turn off LED 
            pause(pulse_ft); %LED pulse frequency
        end
        pause(parameter.dur - (npulse * (pulse_ft + pulse_dur) + 2));
    else
        pause(parameter.dur);
    end
    pause(parameter.dur - npulse * pulse_ft);
    outputSingleScan(s,[1,0]);
    disp('N.O. stream')
    pause(parameter.iti);
        
else
    for i = 1:reps
        disp('N.O. stream')
        pause(parameter.iti);
        outputSingleScan(s,[0,0]);
        disp('N.C. stream')
        if LED == 1;
            pause(2); %pause for odor delivery delay
            for i =1: npulse
                outputSingleScan(s,[0,1]); %turn on LED 
                pause(pulse_dur); %LED pulse duration; 
                outputSingleScan(s,[0,0]); %turn off LED 
                pause(pulse_ft); %LED pulse frequency
            end
            pause(parameter.dur - (npulse * (pulse_ft + pulse_dur) + 2));
        else
            pause(parameter.dur);
        end
        outputSingleScan(s,[1,0]);
    end
    disp('N.O. stream')
    pause(parameter.iti);
end

disp('Complete.')
end