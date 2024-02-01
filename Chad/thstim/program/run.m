set([findobj('parent',acqh);edith;runh;addodorh;editodorh;presetodorh],'enable','off')
set(tableRh,'visible','off')
set(findobj('tag','paratable'),'ColumnEditable',...
    logical([0 0]))
set(findobj('tag','odortable'),'ColumnEditable',logical([0 0 0 0 0 0]))
set(statush, 'String',{'Waiting for' 'trigger'},...
    'back','y','Fontsize',0.175)
stopkey=0;

% Create new file every time Run is hit.
savefile=[PathName,'\parameters_',datestr(now,'yymmdd_HHMMss'),'.mat'];
Data_1=struct;%fake data to create file
eval(['save ',savefile,' Data_1'])
set(fileh,'String',savefile((length(savefile)-27):(length(savefile)-4)))
indexnum=1;     %Trial number is reset to 1

eval(menuscript);
                
set([findobj('parent',acqh);edith;runh],'enable','on')
set(get(acqh,'SelectedObject'),'enable','off')

switch get(get(acqh,'SelectedObject'),'tag')
    case {'odor','odorpair'}
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

set(statush, 'String','Idling',...
    'back',[.5 1 .5],'Fontsize',0.3)

