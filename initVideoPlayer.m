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
    
    initSlideBar(handles, vidPlayerAxesPos, videoInfo);
    
    imshow(vidFrame, 'Parent',  hVideoPlayer);
    playerStatus = 'Start';
    set(handles.bgVidControl, 'Visible', 'on');
    setPlayerStatus(handles, 'toStart');
    
    setfgLoadVideo(handles.Video_Player, 1);
end