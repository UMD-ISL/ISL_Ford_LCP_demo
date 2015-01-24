function updateTextEditor(handles, curFrameInd)
    set(handles.numFrameInd, 'String', int2str(curFrameInd));
    set(handles.numCurTimeStamp, 'String', genTimeFormat(curFrameInd, handles.videoInfo.frameRate));
end