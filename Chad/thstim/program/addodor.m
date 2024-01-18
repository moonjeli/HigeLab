eval(['tmptabledata=get(odortable' int2str(selectedmenuindex) 'h, ''data'');'])
tmptabledata(end+1,:)={0 'Select' logical(0) 0 0 0};
eval(['set(odortable' int2str(selectedmenuindex) 'h, ''data'',tmptabledata)'])