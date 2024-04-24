%% 04162024
clear all 
close all
%% 04162024 000
% odor_pairing/04162024/Fly001/

folder = 'odor_pairing/04162024/Fly000/ACV_right';

data.fly04162024_000.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04162024/Fly000/pre_pairing';

data.fly04162024_000.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04162024/Fly000/post_pairing';

data.fly04162024_000.post_pairing_right = extract_fictrac(folder);

data.fly04162024_000.post_pairing_right.paired_odor = "OCT";
data.fly04162024_000.pre_pairing_right.paired_odor = "OCT";

%% 04162024 001
% odor_pairing/04162024/Fly001/

folder = 'odor_pairing/04162024/Fly001/ACV_right';

data.fly04162024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04162024/Fly001/pre_pairing';

data.fly04162024_001.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04162024/Fly001/post_pairing';

data.fly04162024_001.post_pairing_right = extract_fictrac(folder);

data.fly04162024_001.post_pairing_right.paired_odor = "MCH";
data.fly04162024_001.pre_pairing_right.paired_odor = "MCH";

%% 04162024 004
% odor_pairing/04162024/Fly004/

folder = 'odor_pairing/04162024/Fly004/ACV_left';

data.fly04162024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04162024/Fly004/pre_pairing';

data.fly04162024_004.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04162024/Fly004/post_pairing';

data.fly04162024_004.post_pairing_left = extract_fictrac(folder);

data.fly04162024_004.post_pairing_left.paired_odor = "MCH";
data.fly04162024_004.pre_pairing_left.paired_odor = "MCH";

%% 04182024 003
% odor_pairing/04182024/Fly003/

folder = 'odor_pairing/04182024/Fly003/ACV_left';

data.fly04182024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04182024/Fly003/pre_pairing';

data.fly04182024_003.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04182024/Fly003/post_pairing';

data.fly04182024_003.post_pairing_left = extract_fictrac(folder);

data.fly04182024_003.post_pairing_left.paired_odor = "MCH";
data.fly04182024_003.pre_pairing_left.paired_odor = "MCH";

%% 04182024 005
% odor_pairing/04182024/Fly005/

folder = 'odor_pairing/04182024/Fly005/ACV_left';

data.fly04182024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04182024/Fly005/pre_pairing';

data.fly04182024_005.pre_pairing_left = extract_fictrac(folder);
 
%post_pairing
folder = 'odor_pairing/04182024/Fly005/post_pairing';

data.fly04182024_005.post_pairing_left = extract_fictrac(folder);

data.fly04182024_005.post_pairing_left.paired_odor = "MCH";
data.fly04182024_005.pre_pairing_left.paired_odor = "MCH";


%%

straight_vs_turn(data, ['inthead'])

straight_vs_turn(data, ['movspd'])
