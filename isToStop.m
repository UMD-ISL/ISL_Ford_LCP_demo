function fgToStop = isToStop(hPlayerButton)
    if 0 == checkPlayerStatus(hPlayerButton);
        fgToStop = 1;
        return
    else
        fgToStop = 0;
    end
end