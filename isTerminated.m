function fgTerminated = isTerminated(handles)
    fgPlayerStop = checkPlayerStatus(handles.play, 'Terminated');
    fgSliderRest = getappdata(handles.videoSlider, 'isReset');
    fgTerminated = fgSliderRest & fgPlayerStop;
end