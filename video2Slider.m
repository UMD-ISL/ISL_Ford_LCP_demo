function video2Slider(handles, curFrameInd)
    if ~getappdata(handles.videoSlider, 'stopUpdateFrame')
        set(handles.videoSlider, 'value', curFrameInd);
    end
end