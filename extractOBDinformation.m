function [OBDinfo, OBDdata] = extractOBDinformation(OBD_filepath)
    fid = fopen(OBD_filepath);
    OBDinfo.startDate = getOBDstartDate(fid);
    OBDinfo.startTime = getOBDstartTime(fid);
    OBDinfo.initLocation = getOBDinitLocation(fid);
    headerString = fgetl(fid);
    OBDinfo.OBDparamsHeader = getOBDparamsHeader(headerString);
    targetParams = {'time [s]'; 'speed [mph]'; 'GPS long [degs]'; ...
        'GPS lat [degs]'};
    tic;
    OBDdata = getOBDdata(targetParams, OBDinfo.OBDparamsHeader, fid);
    toc;
    fclose(fid);
end