function output = genTimeFormat(numFrame, frameRate)

% numStartTime = datenum(startTime);
numHourFrame = 3600 * frameRate;
numMinFrame = 60 * frameRate;
numSecondFrame = frameRate;
numFFFframe = mod(numFrame, frameRate);
numFFF = round2Ndecimals(mod(numFrame, numSecondFrame) * 1/frameRate, 3);
numSecond = mod((numFrame - numFFFframe) / frameRate, 60);
numMin = mod((numFrame - numFFFframe - numSecond * numSecondFrame) ...
    / (60 * frameRate), 60);
numHour = mod((numFrame - numFFFframe - numSecond * numSecondFrame -  ...
    numMin * numMinFrame) / (3600 * frameRate), 24);

if 1 == length(num2str(numHour))
    strHH = strcat('0', num2str(numHour));
end

if 1 == length(num2str(numMin))
    strMM = strcat('0', num2str(numMin));
else
    strMM = num2str(numMin);
end

if 1 == length(num2str(numSecond))
    strSS = strcat('0', num2str(numSecond));
else
    strSS = num2str(numSecond);
end

strFFF = num2str(numFFF, '%.3f');


output = strcat(strHH, ':', strMM, ':', strSS, '.', strFFF(3:end));
