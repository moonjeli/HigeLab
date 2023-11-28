%Octanol_responses

%% CH_11172023\Fly000 straight

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly000\odor_straight\fictrac-20231117_103902.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly000\odor_straight\fictrac-vidLogFrames-20231117_103902.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly000\odor_straight\Results.csv';

data.fly_11172023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly000\odor_right\fictrac-20231117_105539.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly000\odor_right\fictrac-vidLogFrames-20231117_105539.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly000\odor_right\Results.csv';

data.fly_11172023_000.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11172023\Fly000 straight

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly001\odor_straight\fictrac-20231117_111312.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly001\odor_straight\fictrac-vidLogFrames-20231117_111312.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly001\odor_straight\Results.csv';

data.fly_11172023_001.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly001\odor_right\fictrac-20231117_112706.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly001\odor_right\fictrac-vidLogFrames-20231117_112706.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly001\odor_right\Results.csv';

data.fly_11172023_001.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);


%% CH_11172023\Fly000 straight

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly002\odor_straight\fictrac-20231117_135723.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly002\odor_straight\fictrac-vidLogFrames-20231117_135723.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly002\odor_straight\Results.csv';

data.fly_11172023_002.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly002\odor_right\fictrac-20231117_141130.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly002\odor_right\fictrac-vidLogFrames-20231117_141130.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly002\odor_right\Results.csv';

data.fly_11172023_002.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11172023\Fly003 straight

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly003\odor_straight\fictrac-20231117_145008.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly003\odor_straight\fictrac-vidLogFrames-20231117_145008.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly003\odor_straight\Results.csv';

data.fly_11172023_003.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly003\odor_right\fictrac-20231117_150250.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly003\odor_right\fictrac-vidLogFrames-20231117_150250.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly003\odor_right\Results.csv';

data.fly_11172023_003.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11172023\Fly004 

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly004\odor_straight\fictrac-20231117_152049.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly004\odor_straight\fictrac-vidLogFrames-20231117_152049.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly004\odor_straight\Results.csv';

data.fly_11172023_004.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11172023\Fly004\odor_right\fictrac-20231117_153349.dat';
fictrac_txt = 'E:\Data\LiveVideo\11172023\Fly004\odor_right\fictrac-vidLogFrames-20231117_153349.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11172023\Fly004\odor_right\Results.csv';

data.fly_11172023_004.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'drotvlx')

