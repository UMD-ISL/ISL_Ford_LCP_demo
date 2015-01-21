function fgDone = isDone(handles)
    curFrameInd = getVidFrameInd(handles.Video_Player);
    if curFrameInd == handles.videoInfo.numFrame
        fgDone = 1;
        return
    else
        fgDone = 0;
        return
    end
end
