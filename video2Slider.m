function video2Slider(handles, curFrameInd)
    if isToTerminate(handles.play)
        curFrameInd = 1;
    end
    frame = read(handles.videoSrc, curFrameInd);
    nextFrameInd = curFrameInd + 1;
   
    showFrameOnAxis(handles.Video_Player, frame);
    setVidFrameInd(handles.Video_Player, nextFrameInd);
    if ~getappdata(handles.videoSlider, 'stopUpdateFrame') && ~mod(curFrameInd, 30)
        set(handles.videoSlider, 'value', nextFrameInd);
    end
end