function timerUpdateVideo(hObject, eventdata, hfigure)
% Timer timer1 callback, called each time timer iterates.
% Gets surface Z data, adds noise, and writes it back to surface object.
    handles = guidata(hfigure);
    if isPlaying(handles.play) && ~isDone(handles)
        try
            curFrameInd = getVidFrameInd(handles.Video_Player);
            updateTextEditor(handles, curFrameInd);
            playOneFrame(handles);
            if ~mod(curFrameInd, 90)
                java.lang.System.gc();
            end
        catch ME
            stopTimer(handles.timer);
            if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
                rethrow(ME);
            end
        end
    end
end
