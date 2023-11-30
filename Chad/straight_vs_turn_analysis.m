%% Analysis of straight vs side delivery of 1/5 air diluted ACV. 200-300mL pressure with a 1/16th in diameter tube. 
% Chad Heer; Hige Lab 11/2023
% 
% Run from Onedrive/FOB data folder
% 
% for each session designate:
% 
% fictrac_dat = fictrac .dat file folder location containing all measurement 
% outputs from fictrac
% 
% fictrac_txt = fictrac .txt file folder location containing log aligning vid 
% frames to fictrac output 
% 
% fictrac_stim_csv = .csv file folder location containing roi trace for stim 
% LED.
% 
% run " data.fly.session = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv)" 
% for each session to extract fictrac data and combine data from all flies
% 
% 
% 
% run striaght_vs_turn(data, measure) to compare different measures of behavior 
% during different tasks
% 
% 
%% CH_11082023/Fly000

fictrac_dat = '11082023/Fly000/odor_straight/fictrac-20231108_101533.dat';
fictrac_txt = '11082023/Fly000/odor_straight/fictrac-vidLogFrames-20231108_101533.txt';
fictrac_stim_csv = '11082023/Fly000/odor_straight/Results.csv';

data.fly_11082023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = '11082023/Fly000/odor_left/fictrac-20231108_104854.dat';
fictrac_txt = '11082023/Fly000/odor_left/fictrac-vidLogFrames-20231108_104854.txt';
fictrac_stim_csv = '11082023/Fly000/odor_left/Results.csv';

data.fly_11082023_000.left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%% CH_11082023/Fly002

fictrac_dat = '11082023/Fly002/odor_straight/fictrac-20231108_113306.dat';
fictrac_txt = '11082023/Fly002/odor_straight/fictrac-vidLogFrames-20231108_113306.txt';
fictrac_stim_csv = '11082023/Fly002/odor_straight/Results.csv';

data.fly_11082023_002.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = '11082023/Fly002/odor_right/fictrac-20231108_114933.dat';
fictrac_txt = '11082023/Fly002/odor_right/fictrac-vidLogFrames-20231108_114933.txt';
fictrac_stim_csv = '11082023/Fly002/odor_right/Results.csv';

data.fly_11082023_002.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%% CH_10082023/Fly003


fictrac_dat = '11082023/Fly003/fictrac-20231108_124800.dat';
fictrac_txt = '11082023/Fly003/fictrac-vidLogFrames-20231108_124800.txt';
fictrac_stim_csv = '11082023/Fly003/Results.csv';

data.fly_11082023_003.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);


fictrac_dat = '11082023/Fly003/odor_right/fictrac-20231108_130113.dat';
fictrac_txt = '11082023/Fly003/odor_right/fictrac-vidLogFrames-20231108_130113.txt';
fictrac_stim_csv = '11082023/Fly003/odor_right/Results.csv';

data.fly_11082023_003.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%% CH_11092023/Fly000

fictrac_dat = '11092023/Fly000/odor_straight/fictrac-20231109_103852.dat';
fictrac_txt = '11092023/Fly000/odor_straight/fictrac-vidLogFrames-20231109_103852.txt';
fictrac_stim_csv = '11092023/Fly000/odor_straight/Results.csv';

data.fly_11092023_000.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = '11092023/Fly000/odor_left/fictrac-20231109_105401.dat';
fictrac_txt = '11092023/Fly000/odor_left/fictrac-vidLogFrames-20231109_105401.txt';
fictrac_stim_csv = '11092023/Fly000/odor_left/Results.csv';

data.fly_11092023_000.left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%% CH_11092023/Fly001

fictrac_dat = '11092023/Fly001/odor_straight/fictrac-20231109_111822.dat';
fictrac_txt = '11092023/Fly001/odor_straight/fictrac-vidLogFrames-20231109_111822.txt';
fictrac_stim_csv = '11092023/Fly001/odor_straight/Results.csv';

data.fly_11092023_001.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);

fictrac_dat = '11092023/Fly001/odor_right/fictrac-20231109_113321.dat';
fictrac_txt = '11092023/Fly001/odor_right/fictrac-vidLogFrames-20231109_113321.txt';
fictrac_stim_csv = '11092023/Fly001/odor_right/Results.csv';

data.fly_11092023_001.right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%% 11092023/Fly003

fictrac_dat = '11092023/Fly003/odor_straight/fictrac-20231109_134658.dat';
fictrac_txt = '11092023/Fly003/odor_straight/fictrac-vidLogFrames-20231109_134658.txt';
fictrac_stim_csv = '11092023/Fly003/odor_straight/Results.csv';

data.fly_11092023_003.straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);


fictrac_dat = '11092023/Fly003/odor_left/fictrac-20231109_140115.dat';
fictrac_txt = '11092023/Fly003/odor_left/fictrac-vidLogFrames-20231109_140115.txt';
fictrac_stim_csv = '11092023/Fly003/odor_left/Results.csv';

data.fly_11092023_003.left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
%% save data

save('ACV_straight_v_turn')

%% analysis


straight_vs_turn(data, 'movspd')
%%

straight_vs_turn(data, 'inthead')