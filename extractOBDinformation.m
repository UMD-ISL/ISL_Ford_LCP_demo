function [OBDinfo, OBDdata] = extractOBDinformation(videoPath, OBD_filepath)
    videoSrc = VideoReader(videoPath);    
    [videoInfo.numFrame, videoInfo.frameRate] = getVideoInfo(videoSrc);
    
    fid = fopen(OBD_filepath);
    OBDinfo.dataRate = 100;
    OBDinfo.startDate = getOBDstartDate(fid);
    OBDinfo.startTime = getOBDstartTime(fid);
    OBDinfo.initLocation = getOBDinitLocation(fid);
    headerString = fgetl(fid);
    OBDinfo.OBDparamsHeader = getOBDparamsHeader(headerString);
    targetParams = {'time [s]'; 'speed [mph]'; 'GPS long [degs]'; ...
        'GPS lat [degs]'};
    tic;
    OBDdata = getOBDdata(targetParams, OBDinfo, videoInfo, fid);
    toc;
    fclose(fid);
end