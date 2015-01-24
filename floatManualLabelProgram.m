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

% Last Modified by GUIDE v2.5 24-Jan-2015 02:02:59

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

% UIWAIT makes floatManualLabelProgram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = floatManualLabelProgram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edLogLabelCommand_Callback(hObject, eventdata, handles)
% hObject    handle to edLogLabelCommand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edLogLabelCommand as text
%        str2double(get(hObject,'String')) returns contents of edLogLabelCommand as a double


% --- Executes during object creation, after setting all properties.
function edLogLabelCommand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edLogLabelCommand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbYawning.
function pbYawning_Callback(hObject, eventdata, handles)
% hObject    handle to pbYawning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbEyeClosing.
function pbEyeClosing_Callback(hObject, eventdata, handles)
% hObject    handle to pbEyeClosing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbNodding.
function pbNodding_Callback(hObject, eventdata, handles)
% hObject    handle to pbNodding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbHeadL.
function pbHeadL_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbHeadR.
function pbHeadR_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbHeadLCL.
function pbHeadLCL_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadLCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbHeadRCL.
function pbHeadRCL_Callback(hObject, eventdata, handles)
% hObject    handle to pbHeadRCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
