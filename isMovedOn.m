function fgMovedOn = isMovedOn(pos, hObject)
   if pos(1) > hObject(1) && ...
      pos(1) < (hObject(1) + hObject(3)) && ...
      pos(2) > hObject(2) && ...
      pos(2) < (hObject(2) + hObject(4))

        fgMovedOn = 1;
        return
   else
        fgMovedOn = 0;
        return
   end
end