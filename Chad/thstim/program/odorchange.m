%append Valve# to table
%delete row if 'Delete'

eval(['tmptabledata=get(odortable' int2str(selectedmenuindex) 'h, ''data'');'])
if selectedcol==2   %When odor is changed
    switch tmptabledata{selectedrow,2}
        case 'DELETE THIS LINE!!'
            tmptabledata(selectedrow,:)=[];
            if isempty(tmptabledata)
                tmptabledata={0 'Select' logical(0) 0 0 0};
            end
        otherwise
            odorlistrow=strmatch(tmptabledata{selectedrow,2},odorlist','exact');
            tmptabledata(selectedrow,[1,4,5,6])=num2cell([valve_dilution(odorlistrow,[1,3,4]),...
                CalcTotalDilution(valve_dilution(odorlistrow,3),valve_dilution(odorlistrow,4))]);           
    end    
    
elseif selectedcol==4 ||  selectedcol==5   %when dilution rate is changed
            tmptabledata{selectedrow,6}=CalcTotalDilution(tmptabledata{selectedrow,4},tmptabledata{selectedrow,5});
end

eval(['set(odortable' int2str(selectedmenuindex) 'h, ''data'',tmptabledata)'])

eval(['odortable_' int2str(selectedmenuindex) '=get(odortable' int2str(selectedmenuindex) 'h, ''data'');'])

eval(['odortable=odortable_' int2str(selectedmenuindex) ';'])
