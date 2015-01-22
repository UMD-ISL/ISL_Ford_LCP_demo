function display_number(hObject, eventdata, hfigure)
% Timer timer1 callback, called each time timer iterates.
% Gets surface Z data, adds noise, and writes it back to surface object.
display(strcat('hello world ', num2str(clock)))
handles = guidata(hfigure);
playOneFrame(handles);
% END USER CODE