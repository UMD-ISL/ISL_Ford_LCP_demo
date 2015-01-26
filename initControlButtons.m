function [btImg, btselImg, btPos] = initControlButtons(hObject, handles)

    tagText = get(hObject, 'Tag');
    
    if strcmp(tagText, 'reverse')
        % reverse button control
        btImg = imread('./icons/reverse.jpg', 'jpg');
        btselImg = imread('./icons/reverse_select.jpg', 'jpg');
        set(hObject, 'cdata', btImg);
        set(hObject, 'Enable', 'off');
        btPos = get(hObject, 'Position');
        
    elseif strcmp(tagText, 'play')
        % play button control
        btImg = imread('./icons/play.jpg', 'jpg');
        btselImg = imread('./icons/play_select.jpg', 'jpg');
        set(hObject, 'cdata', btImg);
        set(hObject, 'Enable', 'off');
        btPos = get(hObject, 'Position');
        
    elseif strcmp(tagText, 'stop')
        % stop button control
        btImg = imread('./icons/stop.jpg', 'jpg');
        btselImg = imread('./icons/stop_select.jpg', 'jpg');
        set(hObject, 'cdata', btImg);
        set(hObject, 'Enable', 'off');
        btPos = get(hObject, 'Position');
    else
        % forward button control
        btImg = imread('./icons/forward.jpg', 'jpg');
        btselImg = imread('./icons/forward_select.jpg', 'jpg');
        set(hObject, 'cdata', btImg);
        set(hObject, 'Enable', 'off');
        btPos = get(hObject, 'Position');
    end
end