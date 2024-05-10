%% comparing FOB behavioral responses from straight and side delivery of odors
%Chad Heer: Hige Lab 11/28/2023


%INPUTS:
% in = output of extract_fictrac for all flies. should be organized as
% data.fly.task.measure 
% measure = string of which measure you want to analyze. 

%Generates figures of average resonse of each fly to each task
%odor, population average response of all flies to both conditions, and
%boxplot with annova of average measure pre-deliver vs during delivery for
%each task

%%
function [] = straight_vs_turn(in, measure)

%determine fly names
flies = fieldnames(in);
%determine task names
tasks = fieldnames(in.(flies{1}));

fr = 100;           % set frame rate

%create x/axis in seconds
x_axis = (1: length(in.(flies{1}).(tasks{1}).(measure)))/fr;
%custom color sequence for plots
color_seq = ["b", "r", "g", "m"];

%loop through each fly
for fly = 1: length(flies)
    %find tasks for given fly
    tasks = fieldnames(in.(flies{fly}));
    
    % figure; hold on;
    
    %loop through each task
    for task = 1: length(tasks)

        % find the odor_id for a given task, and asign the delay for the
        % odor delivery for that task

        odor_id = in.(flies{fly}).(tasks{task}).odor_id;

        
        if contains(tasks{task},"left") & measure ~= "movspd";  %change the sign so that the odor delivery direction is always positive
            in.(flies{fly}).(tasks{task}).(measure) = -in.(flies{fly}).(tasks{task}).(measure);
        end

        if  measure == "inthead"; % find the difference between each points heading direction to determine the turning of the animal
            x = diff(in.(flies{fly}).(tasks{task}).(measure));
            x = [0; x];
            x(x>5000) = x(x>5000) - 36000; % elimante the large changes in turning that are caused when going over 360 degrees
            x(x<-5000) = x(x<-5000) + 36000; % elimante the large changes in turning that occur when going under 0 degrees

            in.(flies{fly}).(tasks{task}).(measure) = movmean(x, 10); % find the mean of ten frames to smooth data slightly


        elseif measure == "movdir" % do the same as above but for moving direction
            x = diff(in.(flies{fly}).(tasks{task}).(measure));
            x = [0; x];
            x(x>5000) = x(x>5000) - 36000;
            x(x<-5000) = x(x<-5000) + 36000;

            x = x - nanmean(x);

            in.(flies{fly}).(tasks{task}).(measure) = movmean(x, 10)
            
        end
        
        %if odor id is provided, grab it, else assign it as odor1.
        a = fieldnames(in.(flies{fly}).(tasks{task}));
        if ~any(ismember(a, "odor_id"));
            odor_id = "odor1";

            % if an odor was paired, designate odors as either CS+ or CS- 
        elseif any(ismember(a, "paired_odor"));
            odor_id = in.(flies{fly}).(tasks{task}).odor_id;
            z = find(ismember(odor_id, in.(flies{fly}).(tasks{task}).paired_odor));
            y = find(~ismember(odor_id, in.(flies{fly}).(tasks{task}).paired_odor));
 
            [odor_id{z}] = deal('CS_plus');
            [odor_id{y}] = deal('CS_minus');

        else
            %if there is not a paired odor assign odor_id 
            odor_id = in.(flies{fly}).(tasks{task}).odor_id;
        end

        %grab variables 
        data = in.(flies{fly}).(tasks{task}).(measure);
        trial_length(fly,task) = in.(flies{fly}).(tasks{task}).trial_length;
        trial_frames = in.(flies{fly}).(tasks{task}).trial_frames;
        trial_x = in.(flies{fly}).(tasks{task}).trial_x;
        
        %create x_axis to align trials to
        x_axis = -5000:5000;
        length_x = 1:length(x_axis);

        % smooth data
        smooth_data = movmean(data,100);
    
        %make sure session data is empty
        clear session_data;
        
        %cycle through trials 
        for stim = 1:length(trial_frames);
            
            % if the trial_frames extend beyond the length of the data,
            % grab the frames up until the last data point and align that
            % data to the x_axis, so that the first odor_delivery frame is
            % at x_axis == 1
            if trial_frames{stim}(end) > length(data)
                session_data.(odor_id{stim})(fly,task,stim,length_x(ismember(x_axis, trial_x{stim}(1:find(trial_frames{stim} == length(data)))))) = smooth_data(trial_frames{stim}(1:find(trial_frames{stim} == length(data))));
           
            %else grab the data for the trialand align that
            % data to the x_axis, so that the first odor_delivery frame is
            % at x_axis == 1
            else
                session_data.(odor_id{stim})(fly,task,stim,length_x(ismember(x_axis, trial_x{stim}))) = smooth_data(trial_frames{stim});
            end
            % plot(smooth_data(trial_frames{stim}), 'Color', [.7 .7 .7])
            % session_x(fly,task,stim,1:length(trial_x)) = trial_x{stim};

        end

        % if task contains right or left, remove direction so that tasks
        % across flies are the same.
        if contains(tasks{task}, "left");
            tasks{task} = tasks{task}(1:end-5);

        elseif contains(tasks{task},"right");
            tasks{task} = tasks{task}(1:end-6);

        end
        
       
        %find the odor ids
        odors = fieldnames(session_data);
        
        %loop through each odor
        for o = 1: length(odors);
            session_data.(odors{o})(session_data.(odors{o}) == 0) = NaN;
            %find the mean and SEM for data for this fly
            data_mean.(tasks{task}).(odors{o})(fly,1:length(squeeze(session_data.(odors{o})(fly,task,:,:)))) = nanmean(squeeze(session_data.(odor_id{o})(fly,task,:,:)));
            data_sem.(tasks{task}).(odors{o})(fly,1:length(squeeze(session_data.(odors{o})(fly,task,:,:)))) = nanstd(squeeze(session_data.(odor_id{o})(fly,task,:,:)))./sqrt(size(squeeze(session_data.(odors{o})(fly,task,:,:)),1));
            
            
            %plot mean of data across trials +- sem for this fly
            x = x_axis(1:length(data_mean.(tasks{task}).(odors{o})))/fr;
            % plot(x, squeeze(data_mean.(tasks{task}).(odors{o})(fly,:)) + squeeze(data_sem.(tasks{task}).(odors{o})(fly,:)),'k', "HandleVisibility","off")
            % plot(x, squeeze(data_mean.(tasks{task}).(odors{o})(fly,:)) - squeeze(data_sem.(tasks{task}).(odors{o})(fly,:)),'k', "HandleVisibility","off")
            % plot(x, squeeze(data_mean.(tasks{task}).(odors{o})(fly,:)), 'DisplayName',[char(tasks{task}) ' ' char(odors{o})]);
            % legend()
            % 
            % %label axes 
            % if measure == "movspd"
            %     ylabel("average speed mm/s")
            % else 
            %     ylabel("average rotation degrees/s")
            % end
            % xlabel("times (s)")
            % title(flies{fly});
            % % session_data(session_data == 0) = NaN;
            % %find average data for pre, during and post stimulus
            % 
            % %if the measure is inthead, we just want to look at the 3
            % %seconds before vs after odor delivery 
            if measure == "inthead"
                during = 3 * fr;
            else
                during = trial_length(fly,task);

            end
        
            % find the mean activity prior to, during, and after
            % odor_delivery accounting for odor delivery delay for each
            % task
            % task_mean.(tasks{task})(1,fly,1:size(session_data.(odors{o}),3)) = nanmean(squeeze(session_data.(odors{o})(fly,task,:, 5001-trial_length(fly,task):5000)),2);
            % task_mean.(tasks{task})(2,fly,1:size(session_data.(odors{o}),3)) = nanmean(squeeze(session_data.(odors{o})(fly,task,:,5001:5000 + during)),2);
            % task_mean.(tasks{task})(3,fly,1:size(session_data.(odors{o}),3)) = nanmean(squeeze(session_data.(odors{o})(fly,task,:,5000 + trial_length(fly,task): end)),2);
            % 
            % % make any 0 points, NaNs
            % task_mean.(tasks{task})(task_mean.(tasks{task}) == 0) = NaN;
            % 
            % %find the mean response for each fly
            % task_response.(tasks{task}).(odors{o}) = squeeze(nanmean(task_mean.(tasks{task}),3));

            comparisons.(tasks{task}).(odors{o})(fly,1) = nanmean(data_mean.(tasks{task}).(odors{o})(fly,1:5000),2);
            comparisons.(tasks{task}).(odors{o})(fly,2) = nanmean(data_mean.(tasks{task}).(odors{o})(fly,5001:5000 + during),2);
            comparisons.(tasks{task}).(odors{o})(fly,3) = nanmean(data_mean.(tasks{task}).(odors{o})(fly,500 + trial_length(fly,task):end),2);


            delta_measure.(tasks{task}).(odors{o})(fly) = comparisons.(tasks{task}).(odors{o})(fly,2) - comparisons.(tasks{task}).(odors{o})(fly,1);

        end
        
    end

end


%% boxplot comparing pre, ACV_ straight, OCT_pre, and OCT_straight odor delivery

%loop through each task
for task = 1:length(tasks)
    %find the odor ids
    odors = fieldnames(comparisons.(tasks{task}));

    %loop through each odor
    for o = 1: length(odors)
        %grab the mean activity prior to, and during odor_delivery
        %this can be adjusted to whatever you want to run stats on
        tasks2compare = [squeeze(comparisons.(tasks{task}).(odors{o})(:,1)) squeeze(comparisons.(tasks{task}).(odors{o})(:,2))];

        figure; hold on
        %compare the pre vs during data
        [p,t,stats] = anova1(tasks2compare)
        [c,m,h,gnames] = multcompare(stats);

        % create and label boxplots for data
        figure; hold on

        labels = ["before", "during"];
        boxplot(tasks2compare, labels)
        plot(tasks2compare', 'Marker', 'o', 'Color', 'k');

        if measure == "movspd"
            ylabel("average speed (mm/s)")
        else 
            ylabel("average rotation (degrees/s)")
        end
        box off
        yt = get(gca, 'YTick');
        % axis([xlim    0  ceil(max(yt)*1.2)])
        xt = get(gca, 'XTick');
        title([char(tasks{task}) ' ' char(odors{o})]);

        hold on

        %if there are any measures that are significantly different, plot *
        % with line indicating the comparison
        if any(c(:,end) < 0.05)
            sig_pairs = c(c(:,end) < 0.05,:);
            for pair = 1: size(sig_pairs,1);
                plot(xt([sig_pairs(pair, 1) sig_pairs(pair,2)]), [1 1]*max(yt)*1.05, '-k',  mean(xt([sig_pairs(pair,1) sig_pairs(pair,2)])), max(yt)*1.10, '*k')
        % plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3])), max(yt)*1.15, '*k')
            end
        end
        

        x0=10;
        y0=10;
        width= 300;
        height= 300
        set(gcf,'position',[x0,y0,width,height])


        ylim([0 20])

        hold off    
    end

end

for o = 1: length(odors)
    if odors{o} == "CS_plus" | odors{o} == "CS_minus"
        tasks2compare = [delta_measure.pre_pairing.(odors{o}); delta_measure.post_pairing.(odors{o})];

        figure; hold on
        %compare the pre vs during data
        [p,t,stats] = anova1(tasks2compare')
        [c,m,h,gnames] = multcompare(stats);

        % create and label boxplots for data
        figure; hold on
        labels = ["pre pairing", "post pairing"];
        boxplot(tasks2compare', labels)
        plot(tasks2compare, 'Marker', 'o', 'Color', 'k');

        if measure == "movspd"
            ylabel("change in speed (mm/s)")
        else 
            ylabel("change in rotation (degrees/s)")
        end
        box off
        yt = get(gca, 'YTick');
        % axis([xlim    0  ceil(max(yt)*1.2)])
        xt = get(gca, 'XTick');
        title(odors{o});

        hold on

        %if there are any measures that are significantly different, plot *
        % with line indicating the comparison
        if any(c(:,end) < 0.05)
            sig_pairs = c(c(:,end) < 0.05,:);
            for pair = 1: size(sig_pairs,1);
                plot(xt([sig_pairs(pair, 1) sig_pairs(pair,2)]), [1 1]*max(yt)*1.05, '-k',  mean(xt([sig_pairs(pair,1) sig_pairs(pair,2)])), max(yt)*1.10, '*k')
        % plot(xt([1 3]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 3])), max(yt)*1.15, '*k')
            end
        end

        x0=10;
        y0=10;
        width= 300;
        height= 300
        set(gcf,'position',[x0,y0,width,height])

        ylim([-10 10])

        hold off    
    end
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
%% 

%find population mean and sem for straight and side trials
label = {};
number = 1;

%loop through tasks
for task = 1: length(tasks)
    odors = fieldnames(data_mean.(tasks{task}));

    figure; hold on

    %loop through odors
    for o = 1: length(odors)

        %find the mean and sem trace across fly
        pop_mean = nanmean(squeeze(data_mean.(tasks{task}).(odors{o})(:,:)),1);
        pop_sem = nanstd(squeeze(data_mean.(tasks{task}).(odors{o})(:,:)))./sqrt(size(squeeze(data_mean.(tasks{task}).(odors{o})(:,:)),1));
        
        
        %plot population data
        color_seq = ["b" "r" "g" "c" "m" "y" "k"];
        
        x = x_axis(1:length(pop_mean))/fr; % set x units
        range = (x >= -6 & x <0); % find range to use for baseline subtraction
        h = plot(x,pop_mean(:) - nanmean(pop_mean(range)), 'Color', color_seq(number), 'LineWidth',2, 'DisplayName',[char(tasks{task}) ' ' char(odors{o})]);
        j = patch([x fliplr(x)], [(pop_mean(:)'+pop_sem(:)'- nanmean(pop_mean(range))) fliplr(pop_mean(:)'-pop_sem(:)'- nanmean(pop_mean(range)))],color_seq(task))
        alpha(0.3)
        
        y = ylim;
        %plot lines indicating odor delivery and odor_shutoff
        line([0, 0], [y(1) y(2)],'Color', 'k');
        line([6, 6], [y(1) y(2)],'Color', 'k');

    
        xlim([-5 11])
        ylim([-2 6])

        %set labels
        if measure == "movspd"  
            ylabel("Mean change in speed (mm/s) from baseline")
        else 
            ylabel("Mean change in turning (degrees/s) from baseline")
        end
        xlabel("time (s)")

        number = number + 1;
    end
end

legend(["ACV", "", "", "", "CS+ pre", "","", "", "CS- pre", "","","", "CS+ post","","","" "CS- post"])
end


