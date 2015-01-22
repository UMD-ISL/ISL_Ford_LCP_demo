function curFrameInd = playOneFrame(handles)
    hVideoPlayer    = handles.Video_Player;
    hVideoSrc       = handles.videoSrc;
    curFrameInd = getVidFrameInd(hVideoPlayer);
    frame = read(hVideoSrc, curFrameInd);
    
    showFrameOnAxis(hVideoPlayer, frame);
    
    if ~mod(curFrameInd, 30)
        video2Slider(handles, curFrameInd);
    end
    
    try
        nextFrameInd = curFrameInd + 1;
        setVidFrameInd(hVideoPlayer, nextFrameInd);
    catch
    end
end