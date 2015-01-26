function startTimer(hTimer)
    if strcmp(get(hTimer, 'Running'), 'off')
        start(hTimer);
    end
end
