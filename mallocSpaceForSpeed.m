function mallocSpaceForSpeed(handles, displayResolution, OBD)
    
    dataResoltuion = 100;
    
    indGlobalData = 1:size(OBD.OBDdata, 1);
    GlobalMask = (0 == mod(indGlobalData - 1, ...
        displayResolution * dataResoltuion));
    setappdata(handles.Speed_Display, 'GlobalMask', GlobalMask);
    
    % display recent 5 mintues data
    localPeriod = 5 * 60;
    indLocalData = 1:localPeriod * dataResoltuion;
    LocalMask = (0 == mod(indLocalData - 1, ...
        displayResolution * dataResoltuion));
    setappdata(handles.Speed_Display, 'LocalMask', LocalMask);

end