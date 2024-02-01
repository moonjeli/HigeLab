eval(['paratable_' int2str(selectedmenuindex) '(:,3:4)'...
    '=get(table' int2str(selectedmenuindex) 'h,''data'');'])
eval(['paratable=paratable_' int2str(selectedmenuindex) ';'])
eval(['para_' int2str(selectedmenuindex) '=cell2struct(paratable(:,3),paratable(:,1),1);'])
eval(['parameter=para_' int2str(selectedmenuindex) ';'])
