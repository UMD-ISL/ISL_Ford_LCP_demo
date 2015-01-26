function [videoSrc, videoInfo, ...
    playerStatus] = initVideoPlayer(handles, videoPath)

    hVideoPlayer = handles.Video_Player;
    
    videoPath.fullPath = fullfile(videoPath.folderPath, videoPath.fileName);
    videoSrc = VideoReader(videoPath.fullPath);
    setappdata(hVideoPlayer, 'videoSrc', videoSrc);
    
    
    [videoInfo.numFrame, videoInfo.frameRate] = getVideoInfo(videoSrc);
    setappdata(hVideoPlayer, 'videoInfo', videoInfo);
        
    curFrameInd = 1;
    setVidFrameInd(hVideoPlayer, curFrameInd);
    vidFrame = read(videoSrc, curFrameInd);
    vidtoWinRatio = 0.45;
    
    vidPlayerAxesPos = resizeVidPlayer(handles, vidFrame, vidtoWinRatio);
    imshow(vidFrame, 'Parent', hVideoPlayer);
%     showFrameOnAxis(hVideoPlayer, vidFrame);
    
    loadAllCorrData(handles, videoPath.folderPath);
        
    playerStatus = 'Start';
    setPlayerStatus(handles, 'toStart');
    
    initSlideBar(handles, vidPlayerAxesPos, videoInfo);
    
    freeSliderLock(handles.videoSlider);
    
    setfgLoadVideo(handles.Video_Player, 1);
    
    enableVideoControlButtons(handles);
    
    initTextEditor(handles);
    
    indDisplayResolution = get(handles.popDisplayResolution, 'value');
    textDisplayResolution = get(handles.popDisplayResolution, 'string');
    DisplayResolution = textDisplayResolution{indDisplayResolution};
    
    set(handles.vidtimer, 'Period', 1/videoInfo.frameRate);
    set(handles.sigtimer, 'Period', str2num(DisplayResolution));
    startTimer(handles.vidtimer);
    startTimer(handles.sigtimer);
end