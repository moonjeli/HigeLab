function odorselection(source,eventdata)
if sum(eventdata.Indices)==[0 0]
    ...
else
assignin('base','selectedrow',eventdata.Indices(1,1));
assignin('base','selectedcol',eventdata.Indices(1,2));
end