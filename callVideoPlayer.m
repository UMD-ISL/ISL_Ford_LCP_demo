function callVideoPlayer(handles, isCallback)
    hPlayButton = handles.play;
    hVideoPlayer = handles.Video_Player;
    try
        if isCallback
            if isToContinue(hPlayButton) ||  isToStart(hPlayButton)
                setPlayerStatus(handles, 'toPause');
            else
                setPlayerStatus(handles, 'toContinue');
            end
        end

        while isPlaying(hPlayButton) && ~isDone(handles)
            try
                curFrameInd = getVidFrameInd(hVideoPlayer);
                video2Slider(handles, curFrameInd);
                pause(1/handles.videoInfo.frameRate);
            catch ME
                if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
                    rethrow(ME);
                end
            end
        end
        
    catch ME
       %Re-throw error message if it is not related to invalid handle
       if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
           rethrow(ME);
       end
    end
end