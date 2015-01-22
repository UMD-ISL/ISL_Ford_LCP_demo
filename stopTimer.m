function stopTimer(handles)
    if strcmp(get(handles.timer, 'Running'), 'on')
        stop(handles.timer);
    end
end