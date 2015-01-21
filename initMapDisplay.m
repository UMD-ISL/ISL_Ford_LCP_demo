function initMapDisplay(varargin)

    if 1 == nargin
        hObject = varargin{1};
        set(hObject, 'YLim', [-200 200]);
        set(hObject, 'XLim', [-85 85]);
        plot_google_map('axis', hObject, 'height', 370, 'width', 370);
    elseif 3 == nargin
        hObject = varargin{1};
        lon = varargin{2};
        lag = varargin{3};
        set(hObject, 'YLim', [42.31, 42.32]);
        set(hObject, 'XLim', [-83.24, -83.23]);
        plot_google_map('axis', hObject, 'height', 370, 'width', 370);
    else
        return;
    end
    
end