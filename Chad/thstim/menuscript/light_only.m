
%% Generating LED stim input
if parameter.ao_sr~=parameter.ai_sr
    warndlg('Analog input-output sampling rate must be the same!')
    return
end


if isfield(parameter,'SL_Delay_pre')
    Shutter_LED_Delay(1)=parameter.SL_Delay_pre;
else
    Shutter_LED_Delay(1)=15;
end
if isfield(parameter,'SL_Delay_post')
    Shutter_LED_Delay(2)=parameter.SL_Delay_post;
else
    Shutter_LED_Delay(2)=15;
end
% Shutter_LED_Delay is
% [delay from shutter onset to LED onset, Delay from LED offset to shutter
% offset] in ms
%
% Currently (8/11/2017), it seems to be safe if we allow 15ms before and
% after LED onset/offset for shutter command. 12ms/12ms seems to be also
% acceptable, but we occasionally see LED light in the frame. We also see
% vibration after opening of the shutter. It lasts roughly 180-200ms.

stim=zeros(1,parameter.dur*parameter.ao_sr);

if (parameter.stimN==0)||(parameter.stimD==0) %%We don't need stim in these cases.
    ...
else
  shutter_com=stim;
  putfive=[];
  putfive_shutter=[];
  for i=1:parameter.stimN;
      putfive(parameter.ao_sr*parameter.stimD/1000*(i-1)+1:parameter.ao_sr*parameter.stimD/1000*i)=...
            ((parameter.preS+parameter.isi*(i-1))*parameter.ao_sr):...
            ((parameter.preS+parameter.isi*(i-1))*parameter.ao_sr+parameter.ao_sr*parameter.stimD/1000-1);
      
     putfive_shutter(parameter.ao_sr*(parameter.stimD+sum(Shutter_LED_Delay))/1000*(i-1)+1:...
         parameter.ao_sr*(parameter.stimD+sum(Shutter_LED_Delay))/1000*i)=...
            ((parameter.preS+parameter.isi*(i-1)-Shutter_LED_Delay(1)/1000)*parameter.ao_sr):...
            ((parameter.preS+parameter.isi*(i-1))*parameter.ao_sr+parameter.ao_sr*(parameter.stimD+Shutter_LED_Delay(2))/1000-1);
  end
 stim(round(putfive))=min([5*parameter.stimI/1000,5]);
 %Assuming max current of LED controler is set to 1000mA, which is max
 %current of the current LED.
 shutter_com(round(putfive_shutter))=5;
 
 stim=stim';%%Used with odor paired with stim
 shutter_com=shutter_com';
end

%% Recording loop
for i=1:parameter.numt;
    %% Hardware setup
    SS=MakeDefaultAISession(NIdaq.dev,aichannels);
    ThisChName={SS.Channels.Name}';% Must be called before adding ao channels
    SS.addAnalogOutputChannel(NIdaq.dev,Sout,'voltage');
    % Sout is set in thstim.m.
    % Current setting is:
    %   ao0: LED command
    %   ao1: PMT shutter command
    SS.Rate=parameter.ai_sr;
    queueOutputData(SS,[stim,shutter_com]);
    
    fid=fopen('DataLog.bin','w+');%temporary file to log data
    SS.NotifyWhenDataAvailableExceeds=parameter.dur*parameter.ai_sr;
    SS.addlistener('DataAvailable',...
        @(~,event) fwrite(fid,[event.TimeStamps,event.Data],'single'));
    
    %% Change the status indicator
    set(statush, 'String','Running',...
        'back','r','Fontsize',0.225)
    set(roundh,'string',{' ',sprintf('Sweep : %d/%d',i,parameter.numt)})
    
    %% Wait until the right timing
    if i>2
        pause(parameter.iti-toc)
    end
    
    %% Start acquisition
    datatime=now;
    startBackground(SS);
    StartScanImage_SS
    
    tic
    wait(SS,parameter.dur+5)
    StopScanImage_SS
    %% Retrieve, save, visualize the data
     set(statush, 'String','Saving',...
        'back','b','Fontsize',0.3)
    pause(0.001)
    frewind(fid);
    data=single(fread(fid,[SS.ScansAcquired,inf],'single'));
    fclose(fid);
    
    savedata
    indexnum=indexnum+1;
    
    if i==parameter.numt
        break
    end
    
    %% Wait until next trial, allowing Stop or Pause
    set(statush, 'String',{'Waiting for' 'trigger'},...
        'back','y','Fontsize',0.175)
    set(roundh,'string',{'Next',sprintf('Sweep : %d/%d',i+1,parameter.numt)})
    
    while toc<parameter.iti-0.4
        pause(0.01)
        if stopkey
            break
        end
        
        if get(pauseh,'value')==1
            set(statush, 'String','Pause',...
                'back','m','Fontsize',0.3)
            while get(pauseh,'value')==1
                pause(0.01)
            end
            set(statush, 'String',{'Waiting for' 'trigger'},...
                'back','y','Fontsize',0.175)
        end
    end
    
    if stopkey
        break
    end
    
end

set(roundh,'string','')