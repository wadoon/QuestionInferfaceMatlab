function handle = experiment(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @experiment_OpeningFcn, ...
                   'gui_OutputFcn',  @experiment_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);

if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

handle = gui_mainfcn(gui_State);
% End initialization code - DO NOT EDIT

set(handle.btnYes, 'Callback', @(varargin) setUserResponse(1))
set(handle.btnNo, 'Callback', @(varargin) setUserResponse(0))
set(handle.figure1, 'WindowKeyPressFcn', ...
    @(hObject, eventdata) figure1_WindowKeyPressFcn(hObject, eventdata, guidata(hObject)))



global Label  Antworten Fragen blocksf


% --- Executes just before experiment is made visible.
function experiment_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% UIWAIT makes experiment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = experiment_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles;

% --- Executes on button press in btnYes.
function setUserResponse(i)
%% set USER_RESPONSE to i
global USER_RESPONSE
USER_RESPONSE = i


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
%% handle incoming key events:
%   numpad4 || leftarrow => Yes
%   numpad6 || rightarrow => No
%
%   Result in global variable: USER_RESPONSE

if strcmp( eventdata.Key, 'numpad4')  || ...
    strcmp(eventdata.Key, 'leftarrow')
    setUserResponse(1)
end

if strcmp( eventdata.Key,  'numpad6') || ...
   strcmp(eventdata.Key, 'rightarrow')
    setUserResponse(0)
end

