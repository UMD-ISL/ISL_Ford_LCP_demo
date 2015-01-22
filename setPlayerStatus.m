function setPlayerStatus(handles, todoText)
    if strcmp(todoText, 'toStart')
        todoCode = 1;
    elseif strcmp(todoText, 'toContinue') || strcmp(todoText, 'Paused')
        todoCode = 2;
        set(handles.play, 'CData', ...
            handles.paramsButton.img_play_sel);
    elseif strcmp(todoText, 'toPause') || strcmp(todoText, 'Playing')
        todoCode = 3;
        set(handles.play, 'CData', ...
            handles.paramsButton.img_stop_sel);
    elseif strcmp(todoText, 'Finished') || strcmp(todoText, 'Terminated')
        todoCode = 1;
        set(handles.play, 'CData', ...
            handles.paramsButton.img_play);
    end
    setappdata(handles.play, 'status', todoCode);
end