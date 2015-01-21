function vidPlayerAxesPos = resizeVidPlayer(handles, vidFrame, vidtoWinRatio)
    [frameHeight, frameWidth, ~] = size(vidFrame);
    vidPlayerAxesPos = get(handles.Video_Player, 'Position');
    paramWindow = get(handles.MainWindow, 'Position');
    windowInfo.windowWidth  = paramWindow(3);
    windowInfo.windowHeight = paramWindow(4);
    
    normVidPlayerWidth = vidtoWinRatio;
    pixVidPlayerWidth = normVidPlayerWidth * windowInfo.windowWidth;
    pixVidPlayerHeight = pixVidPlayerWidth * frameHeight / frameWidth;
    normVidPlayerHeight = pixVidPlayerHeight / windowInfo.windowHeight;
    
    vidPlayerAxesPos(1, 3:4) = [normVidPlayerWidth, normVidPlayerHeight];
    set(handles.Video_Player, 'Position', vidPlayerAxesPos);
end