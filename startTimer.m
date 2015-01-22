function startTimer(handles)
    if strcmp(get(handles.timer, 'Running'), 'off')
        start(handles.timer);
    end
end
