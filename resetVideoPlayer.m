function resetVideoPlayer(handles, statusText)
% statusText could be toTerminate / Finished
    setPlayerStatus(handles, statusText);
    set(handles.videoSlider, 'value', 1);
    initFrameInd = 0;
    video2Slider(handles, initFrameInd);
end