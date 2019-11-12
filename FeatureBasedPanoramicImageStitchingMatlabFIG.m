function varargout = FeatureBasedPanoramicImageStitchingMatlabFIG(varargin)
% FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG MATLAB code for FeatureBasedPanoramicImageStitchingMatlabFIG.fig
%      FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG, by itself, creates a new FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG or raises the existing
%      singleton*.
%
%      H = FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG returns the handle to a new FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG or the handle to
%      the existing singleton*.
%
%      FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG.M with the given input arguments.
%
%      FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG('Property','Value',...) creates a new FEATUREBASEDPANORAMICIMAGESTITCHINGMATLABFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FeatureBasedPanoramicImageStitchingMatlabFIG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FeatureBasedPanoramicImageStitchingMatlabFIG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FeatureBasedPanoramicImageStitchingMatlabFIG

% Last Modified by GUIDE v2.5 10-Nov-2019 18:32:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FeatureBasedPanoramicImageStitchingMatlabFIG_OpeningFcn, ...
                   'gui_OutputFcn',  @FeatureBasedPanoramicImageStitchingMatlabFIG_OutputFcn, ...
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
clc;
clear;

% --- Executes just before FeatureBasedPanoramicImageStitchingMatlabFIG is made visible.
function FeatureBasedPanoramicImageStitchingMatlabFIG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FeatureBasedPanoramicImageStitchingMatlabFIG (see VARARGIN)

% Choose default command line output for FeatureBasedPanoramicImageStitchingMatlabFIG
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FeatureBasedPanoramicImageStitchingMatlabFIG wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FeatureBasedPanoramicImageStitchingMatlabFIG_OutputFcn(hObject, eventdata, handles) 
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

a=uigetdir;
%buildingDir = fullfile(toolboxdir('vision'), 'visiondata', 'building');
buildingScene = imageDatastore(a);
hObject.UserData = buildingScene;
%buildingScene = imageDatastore(buildingDir)
% Display images to be stitched
montage(buildingScene.Files) 
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h = findobj('Tag','pushbutton1');
	buildingScene = h.UserData;

panorama = FeatureBasedPanoramicImageStitchingMatlab(buildingScene);
imshow(panorama, 'Parent', handles.axes1);
guidata(hObject, handles);
