function fgToPause = isToPause(hPlayerButton)
    if 3 == checkPlayerStatus(hPlayerButton);
        fgToPause = 1;
        return
    else
        fgToPause = 0;
    end
end