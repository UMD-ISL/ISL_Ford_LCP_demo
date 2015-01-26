function updateSpeedDisplay(hSpeedDisplay, handles, curFrameInd)
    OBD = getappdata(handles.Speed_Display, 'data');
    colOBDtime = OBD.OBDdata(:, 1);
    colOBDspeed = OBD.OBDdata(:, 2);
    
    dataResolution = 100;
    
    if isGlobal(handles.toggle_Global)
        set(hSpeedDisplay, 'Xlim', [min(colOBDtime), max(colOBDtime)]);
        set(hSpeedDisplay, 'Ylim', [min(colOBDspeed), max(colOBDspeed)]);
        
        endIndofData2Display =  round(curFrameInd / handles.videoInfo.frameRate ...
                            * dataResolution);
        GlobalMask = getappdata(handles.Speed_Display, 'GlobalMask');             
        Data2Display = OBD.OBDdata(GlobalMask(1:endIndofData2Display), :);
        
    else
        set(hSpeedDisplay, 'Xlim', [min(1), max(1)]);
        set(hSpeedDisplay, 'Ylim', [min(1), max(1)]);
    end
    
    
    timeData2Display  = Data2Display(:, 1);
    speedData2Display = Data2Display(:, 2);
    scatter(hSpeedDisplay, timeData2Display, speedData2Display, 'fill', 'magenta');    
end