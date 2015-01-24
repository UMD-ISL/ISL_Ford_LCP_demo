function [videoSrc, videoInfo, ...
    playerStatus] = initVideoPlayer(handles, videoPath)

    videoSrc = VideoReader(videoPath);
    handles.videoPath = videoPath;
    [videoInfo.numFrame, videoInfo.frameRate] = getVideoInfo(videoSrc);
    
    hVideoPlayer = handles.Video_Player;
    
    curFrameInd = 1;
    setVidFrameInd(hVideoPlayer, curFrameInd);
    vidFrame = read(videoSrc, curFrameInd);
    vidtoWinRatio = 0.45;
    
    vidPlayerAxesPos = resizeVidPlayer(handles, vidFrame, vidtoWinRatio);
    imshow(vidFrame, 'Parent',  hVideoPlayer);
    % init player control panel
    playerStatus = 'Start';
    set(handles.bgVidControl, 'Visible', 'on');
    setPlayerStatus(handles, 'toStart');
    
    initSlideBar(handles, vidPlayerAxesPos, videoInfo);
    freeSliderLock(handles.videoSlider);
    
    setfgLoadVideo(handles.Video_Player, 1);
end