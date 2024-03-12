%% 01182024/Fly001

%ACV_straight
fictrac_dat = '01182024/Fly001/ACV_straight/fictrac-20240118_121749.dat';
fictrac_txt = '01182024/Fly001/ACV_straight/fictrac-vidLogFrames-20240118_121749.txt';
fictrac_stim_csv = '01182024/Fly001/ACV_straight/Results.csv';
thresh = 75;

data.fly_01182024_001.ACV_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%ACV_right
fictrac_dat = '01182024/Fly001/ACV_right/fictrac-20240118_123559.dat';
fictrac_txt = '01182024/Fly001/ACV_right/fictrac-vidLogFrames-20240118_123559.txt';
fictrac_stim_csv = '01182024/Fly001/ACV_right/Results.csv';
thresh = 180;

data.fly_01182024_001.ACV_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_right
fictrac_dat = '01182024/Fly001/OCT_right/fictrac-20240118_132557.dat';
fictrac_txt = '01182024/Fly001/OCT_right/fictrac-vidLogFrames-20240118_132557.txt';
fictrac_stim_csv = '01182024/Fly001/OCT_right/Results.csv';
thresh = 100;

data.fly_01182024_001.OCT_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_straight
fictrac_dat = '01182024/Fly001/OCT_straight/fictrac-20240118_130255.dat';
fictrac_txt = '01182024/Fly001/OCT_straight/fictrac-vidLogFrames-20240118_130255.txt';
fictrac_stim_csv = '01182024/Fly001/OCT_straight/Results.csv';
thresh = 7;

data.fly_01182024_001.OCT_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%% 01182024/Fly002

%ACV_straight
fictrac_dat = '01182024/Fly002/ACV_straight/fictrac-20240118_134816.dat';
fictrac_txt = '01182024/Fly002/ACV_straight/fictrac-vidLogFrames-20240118_134816.txt';
fictrac_stim_csv = '01182024/Fly002/ACV_straight/Results.csv';
thresh = 230;

data.fly_01182024_002.ACV_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%ACV_right
fictrac_dat = '01182024/Fly002/ACV_left/fictrac-20240118_142010.dat';
fictrac_txt = '01182024/Fly002/ACV_left/fictrac-vidLogFrames-20240118_142010.txt';
fictrac_stim_csv = '01182024/Fly002/ACV_left/Results.csv';
thresh = 100;

data.fly_01182024_002.ACV_left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_left
fictrac_dat = '01182024/Fly002/OCT_left/fictrac-20240118_145243.dat';
fictrac_txt = '01182024/Fly002/OCT_left/fictrac-vidLogFrames-20240118_145243.txt';
fictrac_stim_csv = '01182024/Fly002/OCT_left/Results.csv';
thresh = 190;

data.fly_01182024_002.OCT_left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_straight
fictrac_dat = '01182024/Fly002/OCT_straight/fictrac-20240118_143803.dat';
fictrac_txt = '01182024/Fly002/OCT_straight/fictrac-vidLogFrames-20240118_143803.txt';
fictrac_stim_csv = '01182024/Fly002/OCT_straight/Results.csv';
thresh = 120;

data.fly_01182024_002.OCT_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

% %% 01182024/Fly003
% 
% %ACV_straight
% fictrac_dat = '01182024/Fly003/ACV_straight/fictrac-20240118_153616.dat';
% fictrac_txt = '01182024/Fly003/ACV_straight/fictrac-vidLogFrames-20240118_153616.txt';
% fictrac_stim_csv = '01182024/Fly003/ACV_straight/Results.csv';
% thresh = 75;
% 
% data.fly_01182024_003.ACV_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
% 
% %ACV_right
% fictrac_dat = '01182024/Fly003/ACV_left/fictrac-20240118_155049.dat';
% fictrac_txt = '01182024/Fly003/ACV_left/fictrac-vidLogFrames-20240118_155049.txt';
% fictrac_stim_csv = '01182024/Fly003/ACV_left/Results.csv';
% thresh = 180;
% 
% data.fly_01182024_003.ACV_left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
% 
% %OCT_left
% fictrac_dat = '01182024/Fly003/OCT_left/fictrac-20240118_162959.dat';
% fictrac_txt = '01182024/Fly003/OCT_left/fictrac-vidLogFrames-20240118_162959.txt';
% fictrac_stim_csv = '01182024/Fly003/OCT_left/Results.csv';
% thresh = 100;
% 
% data.fly_01182024_003.OCT_left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);
% 
% %OCT_straight
% fictrac_dat = '01182024/Fly003/OCT_straight/fictrac-20240118_160741.dat';
% fictrac_txt = '01182024/Fly003/OCT_straight/fictrac-vidLogFrames-20240118_160741.txt';
% fictrac_stim_csv = '01182024/Fly003/OCT_straight/Results.csv';
% thresh = 100;
% 
% data.fly_01182024_003.OCT_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv);