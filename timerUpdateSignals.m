function timerUpdateSignals(hObject, eventdata, hfigure)
    handles = guidata(hfigure);
    if isPlaying(handles.play) && ~isDone(handles)
        try
            curFrameInd = getVidFrameInd(handles.Video_Player);
            updateAllAxes(handles, curFrameInd);
            if ~mod(curFrameInd, 90)
                java.lang.System.gc();
            end
        catch ME
            stopTimer(handles.sigtimer);
            if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
                rethrow(ME);
            end
        end
    end
end