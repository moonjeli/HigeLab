function triggerScanImage_SS
% function triggerSanImage
%
% Send TTL pulse to Scan Image
%
%

FlipValve_SS('Trigger',1)
pause(0.05)
FlipValve_SS('Trigger',0)
