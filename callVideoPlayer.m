function callVideoPlayer(handles, isCallback)
%% Description
%  CALLVIDEOPLAYER   Call video player show one frame of video.
%   This function can only be called in two circumstances / cases:
%   1. called by playbutton callback funtion (play_Callback)
%   2. called by slider2Video function
%
%  Copyright 2014-2015 Intelligent System Lab, Unviersity of Michigan Dearborn.

%% function implementation start
    hPlayButton = handles.play; % get the handle of the playbutton
    
    try
        if isCallback % check which cirumstance this funcution is called
            % for case 1
            if isToContinue(hPlayButton)
                % change frome 'coninue/start' button to 'pause' button)
                setPlayerStatus(handles, 'Playing'); % should be playing
%                 startTimer(handles);
            elseif isToStart(hPlayButton)
                try
                        assert(1 == getVidFrameInd(handles.Video_Player) || ...
                        2 == getVidFrameInd(handles.Video_Player), 'error');
                catch
                    setVidFrameInd(handles.Video_Player, 1);
                    playOneFrame(handles);
%                     stopTimer(handles);
                end
                setPlayerStatus(handles, 'Playing'); % should be playing 
            else
                % for case 1 ( change to 'continue' buttion)
                setPlayerStatus(handles, 'Paused');
            end
        else
            if ~isToStart(hPlayButton)
                setPlayerStatus(handles, 'toPause');
%                 startTimer(handles);
            else
                try
                    assert(2 == getVidFrameInd(handles.Video_Player), 'error');
                catch
                    setVidFrameInd(handles.Video_Player, 1);
                    playOneFrame(handles);
                end
            end
        end

        while isPlaying(hPlayButton)
            if  ~isDone(handles)
                try
                    curFrameInd = getVidFrameInd(handles.Video_Player);
                    updateTextEditor(handles, curFrameInd);
                    updateAllAxes(handles, curFrameInd);
    %                 try
    %                     assert(strcmp('on', get(handles.timer, 'Running')));
    %                 catch
    %                     startTimer(handles);
    %                 end
                    playOneFrame(handles);
                    pause(1/90);
                catch ME
                    if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
                        rethrow(ME);
                    end
                end
            else
                resetVideoPlayer(handles);
            end
    %         stopTimer(handles);
        end
        
        catch ME
           %Re-throw error message if it is not related to invalid handle
           if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
               rethrow(ME);
           end
    end
%% function implementation end
end
