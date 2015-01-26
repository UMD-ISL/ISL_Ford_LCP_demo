function varargout = demo(varargin)
% DEMO MATLAB code for demo.fig
%      DEMO, by itself, creates a new DEMO or raises the existing
%      singleton*.
%
%      H = DEMO returns the handle to a new DEMO or the handle to
%      the existing singleton*.
%
%      DEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO.M with the given input arguments.
%
%      DEMO('Property','Value',...) creates a new DEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo

% Last Modified by GUIDE v2.5 26-Jan-2015 00:25:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo_OpeningFcn, ...
                   'gui_OutputFcn',  @demo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before demo is made visible.
function demo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo (see VARARGIN)
% Choose default command line output for demo

% read GUI control images and display in axes objects

handles.output = hObject;

% handles.timer = timer(...
%     'ExecutionMode', 'fixedRate', ...       % Run timer repeatedly
%     'Period', 1, ...                        % Initial period is 1 sec.
%     'TimerFcn', {@display_number, hObject}); % Specify callback

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo wait for user response (see UIRESUME)
% uiwait(handles.MainWindow);


% --- Outputs from this function are returned to the command line.
function varargout = demo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function videoSlider_Callback(hObject, eventdata, handles)
% hObject    handle to videoSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% stopTimer(handles);
slider2Video(handles, 1);


% --- Executes during object creation, after setting all properties.
function videoSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to videoSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callVideoPlayer(handles, 1);

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MainWindow_CloseRequestFcn(handles.MainWindow, eventdata, handles);


% --- Executes on button press in toggle_Local.
function toggle_Local_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_Local (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of toggle_Local
if ~isLoadVideo(handles.Video_Player)
    lat = [42.319544];
    lon = [-83.233134];
    initMapDisplay(handles.Map_Display, lat, lon);
end

% --- Executes on button press in toggle_Global.
function toggle_Global_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_Global (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of toggle_Global
if ~isLoadVideo(handles.Video_Player)
    initMapDisplay(handles.Map_Display);
end

% --- Executes on mouse press over axes background.
function Video_Player_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Video_Player (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Vedio_Open_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Vedio_Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get vedio file path
[videoPath.fileName,videoPath.folderPath] = uigetfile('*.avi','choose a video');
if isequal(videoPath.fileName, 0) || isequal(videoPath.folderPath, 0)
   disp('User pressed cancel')
   return;
else
         
   [handles.videoSrc, handles.videoInfo, ...
       handles.playerStatus] = initVideoPlayer(handles, videoPath);
   
   % initlize timer
%    if strcmp(get(handles.timer, 'Running'), 'on')
%         stop(handles.timer);
%         set(handles.timer,'Period', round2Ndecimals(1/handles.videoInfo.frameRate, 3));
%         start(handles.timer);
%     else               % If timer is stopped, reset its period only.
%         set(handles.timer,'Period', round2Ndecimals(1/handles.videoInfo.frameRate, 3));
%    end

   guidata(hObject, handles);
end

% --- Executes when user attempts to close MainWindow.
function MainWindow_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to MainWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
% stop(handles.timer);
% delete(handles.timer);
delete(hObject);

% --- Executes during object creation, after setting all properties.
function MainWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on mouse motion over figure - except title and menu.
function MainWindow_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to MainWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get current mouse position in figure
% pos = get(handles.MainWindow, 'CurrentPoint');
% changeButtonIcon(pos, handles);

% --- Executes during object creation, after setting all properties.
function Video_Player_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Video_Player (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
setfgLoadVideo(hObject, 0);

% Hint: place code in OpeningFcn to populate Video_Player

% --- Executes during object creation, after setting all properties.
function forward_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[   handles.paramsButton.img_forward, ...
    handles.paramsButton.img_forward_sel, ...
    handles.paramsButton.forward_pos] = initControlButtons(hObject, handles);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function play_CreateFcn(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[   handles.paramsButton.img_play, ...
    handles.paramsButton.img_play_sel, ...
    handles.paramsButton.play_pos] = initControlButtons(hObject, handles);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function stop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[   handles.paramsButton.img_stop, ...
    handles.paramsButton.img_stop_sel, ...
    handles.paramsButton.stop_pos] = initControlButtons(hObject, handles);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function reverse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to reverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[   handles.paramsButton.img_reverse, ...
    handles.paramsButton.img_reverse_sel, ...
    handles.paramsButton.reverse_pos] = initControlButtons(hObject, handles);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resetVideoPlayer(handles);


% --- Executes on button press in forward.
function forward_Callback(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reverse.
function reverse_Callback(hObject, eventdata, handles)
% hObject    handle to reverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Map_Display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Map_Display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Map_Display
initMapDisplay(hObject);


function numFrameInd_Callback(hObject, eventdata, handles)
% hObject    handle to numFrameInd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numFrameInd as text
%        str2double(get(hObject,'String')) returns contents of numFrameInd as a double


% --- Executes during object creation, after setting all properties.
function numFrameInd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numFrameInd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numCurTimeStamp_Callback(hObject, eventdata, handles)
% hObject    handle to numCurTimeStamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numCurTimeStamp as text
%        str2double(get(hObject,'String')) returns contents of numCurTimeStamp as a double


% --- Executes during object creation, after setting all properties.
function numCurTimeStamp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numCurTimeStamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sigSpeed.
function sigSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to sigSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigSpeed


% --- Executes on button press in sigqDEEL.
function sigqDEEL_Callback(hObject, eventdata, handles)
% hObject    handle to sigqDEEL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigqDEEL


% --- Executes on button press in sigTi.
function sigTi_Callback(hObject, eventdata, handles)
% hObject    handle to sigTi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigTi


% --- Executes on button press in sigTe.
function sigTe_Callback(hObject, eventdata, handles)
% hObject    handle to sigTe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigTe


% --- Executes on button press in sigInspVol.
function sigInspVol_Callback(hObject, eventdata, handles)
% hObject    handle to sigInspVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigInspVol


% --- Executes on button press in sigExpVol.
function sigExpVol_Callback(hObject, eventdata, handles)
% hObject    handle to sigExpVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigExpVol


% --- Executes on button press in sigHR.
function sigHR_Callback(hObject, eventdata, handles)
% hObject    handle to sigHR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigHR


% --- Executes on button press in sigGSRraw.
function sigGSRraw_Callback(hObject, eventdata, handles)
% hObject    handle to sigGSRraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigGSRraw


% --- Executes on button press in sigPressure.
function sigPressure_Callback(hObject, eventdata, handles)
% hObject    handle to sigPressure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigPressure


% --- Executes on button press in sigECGraw.
function sigECGraw_Callback(hObject, eventdata, handles)
% hObject    handle to sigECGraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigECGraw

% --- Executes on button press in sigBelt.
function sigBelt_Callback(hObject, eventdata, handles)
% hObject    handle to sigBelt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sigBelt


% --- Executes on button press in fgShowSpeedinAll.
function fgShowSpeedinAll_Callback(hObject, eventdata, handles)
% hObject    handle to fgShowSpeedinAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fgShowSpeedinAll



function edTripDate_Callback(hObject, eventdata, handles)
% hObject    handle to edTripDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edTripDate as text
%        str2double(get(hObject,'String')) returns contents of edTripDate as a double


% --- Executes during object creation, after setting all properties.
function edTripDate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edTripDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edStartTime_Callback(hObject, eventdata, handles)
% hObject    handle to edStartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edStartTime as text
%        str2double(get(hObject,'String')) returns contents of edStartTime as a double


% --- Executes during object creation, after setting all properties.
function edStartTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edStartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbLabelMe.
function rbLabelMe_Callback(hObject, eventdata, handles)
% hObject    handle to rbLabelMe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbLabelMe
if get(handles.rbLabelMe, 'value')
    set(handles.rbLabelMe, 'value', 1)
    floatManualLabelProgram(handles);
else
    set(handles.rbLabelMe, 'value', 0);
    
end


% --- Executes on selection change in popSingalResolution.
function popSingalResolution_Callback(hObject, eventdata, handles)
% hObject    handle to popSingalResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popSingalResolution contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popSingalResolution


% --- Executes during object creation, after setting all properties.
function popSingalResolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popSingalResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
