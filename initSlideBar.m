function initSlideBar(handles, vidPlayerAxesPos, videoInfo)
    timeStep = 300; % 60 second
    vidSliderPos = get(handles.videoSlider, 'Position');
    vidSliderPos = [vidPlayerAxesPos(1, 1), ...
                    vidPlayerAxesPos(1, 2) - vidSliderPos(1, 4), ...
                    vidPlayerAxesPos(1, 3), ...
                    vidSliderPos(1, 4)];

    set(handles.videoSlider, ...
        'value', 1, ...
        'max', videoInfo.numFrame, ...
        'min', 1, ...
        'UserData', struct('val', 0), ...
        'visible', 'on', ...
        'Position', vidSliderPos, ...
        'sliderstep', [1 videoInfo.frameRate * timeStep] / videoInfo.numFrame);
    setSliderLock(handles.videoSlider);
    
end