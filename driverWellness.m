function varargout = driverWellness(varargin)
% DRIVERWELLNESS MATLAB code for driverWellness.fig
%      DRIVERWELLNESS, by itself, creates a new DRIVERWELLNESS or raises the existing
%      singleton*.
%
%      H = DRIVERWELLNESS returns the handle to a new DRIVERWELLNESS or the handle to
%      the existing singleton*.
%
%      DRIVERWELLNESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRIVERWELLNESS.M with the given input arguments.
%
%      DRIVERWELLNESS('Property','Value',...) creates a new DRIVERWELLNESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before driverWellness_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to driverWellness_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help driverWellness

% Last Modified by GUIDE v2.5 18-Jan-2015 00:24:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @driverWellness_OpeningFcn, ...
                   'gui_OutputFcn',  @driverWellness_OutputFcn, ...
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

function videoClip(videoName)
global readerObj
global frameCnt
global frameBegin
global videoFReader
writeObj = VideoWriter(videoName);
open(writeObj);
video = read(readerObj,[frameBegin frameCnt]);
writeVideo(writeObj,video);
% for n = frameBegin:frameCnt
%     step(videoFReader);
%     thisFrame = step(videoFReader);
%     for m = 1:4
%     thisFrame = read(readerObj,n);
%     end
%     writeVideo(writeObj,thisFrame);
%     n = n + 1;
%     if n > frameCnt
%         break;
%     end
% end

    

% --- Executes just before driverWellness is made visible.
function driverWellness_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to driverWellness (see VARARGIN)

% Choose default command line output for driverWellness
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global yawn;        %l used for button state
yawn=0;
global eyeclose;
eyeclose=0;
global nod;
nod=0;
global headl;
headl=0;
global headr;
headr=0;
global headl_cl;
headl_cl=0;
global headr_cl;
headr_cl=0;
global truck;
truck=0;
% UIWAIT makes driverWellness wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = driverWellness_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;






% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seconds
global frames
frames = 30*seconds;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global seconds
seconds = get(handles.edit1,'string');
seconds = str2num(seconds);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in Withdrawal.
function Withdrawal_Callback(hObject, eventdata, handles)
% hObject    handle to Withdrawal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i 
global label
i = i-1;
if i<=2
    i=2;
end
j=size(label,1)-1;
if j<=1
    j=1;
end
label=label(1:j,:);
set(handles.uitable1,'Data',label);

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of 
global checkBox
checkBox = get(handles.checkbox1,'Value');


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop
if ~stop
    stop = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
else
    stop = 0;
    set(hObject,'BackgroundColor',[0.84,0.84,0.84]);
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global numFrame
global value
set(handles.slider1,'max',numFrame);
value = get(handles.slider1,'value');
value = floor(value);



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Forward.
function Forward_Callback(hObject, eventdata, handles)
% hObject    handle to Forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global speed
if speed == 1
    speed = 2;
    set(handles.Forward,'string','Forward 2x');
elseif speed == 2
    speed = 3;
    set(handles.Forward,'string','Forward 3x');
elseif speed == 3
    speed = 4;
    set(handles.Forward,'string','Forward 4x');
else
    speed = 1;
    set(handles.Forward,'string','Forward 1x');    
end

% --- Executes on button press in Yawning.
function Yawning_Callback(hObject, eventdata, handles)
% hObject    handle to Yawning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global yawn;
global lll
if yawn==0
label{i,1} = tShow;
label{i,3} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
yawn=1;
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
lll=i;
i=i+1;
else
  label{lll,2} = tShow;
label{lll,3} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(1) = clipCount(1)+1;
videoName = ['Yawning',num2str(clipCount(1)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label); 
yawn=0;
end


% --- Executes on button press in EyeClosing.
function EyeClosing_Callback(hObject, eventdata, handles)
% hObject    handle to EyeClosing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global eyeclose;
global kkk
if eyeclose==0
label{i,1} = tShow;
label{i,4} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
eyeclose=1;
kkk=i;
i=i+1;
else
label{kkk,2} = tShow;
label{kkk,4} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(2) = clipCount(2)+1;
videoName = ['EyeClosing',num2str(clipCount(2)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label);
eyeclose=0;
end





% --- Executes on button press in Nodding.
function Nodding_Callback(hObject, eventdata, handles)
% hObject    handle to Nodding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global nod;
global nnn
if nod==0
label{i,1} = tShow;
label{i,5} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
nod=1;
nnn=i;
i=i+1;
else
label{nnn,2} = tShow;
label{nnn,5} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(3) = clipCount(3)+1;
videoName = ['Nodding',num2str(clipCount(3)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label);
nod=0;
end



% --- Executes on button press in HeadL.
function HeadL_Callback(hObject, eventdata, handles)
% hObject    handle to HeadL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global headl;
global hhh
if headl==0
label{i,1} = tShow;
label{i,8} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
headl=1;
hhh=i;
i=i+1;
else
label{hhh,2} = tShow;
label{hhh,8} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(4) = clipCount(4)+1;
videoName = ['HeadL',num2str(clipCount(4)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label);
headl=0;
end


% --- Executes on button press in HeadR.
function HeadR_Callback(hObject, eventdata, handles)
% hObject    handle to HeadR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global headr;
global www
if headr==0
label{i,1} = tShow;
label{i,9} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
headr=1;
www=i;
i=i+1;
else
label{www,2} = tShow;
label{www,9} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(5) = clipCount(5)+1;
videoName = ['HeadR',num2str(clipCount(5)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label);
headr=0;
end
    



% --- Executes on button press in HeadL_CL.
function HeadL_CL_Callback(hObject, eventdata, handles)
% hObject    handle to HeadL_CL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global headl_cl;
global eee
if headl_cl==0
label{i,1} = tShow;
label{i,6} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
headl_cl=1;
eee=i;
i=i+1;
else
label{eee,2} = tShow;
label{eee,6} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(6) = clipCount(6)+1;
videoName = ['HeadL_CL',num2str(clipCount(6)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label);
headl_cl=0;
end



% --- Executes on button press in HeadR_CL.
function HeadR_CL_Callback(hObject, eventdata, handles)
% hObject    handle to HeadR_CL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global headr_cl;
global sss
if headr_cl==0
label{i,1} = tShow;
label{i,7} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
headr_cl=1;
sss=i;
i=i+1;
else
label{sss,2} = tShow;
label{sss,7} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(7) = clipCount(7)+1;
videoName = ['HeadR_CL',num2str(clipCount(7)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label);
headr_cl=0;
end




% --- Executes on button press in LaneChange_left.
function LaneChange_left_Callback(hObject, eventdata, handles)
% hObject    handle to LaneChange_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
label{i,1} = tShow;
% set(hObject,'BackgroundColor',[1,1,1]);
label{i,10} = 1;
i = i+1;
set(handles.uitable1,'Data',label);

% --- Executes on button press in LaneChange_right.
function LaneChange_right_Callback(hObject, eventdata, handles)
% hObject    handle to LaneChange_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
label{i,1} = tShow;
% set(hObject,'BackgroundColor',[1,1,1]);
label{i,11} = 1;
i = i+1;
set(handles.uitable1,'Data',label);

% --- Executes on button press in Trun_left.
function Trun_left_Callback(hObject, eventdata, handles)
% hObject    handle to Trun_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
label{i,1} = tShow;
% set(hObject,'BackgroundColor',[1,1,1]);
label{i,12} = 1;
i = i+1;
set(handles.uitable1,'Data',label);

% --- Executes on button press in Turn_right.
function Turn_right_Callback(hObject, eventdata, handles)
% hObject    handle to Turn_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
label{i,1} = tShow;
% set(hObject,'BackgroundColor',[1,1,1]);
label{i,13} = 1;
i = i+1;
set(handles.uitable1,'Data',label);

% --- Executes on button press in ComingCar_Left.
function ComingCar_Left_Callback(hObject, eventdata, handles)
% hObject    handle to ComingCar_Left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
label{i,1} = tShow;
% set(hObject,'BackgroundColor',[1,1,1]);
label{i,14} = 1;
i = i+1;
set(handles.uitable1,'Data',label);

% --- Executes on button press in ComingCar_Right.
function ComingCar_Right_Callback(hObject, eventdata, handles)
% hObject    handle to ComingCar_Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
label{i,1} = tShow;
% set(hObject,'BackgroundColor',[1,1,1]);
label{i,15} = 1;
i = i+1;
set(handles.uitable1,'Data',label);

% --- Executes on button press in LargeTruck.
function LargeTruck_Callback(hObject, eventdata, handles)
% hObject    handle to LargeTruck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
global truck;
global jjj
if truck==0
label{i,1} = tShow;
label{i,16} = 1;
set(hObject,'BackgroundColor',[1,1,1]);
global frameCnt
global frameBegin
frameBegin = frameCnt;
set(handles.uitable1,'Data',label);
truck=1;
jjj=i;
i=i+1;
else
label{jjj,2} = tShow;
label{jjj,16} = 1;
set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
global checkBox
if checkBox
global clipCount
clipCount(8) = clipCount(8)+1;
videoName = ['LargeTruck',num2str(clipCount(8)),'.avi'];
videoClip(videoName);
end
set(handles.uitable1,'Data',label);
truck=0;
end



% --- Executes on button press in ExitFreeway.
function ExitFreeway_Callback(hObject, eventdata, handles)
% hObject    handle to ExitFreeway (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
global tShow
global label
label{i,1} = tShow;
% set(hObject,'BackgroundColor',[1,1,1]);
label{i,17} = 1;
i = i+1;
set(handles.uitable1,'Data',label);






% --------------------------------------------------------------------
function new_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global clipCount
 clipCount = zeros(23,1);
global excelName
excelName = 'driverWellness.xls';
global label
label = [];
headline = {'TimeStart','TimeEnd','Yawning','EyeClosing','Nodding','HeadRotationL_CL','HeadRotationR_CL',...
            'HeadRotationL','HeadRotationR','LaneChange_left','LaneChange_right','Turn_left','Turn_right',...
            'ComingCar_Left','ComingCar_Right','LargeTruckPB','ExitFreeway'};
for n = 1:length(headline)
    label{1,n} = headline{n};
end
set(handles.uitable1,'Data',label(1,:));

% variables declaration
global i
i = 2;
global readerObj
global stop
stop = 0;
global speed
speed =1;
[fileName,pathName] = uigetfile('*.avi','choose a video');
if isequal(fileName,0) || isequal(pathName,0)
   disp('User pressed cancel')
   return;
else
   disp(['User selected ', fullfile(pathName, fileName)])
end
global videoFReader
global videoPlayer
videoFReader = vision.VideoFileReader([pathName,fileName]);
videoPlayer = vision.VideoPlayer;
readerObj = VideoReader([pathName,fileName]);
global numFrame
numFrame = get(readerObj,'NumberOfFrames');
frameRate = readerObj.FrameRate;
global frameCnt
frameCnt = 1;
global frames
global thisFrame
global value
value = -1;

while frameCnt <= numFrame
    if frames                                     %back forward
        frameCnt = frameCnt - frames;
        if frameCnt<=0
            frameCnt =1;
        end
        frames = 0;
    end                                           %slider 
    if value>=0                                                      
    frameCnt = value;
    if frameCnt <=0
        frameCnt = 1;
    end
    value = -1;
    end

%      step(videoFReader);
%     frame = step(videoFReader);   
%     imshow(frame);
    for count = 1:speed 
    thisFrame = read(readerObj,frameCnt);
    if ~stop
        frameCnt = frameCnt+1;
    end
    end
    imshow(thisFrame); 
    pause(0.001);
%     global seconds
%     if seconds
%         tDelta = tNow - tBegin - seconds;
%         seconds = 0;
%      else
         tDelta = round((frameCnt-1)/frameRate)/24/3600;
%     end
    global tShow
    tShow = datestr(tDelta,13);
    set(handles.edit2,'string',tShow);
%     if ~stop
%         frameCnt = frameCnt+1
%     end
end


% --------------------------------------------------------------------
function save_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global label
[fileName,filePath] = uiputfile('*.xls','Save as:');
xlswrite(fileName,label);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
