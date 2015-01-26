function initTextEditor(handles)
    set(handles.numFrameInd, 'String', '1');
    set(handles.numCurTimeStamp, 'String', 'HH:MM:SS.FFF');
    
    try
        OBD = getOBDdataFromAxes(handles.Speed_Display);
        set(handles.edTripDate, 'String', OBD.OBDinfo.startDate);
        set(handles.edStartTime, 'String', OBD.OBDinfo.startTime);
    catch
        error('Can not load OBD data');
        set(handles.edTripDate, 'String', 'MM/DD/YYYY');
        set(handles.edStartTime, 'String', 'HH:MM:SS.FFF');
    end
end