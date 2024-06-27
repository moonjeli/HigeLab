%% ImagingData/06072024/fly002
% 
clear all
close all
%% 

folder = '06212024/fly000/session1';

data.fly06212024_000.session1 = extract_data(folder);
data.fly06212024_000.session1.fr = 30/1;
%%
lobe_ids = {"gamma5", "gamma4", "gamma3", "beta?"};

analysis_58e02(data, "movspd", lobe_ids)