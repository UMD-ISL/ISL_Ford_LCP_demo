function updateSpeedDisplay(hSpeedDisplay, handles, curFrameInd)
    OBD = getappdata(handles.Speed_Display, 'data');
    colOBDtime = OBD.OBDdata(:, 1);
    colOBDspeed = OBD.OBDdata(:, 2);
    
    OBDdataResolution = 100;
    
    if isGlobal(handles.toggle_Global)
        set(hSpeedDisplay, 'Xlim', [min(colOBDtime), max(colOBDtime)]);
        set(hSpeedDisplay, 'Ylim', [min(colOBDspeed), max(colOBDspeed)]);
        
        endIndofData2Display =  1 + floor(curFrameInd / ...
            handles.videoInfo.frameRate) * OBDdataResolution;
              
        GlobalMask = getappdata(handles.Speed_Display, 'GlobalMask');
        
        Data2Display = OBD.OBDdata(GlobalMask(1:endIndofData2Display), :);
        
    else
        set(hSpeedDisplay, 'Xlim', [min(1), max(1)]);
        set(hSpeedDisplay, 'Ylim', [min(1), max(1)]);
    end
    
    timeData2Display  = Data2Display(:, 1);
    speedData2Display = Data2Display(:, 2);
    
    set(handles.speedPlot, 'XData', timeData2Display);
    set(handles.speedPlot, 'YData', speedData2Display);
    set(handles.edCurSpeed, 'string', num2str(speedData2Display(end, :)));
end