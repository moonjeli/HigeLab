%% Upwin imaging
close all
clear all

%% 05062024
% ImagingData/05062024/fly003
% 
% folder = 'ImagingData/05062024/fly000/session1';
% 
% data.fly05062024_000.session1 = extract_data(folder);

folder = 'ImagingData/05062024/fly000/session2';

data.fly05062024_000.session2 = extract_data(folder);
%%
lobe_ids = {"1", "2", "3", "4", "5", "6", "7", "8"};;

lobe_analysis(data, "movspd", lobe_ids)