function varargout = ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI(varargin)
%CHAINE_DE_TRANSMISSION 
%Auteur : ABDALLAOUI MAAN Amine
%amine_abdellaouimaane@um5.ac.ma
%Master Informatique et Telecomunication
% Last Modified by GUIDE v2.5 27-Nov-2020 21:10:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
clc;

gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI_OpeningFcn, ...
                   'gui_OutputFcn',  @ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI_OutputFcn, ...
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




% --- Executes just before ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI is made visible.
function ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI (see VARARGIN)

% Choose default command line output for ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI
handles.output = hObject;
a=10;
handles.EQ=3;
handles.LP=3;
handles.ER=3;
handles.MM=3;
handles.LS=3;
handles.OB=0;
handles.I=0;
handles.a=a;

% Update handles structure
guidata(hObject, handles);

clear all;

% UIWAIT makes ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Title_Callback(hObject, eventdata, handles)
% hObject    handle to Title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Title as text
%        str2double(get(hObject,'String')) returns contents of Title as a double


% --- Executes during object creation, after setting all properties.
function Title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sauver_Origine.
function Sauver_Origine_Callback(hObject, eventdata, handles)
% hObject    handle to Sauver_Origine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file=get(handles.edit1,'String');
set(handles.Taille,'String','');
if (strcmp(file,"")==0)
    set(handles.text14,'visible','off');
    axes(handles.axes1);
    I=imread(file);
    handles.I=I;
    imshow(I);
else
    audio();
    f = errordlg({'Erreur ! Merci de choisir un fichier image... ',...
        '        [+] Tappez le nom de fichier image dans la barre de recherche',...
        '              avant de le sauver'},'Error ...!!!');
    uiwait(f);
end
guidata(hObject, handles);


function audio()
[y,Fs] = audioread('Error_Sound.mp3');
sound(y,Fs);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to Title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Title as text
%        str2double(get(hObject,'String')) returns contents of Title as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Joindre_Origine.
function Joindre_Origine_Callback(hObject, eventdata, handles)
[baseName, folder] = uigetfile( ...
    {'*.png;*.jpg;*.tif;*.pcx;*.bmp;*.gif;*.jpeg;';});
file = fullfile(folder, baseName);

set(handles.Taille,'String','');
if (baseName==0)
    f = errordlg('Erreur ! Merci de choisir un fichier image','Error ...!!!');
    uiwait(f);
else
    I=imread(file);
    handles.I=I;
    tab=split(file,"\");
    set(handles.edit1,'String',tab(end));
    set(handles.text14,'visible','off');
    axes(handles.axes1);
    imshow(I);
    guidata(hObject, handles);
end


% --- Executes on button press in Reinetialiser.
function Reinetialiser_Callback(hObject, eventdata, handles)
% hObject    handle to Reinetialiser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String','');
set(handles.text14,'visible','on');
axes(handles.axes1);
set(handles.Taille,'String','');
cla reset;
set(gca,'visible','off')



% --- Executes on button press in Taille_button.
function Taille_button_Callback(hObject, eventdata, handles)
% hObject    handle to Taille_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file=get(handles.edit1,'String');
if (strcmp(file,"")==0)
    I=handles.I;
    taille_Image=size(I);
    taille_Image=[num2str(taille_Image(1)),' x ',num2str(taille_Image(2))];
    set(handles.Taille,'String',taille_Image);
else
    audio();
    f = errordlg({'Erreur ! Merci de choisir un fichier image...                       ',...
        '        [+] Tapez le nom de l''image dans la barre de recherche',...
        '        [+] Joindre un fichier de votre répértoire'},'Error ...!!!');
    uiwait(f);
end



    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  TRAITEMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% --- Executes on button press in Echant_Quantifi.
function Echant_Quantifi_Callback(hObject, eventdata, handles)
% hObject    handle to Echant_Quantifi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file=get(handles.edit1,'String');
if (strcmp(file,"")==0)
    handles.OO=1;
    set(handles.OO_Choice,'visible','on');
    set(handles.Option1,'visible','on');
    set(handles.Option2,'visible','on');
    set(handles.Option1,'Value',1.0);
    set(handles.Option2,'Value',0.0);
    set(handles.Option1,'String','Echantillonnage');
    set(handles.Option2,'String','Quantification'); 
    set(handles.text2,'HorizontalAlignment','left');
    
    
    
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');
    set(handles.Save_Result,'visible','off');
    set(handles.text4,'visible','off');
    set(handles.text3,'String','');
    set(handles.text5,'visible','off');
    set(handles.OB_Choice,'visible','off');
    set(handles.Origine,'visible','off');
    set(handles.Bruitee,'visible','off');
    set(handles.Plus_Info,'visible','off');
    set(handles.edit6,'visible','off');
    set(handles.edit7,'visible','off');
    set(handles.edit8,'visible','off');
    %Échantillonnage et quantification
    a=1;
    handles.a=a;
    set(handles.text1,'visible','on');
    set(handles.edit2,'visible','off');
    set(handles.edit3,'visible','off');
    set(handles.Appliquer,'visible','on');
    msg=["- L'échantillonnage qui réduit l’ensemble continu du monde observable en une série de valeurs discrétes."...
        "",...
        "- La quantification permet de réduire le nombre des niveaux de gris."];
    set(handles.text1,'String',msg);
    set(handles.text2,'visible','on');
    msg=["",...
        "   [+] Application"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""];
    set(handles.text2,'String',msg);
    set(handles.axes2,'visible','off');
else
    audio();
    f = errordlg({'Erreur ! Merci de choisir un fichier image...                       ',...
        '        [+] Tapez le nom de l''image dans la barre de recherche',...
        '        [+] Joindre un fichier de votre répértoire'},'Error ...!!!');
    uiwait(f);
    
end


guidata(hObject, handles);

% --- Executes on button press in Echantillonnage.
function Echantillonnage_Callback(hObject, eventdata, handles)
% hObject    handle to Echantillonnage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EQ=0;
handles.EQ=EQ;
axes(handles.axes2);
cla reset;
set(gca,'visible','off');
set(handles.text15,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.Option1,'String','Echantillonnage');
set(handles.Option2,'String','Quantification');
set(handles.text2,'HorizontalAlignment','left');
set(handles.edit8,'visible','on');
set(handles.edit2,'String','');
set(handles.edit8,'String','');
set(handles.text3,'String','');

msg=["",...
    "    [+] Application"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "   Le nombre des échantillons:"...
    ""...
    ""...
    ""];
set(handles.text2,'String',msg);

guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Echantillonnage


% --- Executes on button press in Quantification.
function Quantification_Callback(hObject, eventdata, handles)
% hObject    handle to Quantification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EQ=1;
handles.EQ=EQ;
axes(handles.axes2);
cla reset;
set(gca,'visible','off');
set(handles.text15,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.text2,'HorizontalAlignment','left');
set(handles.edit8,'visible','on');
set(handles.edit3,'String','');
set(handles.edit8,'String','');
set(handles.text3,'String','');

msg=["",...
    "    [+] Application"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "  Le nombre de niveaux "...
    "          de gris :"...
    ""...
    ""];
set(handles.text2,'String',msg);

guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Quantification







% --- Executes on button press in Couleur_Gris.
function Couleur_Gris_Callback(hObject, eventdata, handles)
% hObject    handle to Couleur_Gris (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file=get(handles.edit1,'String');
set(handles.text4,'visible','off');
if (strcmp(file,"")==0)
    set(handles.OO_Choice,'visible','off');
    set(handles.Option1,'visible','off');
    set(handles.Option2,'visible','off');
    
    
    
    axes(handles.axes2);
    set(handles.text3,'String','');
    set(handles.Save_Result,'visible','off');
    set(handles.OB_Choice,'visible','off');
    set(handles.Origine,'visible','off');
    set(handles.Bruitee,'visible','off');
    set(handles.text1,'String','');
    set(handles.text3,'String','');
    cla reset;
    set(gca,'visible','off');
    set(handles.axes2,'visible','off');
    set(handles.Plus_Info,'visible','off');
    set(handles.text2,'HorizontalAlignment','center');
    set(handles.text15,'visible','on');
    set(handles.edit6,'visible','off');
    set(handles.edit7,'visible','off');
    set(handles.edit8,'visible','off');
    % Conversion couleur --> niveaux de gris
    a=2;
    handles.a=a;
    set(handles.edit2,'visible','off');
    set(handles.edit3,'visible','off');
    set(handles.text5,'visible','off');
    set(handles.text3,'String','');

    set(handles.Appliquer,'visible','on');
    msg=[" - CONVERSION COULEUR --> NIVEAUX DE GRIS."...
        "        Ce traitment sert à effectuer une transformation de l'image en couleur vers une autre non colorées (GRAY)."];
    set(handles.text1,'String',msg);
    set(handles.text2,'visible','off');
else
    audio();
    f = errordlg({'Erreur ! Merci de choisir un fichier image...                       ',...
        '        [+] Tapez le nom de l''image dans la barre de recherche',...
        '        [+] Joindre un fichier de votre répértoire'},'Error ...!!!');
    uiwait(f);
    
end

guidata(hObject, handles);


% --- Executes on button press in Conversion_espace_couleur.
function Conversion_espace_couleur_Callback(hObject, eventdata, handles)
% hObject    handle to Conversion_espace_couleur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file=get(handles.edit1,'String');
set(handles.text4,'visible','off');
if (strcmp(file,"")==0)
    set(handles.OO_Choice,'visible','off');
    set(handles.Option1,'visible','off');
    set(handles.Option2,'visible','off');
    
    
    
    msg=[" - CONVERSION ENTRE ESPACES DE COULEURS."...
        "        Ce traitment sert à faire convertir une image d'un espace de couleur à autre tel que RGB, HSV, LAB, NTSC et YCbCr. ."];
    set(handles.text1,'String',msg);
    set(handles.text3,'String','');
    set(handles.text15,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.axes2,'visible','off');
    set(handles.text5,'visible','off');
    set(handles.OB_Choice,'visible','off');
    set(handles.Origine,'visible','off');
    set(handles.Bruitee,'visible','off');
    set(handles.text2,'HorizontalAlignment','center');
    set(handles.edit6,'visible','off');
    set(handles.edit7,'visible','off');
    set(handles.Plus_Info,'visible','on');
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off')
    set(handles.text2,'visible','on');
    set(handles.edit2,'visible','on');
    set(handles.edit2,'string','');
    set(handles.edit3,'visible','on');
    set(handles.edit3,'string','');
    set(handles.Appliquer,'visible','on');
    set(handles.edit8,'visible','off');
    set(handles.text3,'String','');
    
    % Hint: get(hObject,'Value') returns toggle state of Conversion_espace_couleur
    a=3;
    handles.a=a;
    msg=[""...
        ""...
        " [+] Espace de couleur de départ :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        " [+] Espace de couleur d'arrivé :"];
    set(handles.text2,'String',msg);
else
    audio();
    f = errordlg({'Erreur ! Merci de choisir un fichier image...                       ',...
        '        [+] Tapez le nom de l''image dans la barre de recherche',...
        '        [+] Joindre un fichier de votre répértoire'},'Error ...!!!');
    uiwait(f);
    
end    
guidata(hObject, handles);


% --- Executes on button press in Spaciale.
function Spaciale_Callback(hObject, eventdata, handles)
% hObject    handle to Spaciale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file=get(handles.edit1,'String');
set(handles.text4,'visible','off');
if (strcmp(file,"")==0)
    set(handles.text15,'visible','on');
    set(handles.OO_Choice,'visible','off');
    set(handles.Option1,'visible','off');
    set(handles.Option2,'visible','off');
    set(handles.Menu_Spacial,'Value',1.0);
    
    
    
    
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');
    set(handles.Save_Result,'visible','off');
    set(handles.text3,'String','');
    set(handles.text5,'visible','off');
    set(handles.OB_Choice,'visible','off');
    set(handles.Origine,'visible','off');
    set(handles.Bruitee,'visible','off');
    set(handles.axes2,'visible','off');
    set(handles.Plus_Info,'visible','off');
    set(handles.text1,'string','');
    set(handles.text2,'visible','off');
    set(handles.edit2,'visible','off');
    set(handles.edit3,'visible','off');
    set(handles.edit6,'visible','off');
    set(handles.edit7,'visible','off');
    set(handles.Appliquer,'visible','off');
    set(handles.edit8,'visible','off');
    % Hint: get(hObject,'Value') returns toggle state of Spaciale
    a=4;
    handles.a=a;
    Menu_Spacial_Callback(hObject, eventdata, handles);
    set(handles.text3,'String','');
    set(handles.edit6,'string','');
    set(handles.edit7,'string','');
else
    audio();
    f = errordlg({'Erreur ! Merci de choisir un fichier image...                       ',...
        '        [+] Tapez le nom de l''image dans la barre de recherche',...
        '        [+] Joindre un fichier de votre répértoire'},'Error ...!!!');
    uiwait(f);
    
end

guidata(hObject, handles);

% --- Executes on button press in F_Moyenneur.
function F_Moyenneur_Callback(hObject, eventdata, handles)
% hObject    handle to F_Moyenneur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MM=0;
handles.MM=MM;
set(handles.text3,'String','');
set(handles.text15,'visible','on');
set(handles.edit6,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.edit7,'visible','on');
set(handles.edit6,'string','');
set(handles.edit7,'string','');
set(handles.Origine,'Value',1.0);
set(handles.Bruitee,'Value',0.0);

msg=[""...
    "  [+]  Choix du filtre :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "  [+]  Taille et nombre de répétition du filtre :"...
    ""...
    "        Taille :"...
    ""...
    "     N.répét :"...
    ""];
set(handles.text2,'String',msg);

axes(handles.axes2);
cla reset;
set(gca,'visible','off')

% Hint: get(hObject,'Value') returns toggle state of F_Moyenneur
guidata(hObject, handles);


% --- Executes on button press in F_Median.
function F_Median_Callback(hObject, eventdata, handles)
% hObject    handle to F_Median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MM=1;
handles.MM=MM;
set(handles.text3,'String','');
set(handles.text15,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.edit6,'visible','on');
set(handles.edit7,'visible','on');
set(handles.edit6,'string','');
set(handles.edit7,'string','');
set(handles.Origine,'Value',1.0);
set(handles.Bruitee,'Value',0.0);

msg=[""...
    "  [+]  Choix du filtre :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "  [+]  Taille et nombre de répétition du filtre :"...
    ""...
    "        Taille :"...
    ""...
    "     N.répét :"...
    ""];
set(handles.text2,'String',msg);

axes(handles.axes2);
cla reset;
set(gca,'visible','off')
% Hint: get(hObject,'Value') returns toggle state of F_Median
guidata(hObject, handles);


% --- Executes on button press in Logarithmique.
function Logarithmique_Callback(hObject, eventdata, handles)
% hObject    handle to Logarithmique (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LP=0;
handles.LP=LP;
set(handles.text3,'String','');
set(handles.text15,'visible','on');
set(handles.edit6,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.edit7,'visible','off');
set(handles.edit6,'string','');
axes(handles.axes2);
cla reset;
set(gca,'visible','off');

msg=[""...
    "   [+] Transformation :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "   [+]  Coeficients"...
    ""...
    "   Canstante :"...
    ""...
    ""...
    ""];
set(handles.text2,'String',msg);

guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Logarithmique


% --- Executes on button press in Puissance.
function Puissance_Callback(hObject, eventdata, handles)
% hObject    handle to Puissance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LP=1;
handles.LP=LP;
set(handles.text3,'String','');
set(handles.text15,'visible','on');
set(handles.edit6,'visible','on');
set(handles.edit7,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.edit6,'string','');
set(handles.edit7,'string','');
axes(handles.axes2);
cla reset;
set(gca,'visible','off');

msg=[""...
    "   [+] Transformation :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "   [+]  Coeficients"...
    ""...
    "   Gamma :"...
    ""...
    "   Canstante :"...
    ""];
set(handles.text2,'string',msg);

guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Puissance


% --- Executes on button press in Etirement.
function Etirement_Callback(hObject, eventdata, handles)
% hObject    handle to Etirement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ER=0;
handles.ER=ER;
I=handles.I;
[l,c,canal]=size(I);
if (canal == 3)
    I=rgb2gray(I);
elseif (canal == 1)
                
end
set(handles.edit6,'visible','on');
set(handles.edit7,'visible','on');
set(handles.text15,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.edit6,'String',min(min(I)));
set(handles.edit7,'String',max(max(I)));
set(handles.text3,'String','');
axes(handles.axes2);
cla reset;
set(gca,'visible','off');

msg=[""...
    "   [+] Application :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "   [+]  L'intervale de votre image :"...
    ""...
    "        Min :"...
    ""...
    "        Max :"...
    ""];
set(handles.text2,'String',msg);

guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Etirement


% --- Executes on button press in Recadrage.
function Recadrage_Callback(hObject, eventdata, handles)
% hObject    handle to Recadrage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ER=1;
handles.ER=ER;
set(handles.text3,'String','');
set(handles.edit6,'visible','on');
set(handles.edit7,'visible','on');
set(handles.text15,'visible','on');
set(handles.Save_Result,'visible','off');
set(handles.edit6,'string','');
set(handles.edit7,'string','');
axes(handles.axes2);
cla reset;
set(gca,'visible','off');

msg=[""...
    "   [+] Application :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "   [+]  Coeficients"...
    ""...
    "        Min :"...
    ""...
    "        Max :"...
    ""];
set(handles.text2,'String',msg);

guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Recadrage


% --- Executes on selection change in Menu_Spacial.
function Menu_Spacial_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Spacial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Menu_Spacial contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Menu_Spacial
a=handles.a;
if (a==4)
    Trait_Spacial=get(hObject,'Value');
    switch Trait_Spacial
        case 2
            handles.OO=2;
            set(handles.OO_Choice,'visible','on');
            set(handles.Option1,'visible','on');
            set(handles.Option2,'visible','on');
            set(handles.Option1,'Value',1.0);
            set(handles.Option2,'Value',0.0);
            set(handles.Option1,'String','Logarithmique');
            set(handles.Option2,'String','Puissance');
            
            
            
            
            
            b=1;
            handles.b=b;
            set(handles.Save_Result,'visible','off');
            set(handles.text15,'visible','on');
            set(handles.text3,'String','');
            Presentation={'   - TRANSFORMATION LOGARITHMIQUE sert a effectuer un filtrage visuel a chacun des pixels de l''image. ',...
                '',...
                '   - TRANSFORMATION DE PUISSANCE consiste à modifier les niveaux de luminace d''ume image.'};
            set(handles.text1,'String',Presentation);
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            set(handles.OB_Choice,'visible','off');
            set(handles.Origine,'visible','off');
            set(handles.Bruitee,'visible','off');
            set(handles.edit8,'visible','off');
            axes(handles.axes2);
            cla reset;
            set(gca,'visible','off');
            set(handles.edit6,'visible','off');
            set(handles.edit7,'visible','off');
            set(handles.text2,'visible','on');
            set(handles.text2,'HorizontalAlignment','left');
            msg=[""...
                "   [+] Transformation :"...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""];
            set(handles.text2,'String',msg);
            set(handles.Appliquer,'visible','on');
            guidata(hObject, handles);

        case 3
            handles.OO=3;
            set(handles.OO_Choice,'visible','on');
            set(handles.Option1,'visible','on');
            set(handles.Option2,'visible','on');
            set(handles.Option1,'Value',1.0);
            set(handles.Option2,'Value',0.0);
            set(handles.Option1,'String','Etirement');
            set(handles.Option2,'String','Recadrage');
            
            
            
            
            b=2;
            handles.b=b;
            set(handles.Save_Result,'visible','off');
            set(handles.text15,'visible','on');
            Presentation={'   - ETIREMENT d''HISTOGRAMME permet de forcer l''image d''être entre 0 et 255 niveaux de gris.',...
                '',...
                '   - RECADRAGE d''HISTOGRAMME permet de diminuer/augmenter le contraste des images.'};
            set(handles.text1,'String',Presentation);
            set(handles.text3,'String','');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            set(handles.OB_Choice,'visible','off');
            set(handles.Origine,'visible','off');
            set(handles.Bruitee,'visible','off');
            set(handles.edit8,'visible','off');
            axes(handles.axes2);
            cla reset;
            set(gca,'visible','off');
            set(handles.edit6,'string','');
            set(handles.edit7,'string','');
            set(handles.text2,'HorizontalAlignment','left');
            set(handles.edit3,'visible','off');
            set(handles.edit2,'visible','off');
            set(handles.text2,'visible','on');
            set(handles.Appliquer,'visible','on');
            set(handles.edit6,'visible','off');
            set(handles.edit7,'visible','off');
            msg=[""...
                "   [+] Application :"...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""];
            
            set(handles.text2,'String',msg);
            set(handles.Appliquer,'visible','on');
            guidata(hObject, handles);
            

        case 4
            handles.OO=4;
            set(handles.OO_Choice,'visible','on');
            set(handles.Option1,'visible','on');
            set(handles.Option2,'visible','on');
            set(handles.Option1,'Value',1.0);
            set(handles.Option2,'Value',0.0);
            set(handles.Option1,'String','F.Moyenneur');
            set(handles.Option2,'String','F.Median');
            
            
            
            
            b=3;
            handles.b=b;
            set(handles.text15,'visible','on');
            set(handles.Save_Result,'visible','off');
            Presentation={'   - FILTRES DE LISSAGE  permettent généralement de :',...
                '          [+] Flouter l''image  (Lissage ou Blurring).',...
                '          [+] Réduire le bruit (débruitage ou Noise reduction) dans l''image.'};
            set(handles.text1,'String',Presentation);
            set(handles.text3,'String','');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            axes(handles.axes2);
            cla reset;
            set(gca,'visible','off');
            set(handles.edit6,'visible','off');
            set(handles.edit7,'visible','off');
            set(handles.Appliquer,'visible','off');
            set(handles.edit6,'string','');
            set(handles.edit7,'string','');
            %set(handles.edit8,'visible','ON');
            set(handles.text2,'HorizontalAlignment','left');
            set(handles.text2,'visible','on');
            msg=[""...
                "  [+]  Choix du filtre :"...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""];
            set(handles.text2,'String',msg);
            set(handles.OB_Choice,'visible','on');
            set(handles.Origine,'visible','on');
            set(handles.Bruitee,'visible','on');
            guidata(hObject, handles);

        case 5
            handles.OO=5;
            set(handles.OO_Choice,'visible','on');
            set(handles.Option1,'visible','on');
            set(handles.Option2,'visible','on');
            set(handles.Option1,'Value',1.0);
            set(handles.Option2,'Value',0.0);
            set(handles.Option1,'String','F.Laplacien');
            set(handles.Option2,'String','F.Sobel');
            
            
            
            
            
            b=4;
            handles.b=b;
            set(handles.text15,'visible','on');
            set(handles.Save_Result,'visible','off');
            Presentation={'   - FILTRES DE REHAUSSEMENT  permettent généralement de :',...
                '          [+] Réduire le flou dans l''image (augmenter la netteté).',...
                '          [+] Détecter les contours dans l''image (description de l’image par ses contours).'};
            set(handles.text1,'String',Presentation);
            set(handles.text3,'String','');
            set(handles.text4,'visible','off');
            set(handles.text5,'visible','off');
            set(handles.OB_Choice,'visible','off');
            set(handles.Origine,'visible','off');
            set(handles.Bruitee,'visible','off');
            axes(handles.axes2);
            cla reset;
            set(gca,'visible','off');
            set(handles.edit6,'visible','of');
            set(handles.edit7,'visible','off');
            set(handles.Appliquer,'visible','on');
            set(handles.edit8,'visible','off');
            set(handles.text2,'visible','on');
            set(handles.text2,'HorizontalAlignment','left');
            msg=[""...
                "  [+]  Choix du filtre :"...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""...
                ""];
            set(handles.text2,'String',msg);
            guidata(hObject, handles);
    end
end    








% --- Executes during object creation, after setting all properties.
function Menu_Spacial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menu_Spacial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text1 as text
%        str2double(get(hObject,'String')) returns contents of text1 as a double


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in Origine.
function Origine_Callback(hObject, eventdata, handles)
% hObject    handle to Origine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OB=0;
I=handles.I;
if (OB==0)
            
elseif(OB==1)
    I= imnoise(I, 'salt & pepper',0.01);
end
handles.OB=OB;
handles.var=0;


% Appliquer_Callback(hObject, eventdata, handles);

MM=handles.MM;
OB=handles.OB;
if (MM==0)            %haha
    taille=str2double(get(handles.edit6,'String'));
    nbr=str2double(get(handles.edit7,'String'));
    if (isnan(taille) || isnan(nbr))
        audio();
        f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes : ',...
            '                   [+]   Taille',...
            '                   [+]   N.Répét'},'Error ...!!!');
        uiwait(f);
    else
        Resultat=Filtre_Moyenneur(I,taille,nbr);
        set(handles.text15,'visible','off');
        axes(handles.axes2);
        set(handles.axes2,'visible','on');
        set(handles.text15,'visible','off');
        imshow(Resultat);
        handles.Resultat=Resultat;
        set(handles.Save_Result,'visible','on');
%                 guidata(hObject, handles);
    %             title(['Application du filtre Moyenneur de taille_button ',num2str(taille_button),'x',num2str(taille_button),' avec ',num2str(nbr),' répétition']);
        if (OB==0)
%             handles.title={['filtre Moyenneur_taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répét sur ImgOri'};
            handles.title=['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image origine'];
            title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image non bruitée, on obtiendra comme résultat une version floutée de l''image origine.'};
            set(handles.text3,'String',Interpretation);
        elseif(OB==1)
            handles.title=['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image bruitée'];
            title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image bruitée, ce dernier annulle/réduit le taux de bruit dans cette image. '};
            set(handles.text3,'String',Interpretation);
        else
            handles.title=['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image origine'];
            title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
        end
    end
    
elseif (MM==1)
    taille=str2double(get(handles.edit6,'String'));
    nbr=str2double(get(handles.edit7,'String'));
    if (isnan(taille) || isnan(nbr))
        audio();
        f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes : ',...
            '                   [+]   Taille',...
            '                   [+]   N.Répét'},'Error ...!!!');
        uiwait(f);
    else
        Resultat = Filtre_Median(I,taille,nbr);
        set(handles.axes2,'visible','on');
        set(handles.text15,'visible','off');
        set(handles.text15,'visible','off');
        imshow(Resultat);  
        handles.Resultat=Resultat;
    %             title(['Application du filtre Median de taille_button ',num2str(taille_button),'x',num2str(taille_button),' avec ',num2str(nbr),' répétition']);
        if (OB==0)
            handles.title=['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image origine'];
            title({['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image non bruitée, on obtiendra comme résultat une version floutée de l''image origine.'};
            set(handles.text3,'String',Interpretation);
        elseif(OB==1)
            handles.title=['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image bruitée'];
            title({['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image bruitée, ce dernier annulle/réduit le taux de bruit dans cette image. '};
            set(handles.text3,'String',Interpretation);
        end
        set(handles.Save_Result,'visible','on');
    end
    
else
    audio();
    f = errordlg({'Erreur ! Merci de Selectionner un filtre de lissage valide',...
       '                   [+]   Filtre Moyenneur',...
       '                   [+]   Filtre Median'},'Error ...!!!');
    uiwait(f);
end
    





% Hint: get(hObject,'Value') returns toggle state of Origine
guidata(hObject, handles);

% --- Executes on button press in Bruitee.
function Bruitee_Callback(hObject, eventdata, handles)
% hObject    handle to Bruitee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OB=1;
handles.OB=OB;
handles.var=1;
I=handles.I;
if (OB==0)
            
elseif(OB==1)
    I= imnoise(I, 'salt & pepper',0.01);
end

MM=handles.MM;
OB=handles.OB;
if (MM==0)            %haha
    taille=str2double(get(handles.edit6,'String'));
    nbr=str2double(get(handles.edit7,'String'));
    if (isnan(taille) || isnan(nbr))
        audio();
        f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes : ',...
            '                   [+]   Taille',...
            '                   [+]   N.Répét'},'Error ...!!!');
        uiwait(f);
    else
        Resultat=Filtre_Moyenneur(I,taille,nbr);
        axes(handles.axes2);
        set(handles.axes2,'visible','on');
        set(handles.text15,'visible','off');
        imshow(Resultat);
        handles.Resultat=Resultat;
        set(handles.Save_Result,'visible','on');
        if (OB==0)
            handles.title=['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image origine'];
            title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image non bruitée, on obtiendra comme résultat une version floutée de l''image origine.'};
            set(handles.text3,'String',Interpretation);
        elseif(OB==1)
            handles.title=['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image bruitée'];
            title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image bruitée, ce dernier annulle/réduit le taux de bruit dans cette image. '};
            set(handles.text3,'String',Interpretation);
        else
            handles.title=['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image origine'];
            title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
        end
    end
    
elseif (MM==1)
    taille=str2double(get(handles.edit6,'String'));
    nbr=str2double(get(handles.edit7,'String'));
    if (isnan(taille) || isnan(nbr))
        audio();
        f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes : ',...
            '                   [+]   Taille',...
            '                   [+]   N.Répét'},'Error ...!!!');
        uiwait(f);
    else
        Resultat = Filtre_Median(I,taille,nbr);
        set(handles.axes2,'visible','on');
        set(handles.text15,'visible','off');
        imshow(Resultat);  
        handles.Resultat=Resultat;
    %             title(['Application du filtre Median de taille_button ',num2str(taille_button),'x',num2str(taille_button),' avec ',num2str(nbr),' répétition']);
        if (OB==0)
            handles.title=['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image origine'];
            title({['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image non bruitée, on obtiendra comme résultat une version floutée de l''image origine.'};
            set(handles.text3,'String',Interpretation);
        elseif(OB==1)
            handles.title=['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition sur image bruitée'];
            title({['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'});
            Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image bruitée, ce dernier annulle/réduit le taux de bruit dans cette image. '};
            set(handles.text3,'String',Interpretation);
        end
        set(handles.Save_Result,'visible','on');
    end
    
else
    audio();
    f = errordlg({'Erreur ! Merci de Selectionner un filtre de lissage valide',...
       '                   [+]   Filtre Moyenneur',...
       '                   [+]   Filtre Median'},'Error ...!!!');
    uiwait(f);
end
% Hint: get(hObject,'Value') returns toggle state of Bruitee
guidata(hObject, handles);


% --- Executes on button press in F_Laplacien.
function F_Laplacien_Callback(hObject, eventdata, handles)
% hObject    handle to F_Laplacien (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LS=0;
handles.LS=LS;
set(handles.text15,'visible','on');
set(handles.text3,'String','');
set(handles.text4,'visible','off');
set(handles.text5,'visible','off');
set(handles.edit6,'String','');
set(handles.Save_Result,'visible','off');
set(handles.text5,'String','');
axes(handles.axes2);
cla reset;
set(gca,'visible','off');

msg=[""...
    "  [+]  Choix du filtre :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "  [+]  Choix de matrice :"...
    ""...
    "        matrice :"...
    ""...
    ""...
    ""];
set(handles.text2,'string',msg);

k=0;
while (k==0)
    k = menu('Merci de choisir quel filtre voulez vous éffectuer : ',...
        'w1 = [0  1 1 ; 1 -4  1; 0  1  0]',...
        'w2 = [0 -1 0 ; 1  4 -1; 1 -1  0]',...
        'w3 = [1  1 1 ; 1 -8  1; 1  1  1]',...
        'w4 = [1 -1 -1; 1  8 -1; 1 -1 -1]',...
        'Annuler');
end
if (k==1 || k==2 || k==3 || k==4)
    set(handles.edit6,'String',k);
else 
end

if (k==1)
    matrice=["0  1  1",...
        "1 -4  1",...
        "0  1  0"];
elseif (k==2)
    matrice=["0 -1  0",...
        "1  4 -1",...
        "1 -1  0"];
elseif (k==3)
    matrice=["1  1  1",...
        "1 -8  1",...
        "1  1  1"];
elseif (k==4)
    matrice=["1 -1 -1",...
        "1  8 -1",...
        "1 -1 -1"];
end
if (k==1 || k==2 || k==3 || k==4)
    set(handles.text4,'String',matrice);
    set(handles.text4,'visible','on');
else 
end

handles.k=k;

set(handles.edit8,'String','');
% Hint: get(hObject,'Value') returns toggle state of F_Laplacien
guidata(hObject, handles);

% --- Executes on button press in F_Sobel.
function F_Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to F_Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LS=1;
handles.LS=LS;
set(handles.text15,'visible','on');
set(handles.text3,'String','');
set(handles.text4,'visible','off');
set(handles.text5,'visible','off');
set(handles.edit6,'String','');
set(handles.Save_Result,'visible','off');
set(handles.text5,'String','');
axes(handles.axes2);
cla reset;
set(gca,'visible','off');

msg=[""...
    "  [+]  Choix du filtre :"...
    ""...
    ""...
    ""...
    ""...
    ""...
    ""...
    "  [+]  Choix de matrice :"...
    ""...
    "        matrice :"...
    ""...
    ""...
    ""];
set(handles.text2,'string',msg);


k=0;
while (k==0)
    k = menu('Merci de choisir quel filtre voulez vous éffectuer : ',...
    'ws1 = [ 1  0 -1 ; 2  0 -2; 1  0  -1]',...
    'ws2 = [ 1  2  1 ; 0  0  0;-1 -2  -1]',...
    'Annuler');
end
if (k==1 || k==2)
    set(handles.edit6,'String',k);
else 
end

if (k==1)
    matrice=["0  1 1",...
        "2 0 -2",...
        "1  0  -1"];
elseif (k==2)
    matrice=[" 1  2  1",...
        "0  0  0",...
        "-1 -2  -1"];
end
if (k==1 || k==2)
    set(handles.text4,'String',matrice);
    set(handles.text4,'visible','on');
else 
   
end

handles.k=k;

set(handles.edit8,'String','');

% Hint: get(hObject,'Value') returns toggle state of F_Sobel
guidata(hObject, handles);

% --- Executes on button press in Appliquer.
function Appliquer_Callback(hObject, eventdata, handles)
% hObject    handle to Appliquer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;

if (a==1)
    %Échantillonnage et quantification
    I=handles.I;
    I = rgb2gray(I);
    EQ=handles.EQ;
    if (EQ==0)
        n=str2double(get(handles.edit8,'String'));
        if (isnan(n))
            audio();
            f = errordlg({'Erreur ! Merci de Saisir la valeur suivante :',...
                '          [+]   Nombre des échatillons'});
            uiwait(f);
        else
%             I_Echantillonne = Echantillonnage(I,n);
            Resultat = Echantillonnage(I,n);
            handles.Resultat=Resultat;
            set(handles.text15,'visible','off');
            axes(handles.axes2);
            set(handles.axes2,'visible','on');
            imshow(uint8(Resultat));
            handles.title=['Image échantillonage avec ',num2str(n),' échantillons'];
            title(['Image échantillonage avec ',num2str(n),' échantillons']);
            Interpretation="[+] On remarque bien que l'échantillonage permet de reduire la distribution des niveaux de gris.";
            set(handles.text3,'String',Interpretation);
            set(handles.Save_Result,'visible','on');
            guidata(hObject, handles);
        end
    elseif (EQ==1)
        nbr_Niveau_gris=str2double(get(handles.edit8,'String'));
        if (isnan(nbr_Niveau_gris))
            audio();
            f = errordlg({'Erreur ! Merci de Saisir le valeur suivante :',...
                '          [+]   Nombre de niveaux de gris'});
            uiwait(f);
        else
%             [Resultat, map]= gray2ind(I, nbr_Niveau_gris);
            [Resultat, map]=Quantification(I,nbr_Niveau_gris);
            handles.Resultat=Resultat;
            set(handles.text15,'visible','off');
            axes(handles.axes2);
            set(handles.axes2,'visible','on');
            imshow(Resultat);
            handles.title=['Image quantifié avec ',num2str(nbr_Niveau_gris),' niveaux de gris'];
            title(['Image quantifié avec ',num2str(nbr_Niveau_gris),' niveaux de gris']);
            Interpretation="[+] On remarque bien que la quantification permet de reduire les niveaux de gris.";
            set(handles.text3,'String',Interpretation);
            set(handles.Save_Result,'visible','on');
            guidata(hObject, handles);
            
        end
        
    else
        audio();
        f = errordlg({'Erreur ! Merci de Sélectionner Quelle application voulez vous effectuer :',...
            '          [+]   Echantillonage',...
            '          [+]   Quantification'...
            },'Error ...!!!');
        uiwait(f);
    end
    
elseif (a==2)
    %Conversion couleur --> niveaux de gris
    I=handles.I;
    Resultat = rgb2gray(I);
    set(handles.text15,'visible','off');
    axes(handles.axes2);
    imshow(Resultat);
    handles.Resultat=Resultat;
    handles.title='Image non colorée (GRAY)';
    title('Image non colorée (GRAY)');
    msg="    [+] On remarque bien que la conversion de l'image colorée est devenu en mode noir et blanc. Ce qui montre l'utilité de cette transformation.";
    set(handles.text3,'String',msg);
    set(handles.Save_Result,'visible','on');
    guidata(hObject, handles);
    
    
    
elseif (a==3)
    I=handles.I;
    depart=get(handles.edit3,'String');
    arrivee=get(handles.edit2,'String');
    option=[depart,'2',arrivee];
    axes(handles.axes2);
    set(handles.axes2,'visible','on');
    er=1;
    %RGB2HSV
    if (strcmp(option,'rgb2hsv'))
        img=rgb2hsv(I);
    elseif (strcmp(option,'hsv2rgb'))
        img=hsv2rgb(I);
    %RGB2GRAY    
    elseif (strcmp(option,'rgb2gray'))
        img=rgb2gray(I);
    %RGB2LAB    
    elseif (strcmp(option,'rgb2lab'))
        img=rgb2lab(I);
    elseif (strcmp(option,'lab2rgb'))
        img=lab2rgb(I);
    %RGB2YCbCr    
    elseif (strcmp(option,'rgb2ycbcr'))
        img=rgb2ycbcr(I);
    elseif (strcmp(option,'ycbcr2rgb'))
        img=ycbcr2rgb(I);
    %RGB2NTSC  
    elseif (strcmp(option,'rgb2ntsc'))
        img=rgb2ntsc(I);
    elseif (strcmp(option,'ntsc2rgb'))
        img=ntsc2rgb(I);
    elseif (strcmp(option,'rgb2rgb'))
        img=I;
    else
        set(handles.axes2,'visible','off');
        audio();
        f = errordlg({' [!] Merci de choisir une transformation valide'...
            'Vous avez le choix entre ces transformations :           '...
            'RGB ---> GRAY '...
            'RGB ---> HSV (ou inverse)'...
            'RGB ---> LAB (ou inverse)'...
            'RGB ---> NTSC (ou inverse)'...
            'RGB ---> YCbCr  (ou inverse)'},...
            '[!]  Error ...!!!');
        uiwait(f);
        er=0;
    end
    if(er==1)
        Resultat=img;
        set(handles.text15,'visible','off');
        imshow(Resultat);
        handles.Resultat=Resultat;
        handles.title=['Transformation d''image de ',depart,' vers ',arrivee];
        title(['Transformation d''image de ',depart,' vers ',arrivee]);
        Interpretation="    [+] On remarque bien que la distribution des couleurs se diffère d'un espace de couleur à autre. L'utilisation de ces espaces de couleurs dépend des differents applications efectuées .";
        set(handles.text3,'String',Interpretation);
        set(handles.Save_Result,'visible','on');
        guidata(hObject, handles);
    else
        
    end
    
    
elseif(a==4)
    b=handles.b;
    I=handles.I;
    if(b==1)
        % Logarithmique et de puissance
        LP=handles.LP;
        if (LP==0)
            cte=str2double(get(handles.edit6,'String'));
            if (isnan(cte))
                audio();
                f = errordlg({'Erreur ! Merci de Saisir la valeurs suivante :',...
                    '          [+]   Canstate'});
                uiwait(f);
            else
                Resultat=Logarithmique(I,cte);
                set(handles.text15,'visible','off');
                axes(handles.axes2);
                set(handles.axes2,'visible','on');
                imshow(Resultat); 
                handles.Resultat=Resultat;
                handles.title=['Transformation logarithmique avec canstante = ',num2str(cte)];
                title(['Transformation logarithmique avec canstante = ',num2str(cte)]);
                Interpretation={'    [+] On remarque bien que le fond de l''image obtenue comme résultat est vide, cela est invisible sur l''image origine.',...
                    '    [+] Plus que la canstante augmente plus que le fond devient plus vide.'};
                set(handles.text3,'String',Interpretation);
                set(handles.Save_Result,'visible','on');
                guidata(hObject, handles);
            end
                
        elseif (LP==1)
            gamma=str2double(get(handles.edit6,'String'));
            cte=str2double(get(handles.edit7,'String'));
            if (isnan(gamma) || isnan(cte))
                audio();
                f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes :',...
                    '          [+]   Gamma',...
                    '          [+]   Canstante'});
                uiwait(f);
            else
                Resultat=Puissance(I,gamma,cte);
                set(handles.text15,'visible','off');
                axes(handles.axes2);
                set(handles.axes2,'visible','on');
                imshow(Resultat);  
                handles.Resultat=Resultat;
                handles.title=['Transformation de puissance avec GAMMA = ',num2str(gamma),' et canstante = ',num2str(cte)];
                title(['Transformation de puissance avec GAMMA = ',num2str(gamma),' et canstante = ',num2str(cte)]);
                Interpretation={'    [+] On remarque bien que le changement du coefficient Gamma sert à adjuster le gain de puissance basé sur le niveaux de luminance. '};
                set(handles.text3,'String',Interpretation);
                set(handles.Save_Result,'visible','on');
                guidata(hObject, handles);
            end
            
        else
            audio();
            f = errordlg({'Erreur ! Merci de Selectionner une transformation valide ',...
                '             [+]   Lorgarithmique',...
                '             [+]   Puissance'},'Error ...!!!');
            uiwait(f);
        end

        
    elseif (b==2)
        % Par histogramme (étirement, recadrage)
        ER=handles.ER;
        if (ER==0)
            Min=0;
            Max=255;
            Resultat=Etirement(I,Min,Max);
            set(handles.text15,'visible','off');
            axes(handles.axes2);
            set(handles.axes2,'visible','on');
            imhist(Resultat);  
            title('Histograme etiré entre ');
            Interpretation={'    [+] pour une image dont les niveaux sont codés sur 8 bits, l''intervalle [a, b] de l''image d''entrée sera étiré jusqu’à l''intervalle [0, 255] pour celle de la sortie. '};
            set(handles.text3,'String',Interpretation);
            set(handles.Save_Result,'visible','off');
            
            
        elseif (ER==1)
            Min=str2double(get(handles.edit6,'String'));
            Max=str2double(get(handles.edit7,'String'));
            if (isnan(Min) || isnan(Max))
                audio();
                f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes :',...
                    '          [+]   Min',...
                    '          [+]   Max'});
                uiwait(f);
            else
                if (Min<0 || Min>255 || Max<0 || Max>255)
                    audio();
                    f = errordlg({'Erreur ! Merci de Saisir des valeurs valides à savoir que ',...
                        '          [+]    0 < Min < 255 ',...
                        '          [+]    0 < Max < 255 '});
                    set(handles.edit6,'String','');
                    set(handles.edit7,'String','');
                    uiwait(f);
                else
                    Resultat=Recadrage(I,Min,Max);
                    set(handles.text15,'visible','off');
                    axes(handles.axes2);
                    set(handles.axes2,'visible','on');
                    imhist(Resultat);  
                    title(['Histograme recadré entre ',num2str(Min),' et ',num2str(Max)]);
                    Interpretation={'    [+] On remarque bien que le recadrage permet de recadrer l''histogramme entre un intervale donné. '};
                    set(handles.text3,'String',Interpretation);
                    set(handles.Save_Result,'visible','off');
                end
            end
            
        else
            audio();
            f = errordlg({'Erreur ! Merci de Selectionner une Application d''histogramme valide ',...
                '                   [+]   Etirement',...
                '                   [+]   Recadrage'},'Error ...!!!');
            uiwait(f);
        end

        
    elseif (b==3)
        % Filtres de lissage (choix du filtre, de sa taille_button, ...)
%         MM=handles.MM;
%         OB=handles.OB;
%         %var=handles.var;
%         if (OB==0)
%             
%         elseif(OB==1)
%             I= imnoise(I, 'salt & pepper',0.01);
%         end
%         if (MM==0)            %haha
%             taille=str2double(get(handles.edit6,'String'));
%             nbr=str2double(get(handles.edit7,'String'));
%             if (isnan(taille) || isnan(nbr))
%                 audio();
%                 f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes : ',...
%                     '                   [+]   Taille',...
%                     '                   [+]   N.Répét'},'Error ...!!!');
%                 uiwait(f);
%             else
%                 Resultat=Filtre_Moyenneur(I,taille,nbr);
%                 handles.Resultat=Resultat;
%                 set(handles.text15,'visible','off');
%                 axes(handles.axes2);
%                 set(handles.axes2,'visible','on');
%                 imshow(Resultat);
%                 set(handles.Save_Result,'visible','on');
% %                 guidata(hObject, handles);
%     %             title(['Application du filtre Moyenneur de taille_button ',num2str(taille_button),'x',num2str(taille_button),' avec ',num2str(nbr),' répétition']);
%                 if (OB==0)
% %                     handles.title={['filtre Moyenneur_taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répét sur ImgOri'};
%                     handles.title='Moy';
%                     title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
%                     Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image non bruitée, on obtiendra comme une version floutée de l''image origine.'};
%                     guidata(hObject, handles);
%                 set(handles.text3,'String',Interpretation);
%                 elseif(OB==1)
%                     handles.title={['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'};
%                     title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'});
%                     Interpretation={'    [+] On remarque bien que lors d''application d''un filtre de lissage sur une image bruitée, ce dernier annulle/réduit le taux de bruit dans cette image. '};
% %                     guidata(hObject, handles);
%                 set(handles.text3,'String',Interpretation);
%                 else
%                     handles.title={['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'};
%                     title({['Application du filtre Moyenneur de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
% %                     guidata(hObject, handles);
%                 end
% %                 handles.title='amine';
%                 guidata(hObject, handles);
%                 
%                 
%             end
% 
%          elseif (MM==1)
%             taille=str2double(get(handles.edit6,'String'));
%             nbr=str2double(get(handles.edit7,'String'));
%             if (isnan(taille) || isnan(nbr))
%                 audio();
%                 f = errordlg({'Erreur ! Merci de Saisir les valeurs suivantes : ',...
%                     '                   [+]   Taille',...
%                     '                   [+]   N.Répét'},'Error ...!!!');
%                 uiwait(f);
%             else
%                 Resultat = Filtre_Median(I,taille,nbr);
%                 set(handles.axes2,'visible','on');
%                 set(handles.text15,'visible','off');
%                 imshow(Resultat);  
%                 handles.Resultat=Resultat;
%     %             title(['Application du filtre Median de taille_button ',num2str(taille_button),'x',num2str(taille_button),' avec ',num2str(nbr),' répétition']);
%                 if (OB==0)
%                     handles.title={['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'};
%                     title({['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image origine'});
%                 elseif(OB==1)
%                     handles.title={['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'};
%                     title({['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr)],' répétition sur image bruitée'});
%                 end
%                 Interpretation={'    [+] '};
%                 set(handles.text3,'String',Interpretation);
%                 set(handles.Save_Result,'visible','on');
%             end
%             
% 
%         else
%             audio();
%             f = errordlg({'Erreur ! Merci de Selectionner un filtre de lissage valide',...
%                 '                   [+]   Filtre Moyenneur',...
%                 '                   [+]   Filtre Median'},'Error ...!!!');
%             uiwait(f);
%         end
        
    elseif (b==4)
        % Filtres de rehaussement.
        LS=handles.LS;
        if (LS==0)
            % Filtre laplacien
            wa=str2double(get(handles.edit6,'String'));
            if (wa==1)
                w = [0  1 1 ; 1 -4  1; 0  1  0];
            elseif (wa==2)
                w = [0 -1 0 ; 1  4 -1; 1 -1  0];
            elseif (wa==3)
                w = [1  1 1 ; 1 -8  1; 1  1  1];
            elseif (wa==4)
                w = [1 -1 -1; 1  8 -1; 1 -1 -1];
            else
                F_Laplacien_Callback(hObject, eventdata, handles)
            end
            k=handles.k;
            if (k~=5)

                Resultat = imfilter(I,w);
                set(handles.text15,'visible','off');
                axes(handles.axes2);
                set(handles.axes2,'visible','on');
                imshow(Resultat);
                handles.Resultat=Resultat;
                title('Application du filtre laplacien en utilisant la matrice :');
                Interpretation={'    [+] les résultats de l''application de ce filtre se diffèrent d''une matrice a autre, mais généralement ils ont un but commun.','        C''est qu''ils augmentent la nétteté des images'};
                set(handles.text3,'String',Interpretation);
                if (wa==1)
                    matrice=["0  1  1",...
                        "1 -4  1",...
                        "0  1  0"];
                    handles.title='Application du filtre laplacien en utilisant la matrice w1';
                elseif (wa==2)
                    matrice=["0 -1  0",...
                        "1  4 -1",...
                        "1 -1  0"];
                    handles.title='Application du filtre laplacien en utilisant la matrice w2';
                elseif (wa==3)
                    matrice=["1  1  1",...
                        "1 -8  1",...
                        "1  1  1"];
                    handles.title='Application du filtre laplacien en utilisant la matrice w3';
                elseif (wa==4)
                    matrice=["1 -1 -1",...
                        "1  8 -1",...
                        "1 -1 -1"];
                    handles.title='Application du filtre laplacien en utilisant la matrice w4';
                end
                guidata(hObject, handles);
                set(handles.text5,'String',matrice);
                set(handles.text5,'visible','on');

            end
        elseif (LS==1)
            % Filtre Sobel
            wa=str2double(get(handles.edit6,'String'));
            if (wa==1)
                w = [1 0 -1 ; 2 0 -2; 1  0  -1];
            elseif (wa==2)
                w = [1 2 1 ; 0  0 0; -1 -2  -1];
            else
                F_Sobel_Callback(hObject, eventdata, handles)
            end
            k=handles.k;
            if (k~=3)
                Resultat = imfilter(I,w);
                set(handles.text15,'visible','off');
                axes(handles.axes2);
                set(handles.axes2,'visible','on');
                imshow(Resultat);
                handles.Resultat=Resultat;
                title('Application du filtre Sobel en utilisant la matrice :');
                Interpretation={'    [+] L''application de ce filtre génère une detection de contour de l''image',...
                       'on explique l''existante de deux matrices par leur roles lié aux deux axes X et Y.'};
                set(handles.text3,'String',Interpretation);
                set(handles.Save_Result,'visible','on');
                if (wa==1)
                    matrice=["0  1  1",...
                        "2  0 -2",...
                        "1  0 -1"];
                    handles.title='Application du filtre Sobel en utilisant la matrice ws1 ';
                elseif (wa==2)
                    matrice=[" 1  2  1",...
                        "0  0  0",...
                        "-1 -2 -1"];
                    handles.title='Application du filtre Sobel en utilisant la matrice ws2 ';
                end
                
                guidata(hObject, handles);
                set(handles.text5,'String',matrice);
                set(handles.text5,'visible','on');
            end
            
        else
            audio();
            f = errordlg({'Erreur ! Merci de Selectionner un filtre de lissage valide',...
                '                   [+]   Filtre Laplacien',...
                '                   [+]   Filtre Sobel'},'Error ...!!!');
            uiwait(f);
        end
        set(handles.Save_Result,'visible','on');
    end

end



function edit3_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function Consulter_Fonctions_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function Contacter_nous_Callback(hObject, eventdata, handles)
logo=imread('Contact.png');
    f = msgbox({'- Gmail : AABDELLAOUI322@GMAIL.COM'; ...
                '- Compte academique : AMINE_ABDELLAOUIMAANE@UM5.AC.MA'; ...
                '- LinKedIn : ABDALAOUI MAAN AMINE'}, ...
                'Contact','custom',logo);
            uiwait(f);


% --------------------------------------------------------------------
function Information_Callback(hObject, eventdata, handles)
run('Information');


% --------------------------------------------------------------------
function Axes_Origine_Clear_Callback(hObject, eventdata, handles)
set(handles.axes1,'visible','off');
axes(handles.axes1);
cla reset;
set(handles.axes1,'visible','off');
set(handles.text14,'visible','on');


% --------------------------------------------------------------------
function Axes_Result_Clear_Callback(hObject, eventdata, handles)
set(handles.axes2,'visible','off');
axes(handles.axes2);
cla reset;
set(handles.axes2,'visible','off');
set(handles.text15,'visible','on');

% --------------------------------------------------------------------
function Clear_All_Axes_Callback(hObject, eventdata, handles)
set(handles.axes1,'visible','off');
axes(handles.axes1);
cla reset;
set(handles.axes1,'visible','off');
set(handles.text14,'visible','on');
set(handles.axes2,'visible','off');
axes(handles.axes2);
cla reset;
set(handles.axes2,'visible','off');
set(handles.text15,'visible','on');

% --------------------------------------------------------------------
function Ouvrir_Callback(hObject, eventdata, handles)
    [file,path,indx] = uigetfile();
    open(file);
    
    


% --------------------------------------------------------------------
function Fermer_Callback(hObject, eventdata, handles)
close(ABDALLAOUI_MAAN_AMINE_INTERFACE_GRAPHIQUE_TNI);



% --------------------------------------------------------------------
function Sauvegarder_Callback(hObject, eventdata, handles)
    [filename, pathname, filterindex] = uiputfile( ...
       {'*.m;*.fig;*.mat;*.mdl', 'All MATLAB Files (*.m, *.fig, *.mat, *.mdl)';
        '*.m',  'MATLAB Code (*.m)'; ...
        '*.fig','Figures (*.fig)'; ...
        '*.mat','MAT-files (*.mat)'; ...
        '*.mdl','Models (*.mdl)'; ...
        '*.*',  'All Files (*.*)'}, ...
        'Save as');
    save(filename);






function edit6_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in Plus_Info.
function Plus_Info_Callback(hObject, eventdata, handles)
logo=imread('Info.jpg');
f = msgbox({'[+]  Transformation que vous pouvez utiliser'; ...
                '           RGB ---> GRAY '; ...
                '           RGB ---> HSV (ou inverse)';...
                '           RGB ---> LAB (ou inverse)';...
                '           RGB ---> NTSC (ou inverse)';...
                '           RGB ---> YCbCr  (ou inverse)'},...
                'Types de transformations des espaces de couleurs','custom',logo);            
uiwait(f);


% --- Executes during object creation, after setting all properties.
function LogPui_Choice_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function MM_Choice_CreateFcn(hObject, eventdata, handles)

function edit8_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function OB_Choice_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)


% --- Executes on button press in Option1.
function Option1_Callback(hObject, eventdata, handles)
% hObject    handle to Option1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OO=handles.OO;
if (OO==1)
    %Echatillonnage@
    EQ=0;
    handles.EQ=EQ;
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');
    set(handles.text15,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.Option1,'String','Echantillonnage');
    set(handles.Option2,'String','Quantification');
    set(handles.text2,'HorizontalAlignment','left');
    set(handles.edit8,'visible','on');
    set(handles.edit2,'String','');
    set(handles.edit8,'String','');
    set(handles.text3,'String','');

    msg=["",...
        "  [+] Application"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "  [+] Le nombre des "...
        "                     échantillons:"...
        ""...
        ""];
    set(handles.text2,'String',msg);


    guidata(hObject, handles);
    
elseif (OO==2)
    %Logarithmique@
    LP=0;
    handles.LP=LP;
    set(handles.text3,'String','');
    set(handles.text15,'visible','on');
    set(handles.edit6,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.edit7,'visible','off');
    set(handles.edit6,'string','');
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');

    msg=[""...
        "   [+] Transformation :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "   [+]  Coeficients"...
        ""...
        "   Canstante :"...
        ""...
        ""...
        ""];
    set(handles.text2,'String',msg);

    guidata(hObject, handles);
    
    

elseif (OO==3)
    %Etirement@
    ER=0;
    handles.ER=ER;
    I=handles.I;
    [l,c,canal]=size(I);
    if (canal == 3)
        I=rgb2gray(I);
    elseif (canal == 1)

    end
    set(handles.edit6,'visible','on');
    set(handles.edit7,'visible','on');
    set(handles.text15,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.edit6,'String',min(min(I)));
    set(handles.edit7,'String',max(max(I)));
    set(handles.text3,'String','');
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');

    msg=[""...
        "   [+] Application :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "   [+]  L'intervale de votre image :"...
        ""...
        "        Min :"...
        ""...
        "        Max :"...
        ""];
    set(handles.text2,'String',msg);

    guidata(hObject, handles);
    
    
    
    
    
elseif (OO==4)
    %F_Moyenneur@
    MM=0;
    handles.MM=MM;
    set(handles.text3,'String','');
    set(handles.text15,'visible','on');
    set(handles.edit6,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.edit7,'visible','on');
    set(handles.edit6,'string','');
    set(handles.edit7,'string','');

    msg=[""...
        "  [+]  Choix du filtre :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "  [+]  Taille et nombre de répétition du filtre :"...
        ""...
        "        Taille :"...
        ""...
        "     N.répét :"...
        ""];
    set(handles.text2,'String',msg);

    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off')
    guidata(hObject, handles);
    
    
    
elseif(OO==5)
    %F_Laplacien@
    LS=0;
    handles.LS=LS;
    set(handles.text15,'visible','on');
    set(handles.text3,'String','');
    set(handles.text4,'visible','off');
    set(handles.text5,'visible','off');
    set(handles.edit6,'String','');
    set(handles.Save_Result,'visible','off');
    set(handles.text5,'String','');
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');

    msg=[""...
        "  [+]  Choix du filtre :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "  [+]  Choix de matrice :"...
        ""...
        "        matrice :"...
        ""...
        ""...
        ""];
    set(handles.text2,'string',msg);

    k=0;
    while (k==0)
        k = menu('Merci de choisir quel filtre voulez vous éffectuer : ',...
        'w1 = [0  1 1 ; 1 -4  1; 0  1  0]',...
        'w2 = [0 -1 0 ; 1  4 -1; 1 -1  0]',...
        'w3 = [1  1 1 ; 1 -8  1; 1  1  1]',...
        'w4 = [1 -1 -1; 1  8 -1; 1 -1 -1]',...
        'Annuler');
    end
    if (k==1 || k==2 || k==3 || k==4)
        set(handles.edit6,'String',k);
    else 
    end

    if (k==1)
        matrice=["0  1  1",...
            "1 -4  1",...
            "0  1  0"];
    elseif (k==2)
        matrice=["0 -1  0",...
            "1  4 -1",...
            "1 -1  0"];
    elseif (k==3)
        matrice=["1  1  1",...
            "1 -8  1",...
            "1  1  1"];
    elseif (k==4)
        matrice=["1 -1 -1",...
            "1  8 -1",...
            "1 -1 -1"];
    end
    if (k==1 || k==2 || k==3 || k==4)
        set(handles.text4,'String',matrice);
        set(handles.text4,'visible','on');
    else 
    end

    handles.k=k;

    set(handles.edit8,'String','');
    % Hint: get(hObject,'Value') returns toggle state of F_Laplacien
    guidata(hObject, handles);
    
    
    
    
end

% Hint: get(hObject,'Value') returns toggle state of Option1


% --- Executes on button press in Option2.
function Option2_Callback(hObject, eventdata, handles)
% hObject    handle to Option2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OO=handles.OO;
if (OO==1)
    %Quantification@
    EQ=1;
    handles.EQ=EQ;
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');
    set(handles.text15,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.text2,'HorizontalAlignment','left');
    set(handles.edit8,'visible','on');
    set(handles.edit3,'String','');
    set(handles.edit8,'String','');
    set(handles.text3,'String','');

    msg=["",...
        "  [+] Application"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "  [+] Le nombre de niveaux"...
        "     de gris :"...
        ""...
        ""...
        ""];
    set(handles.text2,'String',msg);

    guidata(hObject, handles);
    
elseif (OO==2)
    %Puissance@
    LP=1;
    handles.LP=LP;
    set(handles.text3,'String','');
    set(handles.text15,'visible','on');
    set(handles.edit6,'visible','on');
    set(handles.edit7,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.edit6,'string','');
    set(handles.edit7,'string','');
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');

    msg=[""...
        "   [+] Transformation :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "   [+]  Coeficients"...
        ""...
        "   Gamma :"...
        ""...
        "   Canstante :"...
        ""];
    set(handles.text2,'string',msg);

    guidata(hObject, handles);
    

elseif (OO==3)
    %Recadrage@
    ER=1;
    handles.ER=ER;
    set(handles.text3,'String','');
    set(handles.edit6,'visible','on');
    set(handles.edit7,'visible','on');
    set(handles.text15,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.edit6,'string','');
    set(handles.edit7,'string','');
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');

    msg=[""...
        "   [+] Application :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "   [+]  Coeficients"...
        ""...
        "        Min :"...
        ""...
        "        Max :"...
        ""];
    set(handles.text2,'String',msg);

    guidata(hObject, handles);
    
    
    
    
    
elseif (OO==4)
    %F_Median@
    MM=1;
    handles.MM=MM;
    set(handles.text3,'String','');
    set(handles.text15,'visible','on');
    set(handles.Save_Result,'visible','off');
    set(handles.edit6,'visible','on');
    set(handles.edit7,'visible','on');
    set(handles.edit6,'string','');
    set(handles.edit7,'string','');

    msg=[""...
        "  [+]  Choix du filtre :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "  [+]  Taille et nombre de répétition du filtre :"...
        ""...
        "        Taille :"...
        ""...
        "     N.répét :"...
        ""];
    set(handles.text2,'String',msg);

    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off')
    % Hint: get(hObject,'Value') returns toggle state of F_Median
    guidata(hObject, handles);
    
    
    
elseif(OO==5)
    %F_Sobel@
    LS=1;
    handles.LS=LS;
    set(handles.text15,'visible','on');
    set(handles.text3,'String','');
    set(handles.text4,'visible','off');
    set(handles.text5,'visible','off');
    set(handles.edit6,'String','');
    set(handles.Save_Result,'visible','off');
    set(handles.text5,'String','');
    axes(handles.axes2);
    cla reset;
    set(gca,'visible','off');

    msg=[""...
        "  [+]  Choix du filtre :"...
        ""...
        ""...
        ""...
        ""...
        ""...
        ""...
        "  [+]  Choix de matrice :"...
        ""...
        "        matrice :"...
        ""...
        ""...
        ""];
    set(handles.text2,'string',msg);


    k=0;
    while (k==0)
        k = menu('Merci de choisir quel filtre voulez vous éffectuer : ',...
        'ws1 = [ 1  0 -1 ; 2  0 -2; 1  0  -1]',...
        'ws2 = [ 1  2  1 ; 0  0  0;-1 -2  -1]',...
        'Annuler');
    end
    if (k==1 || k==2)
        set(handles.edit6,'String',k);
    else 
    end

    if (k==1)
        matrice=["0  1 1",...
            "2 0 -2",...
            "1  0  -1"];
    elseif (k==2)
        matrice=[" 1  2  1",...
            "0  0  0",...
            "-1 -2  -1"];
    end
    if (k==1 || k==2)
        set(handles.text4,'String',matrice);
        set(handles.text4,'visible','on');
    else 

    end

    handles.k=k;

    set(handles.edit8,'String','');

    % Hint: get(hObject,'Value') returns toggle state of F_Sobel
    guidata(hObject, handles);
    
    
    
    
end


% Hint: get(hObject,'Value') returns toggle state of Option2



% --- Executes on button press in Save_Result.
function Save_Result_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Resultat=handles.Resultat;
title=handles.title;
[filename, foldername] = uiputfile(...
    {'*.jpg','JPG File (*.jpg)';...
        '*.png',  'PNG File (*.png)'; ...
        '*.tif','TIF File (*.tif)'; ...
        '*.bmp','BMP File (*.bmp)'; ...
        '*.jpeg','JPEG File (*.jpeg)';...
        '*.*',  'All Files (*.*)'}, ...
        'Save as',title);
if (filename ~= 0)
    complete_name = fullfile(foldername, filename);
    imwrite(Resultat, complete_name);
else
    
end


% --------------------------------------------------------------------
function Echantillonnage_F_Callback(hObject, eventdata, handles)
% hObject    handle to Echantillonnage_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Echantillonnage')

% --------------------------------------------------------------------
function Quantification_F_Callback(hObject, eventdata, handles)
% hObject    handle to Quantification_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Quantification')

% --------------------------------------------------------------------
function Logarithmique_F_Callback(hObject, eventdata, handles)
% hObject    handle to Logarithmique_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Logarithmique');

% --------------------------------------------------------------------
function Puissance_F_Callback(hObject, eventdata, handles)
% hObject    handle to Puissance_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Puissance');

% --------------------------------------------------------------------
function Etirement_F_Callback(hObject, eventdata, handles)
% hObject    handle to Etirement_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Etirement');

% --------------------------------------------------------------------
function Recadrage_F_Callback(hObject, eventdata, handles)
% hObject    handle to Recadrage_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Recadrage')

% --------------------------------------------------------------------
function Moyenneur_F_Callback(hObject, eventdata, handles)
% hObject    handle to Moyenneur_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Filtre_Moyenneur')

% --------------------------------------------------------------------
function Median_F_Callback(hObject, eventdata, handles)
% hObject    handle to Median_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Filtre_Median')

% --------------------------------------------------------------------
function Traitement_d_Amelioration_spaciale_F_Callback(hObject, eventdata, handles)
% hObject    handle to Traitement_d_Amelioration_spaciale_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Lissage_F_Callback(hObject, eventdata, handles)
% hObject    handle to Lissage_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
