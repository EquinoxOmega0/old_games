unit mapedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Buttons;

type
  TForm4 = class(TForm)
    PaintBox1: TPaintBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Shape1: TShape;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    ListBox1: TListBox;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      procedure pinsel1(x,y:integer);
      procedure pinsel2(x,y:integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure linie1(x,y:integer);
    procedure linie2(x,y:integer);
    procedure full(x,y:integer);
    procedure extrazeugs(x,y:integer);
    procedure loesch;
    procedure setkanone(x,y:integer);
    procedure setmine(x,y:integer);
    procedure setbuilder(x,y:integer);
    procedure kraftfeld1(x,y:integer);
    procedure Panel3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


type Tspez1=record
x,y:integer;
end;
                               //Spezialeffekte Typen
type Tspez2=record
x1,x2,y1,y2:integer;
end;

type Tdaten=record
  gun:array[0..4] of Tspez1;
  mine:array[0..9] of Tspez1;
  builder:array[0..2] of Tspez1;
  ffield:array [0..2] of Tspez2;      //Sammeltyp
  karte:array[0..450,0..384] of byte;
  end;



var
  Form4: TForm4;
  pic,puf,ganz,pgun,pmine,pffield,pbuilder:Tbitmap;
  auswahl:byte;
  down,kf:boolean;
  ax,ay:integer;
  dat:Tdaten;

implementation

uses menu;

{$R *.dfm}

procedure TForm4.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
down:=false;
if shape1.Brush.color=clwhite
then
shape1.Brush.Color:=clblack                 //fest durchlässig setzen
else
shape1.Brush.color:=clwhite;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
BitBtn1.Enabled:=false;  //Pinsel auswählen
BitBtn2.Enabled:=true;
BitBtn3.Enabled:=true;
panel6.enabled:=true;
panel7.enabled:=true;
panel8.enabled:=true;
panel9.Enabled:=true;
auswahl:=0;
down:=false;
kf:=false;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
BitBtn1.Enabled:=true;  //Linie auswählen
BitBtn2.Enabled:=false;
BitBtn3.Enabled:=true;
panel6.enabled:=true;
panel7.enabled:=true;
panel8.enabled:=true;
panel9.Enabled:=true;
auswahl:=1;
down:=false;
kf:=false;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
BitBtn1.Enabled:=true;  //Füller auswählen
BitBtn2.Enabled:=true;
BitBtn3.Enabled:=false;
panel6.enabled:=true;
panel7.enabled:=true;
panel8.enabled:=true;
panel9.Enabled:=true;
auswahl:=2;
down:=false;
kf:=false;
end;

procedure TForm4.Panel6Click(Sender: TObject);
begin
BitBtn1.Enabled:=true;  //Geschütz auswählen
BitBtn2.Enabled:=true;
BitBtn3.Enabled:=true;
panel6.enabled:=false;
panel7.enabled:=true;
panel8.enabled:=true;
panel9.Enabled:=true;
auswahl:=3;
down:=false;
kf:=false;
end;

procedure TForm4.Panel7Click(Sender: TObject);
begin
BitBtn1.Enabled:=true;  //Kraftfeld auswählen
BitBtn2.Enabled:=true;
BitBtn3.Enabled:=true;
panel6.enabled:=true;
panel7.enabled:=false;
panel8.enabled:=true;
panel9.Enabled:=true;
auswahl:=4;
down:=false;
kf:=false;
end;

procedure TForm4.Panel8Click(Sender: TObject);
begin
BitBtn1.Enabled:=true;  //Splittermine auswählen
BitBtn2.Enabled:=true;
BitBtn3.Enabled:=true;
panel6.enabled:=true;
panel7.enabled:=true;
panel8.enabled:=false;
panel9.Enabled:=true;
auswahl:=5;
down:=false;
kf:=false;
end;

procedure TForm4.Panel9Click(Sender: TObject);
begin
BitBtn1.Enabled:=true;  //Mauerbauer auswählen
BitBtn2.Enabled:=true;
BitBtn3.Enabled:=true;
panel6.enabled:=true;
panel7.enabled:=true;
panel8.enabled:=true;
panel9.Enabled:=false;
auswahl:=6;
down:=false;
kf:=false;
end;

procedure TForm4.FormCreate(Sender: TObject);
var i:integer;
begin                             // Erzeugen der Bitmaps
pic:=Tbitmap.create;
puf:=Tbitmap.create;
ganz:=Tbitmap.create;

pic.Width:=paintbox1.Width;
pic.Height:=paintbox1.Height;
puf.Width:=paintbox1.Width;
puf.Height:=paintbox1.Height;
ganz.Width:=paintbox1.Width;
ganz.Height:=paintbox1.Height;

pic.Canvas.Brush.Color:=clblack;
pic.Canvas.fillrect(rect(0,0,paintbox1.width,paintbox1.Height));
   pic.canvas.Pen.Width:=2;
  pic.Canvas.Pen.Color:=clwhite;
    pic.Canvas.MoveTo(1,1);
    pic.Canvas.lineto(449,1);
    pic.Canvas.lineto(449,383);
    pic.Canvas.lineto(1,383);
    pic.Canvas.lineto(1,1);
       pic.canvas.Pen.Width:=spinedit1.value;
puf.canvas.draw(0,0,pic);
ganz.canvas.draw(0,0,pic);


pgun:=Tbitmap.create;
pmine:=Tbitmap.create;
pffield:=Tbitmap.create;
pbuilder:=Tbitmap.create;

pgun.LoadFromFile('images/geschuetz.bmp');
pmine.LoadFromFile('images/splittermine.bmp');
pffield.LoadFromFile('images/kraftfeldgenerator.bmp');
pbuilder.LoadFromFile('images/mauerbauer.bmp');
pgun.Transparent:=true;
pgun.transparentcolor:=clblack;
pmine.Transparent:=true;
pmine.transparentcolor:=clblack;
pffield.Transparent:=true;
pffield.transparentcolor:=clblack;
pbuilder.Transparent:=true;
pbuilder.transparentcolor:=clblack;

for i:=0 to 2 do
begin
dat.builder[i].x:=-1;
dat.builder[i].y:=-1;
dat.ffield[i].x1:=-1;
dat.ffield[i].y1:=-1;            //Initialisieren des Daten-Arrays
dat.ffield[i].x2:=-1;
dat.ffield[i].y2:=-1;
end;
for i:=0 to 4 do
begin
dat.gun[i].x:=-1;
dat.gun[i].y:=-1;
end;
for i:=0 to 9 do
begin
dat.mine[i].x:=-1;
dat.mine[i].y:=-1;
end;

auswahl:=0;
paintbox1.Canvas.Draw(0,0,ganz);
down:=false;
kf:=false;
end;

procedure TForm4.Panel1Click(Sender: TObject);
begin
loesch; //Neu

end;

procedure TForm4.Panel4Click(Sender: TObject);
begin
form4.Visible:=false;
Loesch;
form1.CheckBox16.Checked:=false;
form1.visible:=true; //Beenden ohne Übernehmen
end;

procedure TForm4.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
case auswahl of
0:pinsel2(x,y);
1:linie2(x,y);
end;
extrazeugs(x,y);
paintbox1.canvas.Draw(0,0,ganz);
label3.Caption:='('+inttostr(x*2)+'/'+inttostr(y*2)+')';
end;

procedure TForm4.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button=mbleft
then
down:=true;
case auswahl of
0:pinsel1(x,y);
1:linie1(x,y);
2:full(x,y);
3:setkanone(x,y);
4:kraftfeld1(x,y);
5:setmine(x,y);
6:setbuilder(x,y);
end;

if button=mbright
then
pic.canvas.draw(0,0,puf);

extrazeugs(x,y);
paintbox1.canvas.Draw(0,0,ganz);
label3.Caption:='('+inttostr(x*2)+'/'+inttostr(y*2)+')';
end;

procedure TForm4.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

case auswahl of
0:begin
end;
end;

 down:=false;
extrazeugs(x,y);
paintbox1.canvas.Draw(0,0,ganz);
label3.Caption:='('+inttostr(x*2)+'/'+inttostr(y*2)+')';
end;


   procedure TForm4.pinsel1(x,y:integer);
   begin //Pinsel starten
   if down=true
   then
   begin
   puf.canvas.Draw(0,0,pic);
   pic.Canvas.Pen.Color:=shape1.Brush.color;
   pic.canvas.pen.width:=spinedit1.value;
   pic.canvas.moveto(x,y);
   end;
   end;
   
      procedure TForm4.pinsel2(x,y:integer);
      begin //Pinsel malen
      if down=true
      then
      begin
      pic.canvas.LineTo(x,y);
      end;
      end;

    procedure TForm4.linie1(x,y:integer);
    begin                  //Linie starten
    if down=true
    then
    begin
    puf.canvas.Draw(0,0,pic);
   pic.Canvas.Pen.Color:=shape1.Brush.color;
   pic.canvas.pen.width:=spinedit1.value;
   ax:=x;
   ay:=y;
    end;
    end;


    procedure TForm4.linie2(x,y:integer);
    begin                  //Linie zeichnen
    if down=true
      then
      begin
      pic.Canvas.Draw(0,0,puf);
      pic.canvas.MoveTo(ax,ay);
      pic.canvas.LineTo(x,y);
      end;
    end;

    procedure TForm4.full(x,y:integer);
    var local:integer;
    begin                  //Füllen
    if down=true
      then
      begin
      puf.Canvas.Draw(0,0,pic);

   pic.canvas.Brush.color:=shape1.Brush.color;
local:=pic.canvas.pixels[x,y];
pic.canvas.FloodFill(x, y, local,fsSurface);
      end;
    end;

    procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form4.Visible:=false;
form1.visible:=true; //Beenden ohne Übernehmen
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form4.Visible:=false;
form1.visible:=true; //Beenden ohne Übernehmen
end;

procedure TForm4.extrazeugs(x,y:integer);
var i:integer;
begin                          //Extra Sachen hinzuzeichnen
ganz.Canvas.Draw(0,0,pic);

for i:=0 to 4 do
if dat.gun[i].x<>-1
then
ganz.Canvas.StretchDraw(rect(dat.gun[i].x-2,dat.gun[i].y-2,dat.gun[i].x+2,dat.gun[i].y+2),pgun);

for i:=0 to 9 do
if dat.mine[i].x<>-1
then
ganz.Canvas.StretchDraw(rect(dat.mine[i].x-2,dat.mine[i].y-2,dat.mine[i].x+2,dat.mine[i].y+2),pmine);

for i:=0 to 2 do
if dat.builder[i].x<>-1
then
ganz.Canvas.StretchDraw(rect(dat.builder[i].x-4,dat.builder[i].y-4,dat.builder[i].x+4,dat.builder[i].y+4),pbuilder);

ganz.Canvas.Pen.Width:=1;
ganz.Canvas.Pen.Color:=claqua;

for i:=0 to 2 do
if dat.ffield[i].x2<>-1
then
begin
ganz.Canvas.StretchDraw(rect(dat.ffield[i].x1-2,dat.ffield[i].y1-2,dat.ffield[i].x1+2,dat.ffield[i].y1+2),pffield);
ganz.Canvas.StretchDraw(rect(dat.ffield[i].x2-2,dat.ffield[i].y2-2,dat.ffield[i].x2+2,dat.ffield[i].y2+2),pffield);
ganz.Canvas.moveto(dat.ffield[i].x1,dat.ffield[i].y1);
ganz.Canvas.lineto(dat.ffield[i].x2,dat.ffield[i].y2);
end;

if kf=true
then
begin
ganz.canvas.moveto(dat.ffield[ax].x1,dat.ffield[ax].y1);
ganz.Canvas.LineTo(x,y);

end;

end;

 procedure Tform4.loesch;
 var i:integer;
 begin                   
pic.Canvas.Brush.Color:=clblack;            //Löschen
pic.Canvas.fillrect(rect(0,0,paintbox1.width,paintbox1.Height));
   pic.canvas.Pen.Width:=2;
  pic.Canvas.Pen.Color:=clwhite;
    pic.Canvas.MoveTo(1,1);
    pic.Canvas.lineto(449,1);
    pic.Canvas.lineto(449,383);
    pic.Canvas.lineto(1,383);
    pic.Canvas.lineto(1,1);
       pic.canvas.Pen.Width:=spinedit1.value;
puf.canvas.draw(0,0,pic);
ganz.canvas.draw(0,0,pic);
  kf:=false;
  down:=false;
listbox1.Clear;
BitBtn1.Enabled:=false;  
BitBtn2.Enabled:=true;
BitBtn3.Enabled:=true;
panel6.enabled:=true;
panel7.enabled:=true;
panel8.enabled:=true;
panel9.Enabled:=true;

for i:=0 to 2 do
begin
dat.builder[i].x:=-1;
dat.builder[i].y:=-1;
dat.ffield[i].x1:=-1;
dat.ffield[i].y1:=-1;
dat.ffield[i].x2:=-1;
dat.ffield[i].y2:=-1;
end;
for i:=0 to 4 do
begin
dat.gun[i].x:=-1;
dat.gun[i].y:=-1;
end;
for i:=0 to 9 do
begin
dat.mine[i].x:=-1;
dat.mine[i].y:=-1;
end;

spinedit1.value:=3;
shape1.Brush.Color:=clwhite;

paintbox1.Canvas.Draw(0,0,ganz);
 end;


    procedure Tform4.setkanone(x,y:integer);
    var i,a:integer;
    begin
    a:=-1;       //Geschütz erzeugen
   for i:=4 downto 0 do
   if dat.gun[i].x=-1
   then
   a:=i;

   if a=-1
   then
   begin
   if form1.radiobutton19.checked=true
   then
   MessageDlg('zu viele Geschütze!', mtInformation, [mbOk], 0);
   if form1.radiobutton20.checked=true
   then
   MessageDlg('too many guns!', mtInformation, [mbOk], 0);
   if form1.radiobutton21.checked=true
   then
   MessageDlg('trop des artilleries!', mtInformation, [mbOk], 0);
   if form1.radiobutton22.checked=true
   then
   MessageDlg('¡demasiado de cañóns!', mtInformation, [mbOk], 0);
   end
   else
   begin
   dat.gun[a].x:=x;
   dat.gun[a].y:=y;
   listbox1.Items.Add('(1) - '+inttostr(a)+' : ('+inttostr(dat.gun[a].x*2)+'/'+inttostr(dat.gun[a].y*2)+')');
   end;
   
    end;


   procedure Tform4.setmine(x,y:integer);
    var i,a:integer;
    begin
    a:=-1;       //Mine erzeugen
   for i:=9 downto 0 do
   if dat.mine[i].x=-1
   then
   a:=i;

   if a=-1
   then
   begin
   if form1.radiobutton19.checked=true
   then
   MessageDlg('zu viele Splitterminen!', mtInformation, [mbOk], 0);
   if form1.radiobutton20.checked=true
   then
   MessageDlg('too many splintermines!', mtInformation, [mbOk], 0);
   if form1.radiobutton21.checked=true
   then
   MessageDlg('trop des mines à fragmentation!', mtInformation, [mbOk], 0);
   if form1.radiobutton22.checked=true
   then
   MessageDlg('¡demasiado de minas de casco!', mtInformation, [mbOk], 0);
   end
   else
   begin
   dat.mine[a].x:=x;
   dat.mine[a].y:=y;
   listbox1.Items.Add('(3) - '+inttostr(a)+' : ('+inttostr(dat.mine[a].x*2)+'/'+inttostr(dat.mine[a].y*2)+')');
   end;
   
    end;


        procedure Tform4.setbuilder(x,y:integer);
    var i,a:integer;
    begin
    a:=-1;       //Mauerbauer erzeugen
   for i:=2 downto 0 do
   if dat.builder[i].x=-1
   then
   a:=i;

   if a=-1
   then
   begin
   if form1.radiobutton19.checked=true
   then
   MessageDlg('zu viele Mauerbauer!', mtInformation, [mbOk], 0);
   if form1.radiobutton20.checked=true
   then
   MessageDlg('too many wallbuilders!', mtInformation, [mbOk], 0);
   if form1.radiobutton21.checked=true
   then
   MessageDlg('trop des constructeurs des murs!', mtInformation, [mbOk], 0);
   if form1.radiobutton22.checked=true
   then
   MessageDlg('¡demasiado de constructores de muros!', mtInformation, [mbOk], 0);
   end
   else
   begin
   dat.builder[a].x:=x;
   dat.builder[a].y:=y;
   listbox1.Items.Add('(4) - '+inttostr(a)+' : ('+inttostr(dat.builder[a].x*2)+'/'+inttostr(dat.builder[a].y*2)+')');
   end;
   
    end;


        procedure Tform4.kraftfeld1(x,y:integer);
    var i,a:integer;
    begin
    if kf=false
    then
    begin
    a:=-1;       //Kraftfeld erzeugen
   for i:=2 downto 0 do
   if dat.ffield[i].x2=-1
   then
   a:=i;

   if a=-1
   then
   begin
   if form1.radiobutton19.checked=true
   then
   MessageDlg('zu viele Kraftfelder!', mtInformation, [mbOk], 0);
   if form1.radiobutton20.checked=true
   then
   MessageDlg('too many forcefields!', mtInformation, [mbOk], 0);
   if form1.radiobutton21.checked=true
   then
   MessageDlg('trop des champs de force!', mtInformation, [mbOk], 0);
   if form1.radiobutton22.checked=true
   then
   MessageDlg('¡demasiado de campos de fuerza!', mtInformation, [mbOk], 0);
   end
   else
   begin
   dat.ffield[a].x1:=x;
   dat.ffield[a].y1:=y;
   ax:=a;
   kf:=true;
  end;


   end
   else
   begin
   dat.ffield[ax].x2:=x;
   dat.ffield[ax].y2:=y;
   
   listbox1.Items.Add('(2) - '+inttostr(ax)+' : ('+inttostr(dat.ffield[ax].x1*2)+'/'+inttostr(dat.ffield[ax].y1*2)+') - ('+inttostr(dat.ffield[ax].x2*2)+'/'+inttostr(dat.ffield[ax].y2*2)+')');

   kf:=false;
   end;

    end;

    procedure TForm4.Panel3Click(Sender: TObject);
    var i,e:integer;
        F:file of Tdaten;
begin     //Laden
 
 if opendialog1.Execute
 then     
 begin
 loesch;
 assignfile(F,savedialog1.FileName);
 reset(F);
 read(F,dat);
 closefile(F);

 for i:=0 to 450 do
 for e:=0 to 384 do
 if dat.karte[i,e]=0
 then
 pic.Canvas.Pixels[i,e]:=clblack
 else
 pic.Canvas.Pixels[i,e]:=clwhite;

 puf.canvas.draw(0,0,pic);
 ganz.Canvas.draw(0,0,pic);
 paintbox1.canvas.draw(0,0,pic);

 for i:=0 to 4 do
 if dat.gun[i].x<>-1
 then
 listbox1.Items.Add('(1) - '+inttostr(i)+' : ('+inttostr(dat.gun[i].x*2)+'/'+inttostr(dat.gun[i].y*2)+')');

 for i:=0 to 2 do
 if dat.ffield[i].x2<>-1
 then
 listbox1.Items.Add('(2) - '+inttostr(i)+' : ('+inttostr(dat.ffield[i].x1*2)+'/'+inttostr(dat.ffield[i].y1*2)+') - ('+inttostr(dat.ffield[i].x2*2)+'/'+inttostr(dat.ffield[i].y2*2)+')');

 for i:=0 to 9 do
 if dat.mine[i].x<>-1
 then
 listbox1.Items.Add('(3) - '+inttostr(i)+' : ('+inttostr(dat.mine[i].x*2)+'/'+inttostr(dat.mine[i].y*2)+')');

 for i:=0 to 2 do
 if dat.builder[i].x<>-1
 then
 listbox1.Items.Add('(4) - '+inttostr(i)+' : ('+inttostr(dat.builder[i].x*2)+'/'+inttostr(dat.builder[i].y*2)+')');

 end;
end;

procedure TForm4.Panel2Click(Sender: TObject);
   var    F:file of Tdaten;
   i,e:integer;
begin

                 //Speichern
 if savedialog1.Execute
 then
 begin
 for i:=0 to 450 do
 for e:=0 to 384 do
 if pic.Canvas.Pixels[i,e]=0
 then
 dat.karte[i,e]:=0
 else
 dat.karte[i,e]:=1;
 assignfile(F,savedialog1.FileName);
 rewrite(F);
 write(F,dat);
 closefile(F);
 end;

 end;

procedure TForm4.BitBtn4Click(Sender: TObject);
var a,i,t,n:integer;
s:string;
begin      //Spezialzeugs löschen
a:=-1;
for i:=0 to listbox1.Items.Count-1 do
if listbox1.Selected[i]=true
then
a:=i;

if a<>-1
then
begin
s:=listbox1.Items.Strings[a];
t:=strtoint(s[2]);
n:=strtoint(s[7]);

case t of
1:begin
dat.gun[n].x:=-1;
dat.gun[n].y:=-1;
end;
2:begin
dat.ffield[n].x1:=-1;
dat.ffield[n].y1:=-1;
dat.ffield[n].x2:=-1;
dat.ffield[n].y2:=-1;
end;
3:begin
dat.mine[n].x:=-1;
dat.mine[n].y:=-1;
end;
4:begin
dat.builder[n].x:=-1;
dat.builder[n].y:=-1;
end;
end;

listbox1.Items.Delete(a);

extrazeugs(0,0);
paintbox1.canvas.Draw(0,0,ganz);

end;

end;

procedure TForm4.Panel5Click(Sender: TObject);
   var    F:file of Tdaten;
   i,e:integer;
begin

                // Beenden mit Übernehmen, Speichern in aktu.mp
 for i:=0 to 450 do
 for e:=0 to 384 do
 if pic.Canvas.Pixels[i,e]=0
 then
 dat.karte[i,e]:=0
 else
 dat.karte[i,e]:=1;
 assignfile(F,'aktu.mp');
 rewrite(F);
 write(F,dat);
 closefile(F);

 form4.Visible:=false;
 form1.CheckBox16.Checked:=true;
form1.visible:=true;
 end;
end.
