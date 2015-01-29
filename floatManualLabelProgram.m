function varargout = floatManualLabelProgram(varargin)
% FLOATMANUALLABELPROGRAM MATLAB code for floatManualLabelProgram.fig
%      FLOATMANUALLABELPROGRAM, by itself, creates a new FLOATMANUALLABELPROGRAM or raises the existing
%      singleton*.
%
%      H = FLOATMANUALLABELPROGRAM returns the handle to a new FLOATMANUALLABELPROGRAM or the handle to
%      the existing singleton*.
%
%      FLOATMANUALLABELPROGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FLOATMANUALLABELPROGRAM.M with the given input arguments.
%
%      FLOATMANUALLABELPROGRAM('Property','Value',...) creates a new FLOATMANUALLABELPROGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before floatManualLabelProgram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to floatManualLabelProgram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help floatManualLabelProgram

% Last Modified by GUIDE v2.5 27-Jan-2015 22:28:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @floatManualLabelProgram_OpeningFcn, ...
                   'gui_OutputFcn',  @floatManualLabelProgram_OutputFcn, ...
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


% --- Executes just before floatManualLabelProgram is made visible.
function floatManualLabelProgram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to floatManualLabelProgram (see VARARGIN)

% Choose default command line output for floatManualLabelProgram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global yawn;        % used for button state
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
global count;
count=2;
global label
label = [];
global syncTime;
headline = {'TimeStart','TimeEnd','Yawning','EyeClosing','Nodding','HeadRotationL_CL','HeadRotationR_CL',...
            'HeadRotationL','HeadRotationR','LaneChange_left','LaneChange_right','Turn_left','Turn_right',...
            'ComingCar_Left','ComingCar_Right','LargeTruckPB','ExitFreeway'};
for n = 1:length(headline)
    label{1,n} = headline{n};
end
global log
log=[];
headline2={'Time','Events'};
for m = 1:length(headline2)
    log{1,m} = headline2{m};
end




% --- Outputs from this function are returned to the command line.
function varargout = floatManualLabelProgram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbYawning.
function pbYawning_Callback(hObject, eventdata, handles)
% hObject    handle to pbYawning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global yawn
global label
global log
global syncTime
if yawn==0
    label{count,1} = syncTime;
    label{count,3} = 1;
    yawn=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Yawning start...';
    set(handles.uitable1,'Data',log);
else if yawn==1
    label{count,2} = syncTime;
    label{count,3} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Yawning end.';
    set(handles.uitable1,'Data',log);
    yawn=0;
    end
end
        





% --- Executes on button press in pbEyeClosing.
function pbEyeClosing_Callback(hObject, eventdata, handles)
% hObject    handle to pbEyeClosing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global eyeclose
global label
global log
global syncTime;
if eyeclose==0
    label{count,1} = syncTime;
    label{count,4} = 1;
    eyeclose=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Eyeclose start...';
    set(handles.uitable1,'Data',log);
else if eyeclose==1
    label{count,2} = syncTime;
    label{count,4} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Eyeclose end.';
    set(handles.uitable1,'Data',log);
    eyeclose=0;
    end
end

% --- Executes on button press in pbNodding.
function pbNodding_Callback(hObject, eventdata, handles)
% hObject    handle to pbNodding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global nod
global label
global syncTime;
global log
if nod==0
    label{count,1} = syncTime;
    label{count,5} = 1;
    nod=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Nodding start...';
    set(handles.uitable1,'Data',log);
else if nod==1
    label{count,2} = syncTime;
    label{count,5} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Nodding end.';
    set(handles.uitable1,'Data',log);
    nod=0;
    end
end

% --- Executes on button press in pbHeadL.
function pbHeadL_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global headl
global label
global log
global syncTime;
if headl==0
    label{count,1} = syncTime;
    label{count,8} = 1;
    headl=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Head turn left start...';
    set(handles.uitable1,'Data',log);
else if headl==1
    label{count,2} = syncTime;
    label{count,8} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Head turn left end.';
    set(handles.uitable1,'Data',log);
    headl=0;
    end
end

% --- Executes on button press in pbHeadR.
function pbHeadR_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global headr
global label
global log
global syncTime;
if headr==0
    label{count,1} = syncTime;
    label{count,9} = 1;
    headr=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Head turn right start...';
    set(handles.uitable1,'Data',log);
else if headr==1
    label{count,2} = syncTime;
    label{count,9} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Head turn right end.';
    set(handles.uitable1,'Data',log);
    headr=0;
    end
end

% --- Executes on button press in pbHeadLCL.
function pbHeadLCL_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadLCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global headl_cl
global label
global log
global syncTime;
if headl_cl==0
    label{count,1} = syncTime;
    label{count,6} = 1;
    headl_cl=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Head turn left when lane change start...';
    set(handles.uitable1,'Data',log);
else if headl_cl==1
    label{count,2} = syncTime;
    label{count,6} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Head turn left when lane change end.';
    set(handles.uitable1,'Data',log);
    headl_cl=0;
    end
end

% --- Executes on button press in pbHeadRCL.
function pbHeadRCL_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadRCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global headr_cl
global label
global log
global syncTime;
if headr_cl==0
    label{count,1} = syncTime;
    label{count,7} = 1;
    headr_cl=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Head turn right when lane change start...';
    set(handles.uitable1,'Data',log);
else if headr_cl==1
    label{count,2} = syncTime;
    label{count,7} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Head turn right when lane change end.';
    set(handles.uitable1,'Data',log);
    headr_cl=0;
    end
end

% --------------------------------------------------------------------
function savefile_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to savefile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global label
[fileName,filePath] = uiputfile('*.xls','Save as:');
xlswrite(fileName,label);


% --- Executes when entered data in editable cell(s) in uitable1


% --- Executes on button press in tLeft.
function tLeft_Callback(hObject, eventdata, handles)
% hObject    handle to tLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
global syncTime;
label{count,1} =syncTime;
% set(hObject,'BackgroundColor',[1,1,1]);
label{count,12} = 1;
count = count+1;
log{count-1,2}='Turn left.';
set(handles.uitable1,'Data',log);

% --- Executes on button press in tRight.
function tRight_Callback(hObject, eventdata, handles)
% hObject    handle to tRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
global syncTime;
label{count,1} =syncTime;
% set(hObject,'BackgroundColor',[1,1,1]);
label{count,13} = 1;
count = count+1;
log{count-1,2}='Turn right.';
set(handles.uitable1,'Data',log);

% --- Executes on button press in LeftCarCome.
function LeftCarCome_Callback(hObject, eventdata, handles)
% hObject    handle to LeftCarCome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
global syncTime;
label{count,1} =syncTime;
% set(hObject,'BackgroundColor',[1,1,1]);
label{count,14} = 1;
count = count+1;
log{count-1,2}='A car is passing from your left.';
set(handles.uitable1,'Data',log);

% --- Executes on button press in RightCarCome.
function RightCarCome_Callback(hObject, eventdata, handles)
% hObject    handle to RightCarCome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
global syncTime;
label{count,1} =syncTime;
% set(hObject,'BackgroundColor',[1,1,1]);
label{count,15} = 1;
count = count+1;
log{count-1,2}='A car is passing from your right.';
set(handles.uitable1,'Data',log);

% --- Executes on button press in exitFW.
function exitFW_Callback(hObject, eventdata, handles)
% hObject    handle to exitFW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
global syncTime;
label{count,1} =syncTime;
% set(hObject,'BackgroundColor',[1,1,1]);
label{count,17} = 1;
count = count+1;
log{count-1,2}='Exit free way.';
set(handles.uitable1,'Data',log);

% --- Executes on button press in LTruckPB.
function LTruckPB_Callback(hObject, eventdata, handles)
% hObject    handle to LTruckPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global truck
global label
global log
global syncTime;
if truck==0
    label{count,1} = syncTime;
    label{count,16} = 1;
    truck=1;
    count=count+1;
    set(hObject,'BackgroundColor',[1,1,1]);
    log{count-1,2}='Large truck pass by start...';
    set(handles.uitable1,'Data',log);
else if truck==1
    label{count,2} = syncTime;
    label{count,16} = 1;
    set(hObject,'BackgroundColor',[0.94,0.94,0.94]);
    count=count+1;
    log{count-1,2}='Large truck pass by end.';
    set(handles.uitable1,'Data',log);
    truck=0;
    end
end


% --- Executes on button press in lcRighr.
function lcRighr_Callback(hObject, eventdata, handles)
% hObject    handle to lcRighr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
global syncTime;
label{count,1} =syncTime;
% set(hObject,'BackgroundColor',[1,1,1]);
label{count,10} = 1;
count = count+1;
log{count-1,2}='Lane change to right.';
set(handles.uitable1,'Data',log);

% --- Executes on button press in lcLeft.
function lcLeft_Callback(hObject, eventdata, handles)
% hObject    handle to lcLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
global syncTime;
label{count,1} =syncTime;
% set(hObject,'BackgroundColor',[1,1,1]);
label{count,11} = 1;
count = count+1;
log{count-1,2}='Lane change to left.';
set(handles.uitable1,'Data',log);


% --- Executes on button press in withdraw.
function withdraw_Callback(hObject, eventdata, handles)
% hObject    handle to withdraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
global label
global log
if count>2
    count=count-1;
end
j=size(label,1)-1;
if j<=1
    j=1;
end
label=label(1:j,:);
log=log(1:j,:);
set(handles.uitable1,'Data',log);


% --- Executes during object creation, after setting all properties.


% --- Executes during object creation, after setting all properties.
function lcLeft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LTruckPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function LTruckPB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LTruckPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
