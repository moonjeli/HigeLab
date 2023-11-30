%% comparing FOB behavioral responses from straight and side delivery of odors
%Chad Heer: Hige Lab 11/28/2023


%INPUTS:
% in = output of extract_fictrac for all flies. should be organized as
%       data.fly.session.measure where session is straight, right or left
% measure = string of which measure you want to analyze. 

%Generates figures of average resonse of each fly to straight and side
%odor, population average response of all flies to both conditions, and
%boxplot with annova of average measure pre-delivery, straight delivery,
%side delivery, and post delivery of odor

%%
function [] = straight_vs_turn(in, measure)

%determine fly names
flies = fieldnames(in);
fr = 100; 
x_axis = (1: length(in.(flies{1}).straight.(measure)))/fr;

%loop through each fly
for fly = 1: length(flies)
    tasks = fieldnames(in.(flies{fly}));
    % a = in.(flies{fly}).left.(measure);
    % n = 10; 
    % in.(flies{fly}).left.(measure) = arrayfun(@(i) mean(a(i:i+n-1)),1:n:length(a)-n+1)';

    if any(tasks == "left") & measure ~= "movspd";  %change the sign so that the odor delivery direction is always negative
        in.(flies{fly}).left.(measure) = -in.(flies{fly}).left.(measure);
    end
    
    if measure == "movdir" | measure == "inthead"; % find the difference between each points moving direction to determine the turning of the animal
       
        for task = 1:length(tasks)
            x = diff(in.(flies{fly}).(tasks{task}).(measure));
            x = [0; x];
            x(x>5000) = x(x>5000) - 36000;
            x(x<-5000) = x(x<-5000) + 36000;

            in.(flies{fly}).(tasks{task}).(measure) = movmean(x, 10);
        end

    end

    %align data from each trial for the given measure
    data = in.(flies{fly}).straight.(measure);
    trial_length = in.(flies{fly}).straight.trial_length;
    trial_frames = in.(flies{fly}).straight.trial_frames;
    % figure; hold on
    smooth_data = movmean(data,10);
    for stim = 1:length(trial_frames);
        session_data(fly,stim,1:length(trial_frames{stim})) = smooth_data(trial_frames{stim});
        % plot(smooth_data(trial_frames{stim}), 'Color', [.7 .7 .7])
    end
    
    %find the mean and SEM for data for each fly
    data_mean(fly,1:length(squeeze(session_data(fly,:,:)))) = nanmean(squeeze(session_data(fly,:,:)));
    data_sem(fly,1:length(squeeze(session_data(fly,:,:)))) = nanstd(squeeze(session_data(fly,:,:)))./sqrt(size(squeeze(session_data(fly,:,:)),1));
    
    %align data for side odor deliver for each trial
    data_turn = in.(flies{fly}).(tasks{2}).(measure);
    turn_trial_length = in.(flies{fly}).(tasks{2}).trial_length;
    turn_trial_frames = in.(flies{fly}).(tasks{2}).trial_frames;
    % figure; hold on
    smooth_turn_data = movmean(data_turn,10);
    for stim = 1:length(turn_trial_frames);
        session_turn_data(fly,stim,1:length(turn_trial_frames{stim})) = smooth_turn_data(turn_trial_frames{stim});
        % plot(smooth_turn_data(turn_trial_frames{stim}), 'Color', [.7 .7 .7])
    end
    
    %find mean and sem for each fly
    turn_data_mean(fly,1:length(squeeze(session_turn_data(fly,:,:)))) = nanmean(squeeze(session_turn_data(fly,:,:)));
    turn_data_sem(fly,1:length(squeeze(session_turn_data(fly,:,:)))) = nanstd(squeeze(session_turn_data(fly,:,:)))./sqrt(size(squeeze(session_turn_data(fly,:,:)),1));
    
    
    %plot data for each fly
    figure; hold on;
    x = x_axis(1:length(data_mean));
    plot(x, data_mean(fly,:)+data_sem(fly,:),'r')
    plot(x, data_mean(fly,:)-data_sem(fly,:), 'r')
    plot(x, data_mean(fly,:), 'b')
    x = x_axis(1:length(turn_data_mean));
    plot(x, turn_data_mean(fly,:)+turn_data_sem(fly,:),'k')
    plot(x, turn_data_mean(fly,:)-turn_data_sem(fly,:), 'k')
    plot(x, turn_data_mean(fly,:), 'g')
    line([x(trial_length), x(trial_length)], [min(smooth_data),max(smooth_data)]);
    line([x(trial_length)*2, x(trial_length)*2], [min(smooth_data),max(smooth_data)]);
    if measure == "movspd"
        ylabel("average speed mm/s")
    else 
        ylabel("average rotation degrees/s")
    end
    xlabel("times (s)")
    %find average data for pre, during and post stimulus
    straight_mean(1,fly,:) = nanmean(squeeze(session_data(fly,:,1:trial_length)),2);
    straight_mean(2,fly,:) = nanmean(squeeze(session_data(fly,:,trial_length+1:trial_length *2)),2);
    straight_mean(3,fly,:) = nanmean(squeeze(session_data(fly,:,trial_length * 2+1:trial_length*3)),2);

    turn_mean(1,fly,:) = nanmean(squeeze(session_turn_data(fly,:,1:trial_length)),2);
    turn_mean(2,fly,:) = nanmean(squeeze(session_turn_data(fly,:,trial_length+1:trial_length *2)),2);
    turn_mean(3,fly,:) = nanmean(squeeze(session_turn_data(fly,:,trial_length * 2+1:trial_length*2.5)),2);
end


%boxplot comparing pre, straight, side, and post odor delivery
task_mean = squeeze(nanmean(straight_mean,3));
task_mean = [task_mean; squeeze(nanmean(turn_mean,3))];

figure;
tasks = ["pre", "straight", "side", "post"];
boxplot(task_mean([1,2,5,3],:)', tasks)
if measure == "movspd"
    ylabel("average speed mm/s")
else 
    ylabel("average rotation degrees/s")
end

figure; hold on

[p,t,stats] = anova1(task_mean([1,2,5,3],:)')
[c,m,h,gnames] = multcompare(stats);


figure; 
trial_mean = squeeze(nanmean(straight_mean,2));
trial_sem = squeeze(nanstd(straight_mean,0,2))./sqrt(size(straight_mean,2));
ydata = [trial_mean(1,1), trial_mean(2,:)];
err = [trial_sem(1,1), trial_sem(2,:)];
x = [0:10];
errorbar(x,ydata,err);

%plot trial by trial population means
if measure == "movspd"
    ylabel("average speed mm/s")
else 
    ylabel("average rotation degrees/s")
end
xlabel("trial number")

trials = size(trial_mean,1);
red = [0.9290 0.6940 0.1250];
pink = [0.4940 0.1840 0.5560];
colors_p = [linspace(red(1),pink(1),trials)', linspace(red(2),pink(2),trials)', linspace(red(3),pink(3),trials)'];

% figure; hold on
% for trial = 1:size(trial_mean,1)
%     plot(trial_mean(trial,:), 'Color', colors_p(trial,:));
% end

%find population mean and sem for straight and side trials
pop_mean = nanmean(data_mean);
pop_sem = nanstd(data_mean)./sqrt(size(data_mean,1));
turn_pop_mean = nanmean(turn_data_mean);
turn_pop_sem = nanstd(turn_data_mean)./sqrt(size(turn_data_mean,1));

%plot population data
figure; hold on
x = x_axis(1:length(pop_mean));
plot(x, pop_mean + pop_sem, 'Color', [.7 .7 .7]);
plot(x, pop_mean - pop_sem, 'Color', [.7 .7 .7]);
plot(x, pop_mean, 'k')

x = x_axis(1:length(turn_pop_mean));
plot(x, turn_pop_mean + turn_pop_sem, 'Color', [0 .7 .7]);
plot(x, turn_pop_mean - turn_pop_sem, 'Color', [0 .7 .7]);
plot(x, turn_pop_mean, 'b')
line([x(trial_length), x(trial_length)], [min(smooth_data),max(smooth_data)]);
line([x(trial_length)*2, x(trial_length)*2], [min(smooth_data),max(smooth_data)]);

if measure == "movspd"
    ylabel("average speed mm/s")
else 
    ylabel("average rotation degrees/s")
end
xlabel("time (s)")

