function curFrameInd = getVidFrameInd(hVideoPlayer)
    curFrameInd = getappdata(hVideoPlayer, 'frame_index');
end