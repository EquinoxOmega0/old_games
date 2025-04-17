unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, game, ComCtrls, ExtDlgs, Spin, mapedit, jpeg;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    Shape1: TShape;
    Label2: TLabel;
    ColorDialog1: TColorDialog;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    Image1: TImage;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Shape2: TShape;
    Label9: TLabel;
    Image2: TImage;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit2: TEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Shape3: TShape;
    Label16: TLabel;
    Image3: TImage;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Edit3: TEdit;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    Shape4: TShape;
    Label23: TLabel;
    Image4: TImage;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Edit4: TEdit;
    GroupBox6: TGroupBox;
    Label29: TLabel;
    Shape5: TShape;
    Label30: TLabel;
    Image5: TImage;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    Edit5: TEdit;
    GroupBox7: TGroupBox;
    Label36: TLabel;
    Shape6: TShape;
    Label37: TLabel;
    Image6: TImage;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    Edit6: TEdit;
    GroupBox8: TGroupBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox2: TCheckBox;
    Label13: TLabel;
    Label14: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    CheckBox3: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    CheckBox4: TCheckBox;
    Label27: TLabel;
    Label28: TLabel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    CheckBox5: TCheckBox;
    Label34: TLabel;
    Label35: TLabel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    CheckBox6: TCheckBox;
    Label41: TLabel;
    Label42: TLabel;
    TrackBar1: TTrackBar;
    Label43: TLabel;
    Label44: TLabel;
    Shape7: TShape;
    Timer1: TTimer;
    OpenPictureDialog1: TOpenPictureDialog;
    SpinEdit1: TSpinEdit;
    Label45: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Image7: TImage;
    Panel4: TPanel;
    GroupBox9: TGroupBox;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    RadioButton22: TRadioButton;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    CheckBox16: TCheckBox;
    RadioButton23: TRadioButton;
    RadioButton24: TRadioButton;
    RadioButton25: TRadioButton;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    GroupBox10: TGroupBox;
    RadioButton26: TRadioButton;
    RadioButton27: TRadioButton;
    Label46: TLabel;
    procedure Panel6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel19Click(Sender: TObject);
    procedure Panel20Click(Sender: TObject);
    procedure Panel21Click(Sender: TObject);
    procedure Panel18Click(Sender: TObject);
    procedure Panel17Click(Sender: TObject);
    procedure Panel24Click(Sender: TObject);
    procedure Panel25Click(Sender: TObject);
    procedure Panel26Click(Sender: TObject);
    procedure Panel23Click(Sender: TObject);
    procedure Panel22Click(Sender: TObject);
    procedure Panel29Click(Sender: TObject);
    procedure Panel30Click(Sender: TObject);
    procedure Panel31Click(Sender: TObject);
    procedure Panel28Click(Sender: TObject);
    procedure Panel27Click(Sender: TObject);
    procedure Panel34Click(Sender: TObject);
    procedure Panel35Click(Sender: TObject);
    procedure Panel36Click(Sender: TObject);
    procedure Panel33Click(Sender: TObject);
    procedure Panel32Click(Sender: TObject);
    procedure keylesstart;
    procedure Timer1Timer(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      function tastenwert(k:byte):String;
      procedure tastreturn;
    procedure Panel3Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Shape6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      procedure Bildschirmvoll;
      procedure Bildschirmnormal;
    procedure Panel4Click(Sender: TObject);
    procedure RadioButton19Click(Sender: TObject);
    procedure RadioButton20Click(Sender: TObject);
    procedure RadioButton21Click(Sender: TObject);
    procedure RadioButton22Click(Sender: TObject);
    procedure Spracheander;
    procedure checksprache;
    procedure RadioButton26Click(Sender: TObject);
    procedure RadioButton27Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
   { type ttast=record
  daten:array[0..5,0..4] of byte
  end;    }

var
  Form1: TForm1;
   tasten:ttast;
   selpos:integer;

      ddevmode,ddd,dzz:TDevMode;
  dd:integer;                    //Bildschirm Variablen
  ddc:hdc;
  dscrx,dscry,dfarb:integer;
  sprache:integer;

implementation

uses intro;

{$R *.dfm}

 procedure TForm1.Bildschirmvoll;
    begin               //full screen
       ddc:=getdc(0);
dfarb:=1 shl getdevicecaps(ddc, Bitspixel);
releaseDC(0,ddc);
dscrx:=screen.width;
dscry:=screen.height;


ddevmode.dmsize:=Sizeof(TDevmode);
ddevmode.dmdriverextra:=0;
dd:=0;


while EnumDisplaySettings(nil,dd,ddevmode)  do

begin

inc(dd);
if (ddevmode.dmpelswidth=1024) and (ddevmode.dmpelsheight=768) and ((1 shl ddevmode.dmbitsperpel)=65536)
then
begin
ddd:=ddevmode;
end;

if (ddevmode.dmpelswidth=dscrx) and (ddevmode.dmpelsheight=dscry) and ((1 shl ddevmode.dmbitsperpel)=dfarb)
then
begin
dzz:=ddevmode;
end;

end;

  changedisplaySettings(Tdevmode(ddd),0);




    end;


        procedure TForm1.Bildschirmnormal;
    begin               //full screen
      changedisplaySettings(Tdevmode(dzz),0);

    end;


procedure TForm1.Panel6Click(Sender: TObject);
begin
form3.close; //Programm beenden
end;

procedure TForm1.FormCreate(Sender: TObject);
begin


selpos:=-1;

tasten.daten[0,0]:=49;
tasten.daten[0,1]:=81;
tasten.daten[0,2]:=112;
tasten.daten[0,3]:=50;
tasten.daten[0,4]:=87;

tasten.daten[1,0]:=89;
tasten.daten[1,1]:=88;
tasten.daten[1,2]:=16;
tasten.daten[1,3]:=83;
tasten.daten[1,4]:=65;

tasten.daten[2,0]:=78;
tasten.daten[2,1]:=77;
tasten.daten[2,2]:=18;
tasten.daten[2,3]:=74;
tasten.daten[2,4]:=75;

tasten.daten[3,0]:=37;
tasten.daten[3,1]:=39;
tasten.daten[3,2]:=40;
tasten.daten[3,3]:=17;
tasten.daten[3,4]:=38;

tasten.daten[4,0]:=97;
tasten.daten[4,1]:=98;
tasten.daten[4,2]:=99;
tasten.daten[4,3]:=96;
tasten.daten[4,4]:=110;

tasten.daten[5,0]:=105;
tasten.daten[5,1]:=109;
tasten.daten[5,2]:=107;
tasten.daten[5,3]:=106;
tasten.daten[5,4]:=102;


tastreturn;
end;                                  //Tastatur einstellen

procedure TForm1.Panel9Click(Sender: TObject);
begin
selpos:=0;
keylesstart;
end;

procedure TForm1.Panel8Click(Sender: TObject);
begin
selpos:=1;
keylesstart;
end;

procedure TForm1.Panel7Click(Sender: TObject);
begin
selpos:=2;
keylesstart;
end;

procedure TForm1.Panel10Click(Sender: TObject);
begin
selpos:=3;
keylesstart;
end;

procedure TForm1.Panel11Click(Sender: TObject);
begin
selpos:=4;
keylesstart;
end;

procedure TForm1.Panel14Click(Sender: TObject);
begin
selpos:=5;
keylesstart;
end;

procedure TForm1.Panel15Click(Sender: TObject);
begin
selpos:=6;
keylesstart;
end;

procedure TForm1.Panel16Click(Sender: TObject);
begin
selpos:=7;
keylesstart;
end;

procedure TForm1.Panel13Click(Sender: TObject);
begin
selpos:=8;
keylesstart;
end;

procedure TForm1.Panel12Click(Sender: TObject);
begin
selpos:=0;
keylesstart;
end;

procedure TForm1.Panel19Click(Sender: TObject);
begin
selpos:=10;
keylesstart;
end;

procedure TForm1.Panel20Click(Sender: TObject);
begin
selpos:=11;
keylesstart;
end;

procedure TForm1.Panel21Click(Sender: TObject);
begin
selpos:=12;
keylesstart;
end;

procedure TForm1.Panel18Click(Sender: TObject);
begin
selpos:=13;
keylesstart;
end;

procedure TForm1.Panel17Click(Sender: TObject);
begin
selpos:=14;
keylesstart;
end;

procedure TForm1.Panel24Click(Sender: TObject);
begin
selpos:=15;
keylesstart;
end;

procedure TForm1.Panel25Click(Sender: TObject);
begin
selpos:=16;
keylesstart;
end;

procedure TForm1.Panel26Click(Sender: TObject);
begin
selpos:=17;
keylesstart;
end;

procedure TForm1.Panel23Click(Sender: TObject);
begin
selpos:=18;
keylesstart;
end;

procedure TForm1.Panel22Click(Sender: TObject);
begin
selpos:=19;
keylesstart;
end;

procedure TForm1.Panel29Click(Sender: TObject);
begin
selpos:=20;
keylesstart;
end;

procedure TForm1.Panel30Click(Sender: TObject);
begin
selpos:=21;
keylesstart;
end;

procedure TForm1.Panel31Click(Sender: TObject);
begin
selpos:=22;
keylesstart;
end;

procedure TForm1.Panel28Click(Sender: TObject);
begin
selpos:=23;
keylesstart;
end;

procedure TForm1.Panel27Click(Sender: TObject);
begin
selpos:=24;
keylesstart;
end;

procedure TForm1.Panel34Click(Sender: TObject);
begin
selpos:=25;
keylesstart;
end;

procedure TForm1.Panel35Click(Sender: TObject);
begin
selpos:=26;
keylesstart;
end;

procedure TForm1.Panel36Click(Sender: TObject);
begin
selpos:=27;
keylesstart;
end;

procedure TForm1.Panel33Click(Sender: TObject);
begin
selpos:=28;
keylesstart;
end;

procedure TForm1.Panel32Click(Sender: TObject);
begin
selpos:=29;
keylesstart;
end;

procedure Tform1.keylesstart;
    var i,e:integer;
    begin//Tasten lesen setzen
    for i:=0 to 128 do
    if getasynckeystate(i)<>0
    then
    e:=i;
    timer1.enabled:=true;
    Shape7.Brush.Color:=cllime;
    end;

procedure TForm1.Timer1Timer(Sender: TObject);
  var i,e,a:integer;
begin
if selpos<>-1
then
begin
a:=0;
for i:=0 to 128 do
if getasynckeystate(i)<>0
then
a:=i;


if (a>13) and (a<>27) and (a<>32)
then
begin
Shape7.Brush.Color:=clyellow;

i:=trunc(selpos/5);
e:=selpos mod 5;

tasten.daten[i,e]:=a;

selpos:=-1;
tastreturn;
timer1.Enabled:=false;
Shape7.Brush.Color:=clred;
end;

end;

end;

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var farbok:boolean;
begin
colordialog1.Color:=shape1.Brush.Color;
if colordialog1.Execute
then
begin
farbok:=true;                            //Farbe überprüfen
if colordialog1.color=0
then
farbok:=false;
if shape2.Brush.color=colordialog1.Color
then
farbok:=false;
if shape3.Brush.color=colordialog1.Color
then
farbok:=false;
if shape4.Brush.color=colordialog1.Color
then
farbok:=false;
if shape5.Brush.color=colordialog1.Color
then
farbok:=false;
if shape6.Brush.color=colordialog1.Color
then
farbok:=false;

if farbok=true
then
shape1.Brush.Color:=colordialog1.Color;
end;
end;

procedure TForm1.Shape2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var farbok:boolean;
begin
colordialog1.Color:=shape2.Brush.Color;
if colordialog1.Execute
then
begin
farbok:=true;                            //Farbe überprüfen
if colordialog1.color=0
then
farbok:=false;
if shape1.Brush.color=colordialog1.Color
then
farbok:=false;
if shape3.Brush.color=colordialog1.Color
then
farbok:=false;
if shape4.Brush.color=colordialog1.Color
then
farbok:=false;
if shape5.Brush.color=colordialog1.Color
then
farbok:=false;
if shape6.Brush.color=colordialog1.Color
then
farbok:=false;

if farbok=true
then
shape2.Brush.Color:=colordialog1.Color;
end;
end;

procedure TForm1.Shape3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var farbok:boolean;
begin
colordialog1.Color:=shape3.Brush.Color;
if colordialog1.Execute
then
begin
farbok:=true;                            //Farbe überprüfen
if colordialog1.color=0
then
farbok:=false;
if shape2.Brush.color=colordialog1.Color
then
farbok:=false;
if shape1.Brush.color=colordialog1.Color
then
farbok:=false;
if shape4.Brush.color=colordialog1.Color
then
farbok:=false;
if shape5.Brush.color=colordialog1.Color
then
farbok:=false;
if shape6.Brush.color=colordialog1.Color
then
farbok:=false;

if farbok=true
then
shape3.Brush.Color:=colordialog1.Color;
end;
end;

procedure TForm1.Shape4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var farbok:boolean;
begin
colordialog1.Color:=shape4.Brush.Color;
if colordialog1.Execute
then
begin
farbok:=true;                            //Farbe überprüfen
if colordialog1.color=0
then
farbok:=false;
if shape2.Brush.color=colordialog1.Color
then
farbok:=false;
if shape3.Brush.color=colordialog1.Color
then
farbok:=false;
if shape1.Brush.color=colordialog1.Color
then
farbok:=false;
if shape5.Brush.color=colordialog1.Color
then
farbok:=false;
if shape6.Brush.color=colordialog1.Color
then
farbok:=false;

if farbok=true
then
shape4.Brush.Color:=colordialog1.Color;
end;
end;

function Tform1.tastenwert(k:byte):String;
    begin                                     //Übersetze ASCII
    case k of

    16:tastenwert:='Shift up';
    17:tastenwert:='Strg';
    18:tastenwert:='Alt Gr';
    20:tastenwert:='Shift down';

    33:tastenwert:='Bild up';
    34:tastenwert:='Bild down';
    35:tastenwert:='Ende';
    36:tastenwert:='Pos1';

    37:tastenwert:='Cur left';
    38:tastenwert:='Cur up';
    39:tastenwert:='Cur right';
    40:tastenwert:='Cur down';

    45:tastenwert:='Einfg';
    46:tastenwert:='Entf';

    48:tastenwert:='0';
    49:tastenwert:='1';
    50:tastenwert:='2';
    51:tastenwert:='3';
    52:tastenwert:='4';
    53:tastenwert:='5';
    54:tastenwert:='6';
    55:tastenwert:='7';
    56:tastenwert:='8';
    57:tastenwert:='9';

    65..90:tastenwert:=char(k);

    93:tastenwert:='Menu';

    96:tastenwert:='Num 0';
    97:tastenwert:='Num 1';
    98:tastenwert:='Num 2';
    99:tastenwert:='Num 3';
    100:tastenwert:='Num 4';
    101:tastenwert:='Num 5';
    102:tastenwert:='Num 6';
    103:tastenwert:='Num 7';
    104:tastenwert:='Num 8';
    105:tastenwert:='Num 9';
    106:tastenwert:='Num *';
    107:tastenwert:='Num +';
    109:tastenwert:='Num -';
    110:tastenwert:='Num ,';
    111:tastenwert:='Num /';
    112:tastenwert:='F1';
    113:tastenwert:='F2';
    114:tastenwert:='F3';
    115:tastenwert:='F4';
    116:tastenwert:='F5';
    117:tastenwert:='F6';
    118:tastenwert:='F7';
    119:tastenwert:='F8';
    120:tastenwert:='F9';
    121:tastenwert:='F10';
    122:tastenwert:='F11';
    123:tastenwert:='F12';
    else tastenwert:='N/A';
    end;

    end;

    procedure Tform1.tastreturn;
    begin   //Keydaten zurücksenden

    panel9.caption:=tastenwert(tasten.daten[0,0]);
    panel8.caption:=tastenwert(tasten.daten[0,1]);
    panel7.caption:=tastenwert(tasten.daten[0,2]);
    panel10.caption:=tastenwert(tasten.daten[0,3]);
    panel11.caption:=tastenwert(tasten.daten[0,4]);

    panel14.caption:=tastenwert(tasten.daten[1,0]);
    panel15.caption:=tastenwert(tasten.daten[1,1]);
    panel16.caption:=tastenwert(tasten.daten[1,2]);
    panel13.caption:=tastenwert(tasten.daten[1,3]);
    panel12.caption:=tastenwert(tasten.daten[1,4]);

    panel19.caption:=tastenwert(tasten.daten[2,0]);
    panel20.caption:=tastenwert(tasten.daten[2,1]);
    panel21.caption:=tastenwert(tasten.daten[2,2]);
    panel18.caption:=tastenwert(tasten.daten[2,3]);
    panel17.caption:=tastenwert(tasten.daten[2,4]);

    panel24.caption:=tastenwert(tasten.daten[3,0]);
    panel25.caption:=tastenwert(tasten.daten[3,1]);
    panel26.caption:=tastenwert(tasten.daten[3,2]);
    panel23.caption:=tastenwert(tasten.daten[3,3]);
    panel22.caption:=tastenwert(tasten.daten[3,4]);

    panel29.caption:=tastenwert(tasten.daten[4,0]);
    panel30.caption:=tastenwert(tasten.daten[4,1]);
    panel31.caption:=tastenwert(tasten.daten[4,2]);
    panel28.caption:=tastenwert(tasten.daten[4,3]);
    panel27.caption:=tastenwert(tasten.daten[4,4]);

    panel34.caption:=tastenwert(tasten.daten[5,0]);
    panel35.caption:=tastenwert(tasten.daten[5,1]);
    panel36.caption:=tastenwert(tasten.daten[5,2]);
    panel33.caption:=tastenwert(tasten.daten[5,3]);
    panel32.caption:=tastenwert(tasten.daten[5,4]);
    end;

procedure TForm1.Panel3Click(Sender: TObject);
begin             //Zurücksetzen
tasten.daten[0,0]:=49;
tasten.daten[0,1]:=81;
tasten.daten[0,2]:=112;
tasten.daten[0,3]:=50;
tasten.daten[0,4]:=87;

tasten.daten[1,0]:=89;
tasten.daten[1,1]:=88;
tasten.daten[1,2]:=16;
tasten.daten[1,3]:=83;
tasten.daten[1,4]:=65;

tasten.daten[2,0]:=78;
tasten.daten[2,1]:=77;
tasten.daten[2,2]:=18;
tasten.daten[2,3]:=74;
tasten.daten[2,4]:=75;

tasten.daten[3,0]:=37;
tasten.daten[3,1]:=39;
tasten.daten[3,2]:=40;
tasten.daten[3,3]:=17;
tasten.daten[3,4]:=38;

tasten.daten[4,0]:=97;
tasten.daten[4,1]:=98;
tasten.daten[4,2]:=99;
tasten.daten[4,3]:=96;
tasten.daten[4,4]:=110;

tasten.daten[5,0]:=105;
tasten.daten[5,1]:=109;
tasten.daten[5,2]:=107;
tasten.daten[5,3]:=106;
tasten.daten[5,4]:=102;

radiobutton1.checked:=true;
radiobutton4.checked:=true;
radiobutton7.checked:=true;
radiobutton10.checked:=true;
radiobutton13.checked:=true;
radiobutton16.checked:=true;
radiobutton24.Checked:=true;

checkbox1.checked:=false;
checkbox2.checked:=false;
checkbox3.checked:=false;
checkbox4.checked:=false;
checkbox5.checked:=false;
checkbox6.checked:=false;
checkbox7.checked:=false;
checkbox8.checked:=false;
checkbox9.checked:=false;
checkbox10.checked:=false;
checkbox11.checked:=false;
checkbox12.checked:=false;
checkbox13.checked:=false;
checkbox14.checked:=false;
checkbox15.checked:=false;
checkbox16.Checked:=false;

Edit1.Text:='Spieler 1';
Edit2.Text:='Spieler 2';
Edit3.Text:='Spieler 3';
Edit4.Text:='Spieler 4';
Edit5.Text:='Spieler 5';
Edit6.Text:='Spieler 6';


tastreturn;
end;

procedure TForm1.Panel5Click(Sender: TObject);
var sp:integer;
begin
sp:=0;
if radiobutton1.checked=false
then
inc(sp);
if radiobutton4.checked=false
then
inc(sp);
if radiobutton7.checked=false
then
inc(sp);
if radiobutton10.checked=false
then
inc(sp);
if radiobutton13.checked=false
then
inc(sp);
if radiobutton16.checked=false
then
inc(sp);

if sp>1
then
begin
form2.ClientWidth:=1024;
form2.ClientHeight:=768;
form1.Visible:=false;
form1.Bildschirmvoll;
form2.Visible:=true;

if checkbox16.Checked=true
then
form2.loadmap;

form2.punktreset;
form2.init(tasten);
end;

end;

procedure TForm1.Image1Click(Sender: TObject);
begin
if openpicturedialog1.Execute                        //Bild laden
then
image1.Picture.LoadFromFile(openpicturedialog1.filename);
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
if openpicturedialog1.Execute                        //Bild laden
then
image2.Picture.LoadFromFile(openpicturedialog1.filename);
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
if openpicturedialog1.Execute                        //Bild laden
then
image3.Picture.LoadFromFile(openpicturedialog1.filename);
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
if openpicturedialog1.Execute                        //Bild laden
then
image4.Picture.LoadFromFile(openpicturedialog1.filename);
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
if openpicturedialog1.Execute                        //Bild laden
then
image5.Picture.LoadFromFile(openpicturedialog1.filename);
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
if openpicturedialog1.Execute                        //Bild laden
then
image6.Picture.LoadFromFile(openpicturedialog1.filename);
end;

procedure TForm1.Panel1Click(Sender: TObject);
var F:textfile;
    s:string;
    i,e:integer;
begin
if savedialog1.Execute                  //Profil speichern
then
begin
assignfile(F,savedialog1.FileName);
rewrite(F);

if radiobutton1.checked=true
then
s:='0'
else if radiobutton2.Checked=true
then
s:='1'
else
s:='2';

writeln(F,s);

if radiobutton4.checked=true
then
s:='0'
else if radiobutton5.Checked=true
then
s:='1'
else
s:='2';

writeln(F,s);

if radiobutton7.checked=true
then
s:='0'
else if radiobutton8.Checked=true
then
s:='1'
else
s:='2';

writeln(F,s);

if radiobutton10.checked=true
then
s:='0'
else if radiobutton11.Checked=true
then
s:='1'
else
s:='2';

writeln(F,s);

if radiobutton13.checked=true
then
s:='0'
else if radiobutton14.Checked=true
then
s:='1'
else
s:='2';

writeln(F,s);

if radiobutton16.checked=true
then
s:='0'
else if radiobutton17.Checked=true
then
s:='1'
else
s:='2';

writeln(F,s);


writeln(F,edit1.text);
writeln(F,edit2.text);
writeln(F,edit3.text);
writeln(F,edit4.text);
writeln(F,edit5.text);
writeln(F,edit6.text);

s:=inttostr(shape1.Brush.Color);
writeln(F,s);

s:=inttostr(shape2.Brush.Color);
writeln(F,s);

s:=inttostr(shape3.Brush.Color);
writeln(F,s);

s:=inttostr(shape4.Brush.Color);
writeln(F,s);

s:=inttostr(shape5.Brush.Color);
writeln(F,s);

s:=inttostr(shape6.Brush.Color);
writeln(F,s);

for i:=0 to 5 do
for e:=0 to 4 do
begin
s:=inttostr(tasten.daten[i,e]);
writeln(F,s);
end;

if checkbox1.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox2.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox3.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox4.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox5.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox6.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox7.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox8.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox9.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox10.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox11.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox12.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox13.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox14.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox15.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);


if radiobutton23.checked=true
then
s:='0'
else if radiobutton24.checked=true
then
s:='1'
else
s:='2';
writeln(F,s);

s:=inttostr(trackbar1.Position);
writeln(F,s);

s:=inttostr(spinedit1.Value);
writeln(F,s);

if checkbox17.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox18.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if checkbox19.checked=true
then
s:='1'
else
s:='0';
writeln(F,s);

if radiobutton26.checked=true
then
s:='0'
else
s:='1';
writeln(F,s);

closefile(F);
end;

end;

procedure TForm1.Panel2Click(Sender: TObject);
var F:textfile;
    s:string;
    i,e:integer;
begin
if opendialog1.Execute
then
begin
assignfile(F,opendialog1.FileName);
reset(f);


readln(F,s);

if s='0'
then
radiobutton1.checked:=true
else if s='1'
then
radiobutton2.Checked:=true
else
radiobutton3.Checked:=true;


readln(F,s);

if s='0'
then
radiobutton4.checked:=true
else if s='1'
then
radiobutton5.Checked:=true
else
radiobutton6.Checked:=true;


readln(F,s);

if s='0'
then
radiobutton7.checked:=true
else if s='1'
then
radiobutton8.Checked:=true
else
radiobutton9.Checked:=true;

readln(F,s);

if s='0'
then
radiobutton10.checked:=true
else if s='1'
then
radiobutton11.Checked:=true
else
radiobutton12.Checked:=true;

readln(F,s);

if s='0'
then
radiobutton13.checked:=true
else if s='1'
then
radiobutton14.Checked:=true
else
radiobutton15.Checked:=true;

readln(F,s);

if s='0'
then
radiobutton16.checked:=true
else if s='1'
then
radiobutton17.Checked:=true
else
radiobutton18.Checked:=true;

readln(F,s);
edit1.Text:=s;
readln(F,s);
edit2.Text:=s;
readln(F,s);
edit3.Text:=s;
readln(F,s);
edit4.Text:=s;
readln(F,s);
edit5.Text:=s;
readln(F,s);
edit6.Text:=s;

readln(F,s);
shape1.Brush.Color:=strtoint(s);

readln(F,s);
shape2.Brush.Color:=strtoint(s);

readln(F,s);
shape3.Brush.Color:=strtoint(s);

readln(F,s);
shape4.Brush.Color:=strtoint(s);

readln(F,s);
shape5.Brush.Color:=strtoint(s);

readln(F,s);
shape6.Brush.Color:=strtoint(s);


for i:=0 to 5 do
for e:=0 to 4 do
begin
readln(F,s);
tasten.daten[i,e]:=strtoint(s);
end;

readln(F,s);
if s='0'
then
checkbox1.checked:=false
else
checkbox1.Checked:=True;

readln(F,s);
if s='0'
then
checkbox2.checked:=false
else
checkbox2.Checked:=True;

readln(F,s);
if s='0'
then
checkbox3.checked:=false
else
checkbox3.Checked:=True;

readln(F,s);
if s='0'
then
checkbox4.checked:=false
else
checkbox4.Checked:=True;

readln(F,s);
if s='0'
then
checkbox5.checked:=false
else
checkbox5.Checked:=True;

readln(F,s);
if s='0'
then
checkbox6.checked:=false
else
checkbox6.Checked:=True;

readln(F,s);
if s='0'
then
checkbox7.checked:=false
else
checkbox7.Checked:=True;

readln(F,s);
if s='0'
then
checkbox8.checked:=false
else
checkbox8.Checked:=True;

readln(F,s);
if s='0'
then
checkbox9.checked:=false
else
checkbox9.Checked:=True;

readln(F,s);
if s='0'
then
checkbox10.checked:=false
else
checkbox10.Checked:=True;

readln(F,s);
if s='0'
then
checkbox11.checked:=false
else
checkbox11.Checked:=True;

readln(F,s);
if s='0'
then
checkbox12.checked:=false
else
checkbox12.Checked:=True;

readln(F,s);
if s='0'
then
checkbox13.checked:=false
else
checkbox13.Checked:=True;

readln(F,s);
if s='0'
then
checkbox14.checked:=false
else
checkbox14.Checked:=True;

readln(F,s);
if s='0'
then
checkbox15.checked:=false
else
checkbox15.Checked:=True;

readln(F,s);
if s='0'
then
radiobutton23.checked:=true
else if s='1'
then
radiobutton24.checked:=true
else
radiobutton25.checked:=true;

readln(F,s);
if s='0'
then
checkbox17.checked:=false
else
checkbox17.Checked:=True;

readln(F,s);
if s='0'
then
checkbox18.checked:=false
else
checkbox18.Checked:=True;

readln(F,s);
if s='0'
then
checkbox19.checked:=false
else
checkbox19.Checked:=True;


readln(f,s);
trackbar1.Position:=strtoint(s);

readln(F,s);
spinedit1.Value:=strtoint(s);

readln(F,s);
if s='0'
then
radiobutton26.checked:=true
else
radiobutton27.checked:=true;


closefile(F);
end;

end;

procedure TForm1.Shape6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var farbok:boolean;
begin
colordialog1.Color:=shape6.Brush.Color;
if colordialog1.Execute
then
begin
farbok:=true;                            //Farbe überprüfen
if colordialog1.color=0
then
farbok:=false;
if shape2.Brush.color=colordialog1.Color
then
farbok:=false;
if shape3.Brush.color=colordialog1.Color
then
farbok:=false;
if shape4.Brush.color=colordialog1.Color
then
farbok:=false;
if shape5.Brush.color=colordialog1.Color
then
farbok:=false;
if shape1.Brush.color=colordialog1.Color
then
farbok:=false;

if farbok=true
then
shape6.Brush.Color:=colordialog1.Color;
end;
end;

procedure TForm1.Shape5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

 var farbok:boolean;
begin
colordialog1.Color:=shape5.Brush.Color;
if colordialog1.Execute
then
begin
farbok:=true;                            //Farbe überprüfen
if colordialog1.color=0
then
farbok:=false;
if shape2.Brush.color=colordialog1.Color
then
farbok:=false;
if shape3.Brush.color=colordialog1.Color
then
farbok:=false;
if shape4.Brush.color=colordialog1.Color
then
farbok:=false;
if shape1.Brush.color=colordialog1.Color
then
farbok:=false;
if shape6.Brush.color=colordialog1.Color
then
farbok:=false;

if farbok=true
then
shape5.Brush.Color:=colordialog1.Color;
end;
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
form1.visible:=false;
form4.Visible:=true; //Mapeditor öffnen
end;

procedure TForm1.RadioButton19Click(Sender: TObject);
var F:file of Integer;
begin
Sprache:=0;  //Deutsch auswählen
assignfile(F,'lingua.dat');
rewrite(F);
write(F,Sprache);
closefile(F);
Spracheander;
end;

procedure TForm1.RadioButton20Click(Sender: TObject);
var F:file of Integer;
begin
Sprache:=1;  //Englisch auswählen
assignfile(F,'lingua.dat');
rewrite(F);
write(F,Sprache);
closefile(F);
Spracheander;
end;

procedure TForm1.RadioButton21Click(Sender: TObject);
var F:file of Integer;
begin
Sprache:=2;  //Französisch auswählen
assignfile(F,'lingua.dat');
rewrite(F);
write(F,Sprache);
closefile(F);
Spracheander;
end;

procedure TForm1.RadioButton22Click(Sender: TObject);
var F:file of Integer;
begin
Sprache:=3;  //Spanisch auswählen
assignfile(F,'lingua.dat');
rewrite(F);
write(F,Sprache);
closefile(F);
Spracheander;
end;

procedure Tform1.Spracheander;
begin
       //Sprache ändern

case Sprache of
0:begin

Label1.Caption:='Name:';
Label2.Caption:='Farbe:';
label3.Caption:='Taste [links]:';
label4.caption:='Taste [rechts]:';
label5.Caption:='Taste [Sprung]:';
label6.Caption:='Taste [Feuer]:';
label7.caption:='Taste [beschl]:';

Label8.Caption:='Name:';
Label9.Caption:='Farbe:';
label12.Caption:='Taste [links]:';
label11.caption:='Taste [rechts]:';
label10.Caption:='Taste [Sprung]:';
label14.Caption:='Taste [Feuer]:';
label13.caption:='Taste [beschl]:';

Label15.Caption:='Name:';
Label16.Caption:='Farbe:';
label19.Caption:='Taste [links]:';
label18.caption:='Taste [rechts]:';
label17.Caption:='Taste [Sprung]:';
label21.Caption:='Taste [Feuer]:';
label20.caption:='Taste [beschl]:';

Label22.Caption:='Name:';
Label23.Caption:='Farbe:';
label26.Caption:='Taste [links]:';
label25.caption:='Taste [rechts]:';
label24.Caption:='Taste [Sprung]:';
label28.Caption:='Taste [Feuer]:';
label27.caption:='Taste [beschl]:';

Label29.Caption:='Name:';
Label30.Caption:='Farbe:';
label33.Caption:='Taste [links]:';
label32.caption:='Taste [rechts]:';
label31.Caption:='Taste [Sprung]:';
label35.Caption:='Taste [Feuer]:';
label34.caption:='Taste [beschl]:';

Label36.Caption:='Name:';
Label37.Caption:='Farbe:';
label40.Caption:='Taste [links]:';
label39.caption:='Taste [rechts]:';
label38.Caption:='Taste [Sprung]:';
label42.Caption:='Taste [Feuer]:';
label41.caption:='Taste [beschl]:';

radiobutton1.Caption:='ausgeschaltet';
radiobutton2.Caption:='Mensch';
radiobutton3.Caption:='Computer';

radiobutton4.Caption:='ausgeschaltet';
radiobutton5.Caption:='Mensch';
radiobutton6.Caption:='Computer';

radiobutton7.Caption:='ausgeschaltet';
radiobutton8.Caption:='Mensch';
radiobutton9.Caption:='Computer';

radiobutton10.Caption:='ausgeschaltet';
radiobutton11.Caption:='Mensch';
radiobutton12.Caption:='Computer';

radiobutton13.Caption:='ausgeschaltet';
radiobutton14.Caption:='Mensch';
radiobutton15.Caption:='Computer';

radiobutton16.Caption:='ausgeschaltet';
radiobutton17.Caption:='Mensch';
radiobutton18.Caption:='Computer';

Checkbox1.Caption:='Kopf ein';
Checkbox2.Caption:='Kopf ein';
Checkbox3.Caption:='Kopf ein';
Checkbox4.Caption:='Kopf ein';
Checkbox5.Caption:='Kopf ein';
Checkbox6.Caption:='Kopf ein';

Checkbox7.caption:='automatische Sprünge';
checkbox8.caption:='kontrollierte Sprünge';
checkbox9.caption:='endlos Sprungenergie';
checkbox10.caption:='Schießen';
checkbox11.caption:='Durchschlag';
checkbox12.caption:='endlos Munition';
checkbox13.caption:='Windschattenbeschleunigung';
checkbox14.Caption:='kontrollierte Beschleunigung';
checkbox15.caption:='endlos Beschleunigungsenergie';

label43.Caption:='Spielgeschwindigkeit';
label44.caption:='Tasteneinlesen Status:';
label45.caption:='Anzahl der Runden';

Groupbox1.Caption:='Spielerauswahl';
Groupbox2.caption:='Spieler 1';
Groupbox3.caption:='Spieler 2';
Groupbox4.caption:='Spieler 3';
Groupbox5.caption:='Spieler 4';
Groupbox6.caption:='Spieler 5';
Groupbox7.caption:='Spieler 6';
Groupbox8.caption:='Spieloptionen';
Groupbox9.Caption:='Sprachen';

panel1.caption:='Einstellungsprofil speichern';
panel2.Caption:='Einstellungsprofil laden';
panel3.caption:='Einstellungen zurücksetzen';
panel4.caption:='Mapeditor';
panel5.Caption:='SPIEL STARTEN';
Panel6.caption:='PROGRAMM BEENDEN';

Form1.Caption:='Achtung, die Kurve! V1.1 - Menü - von EquinoxOmega';

Form4.caption:='Achtung, die Kurve! V1.1 - Mapeditor - von EquinoxOmega';
form4.panel1.Caption:='Neu';
form4.panel2.Caption:='Speichern';
form4.panel3.Caption:='Laden';
form4.panel4.Caption:='Beenden ohne Übernehmen';
form4.panel5.Caption:='Beenden mit Übernehmen';
form4.panel6.Caption:='(1) Geschütz';
form4.panel7.Caption:='(2) Kraftfeld';
form4.panel8.Caption:='(3) Splittermine';
form4.panel9.Caption:='(4) Mauerbauer';

form4.label1.caption:='Dicke:';
Form4.label2.caption:='Farbe:';

radiobutton23.caption:='Karte nie erneuern';
radiobutton24.caption:='Karte nach jeder Runde erneuern';
radiobutton25.caption:='Mauern der Karte permant erneuern';
checkbox16.caption:='aktuelle Karte verwenden';

label46.Caption:='Anzahl der Punkte';

groupbox10.Caption:='Gewinnmodus';
Radiobutton26.Caption:='Runden';
Radiobutton27.Caption:='Punkte';
Checkbox17.Caption:='nicht tödliche Schüsse';
Checkbox18.Caption:='Power-ups';
Checkbox19.Caption:='Power-downs';

end;
1:begin
Label1.Caption:='name:';
Label2.Caption:='colour:';
label3.Caption:='key [left]:';
label4.caption:='key [right]:';
label5.Caption:='key [jump]:';
label6.Caption:='key [fire]:';
label7.caption:='key [accel]:';

Label8.Caption:='name:';
Label9.Caption:='colour:';
label12.Caption:='key [left]:';
label11.caption:='key [right]:';
label10.Caption:='key [jump]:';
label14.Caption:='key [fire]:';
label13.caption:='key [accel]:';

Label15.Caption:='name:';
Label16.Caption:='colour:';
label19.Caption:='key [left]:';
label18.caption:='key [right]:';
label17.Caption:='key [jump]:';
label21.Caption:='key [fire]:';
label20.caption:='key [accel]:';

Label22.Caption:='name:';
Label23.Caption:='colour:';
label26.Caption:='key [left]:';
label25.caption:='key [right]:';
label24.Caption:='key [jump]:';
label28.Caption:='key [fire]:';
label27.caption:='key [accel]:';

Label29.Caption:='name:';
Label30.Caption:='colour:';
label33.Caption:='key [left]:';
label32.caption:='key [right]:';
label31.Caption:='key [jump]:';
label35.Caption:='key [fire]:';
label34.caption:='key [accel]:';

Label36.Caption:='name:';
Label37.Caption:='colour:';
label40.Caption:='key [left]:';
label39.caption:='key [right]:';
label38.Caption:='key [jump]:';
label42.Caption:='key [fire]:';
label41.caption:='key [accel]:';

radiobutton1.Caption:='off-line';
radiobutton2.Caption:='human';
radiobutton3.Caption:='computer';

radiobutton4.Caption:='off-line';
radiobutton5.Caption:='human';
radiobutton6.Caption:='computer';

radiobutton7.Caption:='off-line';
radiobutton8.Caption:='human';
radiobutton9.Caption:='computer';

radiobutton10.Caption:='off-line';
radiobutton11.Caption:='human';
radiobutton12.Caption:='computer';

radiobutton13.Caption:='off-line';
radiobutton14.Caption:='human';
radiobutton15.Caption:='computer';

radiobutton16.Caption:='off-line';
radiobutton17.Caption:='human';
radiobutton18.Caption:='computer';

Checkbox1.Caption:='head on';
Checkbox2.Caption:='head on';
Checkbox3.Caption:='head on';
Checkbox4.Caption:='head on';
Checkbox5.Caption:='head on';
Checkbox6.Caption:='head on';

Checkbox7.caption:='automatic jumps';
checkbox8.caption:='controlled jumps';
checkbox9.caption:='indefinate jump-power';
checkbox10.caption:='shooting';
checkbox11.caption:='heavy hits';
checkbox12.caption:='indefinate amunition';
checkbox13.caption:='wind shadow acceleration';
checkbox14.Caption:='controlled acceleration';
checkbox15.caption:='infefinate acceleration-power';

label43.Caption:='gamespeed';
label44.caption:='keyreader state:';
label45.caption:='number of turns';

Groupbox1.Caption:='playerselection';
Groupbox2.caption:='player 1';
Groupbox3.caption:='player 2';
Groupbox4.caption:='player 3';
Groupbox5.caption:='player 4';
Groupbox6.caption:='player 5';
Groupbox7.caption:='player 6';
Groupbox8.caption:='gameoptions';
Groupbox9.Caption:='languages';

panel1.caption:='save setup profil';
panel2.Caption:='load setup profil';
panel3.caption:='reset setup';
panel4.caption:='mapeditor';
panel5.Caption:='START GAME';
Panel6.caption:='QUIT PROGRAM';

Form1.Caption:='Achtung, die Kurve! V1.1 - menu - by EquinoxOmega';

Form4.caption:='Achtung, die Kurve! V1.1 - mapeditor - by EquinoxOmega';
form4.panel1.Caption:='new';
form4.panel2.Caption:='save';
form4.panel3.Caption:='load';
form4.panel4.Caption:='quit without using map';
form4.panel5.Caption:='quit with using map';
form4.panel6.Caption:='(1) gun';
form4.panel7.Caption:='(2) forcefield';
form4.panel8.Caption:='(3) splintermine';
form4.panel9.Caption:='(4) wallbuilder';

form4.label1.caption:='width:';
Form4.label2.caption:='colour:';

radiobutton23.caption:='never renew map';
radiobutton24.caption:='renew map after every turn';
radiobutton25.caption:='permanently renewing walls of map';
checkbox16.caption:='use actual map';


label46.Caption:='number of points';

groupbox10.Caption:='win mode';
Radiobutton26.Caption:='turns';
Radiobutton27.Caption:='points';
Checkbox17.Caption:='non-lethal shoots';
Checkbox18.Caption:='power-ups';
Checkbox19.Caption:='power-downs';


end;
2:begin

Label1.Caption:='nom:';
Label2.Caption:='coleur:';
label3.Caption:='touche [gauche]:';
label4.caption:='touche [droite]:';
label5.Caption:='touche [saut]:';
label6.Caption:='touche [feu]:';
label7.caption:='touche [accél]:';

Label8.Caption:='nom:';
Label9.Caption:='coleur:';
label12.Caption:='touche [gauche]:';
label11.caption:='touche [droite]:';
label11.Caption:='touche [saut]:';
label14.Caption:='touche [feu]:';
label13.caption:='touche [accél]:';

Label15.Caption:='nom:';
Label16.Caption:='coleur:';
label19.Caption:='touche [gauche]:';
label18.caption:='touche [droite]:';
label17.Caption:='touche [saut]:';
label21.Caption:='touche [feu]:';
label20.caption:='touche [accél]:';

Label22.Caption:='nom:';
Label23.Caption:='coleur:';
label26.Caption:='touche [gauche]:';
label25.caption:='touche [droite]:';
label24.Caption:='touche [saut]:';
label28.Caption:='touche [feu]:';
label27.caption:='touche [accél]:';

Label29.Caption:='nom:';
Label30.Caption:='coleur:';
label33.Caption:='touche [gauche]:';
label32.caption:='touche [droite]:';
label31.Caption:='touche [saut]:';
label35.Caption:='touche [feu]:';
label34.caption:='touche [accél]:';

Label36.Caption:='nom:';
Label37.Caption:='coleur:';
label40.Caption:='touche [gauche]:';
label39.caption:='touche [droite]:';
label38.Caption:='touche [saut]:';
label42.Caption:='touche [feu]:';
label41.caption:='touche [accél]:';

radiobutton1.Caption:='éteindu';
radiobutton2.Caption:='homme';
radiobutton3.Caption:='ordinateur';

radiobutton4.Caption:='éteindu';
radiobutton5.Caption:='homme';
radiobutton6.Caption:='ordinateur';

radiobutton7.Caption:='éteindu';
radiobutton8.Caption:='homme';
radiobutton9.Caption:='ordinateur';

radiobutton10.Caption:='éteindu';
radiobutton11.Caption:='homme';
radiobutton12.Caption:='ordinateur';

radiobutton13.Caption:='éteindu';
radiobutton14.Caption:='homme';
radiobutton15.Caption:='ordinateur';

radiobutton16.Caption:='éteindu';
radiobutton17.Caption:='homme';
radiobutton18.Caption:='ordinateur';

Checkbox1.Caption:='tête marche';
Checkbox2.Caption:='tête marche';
Checkbox3.Caption:='tête marche';
Checkbox4.Caption:='tête marche';
Checkbox5.Caption:='tête marche';
Checkbox6.Caption:='tête marche';

Checkbox7.caption:='sauts automatiques';
checkbox8.caption:='sauts controlles';
checkbox9.caption:='énergie de saut interminablée';
checkbox10.caption:='tirer';
checkbox11.caption:='traversé';
checkbox12.caption:='munitions interminablées';
checkbox13.caption:='accélération au côté abrité du vent';
checkbox14.Caption:='accélération controllée';
checkbox15.caption:='énergie d´accélération interminablée';

label43.Caption:='vitesse de jeu';
label44.caption:='state de lecteur des clés:';
label45.caption:='nombre des parties';

Groupbox1.Caption:='selection des joueurs';
Groupbox2.caption:='joueur 1';
Groupbox3.caption:='joueur 2';
Groupbox4.caption:='joueur 3';
Groupbox5.caption:='joueur 4';
Groupbox6.caption:='joueur 5';
Groupbox7.caption:='joueur 6';
Groupbox8.caption:='options de jeu';
Groupbox9.Caption:='langues';

panel1.caption:='sauvegarde du profil des paramètres';
panel2.Caption:='appelle du profil des paramètres';
panel3.caption:='remet du profil des paramètres';
panel4.caption:='editor de map';
panel5.Caption:='DÉMARRE LE JEU';
Panel6.caption:='TERMINE LE PROGRAMME';


Form1.Caption:='Achtung, die Kurve! V1.1 - menue - d´EquinoxOmega';


Form4.caption:='Achtung, die Kurve! V1.1 - editor de map - d´EquinoxOmega';
form4.panel1.Caption:='nouveau';
form4.panel2.Caption:='sauvegarde';
form4.panel3.Caption:='appelle';
form4.panel4.Caption:='termine sans usage de map';
form4.panel5.Caption:='termine avec usage de map';
form4.panel6.Caption:='(1) artillerie';
form4.panel7.Caption:='(2) champ de force';
form4.panel8.Caption:='(3) mine à fragmentation';
form4.panel9.Caption:='(4) constructeur des murs';

form4.label1.caption:='épaisseur:';
Form4.label2.caption:='coleur:';


radiobutton23.caption:='ne renouve jemais le map';
radiobutton24.caption:='renouve le map après chaquée patrie';
radiobutton25.caption:='reconstre permanent les murs de map';
checkbox16.caption:='utilize le map actuel';


label46.Caption:='nombre des points';

groupbox10.Caption:='mode de victoir';
Radiobutton26.Caption:='parties';
Radiobutton27.Caption:='points';
Checkbox17.Caption:='non-mortels coups de feu';
Checkbox18.Caption:='power-ups';
Checkbox19.Caption:='power-downs';


end;
3:begin

Label1.Caption:='nombre:';
Label2.Caption:='color:';
label3.Caption:='tecla [izquierda]:';
label4.caption:='tecla [derecha]:';
label5.Caption:='tecla [salto]:';
label6.Caption:='tecla [fuego]:';
label7.caption:='tecla [acelerar]:';

Label8.Caption:='nombre:';
Label9.Caption:='color:';
label12.Caption:='tecla [izquierda]:';
label11.caption:='tecla [derecha]:';
label10.Caption:='tecla [salto]:';
label14.Caption:='tecla [fuego]:';
label13.caption:='tecla [acelerar]:';

Label15.Caption:='nombre:';
Label16.Caption:='color:';
label19.Caption:='tecla [izquierda]:';
label18.caption:='tecla [derecha]:';
label17.Caption:='tecla [salto]:';
label21.Caption:='tecla [fuego]:';
label20.caption:='tecla [acelerar]:';

Label22.Caption:='nombre:';
Label23.Caption:='color:';
label26.Caption:='tecla [izquierda]:';
label25.caption:='tecla [derecha]:';
label24.Caption:='tecla [salto]:';
label28.Caption:='tecla [fuego]:';
label27.caption:='tecla [acelerar]:';

Label29.Caption:='nombre:';
Label30.Caption:='color:';
label33.Caption:='tecla [izquierda]:';
label32.caption:='tecla [derecha]:';
label31.Caption:='tecla [salto]:';
label35.Caption:='tecla [fuego]:';
label34.caption:='tecla [acelerar]:';

Label36.Caption:='nombre:';
Label37.Caption:='color:';
label40.Caption:='tecla [izquierda]:';
label39.caption:='tecla [derecha]:';
label38.Caption:='tecla [salto]:';
label42.Caption:='tecla [fuego]:';
label41.caption:='tecla [acelerar]:';

radiobutton1.Caption:='apagado';
radiobutton2.Caption:='humano';
radiobutton3.Caption:='computadora';

radiobutton4.Caption:='apagado';
radiobutton5.Caption:='humano';
radiobutton6.Caption:='computadora';

radiobutton7.Caption:='apagado';
radiobutton8.Caption:='humano';
radiobutton9.Caption:='computadora';

radiobutton10.Caption:='apagado';
radiobutton11.Caption:='humano';
radiobutton12.Caption:='computadora';

radiobutton13.Caption:='apagado';
radiobutton14.Caption:='humano';
radiobutton15.Caption:='computadora';

radiobutton16.Caption:='apagado';
radiobutton17.Caption:='humano';
radiobutton18.Caption:='computadora';

Checkbox1.Caption:='cabeza ponido';
Checkbox2.Caption:='cabeza ponido';
Checkbox3.Caption:='cabeza ponido';
Checkbox4.Caption:='cabeza ponido';
Checkbox5.Caption:='cabeza ponido';
Checkbox6.Caption:='cabeza ponido';

Checkbox7.caption:='saltos automáticos';
checkbox8.caption:='saltos controlados';
checkbox9.caption:='energía de saltos infinita';
checkbox10.caption:='tirar';
checkbox11.caption:='cortado';
checkbox12.caption:='munición infinita';
checkbox13.caption:='aceleración a sobre de veleta';
checkbox14.Caption:='aceleración controlados';
checkbox15.caption:='energía de aceleración infinita';

label43.Caption:='velocidad de juego';
label44.caption:='estado de lector de tecla:';
label45.caption:='número de vueltas';

Groupbox1.Caption:='seleción de jugadores';
Groupbox2.caption:='jugador 1';
Groupbox3.caption:='jugador 2';
Groupbox4.caption:='jugador 3';
Groupbox5.caption:='jugador 4';
Groupbox6.caption:='jugador 5';
Groupbox7.caption:='jugador 6';
Groupbox8.caption:='options de juego';
Groupbox9.Caption:='idomas';

panel1.caption:='almacene de perfil de ajustes';
panel2.Caption:='carge de perfil de ajustes';
panel3.caption:='retire de ajustes';
panel4.caption:='editor de mapa';
panel5.Caption:='ARRANCE EL JUEGO';
Panel6.caption:='TERMINE EL PROGRAMA';

Form1.Caption:='Achtung, die Kurve! V1.1 - menu - de EquinoxOmega';

Form4.caption:='Achtung, die Kurve! V1.1 - editor de mapa - de EquinoxOmega';
form4.panel1.Caption:='nuevo';
form4.panel2.Caption:='almacene';
form4.panel3.Caption:='carge';
form4.panel4.Caption:='termine sin utilizavión de mapa';
form4.panel5.Caption:='termine por utilizavión de mapa';
form4.panel6.Caption:='(1) cañón';
form4.panel7.Caption:='(2) campo de fuerza';
form4.panel8.Caption:='(3) mina de casco';
form4.panel9.Caption:='(4) constructor de muros';

form4.label1.caption:='anchura:';
Form4.label2.caption:='color:';


radiobutton23.caption:='jamás renova el mapa';
radiobutton24.caption:='renova el mapa después cada vuelta';
radiobutton25.caption:='permanante renovación de muros de mapa';
checkbox16.caption:='utiliza el mapa en la actualidad';


label46.Caption:='número de puntos';

groupbox10.Caption:='modo de victoria';
Radiobutton26.Caption:='vueltas';
Radiobutton27.Caption:='puntos';
Checkbox17.Caption:='no-mortals tiros';
Checkbox18.Caption:='power-ups';
Checkbox19.Caption:='power-downs';

end;
end;
end;


procedure Tform1.checksprache;
var F:file of integer;
begin

sprache:=0;                  //Sprache einstellen

assignfile(F,'lingua.dat');
reset(F);
read(F,sprache);
closefile(F);

case sprache of
0:radiobutton19.checked:=true;
1:radiobutton20.checked:=true;
2:radiobutton21.checked:=true;
3:radiobutton22.checked:=true;
end;
spracheander;

end;

procedure TForm1.RadioButton26Click(Sender: TObject);
begin
label45.visible:=true;   //Zwischen Runden und Punkte Modus wechseln
label46.Visible:=false;
end;

procedure TForm1.RadioButton27Click(Sender: TObject);
begin
label45.visible:=false;   //Zwischen Runden und Punkte Modus wechseln
label46.Visible:=true;
end;

end.
