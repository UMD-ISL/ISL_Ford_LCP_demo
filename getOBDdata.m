function OBDdata = getOBDdata(targetParams, OBDinfo, videoInfo, fid)
    [~, targetIndex]  = ismember(targetParams, OBDinfo.OBDparamsHeader);
    extendedTimeLength = 5 * 60;
    numRows = (floor(videoInfo.numFrame / videoInfo.frameRate) ...
        + extendedTimeLength) * OBDinfo.dataRate;
    numTargetParams = size(targetParams, 1);
    numColumns = numTargetParams;
    OBDdata = zeros(numRows, numColumns);
    
    lineDataText = fgetl(fid);
    dataLineIndex = 1;
    while ~isequal(lineDataText, -1) && dataLineIndex <= numRows
        LineData = strsplit(lineDataText, ',');
        targetLineData = str2double(LineData(targetIndex));
        OBDdata(dataLineIndex, :) = targetLineData;
        lineDataText = fgetl(fid);
        dataLineIndex = dataLineIndex + 1
    end
end
