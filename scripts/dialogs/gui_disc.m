function varargout = radioTest(varargin)
% RADIOTEST MATLAB code for radioTest.fig
%      RADIOTEST, by itself, creates a new RADIOTEST or raises the existing
%      singleton*.
%
%      H = RADIOTEST returns the handle to a new RADIOTEST or the handle to
%      the existing singleton*.
%
%      RADIOTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RADIOTEST.M with the given input arguments.
%
%      RADIOTEST('Property','Value',...) creates a new RADIOTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before radioTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to radioTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help radioTest

% Last Modified by GUIDE v2.5 13-Jun-2015 14:58:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @radioTest_OpeningFcn, ...
                   'gui_OutputFcn',  @radioTest_OutputFcn, ...
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



% --- Executes just before radioTest is made visible.
function radioTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to radioTest (see VARARGIN)

% Choose default command line output for radioTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes radioTest wait for user response (see UIRESUME)
 uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = radioTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.figure1);


%%%%%%%%%%%%%%%%%%%%%%%
% cancel button
% --- Executes on button press in pushbutton3.
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global start
% start = 0;
guidata(hObject, handles);
%delete(handles.figure1);
uiresume(handles.figure1);

function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% global method
%disp('SELECTION CHANGE')
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton1'
        % Code for when MarkAsGood is selected.
        method = 1;
        %disp('1')
        handles.current_state = 'radiobutton1';
    case 'radiobutton2'
        % Code for when MarkAsBad is selected.
        method = 2;
        %disp('2')
        handles.current_state = 'radiobutton2';
    case 'radiobutton3'
        % Code for when Unmark is selected.
        method = 4;
        %disp('3')
        handles.current_state = 'radiobutton3';
    case 'radiobutton4'
        % Code for when MarkAsGood is selected.
        method = 5;
        %disp('4')
        handles.current_state = 'radiobutton4';
    case 'radiobutton5'
        % Code for when MarkAsGood is selected.
        method = 7;
        %disp('5')
        handles.current_state = 'radiobutton5';
    case 'radiobutton6'
        % Code for when MarkAsBad is selected.
        method = 6;
        %disp('6')
        handles.current_state = 'radiobutton6';
    case 'radiobutton7'
        % Code for when Unmark is selected.
        method = 3;
        %disp('7')
        handles.current_state = 'radiobutton7';
%         global compute_RDM visualize_3d categorize_imgs create_dendrogram
%         compute_RDM = 0;
%         visualize_3d = 0;
%         categorize_imgs = 0;
%         create_dendrogram = 0;
    case 'radiobutton8'
        % Code for when MarkAsGood is selected.
        method = 8;
        %disp('8')
        handles.current_state = 'radiobutton8';
    otherwise
        disp('radiobutton mismatch');
end

%disp(handles.current_state)

% Update handles structure
%guidata(hObject, handles);


%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% start button
% --- Executes on button press in pushbutton2.
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global start
start = 1;
handles.output = 'asdf';
guidata(hObject, handles);
uiresume(handles.figure1);


%%%%%%%%%%%%%%%%%%%%%%%%
% configure representation options
% --- Executes on button press in pushbutton5.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global method
if method == 2 %%%%%%%%%%% sift
% 	global cluster_size
	title = 'SIFT';
	prompt={'Number of words for bag of words comparison (128 is the size of a SIFT feature vector), k='};
	def={'15'}; % default: 15 clusters
	answer=inputdlg(prompt, title,1,def);
	if(sum(size(answer)))
		cluster_size = str2num(answer{1});
	end
elseif method == 4 % geoblur
% 	global find_points w_m w_d gamma alpha_d beta_d mu_d
	prompt={'Number of keypoints?', '(see "Berg. Shape Matching and Object Recognition" for descriptions of parameters; note that points are considered to match based on a simple nearest neighbor search instead of as described in the paper) w_m:', 'w_d:', 'gamma (should be < 1):', 'alpha_d:', 'beta_d:', 'mu_d:'};
    def={'30', '1', '1', '0.9', '1', '1', '1'};
    title='Geometric blur parameters';
    answer=inputdlg(prompt,title,1,def);
%   global find_points
	if(sum(size(answer)))
		find_points = str2num(answer{1});
		w_m = str2num(answer{2});
		w_d = str2num(answer{3});
		gamma = str2num(answer{4}); % must be less than 1
		alpha_d = str2num(answer{5});
		beta_d = str2num(answer{6});
		mu_d = str2num(answer{7});
		if gamma > 1
			error('Invalid parameters');
		end
	end
elseif method == 3
%	global n_filters filter_size avg_down_sample cluster_data

 %   try
%		hier
%	end

	prompt={'Number of white-noise filters?','Filter size? (in pixels, odd numbers only)','Down sample factor?'};
	def={int2str(n_filters),int2str(filter_size),int2str(avg_down_sample)};
	title='Jarrett model parameters';
    answer=inputdlg(prompt,title,1,def);
	if(sum(size(answer)))
		n_filters = str2num(answer{1});
		filter_size = str2num(answer{2});
		avg_down_sample = str2num(answer{3});
		if n_filters < 1 || filter_size < 2 || avg_down_sample < 1 || ~mod(filter_size,2)
			% check if there are enough filters, they are large enough, the downsample is large enough, and the filter size is odd
		   error('Invalid parameters'); 
		end
	end
else
	msgbox('No advanced options to configure.');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
% global img_dir
img_dir_t = get(hObject,'String');


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

% global img_dir_handle img_dir
img_dir_handle = hObject;
set(img_dir_handle, 'String', img_dir);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%
% browse button
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global img_dir_handle img_dir
img_dir_t = uigetdir(img_dir);
if img_dir_t ~= 0
	img_dir = img_dir_t;
	set(img_dir_handle, 'String', img_dir);
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


%%%%%%%%%%%%%%%%%%%%%%55
%% create compute RDM checkbox
%function checkbox2_create(hObject, eventdata, handles)
%global compute_RDM_handle compute_RDM
%compute_RDM_handle = hObject;
%compute_RDM = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%
% compute RDM checkbox
% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
% global visualize_3d_handle create_dendrogram_handle
% global compute_RDM_handle categorize_imgs_handle
% global compute_RDM visualize_3d create_dendrogram
% global compute_RDMcategorize_imgs categorize_imgs
compute_RDM = get(hObject,'Value');
if ~compute_RDM
	set(visualize_3d_handle, 'Value', 0);
	set(create_dendrogram_handle, 'Value', 0);
	set(compute_RDM_handle, 'Value', 0);
	set(categorize_imgs_handle, 'Value', 0);
	visualize_3d = 0;
	create_dendrogram = 0;
	compute_RDM = 0;
	categorize_imgs = 0;
end


%%%%%%%%%%%%%%%%%%%%%%55
%% create dendrogram checkbox
%function checkbox3_create(hObject, eventdata, handles)
%global create_dendrogram_handle create_dendrogram
%create_dendrogram_handle = hObject;
%create_dendrogram = 0;

%%%%%%%%%%%%%%%%%%%%%%55
%% create visualize checkbox
%function checkbox4_create(hObject, eventdata, handles)
%global visualize_3d_handle visualize_3d
%visualize_3d_handle = hObject;
%visualize_3d = 0;

%%%%%%%%%%%%%%%%%%%%%%55
%% create categorize checkbox
%function checkbox5_create(hObject, eventdata, handles)
%global categorize_imgs_handle categorize_imgs
%categorize_imgs_handle = hObject;
%categorize_imgs = 0;

%%%%%%%%%%%%%%%%%%%%%%%%
% create dendrogram
% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
% global create_dendrogram compute_RDM compute_RDM_handle
create_dendrogram = get(hObject,'Value');
if create_dendrogram
	compute_RDM = 1;
	set(compute_RDM_handle, 'Value', 1);
end


%%%%%%%%%%%%%%%%%%%%%
% visualize in 3d checkbox
% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
% global visualize_3d compute_RDM compute_RDM_handle
visualize_3d = get(hObject,'Value');
if visualize_3d
	compute_RDM = 1;
	set(compute_RDM_handle, 'Value', 1);
end


%%%%%%%%%%%%%%%%%%%%
% categorize images checkbox
% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
% global categorize_imgs compute_RDM compute_RDM_handle
categorize_imgs = get(hObject,'Value');
if categorize_imgs
	compute_RDM = 1;
	set(compute_RDM_handle, 'Value', 1);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% configure clustering
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt={'How many categories (clusters) should the images be grouped into?'};
% global n_img_categories
def={int2str(n_img_categories)};
title='Number of clusters';
answer=inputdlg(prompt,title,1,def);
if sum(size(answer))
	n_img_categories = str2num(answer{1});
% 	global compute_RDM categorize_imgs categorize_imgs_handle compute_RDM_handle
	compute_RDM = 1;
	categorize_imgs = 1;
	set(compute_RDM_handle, 'Value', 1);
	set(categorize_imgs_handle, 'Value', 1);
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
