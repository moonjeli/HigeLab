%% ImagingData/06072024/fly002
% 
clear all
close all
%% 

folder = '06212024/fly000/session1';

data.fly06212024_000.session1 = extract_data(folder);
data.fly06212024_000.session1.fr = 30/1;

%% 

folder = '06212024/fly001/session1';

data.fly06212024_001.session1 = extract_data(folder);
data.fly06212024_001.session1.fr = 30/1;
%% 

folder = '06282024/fly1/session1';

data.fly06282024_001.session1 = extract_data(folder);
data.fly06282024_001.session1.fr = 30/1;
%% 

folder = '06282024/fly1/session2';

data.fly06282024_001.session2 = extract_data(folder);
data.fly06282024_001.session2.fr = 30/1;

%% 

folder = '07022024/fly1/session1';

data.fly07022024_001.session1 = extract_data(folder);
data.fly07022024_001.session1.fr = 30/1;
%% 

folder = '07022024/fly1/session2';

data.fly07022024_001.session2 = extract_data(folder);
data.fly07022024_001.session2.fr = 30/1;

%% 

folder = '07082024/fly1/session1';

data.fly07082024_000.session1 = extract_data(folder);
data.fly07082024_000.session1.fr = 30/1;
%%
lobe_ids = {"gamma5", "gamma4", "gamma3", "gamma2", "beta"};

analysis_58e02(data, "movspd", lobe_ids)
analysis_58e02(data, "drotvlx", lobe_ids)

analysis_58e02(data, "drotvly", lobe_ids)
analysis_58e02(data, "drotvlz", lobe_ids)