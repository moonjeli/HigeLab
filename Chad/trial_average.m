function [] = trial_average(in, measure)

flies = fieldnames(in);

for fly = 1: length(flies)
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
    plot(data_mean(fly,:)+data_sem(fly,:),'r')
    plot(data_mean(fly,:)-data_sem(fly,:), 'r')
    plot(data_mean(fly,:), 'b')
    line([trial_length, trial_length], [min(smooth_data),max(smooth_data)]);
    line([trial_length*2, trial_length*2], [min(smooth_data),max(smooth_data)]);
    
end

pop_mean = nanmean(data_mean);
pop_sem = nanstd(data_sem)./sqrt(size(data_sem,1));

figure; hold on
plot(data_mean', 'Color', [.7 .7 .7]);
plot(pop_mean, 'b')
line([trial_length, trial_length], [min(smooth_data),max(smooth_data)]);
line([trial_length*2, trial_length*2], [min(smooth_data),max(smooth_data)]);

