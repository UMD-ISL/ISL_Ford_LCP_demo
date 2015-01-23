function OBDdata = getOBDdata(targetParams, OBDparamsHeader, fid)
    [~, targetIndex]  = ismember(targetParams, OBDparamsHeader);
    OBDdata = [];
    
    lineDataText = fgetl(fid);
    while ~isequal(lineDataText, -1)
        LineData = strsplit(lineDataText, ',');
        targetLineData = str2double(LineData(targetIndex));
        OBDdata = [OBDdata; targetLineData]
        lineDataText = fgetl(fid);
    end
end
