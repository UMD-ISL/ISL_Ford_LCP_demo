function loadAllCorrData(handles, folderPath)
    OBDdataFile = [folderPath, 'OBDoutput.mat'];
    if exist(OBDdataFile, 'file')
        Signals.OBD = load(OBDdataFile);
        setOBDdata2Axes(handles.Speed_Display, Signals.OBD);
    else
        errordlg('OBD Data File not found','File Error');
    end
    
    mallocSpaceForSignals(handles, Signals);
end