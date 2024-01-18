selectedmenuindex=get(get(acqh,'SelectedObject'),'userdata');
set([findobj('tag','paratable');findobj('tag','odortable')],'visible','off')
set(findobj('tag','paratable'),'ColumnEditable',logical([0 0]))
set(findobj('tag','odortable'),'ColumnEditable',logical([0 0 0 0 0 0]))
set([addodorh;editodorh;presetodorh],'enable','off')
eval(['set(table' int2str(selectedmenuindex) ...
    'h,''visible'',''on'')'])
set(findobj('parent',acqh),'enable','on')
set(get(acqh,'SelectedObject'),'enable','off')
menuname=get(get(acqh,'SelectedObject'),'string');
eval(['parameter=para_' int2str(selectedmenuindex) ';'])
eval(['paratable=paratable_' int2str(selectedmenuindex) ';'])
eval(['menuscript=menu' int2str(selectedmenuindex) 'script;'])

switch get(get(acqh,'SelectedObject'),'tag')
    case {'odor','odorpair'}
        eval(['set(odortable' int2str(selectedmenuindex) ...
              'h,''visible'',''on'')'])
        eval(['odortable=odortable_' int2str(selectedmenuindex) ';'])
        set(editodorh,'enable','on')
end


% switch menuscript
%     case 'LED'
%         outputSingleScan(aoSS,5); %Make sure LED is off
%     case 'shockonly'
%         outputSingleScan(aoSS,0); %Make sure shock output is off
%     case 'odor_shock'
%         outputSingleScan(aoSS,0); %Make sure shock output is off
% end

        