function SS=MakeDefaultAISession(Dev,ChList)

% To create default session with analoginput channels
%
% Input
%   Dev: Device ID of Nidaq board ("dev1", "dev2", etc)
%   ChList: n-by-2 Cell array of n analoginput channels
%           {'channel ID','descriptive chennel Name'}
%
% Output
%   SS: Default session
%

SS=daq.createSession('ni');
SS.addAnalogInputChannel(Dev,ChList(:,1),'voltage');
for i=1:size(ChList,1)
    SS.Channels(i).Name=ChList{i,2};
end
