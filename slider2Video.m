function slider2Video(handles, isCallback)
%% description
% slider2Video function will only be called when user move the slider to
% change the video frame.

% this function can be called in two way
% 1. user click the terminated button (not a callback)
% 2. user move the slider bar
    if ~isCallback
        % for case 1
        assert(isTerminated(handles), 'wrong in slider2Video.m');
        fgNotPlay = true;
        set(handles.videoSlider, 'value', 1);
        setPlayerStatus(handles, 'toStart');
    elseif isPlaying(handles.play)
        % check if the player is playing, beacuse user can move the
        % sliderbar both when video is playing or not
        fgNotPlay = false;
        setPlayerStatus(handles, 'toContinue'); % change the video palyer status to pause
    end
    
    setappdata(handles.videoSlider, 'stopUpdateFrame', 1); % stop updating frame
    % get new freame index by reading sliderbar value
    newFrameInd = get(handles.videoSlider, 'value');
    % set videoframe index by new frame index
    setVidFrameInd(handles.Video_Player, newFrameInd);
    
    playOneFrame(handles);
    
    % set playerStatus change to continue model
    try
        if ~fgNotPlay
            setPlayerStatus(handles, 'toPause');
        end
    catch
        setPlayerStatus(handles, 'toPause');
    end
    
    % unlock the video player
    setappdata(handles.videoSlider, 'stopUpdateFrame', 0);
end