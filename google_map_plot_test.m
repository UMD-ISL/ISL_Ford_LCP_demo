function varargout = google_map_plot_test(varargin)
% GOOGLE_MAP_PLOT_TEST MATLAB code for google_map_plot_test.fig
%      GOOGLE_MAP_PLOT_TEST, by itself, creates a new GOOGLE_MAP_PLOT_TEST or raises the existing
%      singleton*.
%
%      H = GOOGLE_MAP_PLOT_TEST returns the handle to a new GOOGLE_MAP_PLOT_TEST or the handle to
%      the existing singleton*.
%
%      GOOGLE_MAP_PLOT_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GOOGLE_MAP_PLOT_TEST.M with the given input arguments.
%
%      GOOGLE_MAP_PLOT_TEST('Property','Value',...) creates a new GOOGLE_MAP_PLOT_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before google_map_plot_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to google_map_plot_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help google_map_plot_test

% Last Modified by GUIDE v2.5 19-Jan-2015 17:00:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @google_map_plot_test_OpeningFcn, ...
                   'gui_OutputFcn',  @google_map_plot_test_OutputFcn, ...
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


% --- Executes just before google_map_plot_test is made visible.
function google_map_plot_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to google_map_plot_test (see VARARGIN)

% Choose default command line output for google_map_plot_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes google_map_plot_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = google_map_plot_test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lat = 42:0.00001:43;
lon = -83:0.00001:-82;
numPoints = size(lat, 2);

for num = 2:numPoints-1
    num
    postion_lat = lat(num);
    postion_lon = lon(num);
    if 42 == ceil(postion_lat * 10^4)/10^4
        set(handles.axes1, 'YLim', [42, (floor(postion_lat * 10^4)+10)/10^4]);
        set(handles.axes1, 'XLim', [-83, (floor(postion_lon * 10^4) + 10)/10^4]);
    else
        set(handles.axes1, 'YLim', [42, ceil(postion_lat * 10^4)/10^4]);
    end
    
    if -83 == ceil(postion_lon * 10^4)/10^4
        set(handles.axes1, 'XLim', [-83, (floor(postion_lon * 10^4) + 10)/10^4]);
        set(handles.axes1, 'YLim', [42, (floor(postion_lat * 10^4)+1)/10^4]);
    else
        set(handles.axes1, 'XLim', [-83, ceil(postion_lon * 10^4)/10^4]);
    end
    plot(handles.axes1, postion_lon, postion_lat, '.r','MarkerSize',20);
    plot_google_map('axis', handles.axes1, 'height', 370, 'width', 370);
    pause(0.1);
end

