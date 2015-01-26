function enableVideoControlButtons(handles)
    if getfgLoadVideo(handles.Video_Player)
        set(handles.reverse, 'Enable', 'on');
        set(handles.play, 'Enable', 'on');
        set(handles.stop, 'Enable', 'on');
        set(handles.forward, 'Enable', 'on');
    end
end