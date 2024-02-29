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
tasks = fieldnames(in.(flies{1}));

fr = 100; 
x_axis = (1: length(in.(flies{1}).(tasks{1}).(measure)))/fr;
color_seq = ["b", "r", "g", "m"];
%loop through each fly
for fly = 1: length(flies)
    tasks = fieldnames(in.(flies{fly}));
    % a = in.(flies{fly}).left.(measure);
    % n = 10; 
    % in.(flies{fly}).left.(measure) = arrayfun(@(i) mean(a(i:i+n-1)),1:n:length(a)-n+1)';
    figure; hold on;

    for task = 1: length(tasks)

        if contains(tasks{task},"left") & measure ~= "movspd";  %change the sign so that the odor delivery direction is always negative
            in.(flies{fly}).(tasks{task}).(measure) = -in.(flies{fly}).(tasks{task}).(measure);
        end
        
        if measure == "movdir" | measure == "inthead"; % find the difference between each points moving direction to determine the turning of the animal
           
            x = diff(in.(flies{fly}).(tasks{task}).(measure));
            x = [0; x];
            x(x>5000) = x(x>5000) - 36000;
            x(x<-5000) = x(x<-5000) + 36000;

            in.(flies{fly}).(tasks{task}).(measure) = movmean(x, 10);
        

        end
    
        %align data from each trial for the given measure
        data = in.(flies{fly}).(tasks{task}).(measure);
        trial_length(fly,task) = in.(flies{fly}).(tasks{task}).trial_length;
        trial_frames = in.(flies{fly}).(tasks{task}).trial_frames;
        % trial_start = in.(flies{fly}).(tasks{task}).trial_start;
        trial_x = in.(flies{fly}).(tasks{task}).trial_x;
        x_axis = -5000:5000;
        length_x = 1:length(x_axis);

        % figure; hold on
        smooth_data = movmean(data,10);
        for stim = 1:length(trial_frames);
            
            if trial_frames{stim}(end) > length(data)
                session_data(fly,task,stim,length_x(ismember(x_axis, trial_x{stim}(1:find(trial_frames{stim} == length(data)))))) = smooth_data(trial_frames{stim}(1:find(trial_frames{stim} == length(data))));
            else
                session_data(fly,task,stim,length_x(ismember(x_axis, trial_x{stim}))) = smooth_data(trial_frames{stim});
            end
            % plot(smooth_data(trial_frames{stim}), 'Color', [.7 .7 .7])
            % session_x(fly,task,stim,1:length(trial_x)) = trial_x{stim};

        end


        if tasks{task} == "ACV_left" | tasks{task} == "ACV_right";

            tasks{task} = "ACV_side";

        elseif tasks{task} == "OCT_left" | tasks{task} == "OCT_right";

            tasks{task} = "OCT_side";

        end
       
        session_data(session_data == 0) = NaN;
        %find the mean and SEM for data for each fly
        data_mean.(tasks{task})(fly,1:length(squeeze(session_data(fly,task,:,:)))) = nanmean(squeeze(session_data(fly,task,:,:)));
        data_sem.(tasks{task})(fly,1:length(squeeze(session_data(fly,task,:,:)))) = nanstd(squeeze(session_data(fly,task,:,:)))./sqrt(size(squeeze(session_data(fly,task,:,:)),1));
        
        
        %plot data for each fly
        x = x_axis(1:length(data_mean.(tasks{task})))/fr;
        plot(x, squeeze(data_mean.(tasks{task})(fly,:)) + squeeze(data_sem.(tasks{task})(fly,:)),color_seq(task), "HandleVisibility","off")
        plot(x, squeeze(data_mean.(tasks{task})(fly,:)) - squeeze(data_sem.(tasks{task})(fly,:)), color_seq(task), "HandleVisibility","off")
        plot(x, squeeze(data_mean.(tasks{task})(fly,:)), color_seq(task), 'DisplayName',(tasks{task}));
        legend()

        if measure == "movspd"
            ylabel("average speed mm/s")
        else 
            ylabel("average rotation degrees/s")
        end
        xlabel("times (s)")
        title(flies{fly});
        %find average data for pre, during and post stimulus
        task_mean.(tasks{task})(1,fly,1:size(session_data,3)) = nanmean(squeeze(session_data(fly,task,:, 5001-trial_length(fly,task):5000)),2);
        task_mean.(tasks{task})(2,fly,1:size(session_data,3)) = nanmean(squeeze(session_data(fly,task,:,5001:5000 + trial_length(fly,task))),2);
        task_mean.(tasks{task})(3,fly,1:size(session_data,3)) = nanmean(squeeze(session_data(fly,task,:,5000 + trial_length(fly,task): end)),2);
    
        task_response.(tasks{task}) = squeeze(nanmean(task_mean.(tasks{task}),3));

    end

end


%% boxplot comparing pre, ACV_ straight, OCT_pre, and OCT_straight odor delivery

for task = 1:length(tasks)
    tasks2compare = [squeeze(task_response.(tasks{task})(1,:)); squeeze(task_response.(tasks{task})(2,:))];
        
    figure; hold on
    [p,t,stats] = anova1(tasks2compare')
    [c,m,h,gnames] = multcompare(stats);

    figure;
    labels = ["pre", "during"];
    boxplot(tasks2compare', labels)
    if measure == "movspd"
        ylabel("average speed mm/s")
    else 
        ylabel("average rotation degrees/s")
    end
    box off
    yt = get(gca, 'YTick');
    axis([xlim    0  ceil(max(yt)*1.2)])
    xt = get(gca, 'XTick');
    title(tasks{task});

    hold on
    
    if any(c(:,end) < 0.05)
        sig_pairs = c(c(:,end) < 0.05,:);
        for pair = 1: size(sig_pairs,1);
            plot(xt([sig_pairs(pair, 1) sig_pairs(pair,2)]), [1 1]*max(yt)*1.05, '-k',  mean(xt([sig_pairs(pair,1) sig_pairs(pair,2)])), max(yt)*1.10, '*k')
    % plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3])), max(yt)*1.15, '*k')
        end
    end
   
    
    hold off    

end




%% figure; 
% trial_mean = squeeze(nanmean(task_mean,2));
% trial_sem = squeeze(nanstd(task_mean,0,2))./sqrt(size(task_mean,2));
% ydata = [trial_mean(1,1), trial_mean(2,:)];
% err = [trial_sem(1,1), trial_sem(2,:)];
% x = [0:10];
% errorbar(x,ydata,err);
% 
% %plot trial by trial population means
% if measure == "movspd"
%     ylabel("average speed mm/s")
% else 
%     ylabel("average rotation degrees/s")
% end
% xlabel("trial number")
% 
% trials = size(trial_mean,1);
% red = [0.9290 0.6940 0.1250];
% pink = [0.4940 0.1840 0.5560];
% colors_p = [linspace(red(1),pink(1),trials)', linspace(red(2),pink(2),trials)', linspace(red(3),pink(3),trials)'];

% figure; hold on
% for trial = 1:size(trial_mean,1)
%     plot(trial_mean(trial,:), 'Color', colors_p(trial,:));
% end

%find population mean and sem for straight and side trials
figure; hold on
label = {};
for task = 1: length(tasks)
    pop_mean = nanmean(squeeze(data_mean.(tasks{task})(:,:)),1);
    pop_sem = nanstd(squeeze(data_mean.(tasks{task})(:,:)))./sqrt(size(squeeze(data_mean.(tasks{task})(:,:)),1));
    
    
    %plot population data
    color_seq = ["b" "r" "g" "c" "m" "y" "k"];
    
    x = x_axis(1:length(pop_mean))/fr;
    h = plot(x,pop_mean(:),color_seq(task), 'LineWidth',2, 'DisplayName',(tasks{task}));
    j = patch([x fliplr(x)], [(pop_mean(:)'+pop_sem(:)') fliplr(pop_mean(:)'-pop_sem(:)')],color_seq(task))
    alpha(0.3)
    % plot(x, pop_mean + pop_sem, 'Color', [.7 .7 .7]);
    % plot(x, pop_mean - pop_sem, 'Color', [.7 .7 .7]);
    % plot(x, pop_mean, 'k', "DisplayName", "straight odor")
    % x = x_axis(1:length(turn_pop_mean));
    % h = plot(x,turn_pop_mean(:),color_seq(2), 'LineWidth',2, 'DisplayName',"ACV straight")
    % j = patch([x fliplr(x)], [(turn_pop_mean(:)'+turn_pop_sem(:)') fliplr(turn_pop_mean(:)'-turn_pop_sem(:)')],color_seq(2))
    % alpha(0.3)
    % x = x_axis(1:length(turn_pop_mean));
    % plot(x, turn_pop_mean + turn_pop_sem, 'Color', [0 .7 .7]);
    % plot(x, turn_pop_mean - turn_pop_sem, 'Color', [0 .7 .7]);
    % plot(x, turn_pop_mean, 'b', "DisplayName", "side odor")
    line([0, 0], [min(smooth_data),max(smooth_data)],'Color', 'k');
    % line([13*2, 13*2], [min(smooth_data),max(smooth_data)], 'Color','k');
    % label{end+1} = tasks{task};
    % label{end+1} = '';

    xlim([0 35])
    ylim([0 100])
    if measure == "movspd"  
        ylabel("average speed mm/s")
    else 
        ylabel("average rotation degrees/s")
    end
    xlabel("time (s)")
end

legend(label)
end


