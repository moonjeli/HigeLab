function FlipValve_SS(lines,state)
%Flips valves through USB6509
%
%Input
%   -lines: determines which line to flip.  You can determine with number
%   (Index number of USB6509 lines) or character of valve names (i.e. 'vial1', 'vial2', 'NO')
%   Or you can use 'all' to flip all valves, except scanimage trigger
%   You can also define multiple valves with cell array.
%
%   -state: A scalar or vector of 0 or 1.  0 is energized state
%


%Only connect to the board the first time the function is called.  
persistent vial_switch olfSS ValveState; %see connectToUSB6509_SS.m

if isempty(olfSS)
    [vial_switch,olfSS,ValveState]=connectUSB6509_SS;
end

if isnumeric(lines)
    ValveState(lines)=state;
elseif ischar(lines) && strcmpi(lines,'all')
    ValveState(1:end-1)=state;%Excludes Trigger channel for scanimage
elseif ischar(lines)
    lines={lines};
end
if iscell(lines)
    if isscalar(state)
        state=state*ones(size(lines));
    end
    for i=1:length(lines)
        if strcmpi(lines{i},'vial13')
            lines{i}='NO';
        end
        ValveState(strcmpi(lines{i},vial_switch(:,1)))=state(i);
    end
end
outputSingleScan(olfSS,ValveState);