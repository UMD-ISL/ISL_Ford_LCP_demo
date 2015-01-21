function changeButtonIcon(pos, handles)
    % check if mouse is over the reverse button and hightlight if true
    if isMovedOn(pos, handles.paramsButton.reverse_pos)
        set(handles.reverse, 'CData', ...
            handles.paramsButton.img_reverse_sel);
    else
        set(handles.reverse, 'CData', ...
            handles.paramsButton.img_reverse);
    end

    % check if mouse is over the forward button and hightlight if true
    if isMovedOn(pos, handles.paramsButton.forward_pos)
        set(handles.forward, 'CData', ...
            handles.paramsButton.img_forward_sel);
    else
        set(handles.forward, 'CData', ...
            handles.paramsButton.img_forward);
    end

    % check if mouse is over the play button and hightlight if true
    if isMovedOn(pos, handles.paramsButton.play_pos)
        set(handles.play, 'CData', ...
            handles.paramsButton.img_play_sel);
    else
        set(handles.play, 'CData', ...
            handles.paramsButton.img_play);
    end

    % check if mouse is over the stop button and hightlight if true
    if isMovedOn(pos, handles.paramsButton.stop_pos)
        set(handles.stop, 'CData', ...
            handles.paramsButton.img_stop_sel);
    else
        set(handles.stop, 'CData', ...
            handles.paramsButton.img_stop);
    end
end