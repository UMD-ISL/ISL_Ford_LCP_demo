function playerStatus = checkPlayerStatus(hPlayerButton, textStatus)
    if strcmp(textStatus, 'toStart') || ...
            strcmp(textStatus, 'Finished') || ...
            strcmp(textStatus, 'Terminated')
        playerStatus = (1 == getappdata(hPlayerButton, 'status'));
    elseif strcmp(textStatus, 'toContinue') || strcmp(textStatus, 'Paused')
         playerStatus = (2 == getappdata(hPlayerButton, 'status'));
    elseif strcmp(textStatus, 'toPause') || strcmp(textStatus, 'Playing')
        playerStatus = (3 == getappdata(hPlayerButton, 'status'));
    end
end