function varargout=initialiseFlows_SS(AC,firstDilution,secondDilution)
% Set up the MFC flows on the odour delivery system
%
% function initialiseFlows_SS(AC,firstDilution,secondDilution)
%
% Inputs
% AC - the serial port object
% firstDilution - Either a scalar (0 to 1) defining the value for the first 
%                dilution. e.g. 0.1 means 1/10 dilution. Or a vector of
%                length 2, defining flow through the carrier and odour
%                streams. e.g. [0.9,0.3] means 0.9 ml/min carrier and 0.3
%                ml/min odour. 
%                 default.
% second dilution - If NaN, the second dilution is switched off by
%                activating the three 3-port-2-way valves. If not a nan, 
%                this defines the flow rate (in ml/min) which will be added 
%                to the odour flow. By default, this is 5000. 


if nargin<2, firstDilution=0.1; end
if nargin<3, secondDilution=5E3; end

if length(firstDilution)==1
    firstDilution=[1-firstDilution,firstDilution];
end

setFlow(AC,firstDilution(1),'A');
setFlow(AC,firstDilution(2),'B');

%If second dilution is nan, we deactivate it. 
if isnan(sum(secondDilution))
    %If nan we will de-activate the entire second dilution  
    setFlow(AC,0,'D');
    if sum(firstDilution)>1
        disp('MFC C can''t go over 1 SLPM')
    end
    
    setFlow(AC,sum(firstDilution),'C')
    FlipValve_SS('Dilution',1)
    fprintf('By-passing second dilution\n')
    if nargout==1    
        varargout{1}=firstDilution(2)/sum(firstDilution);
    end    
    return
% else
%     FlipValve_SS('Dilution',0) %make sure it's active and carry on
end


%Set flow through carrier
try
    load('ADOValvecalib.mat','vCalib');    
catch
    fprintf('Can''t load ADOValvecalib.mat, setting carrier to 0.05\n')
    vCalib=0.95; %flow through needle valve 1
end
setFlow(AC,sum(firstDilution)-vCalib,'C')

setFlow(AC,secondDilution/5E3,'D') 

%report dilution
d1 =firstDilution(2)/sum(firstDilution);
odourRemaining=(sum(firstDilution)-vCalib)*1000;%this much odour is injected into next stag
d2=odourRemaining/(secondDilution+odourRemaining);
totalDilution=d1*d2;
% fprintf('Dilution 1: %0.3g, Dilution 2:%0.3g\nTotal dilution is 1:%4.2f\n',...
%     d1,d2,1/totalDilution)

if nargout==1    
    varargout{1}=totalDilution;
end

    