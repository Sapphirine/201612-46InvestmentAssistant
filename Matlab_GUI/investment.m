function varargout = investment(varargin)
% INVESTMENT MATLAB code for investment.fig
%      INVESTMENT, by itself, creates a new INVESTMENT or raises the existing
%      singleton*.
%
%      H = INVESTMENT returns the handle to a new INVESTMENT or the handle to
%      the existing singleton*.
%
%      INVESTMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INVESTMENT.M with the given input arguments.
%
%      INVESTMENT('Property','Value',...) creates a new INVESTMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before investment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to investment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help investment

% Last Modified by GUIDE v2.5 22-Dec-2016 17:49:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @investment_OpeningFcn, ...
                   'gui_OutputFcn',  @investment_OutputFcn, ...
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



% --- Executes just before investment is made visible.
function investment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to investment (see VARARGIN)

% Choose default command line output for investment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes investment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = investment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global path
global countries
axes(handles.axes1);
img=imread('image9.jpg');
image(img);
axis off;
axes(handles.axes4);
img=imread('image10.png');
image(img);
axis off;


path='stock';
subdir=dir(path);
countries=cell((length(subdir)-2),1);
% countries{1}='Country';
for i = 1 : length( subdir )
    if( isequal( subdir(i).name, '.' )|| isequal( subdir(i).name, '..'))
        continue
    end
    countries{i-2}=subdir(i).name;
end

set(handles.popupmenu2,'String',countries);
set(handles.pushbutton7,'Visible','Off');
set(handles.pushbutton8,'Visible','Off');
set(handles.uipanel7,'Visible','Off');
set(handles.text6,'Visible','Off');
set(handles.text7,'Visible','Off');
set(handles.text8,'Visible','Off');
set(handles.text9,'Visible','Off');
set(handles.text10,'Visible','Off');
set(handles.text11,'Visible','Off');
set(handles.text12,'Visible','Off');
set(handles.text13,'Visible','Off');

set(handles.text14,'Visible','Off');
set(handles.text15,'Visible','Off');
set(handles.edit2,'Visible','Off');
set(handles.pushbutton11,'Visible','Off');




% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
  
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
global countries
global path
global path2
global gushi
global corporates
global the_gushi
global the_country
global the_corporate
the_country=countries{get(handles.popupmenu2,'value')};
path2=fullfile(path,the_country);
sub2dir=dir(path2);
gushi=cell((length(sub2dir)-2),1);
for i = 1 : length( sub2dir )
    if( isequal( sub2dir(i).name, '.' )|| isequal( sub2dir(i).name, '..'))
        continue
    end
    gushi{i-2}=sub2dir(i).name;
end
set(handles.popupmenu3,'String',gushi);
set(handles.popupmenu3,'value',1);
set(handles.popupmenu4,'value',1);
the_gushi=gushi{1};
path3=fullfile(path2,the_gushi);
sub3dir=dir(path3);
if (length(sub3dir)==2)
    corporates='No Corporates';
else
    corporates=cell((length(sub3dir)-2),1);
end
for i = 1 : length( sub3dir )
    if( isequal( sub3dir(i).name, '.' )|| isequal( sub3dir(i).name, '..'))
        continue
    end
    corporates{i-2}=sub3dir(i).name(1:length(sub3dir(i).name)-4);
end
set(handles.popupmenu4,'String',corporates);
guidata(hObject, handles);









function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
global path2
global path3
global gushi
global corporates
global the_corporate
global the_country
global the_gushi
the_gushi=gushi{get(handles.popupmenu3,'value')};
path3=fullfile(path2,the_gushi);
sub3dir=dir(path3);
if (length(sub3dir)==2)
    corporates='No Corporates';
else
    corporates=cell((length(sub3dir)-2),1);
end
for i = 1 : length( sub3dir )
    if( isequal( sub3dir(i).name, '.' )|| isequal( sub3dir(i).name, '..'))
        continue
    end
    corporates{i-2}=sub3dir(i).name(1:length(sub3dir(i).name)-4);
end
set(handles.popupmenu4,'String',corporates);
set(handles.popupmenu4,'value',1);
guidata(hObject, handles);




function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
global the_corporate
global corporates
global stored_path3
global path3
if isequal(corporates,'No Corporates')~=1
    the_corporate1=corporates{get(handles.popupmenu4,'value')};
    the_corporate=the_corporate1;
    stored_path3=path3;
    set(handles.text4,'String',the_corporate); 
    set(handles.pushbutton7,'Visible','On');
    set(handles.pushbutton8,'Visible','On');
else 
    set(handles.text4,'String',''); 
    set(handles.pushbutton7,'Visible','Off');
    set(handles.pushbutton8,'Visible','Off');
    set(handles.text6,'Visible','On');
    set(handles.text7,'Visible','Off');
    set(handles.text8,'Visible','Off');
    set(handles.text9,'Visible','Off');
    set(handles.text10,'Visible','Off');
    set(handles.text11,'Visible','Off');
    set(handles.text12,'Visible','Off');
    set(handles.text13,'Visible','Off');
end




% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel5,'Visible','off');
set(handles.popupmenu4,'Visible','On');
set(handles.text2,'Visible','On');
set(handles.edit1,'Visible','On');
set(handles.text3,'Visible','On');
set(handles.text4,'Visible','On');
set(handles.pushbutton6,'Visible','On');
set(handles.text14,'Visible','Off');
set(handles.text15,'Visible','Off');
set(handles.edit2,'Visible','Off');
set(handles.pushbutton11,'Visible','Off');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel5,'Visible','off');
set(handles.popupmenu4,'Visible','off');
set(handles.text2,'Visible','off');
set(handles.edit1,'Visible','off');
set(handles.text3,'Visible','off');
set(handles.text4,'Visible','off');
set(handles.pushbutton6,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.pushbutton8,'Visible','off');
set(handles.text6,'Visible','off');
set(handles.text7,'Visible','off');
set(handles.text8,'Visible','off');
set(handles.text9,'Visible','off');
set(handles.text10,'Visible','off');
set(handles.text11,'Visible','off');
set(handles.text12,'Visible','of');
set(handles.text13,'Visible','off');

set(handles.text14,'Visible','On');
set(handles.text15,'Visible','On');
set(handles.edit2,'Visible','On');
set(handles.pushbutton11,'Visible','On');




% --- Executes during object creation, after setting all properties.
function uipanel5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel5,'Visible','On');
set(handles.pushbutton2,'Visible','On')
set(handles.pushbutton2,'Visible','On')
cla(handles.axes1,'reset');
img=imread('image9.jpg');
image(img);
axis off;
set(handles.uipanel7,'Visible','Off');
set(handles.text6,'Visible','Off');
set(handles.text7,'Visible','Off');
set(handles.text8,'Visible','Off');
set(handles.text9,'Visible','Off');
set(handles.text10,'Visible','Off');
set(handles.text11,'Visible','Off');
set(handles.text12,'Visible','Off');
set(handles.text13,'Visible','Off');


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global path3
global the_corporate
global stored_path3
flag_find=0;
sub3dir=dir(path3);
Type1=get(handles.edit1,'string');

for i = 1 : length( sub3dir )
    temp=sub3dir(i).name;
    if( isequal( temp(1:length(temp)-4), Type1 ))
        flag_find=1;
        stored_path3=path3;
        the_corporate=Type1;
        set(handles.text4,'String',the_corporate);   
        set(handles.pushbutton7,'Visible','On');
        set(handles.pushbutton8,'Visible','On');
        break
    end
end
if flag_find==0
    set(handles.pushbutton7,'Visible','Off');
    set(handles.pushbutton8,'Visible','Off');
    set(handles.text6,'Visible','Off');
    set(handles.text7,'Visible','Off');
    set(handles.text8,'Visible','Off');
    set(handles.text9,'Visible','Off');
    set(handles.text10,'Visible','Off');
    set(handles.text11,'Visible','Off');
    set(handles.text12,'Visible','Off');
    set(handles.text13,'Visible','Off');
    set(handles.text4,'String','');
    msgbox('No Find!Please type another name','notice');
end
    


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global path3
global the_corporate
global var_flag
global es_flag



corporate_full=strcat(the_corporate,'.txt');
file_path=fullfile(path3,corporate_full);
data=load(file_path);
x1=data(:,1);
y1=data(:,2);
[M1,I] = max(y1);
M1I=x1(I);
[M2,I] = min(y1);
M2I=x1(I);
set(handles.uipanel7,'Visible','On');
set(handles.text6,'Visible','On');
set(handles.text7,'Visible','On');
set(handles.text8,'Visible','On');
set(handles.text9,'Visible','On');
set(handles.text10,'Visible','On');
set(handles.text11,'Visible','On');
set(handles.text12,'Visible','On');
set(handles.text13,'Visible','On');
set(handles.text8,'string',num2str(M1));
set(handles.text12,'string',num2str(M1I));
set(handles.text9,'string',num2str(M2));
set(handles.text13,'string',num2str(M2I));

cla(handles.axes1,'reset');
axes(handles.axes1);
% TextFontSize=10;
LegendFontSize=10;
% set(0,'DefaultAxesFontName','Times','DefaultLineLineWidth',1,'DefaultLineMarkerSize',8);
% set(gca,'FontName','Times?New?Roman','FontSize',TextFontSize);
% set(gcf,'Units','inches','Position',[0 0 6.0 4.0]);
%?---?1?Avg-OPT_costs_1m??
plot(x1,y1,'-r');

hold on
%?---?2?Avg-OPT_costs_2m??
% plot(X_items,Avg_Greedy_C,'-b')
% hold on
grid on
xlabel('day')
ylabel('value')
var_flag=1;
if es_flag==0
   hg1=legend('VaR',1);
else 
   hg1=legend('VaR','ES',1);
end
set(hg1,'FontSize',LegendFontSize);

guidata(hObject, handles);







% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global path3
global the_corporate
global es_flag
global var_flag
corporate_full=strcat(the_corporate,'.txt');
file_path=fullfile(path3,corporate_full);
data=load(file_path);
x1=data(:,1);
y2=data(:,3);
axes(handles.axes1);
% TextFontSize=10;
LegendFontSize=10;
% set(0,'DefaultAxesFontName','Times','DefaultLineLineWidth',1,'DefaultLineMarkerSize',8);
% set(gca,'FontName','Times?New?Roman','FontSize',TextFontSize);
% set(gcf,'Units','inches','Position',[0 0 6.0 4.0]);
%?---?1?Avg-OPT_costs_1m??
plot(x1,y2,'-b')
hold on
%?---?2?Avg-OPT_costs_2m??
% plot(X_items,Avg_Greedy_C,'-b')
% hold on
grid on
xlabel('day')
ylabel('value')
es_flag=1;
if var_flag==0
   hg2=legend('ES',1);
else 
   hg2=legend('VaR','ES',1);
end
set(hg2,'FontSize',LegendFontSize);



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


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global path3
Type2=get(handles.edit2,'string');
sub3dir=dir(path3);
if (length(sub3dir)==2)
    msgbox('No Corporates','notice');
  else
    corporates=cell(length(sub3dir)-2,1);
    data=ones(length(sub3dir)-2,1);
end
for i = 1 : length( sub3dir )
    if( isequal( sub3dir(i).name, '.' )|| isequal( sub3dir(i).name, '..'))
        continue
    end
    corporates{i-2}=sub3dir(i).name(1:length(sub3dir(i).name)-4);
    fileN=fullfile(path3,sub3dir(i).name);
    abc=load(fileN);
    ccc=find(abc(:,1)==str2double(Type2));
    if isempty(ccc)
        continue;
      else
        data(i-2)=abc(ccc,2);
    end
end
[B,I] = sort(data);
too=corporates(I);
if length(I)>10
    B=B(1:10);
    too=too(1:10);
end
cla(handles.axes1,'reset');
axes(handles.axes1);
bar(B,0.4);
set(gca,'XTickLabel',too);
xlabel('Corporates'),ylabel('VaR');

            
