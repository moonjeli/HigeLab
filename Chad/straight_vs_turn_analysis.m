%% CH_11082023\Fly000 

fictrac_dat = 'E:\Data\LiveVideo\11082023\Fly000\odor_straight\fictrac-20231108_101533.dat';
fictrac_txt = 'E:\Data\LiveVideo\11082023\Fly000\odor_straight\fictrac-vidLogFrames-20231108_101533.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11082023\Fly000\odor_straight\Results.csv';

data.fly_11082023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11082023\Fly000\odor_left\fictrac-20231108_104854.dat';
fictrac_txt = 'E:\Data\LiveVideo\11082023\Fly000\odor_left\fictrac-vidLogFrames-20231108_104854.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11082023\Fly000\odor_left\Results.csv';

data.fly_11082023_000.left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11082023\Fly002 

fictrac_dat = 'E:\Data\LiveVideo\11082023\Fly002\odor_straight\fictrac-20231108_113306.dat';
fictrac_txt = 'E:\Data\LiveVideo\11082023\Fly002\odor_straight\fictrac-vidLogFrames-20231108_113306.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11082023\Fly002\odor_straight\Results.csv';

data.fly_11082023_002.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11082023\Fly002\odor_right\fictrac-20231108_114933.dat';
fictrac_txt = 'E:\Data\LiveVideo\11082023\Fly002\odor_right\fictrac-vidLogFrames-20231108_114933.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11082023\Fly002\odor_right\Results.csv';

data.fly_11082023_002.left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);



%% CH_11092023\Fly000 

fictrac_dat = 'E:\Data\LiveVideo\11092023\Fly000\odor_straight\fictrac-20231109_103852.dat';
fictrac_txt = 'E:\Data\LiveVideo\11092023\Fly000\odor_straight\fictrac-vidLogFrames-20231109_103852.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11092023\Fly000\odor_straight\Results.csv';

data.fly_11092023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11092023\Fly000\odor_left\fictrac-20231109_105401.dat';
fictrac_txt = 'E:\Data\LiveVideo\11092023\Fly000\odor_left\fictrac-vidLogFrames-20231109_105401.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11092023\Fly000\odor_left\Results.csv';

data.fly_11092023_000.left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11092023\Fly001 

fictrac_dat = 'E:\Data\LiveVideo\11092023\Fly001\odor_straight\fictrac-20231109_111822.dat';
fictrac_txt = 'E:\Data\LiveVideo\11092023\Fly001\odor_straight\fictrac-vidLogFrames-20231109_111822.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11092023\Fly001\odor_straight\Results.csv';

data.fly_11092023_001.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = 'E:\Data\LiveVideo\11092023\Fly001\odor_right\fictrac-20231109_113321.dat';
fictrac_txt = 'E:\Data\LiveVideo\11092023\Fly001\odor_right\fictrac-vidLogFrames-20231109_113321.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11092023\Fly001\odor_right\Results.csv';

data.fly_11092023_001.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'drotvlx')