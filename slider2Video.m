function slider2Video(handles)
    if isToPause(handles.play)
        setPlayerStatus(handles, 'toContinue');
    elseif isToStart(handles.play)
    end
    setappdata(handles.videoSlider, 'stopUpdateFrame', 1);
    newFrameInd = get(handles.videoSlider, 'value');
    setVidFrameInd(handles.Video_Player, newFrameInd);
    setappdata(handles.videoSlider, 'slidervalue', newFrameInd);
    set(handles.videoSlider, 'value', newFrameInd); % add just sliderbar
    
    curFrameInd = getVidFrameInd(handles.Video_Player);
    frame = read(handles.videoSrc, curFrameInd);
    showFrameOnAxis(handles.Video_Player, frame);
    setPlayerStatus(handles, 'toPause');
    setappdata(handles.videoSlider, 'stopUpdateFrame', 0);
    callVideoPlayer(handles, 0);
end