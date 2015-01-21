function fgToContinue = isToContinue(hPlayerButton)
    if 2 == checkPlayerStatus(hPlayerButton);
        fgToContinue = 1;
        return
    else
        fgToContinue = 0;
    end
end
