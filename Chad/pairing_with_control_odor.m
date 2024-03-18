%% pairing with control odor
close all
clear all

%% odor_pairing/03122024/fly000/ACV_left
%ACV_test
folder = 'odor_pairing/03122024/Fly000/ACV_left';
thresh = 40;

data.fly03122024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03122024/Fly000/pre_pairing';
thresh = 40;

data.fly03122024_000.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03122024/Fly000/post_pairing';
thresh = 40;

data.fly03122024_000.post_pairing_left = extract_fictrac(folder);

data.fly03122024_000.post_pairing_left.paired_odor = "OCT";


%% odor_pairing/03122024/fly001/ACV_left
%ACV_test
folder = 'odor_pairing/03122024/Fly001/ACV_left';
thresh = 40;

data.fly03122024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03122024/Fly001/pre_pairing';
thresh = 40;

data.fly03122024_001.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03122024/Fly001/post_pairing';
thresh = 40;

data.fly03122024_001.post_pairing_left = extract_fictrac(folder);

data.fly03122024_001.post_pairing_left.paired_odor = "OCT";


%% odor_pairing/03122024/fly002
%ACV_test
folder = 'odor_pairing/03122024/Fly002/ACV_left';
thresh = 40;

data.fly03122024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03122024/Fly002/pre_pairing';
thresh = 40;

data.fly03122024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03122024/Fly002/post_pairing';
thresh = 40;

data.fly03122024_002.post_pairing_left = extract_fictrac(folder);

data.fly03122024_002.post_pairing_left.paired_odor = "OCT";


%% odor_pairing/03122024/fly004
%ACV_test
folder = 'odor_pairing/03122024/Fly004/ACV_left';
thresh = 40;

data.fly03122024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03122024/Fly004/pre_pairing';
thresh = 40;

data.fly03122024_004.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03122024/Fly004/post_pairing';
thresh = 40;

data.fly03122024_004.post_pairing_left = extract_fictrac(folder);

data.fly03122024_004.post_pairing_left.paired_odor = "OCT";


%% 03132024
% %% odor_pairing/03132024/fly001/ACV_left 



%excluded due to flying


% %ACV_test
% folder = 'odor_pairing/03132024/Fly001/ACV_left';
% thresh = 40;
% 
% data.fly03132024_001.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'odor_pairing/03132024/Fly001/pre_pairing';
% thresh = 40;
% 
% data.fly03132024_001.pre_pairing_left = extract_fictrac(folder);
% 
% %post_pairing
% folder = 'odor_pairing/03132024/Fly001/post_pairing';
% thresh = 40;
% 
% data.fly03132024_001.post_pairing_left = extract_fictrac(folder);

%% odor_pairing/03132024/fly002/ACV_left
%ACV_test
folder = 'odor_pairing/03132024/Fly002/ACV_left';
thresh = 40;

data.fly03132024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03132024/Fly002/pre_pairing';
thresh = 40;

data.fly03132024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03132024/Fly002/post_pairing';
thresh = 40;

data.fly03132024_002.post_pairing_left = extract_fictrac(folder);

data.fly03132024_002.post_pairing_left.paired_odor = "OCT";

%% odor_pairing/03132024/fly003


%excluded due to flying
% 
% 
% %ACV_test
% folder = 'odor_pairing/03122024/Fly003/ACV_left';
% thresh = 40;
% 
% data.fly03132024_003.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'odor_pairing/03132024/Fly003/pre_pairing';
% thresh = 40;
% 
% data.fly03132024_003.pre_pairing_left = extract_fictrac(folder);
% 
% %post_pairing
% folder = 'odor_pairing/03132024/Fly003/post_pairing';
% thresh = 40;
% 
% data.fly03132024_003.post_pairing_left = extract_fictrac(folder);

%% odor_pairing/03132024/fly004
%ACV_test
folder = 'odor_pairing/03132024/Fly004/ACV_left';
thresh = 40;

data.fly03132024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03132024/Fly004/pre_pairing';
thresh = 40;

data.fly03132024_004.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03132024/Fly004/post_pairing';
thresh = 40;

data.fly03132024_004.post_pairing_left = extract_fictrac(folder);

data.fly03132024_004.post_pairing_left.paired_odor = "OCT";


%% odor_pairing/03132024/fly005
%ACV_test
folder = 'odor_pairing/03132024/Fly005/ACV_left';
thresh = 40;

data.fly03132024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03132024/Fly005/pre_pairing';
thresh = 40;

data.fly03132024_005.pre_pairing_left = extract_fictrac(folder);
data.fly03132024_005.pre_pairing_left.paired_odor = "OCT";

%post_pairing
folder = 'odor_pairing/03132024/Fly005/post_pairing';
thresh = 40;

data.fly03132024_005.post_pairing_left = extract_fictrac(folder);

data.fly03132024_005.post_pairing_left.paired_odor = "OCT";


%% 03142024

%fly 03242024_000
folder = 'odor_pairing/03142024/Fly000/ACV_left';

data.fly03142024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly000/pre_pairing';

data.fly03142024_000.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03142024/Fly000/post_pairing';

data.fly03142024_000.post_pairing_left = extract_fictrac(folder);

data.fly03142024_000.post_pairing_left.paired_odor = "MCH";
data.fly03142024_000.pre_pairing_left.paired_odor = "MCH";

%% fly 03242024_001
folder = 'odor_pairing/03142024/Fly001/ACV_left';

data.fly03142024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly001/pre_pairing';

data.fly03142024_001.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03142024/Fly001/post_pairing';

data.fly03142024_001.post_pairing_left = extract_fictrac(folder);

data.fly03142024_001.post_pairing_left.paired_odor = "MCH";
data.fly03142024_001.pre_pairing_left.paired_odor = "MCH";


%% fly 03242024_002
folder = 'odor_pairing/03142024/Fly002/ACV_left';

data.fly03142024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly002/pre_pairing';

data.fly03142024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03142024/Fly002/post_pairing';

data.fly03142024_002.post_pairing_left = extract_fictrac(folder);

data.fly03142024_002.post_pairing_left.paired_odor = "OCT";
data.fly03142024_002.pre_pairing_left.paired_odor = "OCT";

%% fly 03242024_003
folder = 'odor_pairing/03142024/Fly003/ACV_left';

data.fly03142024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly003/pre_pairing';

data.fly03142024_003.pre_pairing_left = extract_fictrac(folder);
data.fly03142024_003.pre_pairing_left.paired_odor = "OCT";

%post_pairing
folder = 'odor_pairing/03142024/Fly003/post_pairing';

data.fly03142024_003.post_pairing_left = extract_fictrac(folder);

data.fly03142024_003.post_pairing_left.paired_odor = "OCT";
%%
straight_vs_turn(data, ['movdir'])
straight_vs_turn(data, ['movspd'])
