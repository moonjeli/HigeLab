function QuickAOPutSample(Dev,Ch,Val)

% Create AO session and immediately output value
%
% Input
%   Dev: device ID ('dev1', 'dev2', etc)
%   Ch: cell arrray of strings of AO channel name ({'ao0','ao1'})
%   Val: Output values.
%

S=daq.createSession('ni');
S.addAnalogOutputChannel(Dev,Ch,'voltage');
if length(Ch)>1 && isscalar(Val)
    Val=Val*ones*size(Ch);
end
outputSingleScan(S,Val);
delete(S)
end