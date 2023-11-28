function [] = straight_vs_turn(in, measure)

flies = fieldnames(in);

for fly = 1: length(flies)
    tasks = fieldnames(in.(flies{fly}));
    if any(tasks == "left") & measure ~= "movspd";
        in.(flies{fly}).left.(measure) = -in.(flies{fly}).left.(measure);
    end
    
    data = in.(flies{fly}).straight.(measure);
    trial_length = in.(flies{fly}).straight.trial_length;
    trial_frames = in.(flies{fly}).straight.trial_frames;
    figure; hold on
    smooth_data = movmean(data,10);
    for stim = 1:length(trial_frames);
        session_data(stim,1:length(trial_frames{stim})) = smooth_data(trial_frames{stim});
        plot(smooth_data(trial_frames{stim}), 'Color', [.7 .7 .7])
    end
    
    
    data_mean(fly,1:length(session_data)) = nanmean(session_data);
    data_sem(fly,1:length(session_data)) = nanstd(session_data)./sqrt(size(session_data,1));
    
    data_turn = in.(flies{fly}).(tasks{2}).(measure);
    turn_trial_length = in.(flies{fly}).(tasks{2}).trial_length;
    turn_trial_frames = in.(flies{fly}).(tasks{2}).trial_frames;
    figure; hold on
    smooth_turn_data = movmean(data_turn,10);
    for stim = 1:length(turn_trial_frames);
        session_turn_data(stim,1:length(turn_trial_frames{stim})) = smooth_turn_data(turn_trial_frames{stim});
        plot(smooth_turn_data(turn_trial_frames{stim}), 'Color', [.7 .7 .7])
    end
    
    turn_data_mean(fly,1:length(session_turn_data)) = nanmean(session_turn_data);
    turn_data_sem(fly,1:length(session_turn_data)) = nanstd(session_turn_data)./sqrt(size(session_turn_data,1));
    
    plot(data_mean(fly,:)+data_sem(fly,:),'r')
    plot(data_mean(fly,:)-data_sem(fly,:), 'r')
    plot(data_mean(fly,:), 'b')
    plot(turn_data_mean(fly,:)+turn_data_sem(fly,:),'k')
    plot(turn_data_mean(fly,:)-turn_data_sem(fly,:), 'k')
    plot(turn_data_mean(fly,:), 'g')
    line([trial_length, trial_length], [min(smooth_data),max(smooth_data)]);
    line([trial_length*2, trial_length*2], [min(smooth_data),max(smooth_data)]);
    
end

pop_mean = nanmean(data_mean);
pop_sem = nanstd(data_sem)./sqrt(size(data_sem,1));
turn_pop_mean = nanmean(turn_data_mean);
turn_pop_sem = nanstd(turn_data_sem)./sqrt(size(turn_data_sem,1));

figure; hold on
plot(data_mean', 'Color', [.7 .7 .7]);
plot(pop_mean, 'k')
plot(turn_data_mean', 'Color', [0 .7 .7]);
plot(turn_pop_mean, 'b')
line([trial_length, trial_length], [min(smooth_data),max(smooth_data)]);
line([trial_length*2, trial_length*2], [min(smooth_data),max(smooth_data)]);

