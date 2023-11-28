%% Summary of behavioral responses to odor of F.O.B.

%% CH_11012023\Fly000 straight

fictrac_dat = 'E:\Data\LiveVideo\CH_11012023_000\fictrac-20231101_124838.dat';
fictrac_txt = 'E:\Data\LiveVideo\CH_11012023_000\fictrac-vidLogFrames-20231101_124838.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\CH_11012023_000\Results.csv';

data.fly_11012023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11012023\Fly002 straight

fictrac_dat = 'E:\Data\LiveVideo\CH_11012023_003\fictrac-20231101_151315.dat';
fictrac_txt = 'E:\Data\LiveVideo\CH_11012023_003\fictrac-vidLogFrames-20231101_151315.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\CH_11012023_003\Results.csv';

data.fly_11012023_002.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11012023\Fly001 straight

fictrac_dat = 'E:\Data\LiveVideo\CH_11012023_002\fictrac-20231101_145033.dat';
fictrac_txt = 'E:\Data\LiveVideo\CH_11012023_002\fictrac-vidLogFrames-20231101_145033.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\CH_11012023_002\Results.csv';

data.fly_11012023_001.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%% CH_11022023\Fly000\odor_straight

fictrac_dat = 'E:\Data\LiveVideo\CH_11022023\Fly_000\odor_straight\fictrac-20231102_113407.dat';
fictrac_txt = 'E:\Data\LiveVideo\CH_11022023\Fly_000\odor_straight\fictrac-vidLogFrames-20231102_113407.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\CH_11022023\Fly_000\odor_straight\Results.csv';

data.fly_11022023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11022023\Fly001\odor_straight

fictrac_dat = 'E:\Data\LiveVideo\CH_11022023\Fly_001\odor_straight\fictrac-20231102_125246.dat';
fictrac_txt = 'E:\Data\LiveVideo\CH_11022023\Fly_001\odor_straight\fictrac-vidLogFrames-20231102_125246.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\CH_11022023\Fly_001\odor_straight\Results.csv';

data.fly_11022023_001.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% HM_11022023\Fly007\odor_straigth

fictrac_dat = 'E:\Data\LiveVideo\HMS_11022023\fly_007\odor_straight\fictrac-20231102_162204.dat';
fictrac_txt = 'E:\Data\LiveVideo\HMS_11022023\fly_007\odor_straight\fictrac-vidLogFrames-20231102_162204.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\HMS_11022023\fly_007\odor_straight\Results.csv';

data.fly_11022023_007.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);


%% CH_11032023\Fly000\odor_straight

fictrac_dat = 'E:\Data\LiveVideo\CH_11032023\Fly000\odor_straight\fictrac-20231103_133850.dat';
fictrac_txt = 'E:\Data\LiveVideo\CH_11032023\Fly000\odor_straight\fictrac-vidLogFrames-20231103_133850.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\CH_11032023\Fly000\odor_straight\Results.csv';

data.fly_11032023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% Save
save('fob_data')

%% Analysis
%% running speed

trial_average(data, 'movspd')

trial_average(data, 'drotvlx')



%%
%% CH_11072023\Fly000\odor_straight

fictrac_dat = 'E:\Data\LiveVideo\11072023\Fly_000\odor_straight\fictrac-20231107_105758.dat';
fictrac_txt = 'E:\Data\LiveVideo\11072023\Fly_000\odor_straight\fictrac-vidLogFrames-20231107_105758.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11072023\Fly_000\odor_straight\Results.csv';

data.fly_11072023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

%% CH_11032023\Fly001\odor_straight

fictrac_dat = 'E:\Data\LiveVideo\11072023\Fly_001\odor_straight\fictrac-20231107_123235.dat';
fictrac_txt = 'E:\Data\LiveVideo\11072023\Fly_001\odor_straight\fictrac-vidLogFrames-20231107_123235.txt';
fictrac_stim_csv = 'E:\Data\LiveVideo\11072023\Fly_000\odor_straight\Results.csv';

data.fly_11072023_001.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);