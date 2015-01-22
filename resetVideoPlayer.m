function resetVideoPlayer(handles)
% statusText could be toTerminate / Finished
%     stopTimer(handles);
    setPlayerStatus(handles, 'Terminated');
    setappdata(handles.videoSlider, 'isReset', true);
    % reset slider first, then change video frame
    slider2Video(handles, 0);
    set(handles.numFrameInd, 'String', '1');
    set(handles.numCurTimeStamp, 'String', 'HH:MM:SS.FFF');
end