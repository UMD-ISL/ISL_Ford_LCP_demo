function stopTimer(hTimer)
    if strcmp(get(hTimer, 'Running'), 'on')
        stop(hTimer);
    end
end