function [numFrame, frameRate] = getVideoInfo(videoSrc)
    numFrame = videoSrc.NumberOfFrames;
    frameRate = videoSrc.FrameRate;
end