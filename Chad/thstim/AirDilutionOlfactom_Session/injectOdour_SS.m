function injectOdour_SS(vial)
% Inject odour from a given vial into the carrier.
%
% Input
%   -vial: vial# (scalar) to inject odor 

AIR_VIAL=13; %This is fixed unless we re-build the olfactometer

if vial==AIR_VIAL
    return
end

 FlipValve_SS({sprintf('Vial%d',vial),'NO'},0)
