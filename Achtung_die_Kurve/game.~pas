unit game;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, math, StdCtrls;

  type ttast=record
  daten:array[0..5,0..4] of byte
  end;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    Label2: TLabel;
    PaintBox2: TPaintBox;
    Label3: TLabel;
    PaintBox3: TPaintBox;
    Label4: TLabel;
    PaintBox4: TPaintBox;
    Label5: TLabel;
    PaintBox5: TPaintBox;
    Label6: TLabel;
    PaintBox6: TPaintBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure init(keys:ttast);
    procedure getkeys;
    procedure zeichne;
    procedure kolli;
    procedure springe(player:integer);
    procedure feuer(player:integer);
    procedure beschleunige(player:integer);
    procedure berechne;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Torpedoflug;
    procedure statusanzeige;
    procedure punktreset;
    procedure AIsteuer;
    procedure loadmap;
    procedure kartensteuerung;
    procedure setpowerupdown;
    procedure rechenpowerud;
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

  type Tspieler=record
  x,y,ax,ay,v:extended;
  farbe,kurs,speedup,munition,jumper,punkte,bgun,bjumper,unsensi:longint;
  typ:byte;        //Record für Spieler
  tasten:array[0..4] of byte;
  bspeed:boolean;
  end;

  type TTorpedo=record
  x,y,vx,vy:extended;
  zeit:longint;                      //record für Torpedos
  end;


type Tkanone=record
x,y,r,ladung:integer;
exist:boolean;                         //Kanonentyp
end;



type Tkraftfeld=record
x1,x2,y1,y2:integer;
exist1,exist2:boolean;                      //Kraftfeldtyp
end;



type Tmine=record
x,y,explo:integer;
exist:boolean;                                 //Minentyp
end;



type Tmauerbauer=record
x,y,ax,ay,r,timer:integer;
exist:boolean;                              //Mauerbauertyp
end;

type Tsplitter=record
x,y,vx,vy,ax,ay:integer;
exist:boolean;
end;

type TPowerud=record
x,y,aktiv:integer;
typ:byte;
end;

var
  Form2: TForm2;
  speicherkeys:ttast;
  spieler:array[0..5] of TSpieler;
  bild,puf,anzeig,karte:Tbitmap;
  schuss,sprung,beschl,durch,hops:boolean;
  qc,qs:array[0..180] of extended;
  t:array[0..25] of TTorpedo;
  tpos,countdown,runden:integer;
  kopfan:array[0..5] of boolean;
  kpic:array[0..5] of Tbitmap;
  dat:Tdaten;
  kanone:array[0..4] of Tkanone;
  kraftfeld:array[0..2] of Tkraftfeld;
  mine:array[0..9] of Tmine;
  mauerbauer:array[0..2] of TMauerbauer;
  splitter:array[0..300] of TSplitter;
  mb:array[0..179] of Tbitmap;
  gesch:array[0..179] of Tbitmap;
  kfgen,splitm:Tbitmap;
  spielernamen:array[0..5] of string;
  powerud:array[0..9] of Tpowerud;

implementation


uses menu;
{$R *.dfm}


procedure TForm2.init(keys:ttast);
var i,e:integer;
r:extended;
again:boolean;
begin

randomize;

speicherkeys:=keys;


for i:=0 to 4 do
kanone[i].exist:=false;

for i:=0 to 2 do
begin
kraftfeld[i].exist1:=false;
kraftfeld[i].exist2:=false;
mauerbauer[i].exist:=false;
end;

for i:=0 to 9 do
mine[i].exist:=false;

for i:=0 to 300 do
splitter[i].exist:=false;

form2.Canvas.Brush.Color:=clblack;
form2.Canvas.FillRect(rect(0,0,1024,768));
kopfan[0]:=form1.CheckBox1.checked;
kopfan[1]:=form1.CheckBox2.checked;
kopfan[2]:=form1.CheckBox3.checked;     //Kopf überprüfen
kopfan[3]:=form1.CheckBox4.checked;
kopfan[4]:=form1.CheckBox5.checked;
kopfan[5]:=form1.CheckBox6.checked;

spielernamen[0]:=form1.Edit1.Text;
spielernamen[1]:=form1.Edit2.Text;
spielernamen[2]:=form1.Edit3.Text;
spielernamen[3]:=form1.Edit4.Text;
spielernamen[4]:=form1.Edit5.Text;
spielernamen[5]:=form1.Edit6.Text;

if Form1.radiobutton19.checked=true
    then
    case i of
    0:label7.caption:='Punkte: '+inttostr(spieler[i].punkte);
    1:label8.caption:='Punkte: '+inttostr(spieler[i].punkte);
    2:label9.caption:='Punkte: '+inttostr(spieler[i].punkte);
    3:label10.caption:='Punkte: '+inttostr(spieler[i].punkte);
    4:label11.caption:='Punkte: '+inttostr(spieler[i].punkte);
    5:label12.caption:='Punkte: '+inttostr(spieler[i].punkte);
    end;

    if Form1.radiobutton20.checked=true
    then
    case i of
    0:label7.caption:='points: '+inttostr(spieler[i].punkte);
    1:label8.caption:='points: '+inttostr(spieler[i].punkte);
    2:label9.caption:='points: '+inttostr(spieler[i].punkte);
    3:label10.caption:='points: '+inttostr(spieler[i].punkte);
    4:label11.caption:='points: '+inttostr(spieler[i].punkte);
    5:label12.caption:='points: '+inttostr(spieler[i].punkte);
    end;


    if form1.radiobutton21.checked=true
    then
    case i of
    0:label7.caption:='points: '+inttostr(spieler[i].punkte);
    1:label8.caption:='points: '+inttostr(spieler[i].punkte);
    2:label9.caption:='points: '+inttostr(spieler[i].punkte);
    3:label10.caption:='points: '+inttostr(spieler[i].punkte);
    4:label11.caption:='points: '+inttostr(spieler[i].punkte);
    5:label12.caption:='points: '+inttostr(spieler[i].punkte);
    end;


        if Form1.radiobutton22.checked=true
    then
    case i of
    0:label7.caption:='puntos: '+inttostr(spieler[i].punkte);
    1:label8.caption:='puntos: '+inttostr(spieler[i].punkte);
    2:label9.caption:='puntos: '+inttostr(spieler[i].punkte);
    3:label10.caption:='puntos: '+inttostr(spieler[i].punkte);
    4:label11.caption:='puntos: '+inttostr(spieler[i].punkte);
    5:label12.caption:='puntos: '+inttostr(spieler[i].punkte);
    end;

for i:=0 to 5 do
begin
kpic[i].Transparent:=true;
kpic[i].TransparentColor:=clblack;
end;

kpic[0].Canvas.stretchdraw(rect(0,0,10,10),form1.Image1.Picture.graphic);
kpic[1].Canvas.stretchdraw(rect(0,0,10,10),form1.Image2.Picture.graphic);
kpic[2].Canvas.stretchdraw(rect(0,0,10,10),form1.Image3.Picture.graphic);
kpic[3].Canvas.stretchdraw(rect(0,0,10,10),form1.Image4.Picture.graphic);
kpic[4].Canvas.stretchdraw(rect(0,0,10,10),form1.Image5.Picture.graphic);
kpic[5].Canvas.stretchdraw(rect(0,0,10,10),form1.Image6.Picture.graphic);


Tpos:=0;
countdown:=1500;

for i:=0 to 25 do          //Torpedos initialisieren
t[i].zeit:=0;

durch:=false;
if form1.checkbox11.checked=true
then
durch:=true;

if  Form1.radiobutton1.checked=true
then
spieler[0].typ:=0
else
if Form1.radiobutton2.checked=true
then                                          //Checke Auswahl von Spielern
spieler[0].typ:=1
else
spieler[0].typ:=2;

if  Form1.radiobutton4.checked=true
then
spieler[1].typ:=0
else
if Form1.radiobutton5.checked=true
then
spieler[1].typ:=1
else
spieler[1].typ:=2;

if  Form1.radiobutton7.checked=true
then
spieler[2].typ:=0
else
if Form1.radiobutton8.checked=true
then
spieler[2].typ:=1
else
spieler[2].typ:=2;

if  Form1.radiobutton10.checked=true
then
spieler[3].typ:=0
else
if Form1.radiobutton11.checked=true
then
spieler[3].typ:=1
else
spieler[3].typ:=2;

if  Form1.radiobutton13.checked=true
then
spieler[4].typ:=0
else
if Form1.radiobutton14.checked=true
then
spieler[4].typ:=1
else
spieler[4].typ:=2;


if  Form1.radiobutton16.checked=true
then
spieler[5].typ:=0
else
if Form1.radiobutton17.checked=true
then
spieler[5].typ:=1
else
spieler[5].typ:=2;
                                                        //Farben setzen
label1.Font.Color:=form1.Shape1.Brush.Color;
label2.Font.Color:=form1.Shape2.Brush.Color;
label3.Font.Color:=form1.Shape3.Brush.Color;
label4.Font.Color:=form1.Shape4.Brush.Color;
label5.Font.Color:=form1.Shape5.Brush.Color;
label6.Font.Color:=form1.Shape6.Brush.Color;

label7.Font.Color:=form1.Shape1.Brush.Color;
label8.Font.Color:=form1.Shape2.Brush.Color;
label9.Font.Color:=form1.Shape3.Brush.Color;
label10.Font.Color:=form1.Shape4.Brush.Color;
label11.Font.Color:=form1.Shape5.Brush.Color;
label12.Font.Color:=form1.Shape6.Brush.Color;

label1.Caption:=form1.Edit1.Text;
label2.Caption:=form1.Edit2.Text;           //Namen vergeben
label3.Caption:=form1.Edit3.Text;
label4.Caption:=form1.Edit4.Text;
label5.Caption:=form1.Edit5.Text;
label6.Caption:=form1.Edit6.Text;




 for i:=0 to 5 do
begin
spieler[i].munition:=2000;
spieler[i].speedup:=1000;                      //Spieler Werte setzen
spieler[i].jumper:=1000;

spieler[i].bgun:=0;
spieler[i].bjumper:=0;
spieler[i].bspeed:=false;
spieler[i].unsensi:=0;

spieler[i].v:=2;

repeat
again:=false;
spieler[i].x:=random(700)+100;
spieler[i].y:=random(568)+100;
for e:=0 to i do
if e<>i
then
begin
r:=sqr(spieler[i].x-spieler[e].x)+sqr(spieler[i].y-spieler[e].y);
if r<10000
then
again:=true;
end;
until again=false;

spieler[i].kurs:=random(72);
spieler[i].ax:=spieler[i].x;
spieler[i].ay:=spieler[i].y;

end;




for i:=0 to 5 do                //Tasten leer setzen
for e:=0 to 4 do
spieler[i].tasten[e]:=0;

schuss:=false;
beschl:=false;
sprung:=false;


for i:=0 to 5 do
if spieler[i].typ=1
then
begin
spieler[i].tasten[0]:=keys.daten[i,0];
spieler[i].tasten[1]:=keys.daten[i,1];
spieler[i].tasten[2]:=keys.daten[i,2];
spieler[i].tasten[3]:=keys.daten[i,3];
spieler[i].tasten[4]:=keys.daten[i,4];
                                   //Tastenübergabe
if  (form1.checkbox8.checked=true)
then
begin
sprung:=true;
end;


if (form1.checkbox10.checked=true)
then
begin
schuss:=true;
end;

if (form1.checkbox14.checked=true)
then
begin
beschl:=true;
end;

end;

spieler[0].farbe:=form1.Shape1.Brush.color;
spieler[1].farbe:=form1.Shape2.Brush.color;
spieler[2].farbe:=form1.Shape3.Brush.color;
spieler[3].farbe:=form1.Shape4.Brush.color;
spieler[4].farbe:=form1.Shape5.Brush.color;
spieler[5].farbe:=form1.Shape6.Brush.color;


bild.Width:=900;                            //Bild initialisieren
bild.Height:=768;
bild.Canvas.Brush.color:=clblack;
bild.canvas.FillRect(rect(0,0,900,768));


puf.Width:=900;                            //Bild initialisieren
puf.Height:=768;
puf.Canvas.Brush.color:=clblack;
puf.canvas.FillRect(rect(0,0,900,768));

if form1.CheckBox16.checked=true
then
loadmap;
setpowerupdown;
Timer1.Interval:=form1.Trackbar1.Position;
timer1.Enabled:=true;

end;


   procedure Tform2.getkeys;
  var i:integer;
   begin
   if getasynckeystate(27)<>0
   then
   begin
   timer1.Enabled:=false;
   form2.Visible:=false;
    form1.Bildschirmnormal;
   form1.Visible:=true;
   end;

    for i:=0 to 5 do                 //Tasten einlesen
   if spieler[i].typ=1
   then
   begin
   if getasynckeystate(spieler[i].tasten[0])<>0
   then
   begin
   dec(spieler[i].kurs);              //links
   if spieler[i].kurs<0
   then
   spieler[i].kurs:=179;
   end;

   if getasynckeystate(spieler[i].tasten[1])<>0
   then
   begin
   inc(spieler[i].kurs);
   if spieler[i].kurs>179            //rechts
   then
   spieler[i].kurs:=0;
   end;

   if (sprung=true) and (getasynckeystate(spieler[i].tasten[2])<>0)
   then                             //Sprung
   springe(i);
   

   if (schuss=true) and (getasynckeystate(spieler[i].tasten[3])<>0)
   then                             //Sprung
   feuer(i);


   if (beschl=true) and (getasynckeystate(spieler[i].tasten[4])<>0)
   then                             //Sprung
   beschleunige(i);
   

   end;
   end;
   
     procedure Tform2.berechne;
     var i,e:integer;
     winkel,abstand,abstand2:extended;
     parallel:boolean;
    begin          //Berechnung
    for i:=0 to 5 do
    if spieler[i].typ<>0
    then
    begin

    if spieler[i].bjumper>0
    then
    dec(spieler[i].bjumper);

    if form1.checkbox9.checked=true
    then
    if spieler[i].jumper<1000
    then                                   //Energie nachladen
    inc(spieler[i].jumper);

    if form1.checkbox15.checked=true
    then
    if spieler[i].speedup<1000
    then
    inc(spieler[i].speedup);

    if form1.CheckBox12.Checked=true
    then
    if spieler[i].munition<2000
    then
    inc(spieler[i].munition);

    if spieler[i].bgun>0
    then
    dec(spieler[i].bgun);

    if spieler[i].unsensi>0
    then
    dec(spieler[i].unsensi);

    spieler[i].ax:=spieler[i].x;
    spieler[i].ay:=spieler[i].y;

    if spieler[i].bspeed=true
    then
    begin
    if spieler[i].v<5
    then
    spieler[i].v:=spieler[i].v+0.5;
    spieler[i].speedup:=spieler[i].speedup-10;
    end;

    if spieler[i].speedup<10
    then
    spieler[i].bspeed:=false;

    
    if form1.checkbox13.checked=true
    then
    for e:=0 to 5 do
    if (spieler[e].typ<>0) and (i<>e)
    then
    begin

    parallel:=false;

    winkel:=spieler[e].kurs-spieler[i].kurs;

    winkel:=abs(winkel);

    if abs(winkel)<10
    then
    parallel:=true;


    
    winkel:=spieler[e].kurs-spieler[i].kurs-180;

    winkel:=abs(winkel);

    if abs(winkel)<10
    then
    parallel:=true;



    winkel:=spieler[e].kurs-spieler[i].kurs+180;

    winkel:=abs(winkel);

    if abs(winkel)<10
    then
    parallel:=true;


    if parallel=true
    then
    begin
    abstand:=(spieler[i].x-spieler[e].x)*(spieler[i].x-spieler[e].x)+(Spieler[i].y-spieler[e].y)*(spieler[i].y-spieler[e].y);
    if abstand<400
    then
    begin
    abstand2:=(spieler[i].x-(spieler[e].x-qs[Spieler[e].kurs]))*(spieler[i].x-(spieler[e].x-qs[Spieler[e].kurs]))+(Spieler[i].y-(spieler[e].y+qc[Spieler[e].kurs]))*(spieler[i].y-(spieler[e].y+qc[Spieler[e].kurs]));

    if abstand2<abstand
    then
    if spieler[i].v<3
    then
    spieler[i].v:=spieler[i].v+0.5;
    end;
    end;

    end;


    if spieler[i].v>2
    then
    spieler[i].v:=spieler[i].v-0.25;

    spieler[i].x:=spieler[i].x+spieler[i].v*qs[spieler[i].kurs];
    spieler[i].y:=spieler[i].y-spieler[i].v*qc[spieler[i].kurs];

    if form1.checkbox7.checked=true
    then
    if random(500)=1
    then
    begin
    spieler[i].x:=spieler[i].x+7*qs[spieler[i].kurs];
    spieler[i].y:=spieler[i].y-7*qc[spieler[i].kurs];
    spieler[i].ax:=spieler[i].x;
    spieler[i].ay:=spieler[i].y;
    end;

    end;

    end;

    procedure Tform2.zeichne;
    var i:integer;
    begin          //Zeichnen
    puf.canvas.Pen.Width:=5;

    puf.Canvas.Pen.Color:=clwhite;
    puf.Canvas.MoveTo(2,2);
    puf.Canvas.lineto(897,2);
    puf.Canvas.lineto(897,765);
    puf.Canvas.lineto(2,765);
    puf.Canvas.lineto(2,2);

    if (form1.CheckBox18.Checked=true) or (form1.checkbox19.checked=true)
    then
    for i:=0 to 9 do
    if powerud[i].aktiv=100
    then
    begin

             /////////////HIER NOCH PASSENDE BILDER EINFÜGEN UND DIE KOLLISIONSABFRAGE
             ////////////BEZÜGLICH DER FARBERKENNUNG ENTSPRECHEND ABÄNDERN

    end;

     puf.canvas.Pen.Width:=3;
    for i:=0 to 5 do
    if spieler[i].typ<>0
    then
    begin
    puf.canvas.pen.Color:=spieler[i].farbe;
    puf.canvas.MoveTo(round(spieler[i].ax),round(spieler[i].ay));
    puf.canvas.LineTo(round(spieler[i].x),round(spieler[i].y));

    if Form1.radiobutton19.checked=true
    then
    case i of
    0:label7.caption:='Punkte: '+inttostr(spieler[i].punkte);
    1:label8.caption:='Punkte: '+inttostr(spieler[i].punkte);
    2:label9.caption:='Punkte: '+inttostr(spieler[i].punkte);
    3:label10.caption:='Punkte: '+inttostr(spieler[i].punkte);
    4:label11.caption:='Punkte: '+inttostr(spieler[i].punkte);
    5:label12.caption:='Punkte: '+inttostr(spieler[i].punkte);
    end;

    if Form1.radiobutton20.checked=true
    then
    case i of
    0:label7.caption:='points: '+inttostr(spieler[i].punkte);
    1:label8.caption:='points: '+inttostr(spieler[i].punkte);
    2:label9.caption:='points: '+inttostr(spieler[i].punkte);
    3:label10.caption:='points: '+inttostr(spieler[i].punkte);
    4:label11.caption:='points: '+inttostr(spieler[i].punkte);
    5:label12.caption:='points: '+inttostr(spieler[i].punkte);
    end;


    if form1.radiobutton21.checked=true
    then
    case i of
    0:label7.caption:='points: '+inttostr(spieler[i].punkte);
    1:label8.caption:='points: '+inttostr(spieler[i].punkte);
    2:label9.caption:='points: '+inttostr(spieler[i].punkte);
    3:label10.caption:='points: '+inttostr(spieler[i].punkte);
    4:label11.caption:='points: '+inttostr(spieler[i].punkte);
    5:label12.caption:='points: '+inttostr(spieler[i].punkte);
    end;


        if Form1.radiobutton22.checked=true
    then
    case i of
    0:label7.caption:='puntos: '+inttostr(spieler[i].punkte);
    1:label8.caption:='puntos: '+inttostr(spieler[i].punkte);
    2:label9.caption:='puntos: '+inttostr(spieler[i].punkte);
    3:label10.caption:='puntos: '+inttostr(spieler[i].punkte);
    4:label11.caption:='puntos: '+inttostr(spieler[i].punkte);
    5:label12.caption:='puntos: '+inttostr(spieler[i].punkte);
    end;


    end;

    if schuss=true
    then
    torpedoflug
    else
    bild.canvas.Draw(0,0,puf);

    for i:=0 to 5 do
    if (kopfan[i]=true) and (spieler[i].typ<>0)
    then
    bild.Canvas.Draw(round(spieler[i].x-5),round(spieler[i].y-5),kpic[i]);


    form2.Canvas.Draw(0,0,bild);
    end;




    procedure Tform2.kolli;
    var i,e:integer;
    hit:boolean;
    begin          //Kollisionsabfrage
    for i:=0 to 5 do
    if spieler[i].typ<>0
    then
    begin
    hit:=false;

    if puf.Canvas.Pixels[round(spieler[i].x+qs[Spieler[i].kurs]),round(spieler[i].y-qc[Spieler[i].kurs])]<>0
    then
    hit:=true;

    if puf.Canvas.Pixels[round(spieler[i].x+qc[Spieler[i].kurs]),round(spieler[i].y+qs[Spieler[i].kurs])]<>0
    then
    hit:=true;

    if puf.Canvas.Pixels[round(spieler[i].x-qc[Spieler[i].kurs]),round(spieler[i].y-qs[Spieler[i].kurs])]<>0
    then
    hit:=true;

     if hit=true
     then
     begin
     spieler[i].typ:=0;
     for e:=0 to 5 do
     if (spieler[e].typ<>0)
     then
     inc(spieler[e].punkte);
     end;
     
    
    end;
    
    end;

    procedure Tform2.springe(player:integer);
    begin                       //Sprung
    if (spieler[player].jumper>249) and (spieler[player].bjumper=0)
    then
    begin
    spieler[player].x:=spieler[player].x+15*qs[spieler[player].kurs];
    spieler[player].y:=spieler[player].y-15*qc[spieler[player].kurs];
    spieler[player].ax:=spieler[player].x;
    spieler[player].ay:=spieler[player].y;
    spieler[player].jumper:=spieler[player].jumper-250;
    spieler[player].bjumper:=100;
    hops:=true;
    end;
    end;



    procedure Tform2.feuer(player:integer);
    begin                      //schuss
    if spieler[player].bgun=0
    then
    if spieler[player].munition>399
    then
    begin
    spieler[player].munition:=spieler[player].munition-400;
    spieler[player].bgun:=75;
    t[tpos].x:=spieler[player].x+5*qs[spieler[player].kurs];
    t[tpos].y:=spieler[player].y-5*qc[spieler[player].kurs];
    t[tpos].vx:=+7*qs[spieler[player].kurs];
    t[tpos].vy:=-7*qc[spieler[player].kurs];
    t[tpos].zeit:=200;
    inc(tpos);
    if tpos>25
    then
    tpos:=0;

    end;

    end;


    procedure Tform2.beschleunige(player:integer);
    begin                     //Beschleunigung
    if spieler[player].unsensi=0
    then
    if spieler[player].bspeed=false
    then
    begin
    if spieler[player].speedup>9
    then
    spieler[player].bspeed:=true;
    spieler[player].unsensi:=15;
    end
    else
    begin
    spieler[player].bspeed:=false;
     spieler[player].unsensi:=15;
    end;
    
    end;




procedure TForm2.FormCreate(Sender: TObject);
var i:integer;
begin
for i:=0 to 180 do
begin
qc[i]:=cos(i*PI/90);
qs[i]:=sin(i*PI/90);
end;

bild:=Tbitmap.Create;        //Bilder erzeugen
puf:=Tbitmap.Create;
anzeig:=Tbitmap.create;
karte:=Tbitmap.create;
anzeig.Width:=110;
anzeig.Height:=80;

for i:=0 to 179 do
begin
mb[i]:=Tbitmap.create;
mb[i].LoadFromFile('images/mauerbauer/'+inttostr(i*200)+'.bmp');
mb[i].Transparent:=true;
mb[i].TransparentColor:=clblack;
gesch[i]:=Tbitmap.Create;
gesch[i].LoadFromFile('images/geschuetz/'+inttostr(i*200)+'.bmp');
gesch[i].Transparent:=true;
gesch[i].TransparentColor:=clblack;
end;


kfgen:=Tbitmap.create;
kfgen.LoadFromFile('images/kraftfeldgenerator.bmp');
kfgen.Transparent:=true;
kfgen.TransparentColor:=clblack;

splitm:=Tbitmap.create;
splitm.loadfromfile('images/splittermine.bmp');
splitm.Transparent:=true;
splitm.TransparentColor:=clblack;


for i:=0 to 5 do
begin
kpic[i]:=Tbitmap.Create;
kpic[i].width:=10;
kpic[i].Height:=10;

end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var i,a,e:integer;
begin
if countdown=10000
then
begin
if form1.RadioButton27.checked=true
then
for i:=0 to 5 do
if spieler[i].punkte>form1.SpinEdit1.Value
then
runden:=-1;

if Runden>0
then
begin
if form1.RadioButton19.checked=true
then
label13.Caption:='[LEER] drücken';
if form1.RadioButton20.checked=true
then
label13.Caption:='press [SPACE]';
if form1.RadioButton21.checked=true
then
label13.Caption:='touche [ESPACE]';
if form1.RadioButton22.checked=true
then
label13.Caption:='pulsas [ESPACIADOR]';

if getasynckeystate(32)<>0
then
init(speicherkeys);
end
else
begin
form2.font.Size:=25;
form2.font.Color:=clRed;
a:=0;
for e:=0 to 5 do
if spieler[e].punkte>spieler[a].punkte
then
a:=e;
if form1.RadioButton19.checked=true
then
begin
form2.Canvas.TextOut(300,350,'Der Gewinner ist '+spielernamen[a]);
label13.Caption:='Spiel beendet';
end;
if form1.RadioButton20.checked=true
then
begin
form2.Canvas.TextOut(300,350,'The winner is '+spielernamen[a]);
label13.Caption:='game finished';
end;
if form1.RadioButton21.checked=true
then
begin
form2.Canvas.TextOut(300,350,'Le victoir est '+spielernamen[a]);
label13.Caption:='jeu fini';
end;
if form1.RadioButton22.checked=true
then
begin
form2.Canvas.TextOut(300,350,'El victador es '+spielernamen[a]);
label13.Caption:='juego terminado';
end;

form2.Canvas.stretchdraw(rect(375,400,425,450),kpic[a]);

end;
if getasynckeystate(27)<>0
then
begin
  timer1.Enabled:=false;
   form2.Visible:=false;     //Beenden
    form1.Bildschirmnormal;
     form1.Visible:=true;

end;
end
else
begin
if countdown>0
then
begin
for i:=0 to 128 do
if getasynckeystate(i)<>0
then
a:=i;
countdown:=countdown-timer1.interval;

if form1.RadioButton19.checked=true
then
label13.Caption:='Start in '+inttostr(trunc(countdown/300+1));
if form1.RadioButton20.checked=true
then
label13.Caption:='start in '+inttostr(trunc(countdown/300+1));
if form1.RadioButton21.checked=true
then
label13.Caption:='démarrage à '+inttostr(trunc(countdown/300+1));
if form1.RadioButton22.checked=true
then
label13.Caption:='salida en '+inttostr(trunc(countdown/300+1));

for i:=0 to 5 do
if spieler[i].typ<>0
then
begin
form2.Canvas.Pixels[round(spieler[i].x),round(spieler[i].y)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x-1),round(spieler[i].y-1)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x-1),round(spieler[i].y)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x-1),round(spieler[i].y+1)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x),round(spieler[i].y+1)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x+1),round(spieler[i].y+1)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x+1),round(spieler[i].y)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x+1),round(spieler[i].y-1)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x),round(spieler[i].y-1)]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x+2*qs[spieler[i].kurs]),round(spieler[i].y-2*qc[spieler[i].kurs])]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x+3*qs[spieler[i].kurs]),round(spieler[i].y-3*qc[spieler[i].kurs])]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x+2*qs[spieler[i].kurs]),round(spieler[i].y-3*qc[spieler[i].kurs])]:=spieler[i].farbe;
form2.Canvas.Pixels[round(spieler[i].x+3*qs[spieler[i].kurs]),round(spieler[i].y-2*qc[spieler[i].kurs])]:=spieler[i].farbe;
end;

if form1.RadioButton23.checked=true
then
begin
bild.Canvas.Draw(0,0,karte);
for i:=0 to 5 do
if spieler[i].typ<>0
then
begin
bild.Canvas.Pixels[round(spieler[i].x),round(spieler[i].y)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x-1),round(spieler[i].y-1)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x-1),round(spieler[i].y)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x-1),round(spieler[i].y+1)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x),round(spieler[i].y+1)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x+1),round(spieler[i].y+1)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x+1),round(spieler[i].y)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x+1),round(spieler[i].y-1)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x),round(spieler[i].y-1)]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x+2*qs[spieler[i].kurs]),round(spieler[i].y-2*qc[spieler[i].kurs])]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x+3*qs[spieler[i].kurs]),round(spieler[i].y-3*qc[spieler[i].kurs])]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x+2*qs[spieler[i].kurs]),round(spieler[i].y-3*qc[spieler[i].kurs])]:=spieler[i].farbe;
bild.Canvas.Pixels[round(spieler[i].x+3*qs[spieler[i].kurs]),round(spieler[i].y-2*qc[spieler[i].kurs])]:=spieler[i].farbe;
end;
form2.Canvas.Draw(0,0,bild);
end;
end
else
begin
if form1.RadioButton19.checked=true
then
label13.Caption:='Spiel läuft';
if form1.RadioButton20.checked=true
then
label13.Caption:='game is running';
if form1.RadioButton21.checked=true
then
label13.Caption:='jeu  marche';
if form1.RadioButton22.checked=true
then
label13.Caption:='juego marcha';

getkeys;
AIsteuer;
berechne;
kolli;
if (form1.checkbox18.checked=true) or (form1.checkbox19.checked=true)
then
rechenpowerud;
zeichne;
statusanzeige;
a:=0;
for i:=0 to 5 do
if spieler[i].typ<>0
then
inc(a);
if a<2
then
begin
countdown:=10000;
if form1.RadioButton23.checked=true
then
begin
karte.Canvas.brush.Color:=clblack;
karte.canvas.fillrect(rect(0,0,900,768));
for a:=0 to 900 do
for e:=0 to 768 do
if bild.canvas.Pixels[a,e]=clwhite
then
karte.Canvas.Pixels[a,e]:=clwhite;
end;
if form1.RadioButton27.checked=false
then
dec(runden);
end;

end;
end;
end;


 procedure Tform2.Torpedoflug;
 var i,e,a:integer;
 d:extended;
 gemalt:boolean;
 begin //Torpedoflug

 puf.canvas.pen.color:=clBlack;
 puf.canvas.brush.color:=clblack;
 puf.canvas.pen.width:=6;
 bild.canvas.pen.color:=cllime;
 bild.canvas.brush.color:=cllime;
 bild.canvas.pen.width:=1;

 gemalt:=false;

 for e:=0 to 25 do
 if t[e].zeit>0
 then
 begin

 gemalt:=true;

 puf.Canvas.moveto(round(t[e].x),round(t[e].y));

 t[e].x:=t[e].x+t[e].vx;
 t[e].y:=t[e].y+t[e].vy;

 dec(t[e].zeit);

 if durch=false
 then
 for a:=0 to 7 do
 if puf.canvas.Pixels[round(t[e].x-a/7*t[e].vx),round(t[e].y-a/7*t[e].vy)]<>clblack
 then
 t[e].zeit:=0;


 puf.Canvas.LineTo(round(t[e].x),round(t[e].y));
                     end;

                          bild.canvas.Draw(0,0,puf);

                     for e:=0 to 25 do
                      if (t[e].zeit>0) and (t[e].zeit<198)
                     then
                     begin

 for i:=0 to 5 do
 if (spieler[i].typ<>0)
 then
 begin
 d:=(spieler[i].x-t[e].x)*(spieler[i].x-t[e].x)+(spieler[i].y-t[e].y)*(spieler[i].y-t[e].y);
 if d<25
 then
 begin
                                          //Kolli mit Spieler
     if form1.checkbox17.checked=false
     then
    spieler[i].typ:=0;
    
     for a:=0 to 5 do
     if (spieler[a].typ<>0)
     then
     inc(spieler[a].punkte);

     if durch=false
     then
     t[e].zeit:=0;

 end;

 end;



 bild.Canvas.Ellipse(round(t[e].x-2),round(t[e].y-2),round(t[e].x+2),round(t[e].y+2));
 bild.canvas.Pixels[round(t[e].x),round(t[e].y)]:=clyellow;

 end;


 if gemalt=false
 then
 bild.canvas.Draw(0,0,puf);

 end;

 procedure Tform2.statusanzeige;
 var i:integer;
 begin //Status in der Leiste anzeigen

 for i:=0 to 5 do
 begin
 anzeig.Canvas.Brush.Color:=clblack;
 if spieler[i].typ<>0
 then
 begin
 anzeig.Canvas.FillRect(rect(0,0,110,80));


 if sprung=true
 then
 begin
 anzeig.canvas.Pen.Width:=1;
 anzeig.Canvas.Pen.Color:=clteal;
 anzeig.Canvas.MoveTo(25,18);
 anzeig.Canvas.lineTo(25+round(spieler[i].jumper/1000*75),18);
 anzeig.Canvas.MoveTo(25,19);
 anzeig.Canvas.lineTo(25+round(spieler[i].jumper/1000*75),19);
 anzeig.Canvas.MoveTo(25,20);
 anzeig.Canvas.lineTo(25+round(spieler[i].jumper/1000*75),20);
 anzeig.Canvas.MoveTo(25,21);
 anzeig.Canvas.lineTo(25+round(spieler[i].jumper/1000*75),21);

 if (spieler[i].jumper>249) and (spieler[i].bjumper=0)
 then
 anzeig.Canvas.Ellipse(8,17,13,22)
 else
 begin
 anzeig.Canvas.Pen.Color:=round(255-spieler[i].bjumper/100*255);
 anzeig.Canvas.Ellipse(8,17,13,22);
 end;
 end;

 if schuss=true
 then
 begin
 anzeig.canvas.Pen.Width:=1;
 anzeig.Canvas.Pen.Color:=clgreen;
 anzeig.Canvas.MoveTo(25,38);
 anzeig.Canvas.lineTo(25+round(spieler[i].munition/2000*75),38);
 anzeig.Canvas.MoveTo(25,39);
 anzeig.Canvas.lineTo(25+round(spieler[i].munition/2000*75),39);
 anzeig.Canvas.MoveTo(25,40);
 anzeig.Canvas.lineTo(25+round(spieler[i].munition/2000*75),40);
 anzeig.Canvas.MoveTo(25,41);
 anzeig.Canvas.lineTo(25+round(spieler[i].munition/2000*75),41);

 if (spieler[i].munition>399) and (spieler[i].bgun=0)
 then
 anzeig.Canvas.Ellipse(8,37,13,42)
 else
 begin
 anzeig.Canvas.Pen.Color:=round(255-spieler[i].bgun/75*255);
 anzeig.Canvas.Ellipse(8,37,13,42);
  end;

  end;

   if beschl=true
 then
 begin
 anzeig.canvas.Pen.Width:=1;
 anzeig.Canvas.Pen.Color:=clNavy;
 anzeig.Canvas.MoveTo(25,58);
 anzeig.Canvas.lineTo(25+round(spieler[i].speedup/1000*75),58);
 anzeig.Canvas.MoveTo(25,59);
 anzeig.Canvas.lineTo(25+round(spieler[i].speedup/1000*75),59);
 anzeig.Canvas.MoveTo(25,60);
 anzeig.Canvas.lineTo(25+round(spieler[i].speedup/1000*75),60);
 anzeig.Canvas.MoveTo(25,61);
 anzeig.Canvas.lineTo(25+round(spieler[i].speedup/1000*75),61);

 if (spieler[i].bspeed=false)
 then
 anzeig.Canvas.Ellipse(8,57,13,62)
 else
 begin
 anzeig.Canvas.Pen.Color:=clred;
 anzeig.Canvas.Ellipse(8,57,13,62);
  end;

 end;



 end
 else
 begin

 anzeig.Canvas.FillRect(rect(0,0,110,80));
 anzeig.Canvas.font.color:=clred;
 if form1.radiobutton19.checked=true
 then
 anzeig.Canvas.TextOut(20,30,'ausgeschaltet');
 if form1.radiobutton20.checked=true
 then
 anzeig.Canvas.TextOut(20,30,'off-line');
 if form1.radiobutton21.checked=true
 then
 anzeig.Canvas.TextOut(20,30,'éteindu');
 if form1.radiobutton22.checked=true
 then
 anzeig.Canvas.TextOut(20,30,'apagado');
 end;
 case i of
 0:paintbox1.Canvas.Draw(0,0,anzeig);
 1:paintbox2.Canvas.Draw(0,0,anzeig);
 2:paintbox3.Canvas.Draw(0,0,anzeig);
 3:paintbox4.Canvas.Draw(0,0,anzeig);
 4:paintbox5.Canvas.Draw(0,0,anzeig);
 5:paintbox6.Canvas.Draw(0,0,anzeig);
 end;


 end;

 end;

     procedure Tform2.punktreset;
     var i:integer;
     begin //         //Punkte zurück
     for i:=0 to 5 do
     spieler[i].punkte:=0;
     runden:=form1.spinedit1.Value;
     end;



     procedure Tform2.AIsteuer;
     var i,e,a,nk1,nk2,winkel,cx,cy,cx2,cy2,wen,meh:integer;
     ausweich,parallel,notplan:boolean;
     abstand,abstand2:extended;
     begin           //AIsteuerung
     for i:=0 to 5 do
     if spieler[i].typ=2
     then
     begin
     ausweich:=false;

     if (spieler[i].x<75) and (spieler[i].y<75)
     then
     begin

     ausweich:=true;
     
     nk1:=spieler[i].kurs+1;
     if nk1>179
     then
     nk1:=0;

     nk2:=spieler[i].kurs-1;
     if nk2<0
     then
     nk2:=179;

     abstand:=((spieler[i].x+spieler[i].v*qs[nk1])*(spieler[i].x+spieler[i].v*qs[nk1]))+((spieler[i].y-spieler[i].v*qc[nk1])*(spieler[i].y-spieler[i].v*qc[nk1]));
     abstand2:=((spieler[i].x+spieler[i].v*qs[nk2])*(spieler[i].x+spieler[i].v*qs[nk2]))+((spieler[i].y-spieler[i].v*qc[nk2])*(spieler[i].y-spieler[i].v*qc[nk2]));

     if abstand>abstand2
     then
     spieler[i].kurs:=nk1
     else
     spieler[i].kurs:=nk2;

     end;


     if (spieler[i].x>825) and (spieler[i].y<75) 
     then
     begin

     ausweich:=true;
     
     nk1:=spieler[i].kurs+1;
     if nk1>179
     then
     nk1:=0;

     nk2:=spieler[i].kurs-1;
     if nk2<0
     then
     nk2:=179;

     abstand:=((900-spieler[i].x-spieler[i].v*qs[nk1])*(900-spieler[i].x-spieler[i].v*qs[nk1]))+((spieler[i].y-spieler[i].v*qc[nk1])*(spieler[i].y-spieler[i].v*qc[nk1]));
     abstand2:=((900-spieler[i].x-spieler[i].v*qs[nk2])*(900-spieler[i].x-spieler[i].v*qs[nk2]))+((spieler[i].y-spieler[i].v*qc[nk2])*(spieler[i].y-spieler[i].v*qc[nk2]));

     if abstand>abstand2
     then
     spieler[i].kurs:=nk1
     else
     spieler[i].kurs:=nk2;

     end;

      if (spieler[i].x>825) and (spieler[i].y>693)
     then
     begin

     ausweich:=true;
     
     nk1:=spieler[i].kurs+1;
     if nk1>179
     then
     nk1:=0;

     nk2:=spieler[i].kurs-1;
     if nk2<0
     then
     nk2:=179;

     abstand:=((900-spieler[i].x-spieler[i].v*qs[nk1])*(900-spieler[i].x-spieler[i].v*qs[nk1]))+((768-spieler[i].y+spieler[i].v*qc[nk1])*(768-spieler[i].y+spieler[i].v*qc[nk1]));
     abstand2:=((900-spieler[i].x-spieler[i].v*qs[nk2])*(900-spieler[i].x-spieler[i].v*qs[nk2]))+((768-spieler[i].y+spieler[i].v*qc[nk2])*(768-spieler[i].y+spieler[i].v*qc[nk2]));

     if abstand>abstand2
     then
     spieler[i].kurs:=nk1
     else
     spieler[i].kurs:=nk2;

     end;

      if (spieler[i].x<75) and (spieler[i].y>693)
     then
     begin

     ausweich:=true;
     
     nk1:=spieler[i].kurs+1;
     if nk1>179
     then
     nk1:=0;

     nk2:=spieler[i].kurs-1;
     if nk2<0
     then
     nk2:=179;

     abstand:=((spieler[i].x+spieler[i].v*qs[nk1])*(spieler[i].x+spieler[i].v*qs[nk1]))+((768-spieler[i].y+spieler[i].v*qc[nk1])*(768-spieler[i].y+spieler[i].v*qc[nk1]));
     abstand2:=((spieler[i].x+spieler[i].v*qs[nk2])*(spieler[i].x+spieler[i].v*qs[nk2]))+((768-spieler[i].y+spieler[i].v*qc[nk2])*(768-spieler[i].y+spieler[i].v*qc[nk2]));

     if abstand>abstand2
     then
     spieler[i].kurs:=nk1
     else
     spieler[i].kurs:=nk2;

     end;


     if (spieler[i].x<55) and (ausweich=false)
     then
     begin
     
     if ((spieler[i].kurs<180) and (spieler[i].kurs>=135)) or (spieler[i].kurs<6)
     then
     begin
     ausweich:=true;
     inc(spieler[i].kurs);
     if spieler[i].kurs>179
     then
     spieler[i].kurs:=0;
     end;
     
     if (spieler[i].kurs<135) and (spieler[i].kurs>84)
     then
     begin
     ausweich:=true;
     dec(spieler[i].kurs);
     end;
     end;

     if (spieler[i].y<55) and (ausweich=false)
     then
     begin


     if ((spieler[i].kurs>=0) and (spieler[i].kurs<51))
     then
     begin
     inc(spieler[i].kurs);
       ausweich:=true;
       end;

     if (spieler[i].kurs<180) and (spieler[i].kurs>129)
     then
     begin
       ausweich:=true;
     dec(spieler[i].kurs);
     if spieler[i].kurs>179
     then
     spieler[i].kurs:=0;
     end;

 
        end;


         if (spieler[i].x>845) and (ausweich=false)
     then
     begin

     if ((spieler[i].kurs>=0) and (spieler[i].kurs<=45)) or (spieler[i].kurs>174)
     then
     begin
         ausweich:=true;
     dec(spieler[i].kurs);
     if spieler[i].kurs<0
     then
     spieler[i].kurs:=179;
     end;


     if (spieler[i].kurs>45) and (spieler[i].kurs<96)
     then
     begin
     inc(spieler[i].kurs);
         ausweich:=true;
         end;

        end;

        if (spieler[i].y>713) and (ausweich=false)
     then
     begin

     if (spieler[i].kurs>39) and (spieler[i].kurs<=90)
     then
     begin
         ausweich:=true;
     dec(spieler[i].kurs);
     end;


     if (spieler[i].kurs>90) and (spieler[i].kurs<141)
     then
     begin
       ausweich:=true;
     inc(spieler[i].kurs);
        end;
        end;           

      notplan:=true;

     for e:=4 to 75 do
     if notplan=true
     then
     begin



     begin


     cx:=round(spieler[i].x+qs[spieler[i].kurs]*e);
     cy:=round(spieler[i].y-qc[spieler[i].kurs]*e);

     if (puf.Canvas.Pixels[cx,cy]<>clblack) or (puf.Canvas.Pixels[cx-1,cy]<>clblack) or
     (puf.Canvas.Pixels[cx,cy-1]<>clblack) or (puf.Canvas.Pixels[cx+1,cy]<>clblack) or (puf.Canvas.Pixels[cx,cy+1]<>clblack)
     or (puf.Canvas.Pixels[cx,cy+2]<>clblack) or (puf.Canvas.Pixels[cx+2,cy]<>clblack) or (puf.Canvas.Pixels[cx,cy-2]<>clblack)
     or (puf.Canvas.Pixels[cx-2,cy]<>clblack) or (puf.Canvas.Pixels[cx+2,cy+2]<>clblack) or (puf.Canvas.Pixels[cx-2,cy-2]<>clblack)
     or (puf.Canvas.Pixels[cx+2,cy-2]<>clblack) or (puf.Canvas.Pixels[cx-2,cy+2]<>clblack)
     then
     begin
     a:=2;
     wen:=1;
     meh:=1;
     
     repeat

     nk1:=spieler[i].kurs-a;
     if nk1<0
     then
     nk1:=179;
     
     nk2:=spieler[i].kurs+a;
     if nk2>179
     then
     nk2:=0;
     cx:=round(spieler[i].x+qs[nk1]*(e));
     cy:=round(spieler[i].y-qc[nk1]*(e));
     cx2:=round(spieler[i].x+qs[nk2]*(e));
     cy2:=round(spieler[i].y-qc[nk2]*(e));
     if (puf.Canvas.Pixels[cx,cy]=clblack) and (puf.Canvas.Pixels[cx-1,cy]=clblack)  and (puf.Canvas.Pixels[cx,cy-1]=clblack)
     and (puf.Canvas.Pixels[cx+1,cy]=clblack) and (puf.Canvas.Pixels[cx,cy+1]=clblack)   and (puf.Canvas.Pixels[cx+1,cy+1]=clblack)
     and (puf.Canvas.Pixels[cx-1,cy+1]=clblack)  and (puf.Canvas.Pixels[cx+1,cy-1]=clblack)        and (puf.Canvas.Pixels[cx-1,cy-1]=clblack)
     then
     begin
       inc(wen);
       inc(wen);
      end
     else if (puf.Canvas.Pixels[cx2,cy2]=clblack) and  (puf.Canvas.Pixels[cx2-1,cy2]=clblack) and
     (puf.Canvas.Pixels[cx2,cy2-1]=clblack) and (puf.Canvas.Pixels[cx2+1,cy2]=clblack) and (puf.Canvas.Pixels[cx2,cy2+1]=clblack)
      and (puf.Canvas.Pixels[cx2+1,cy2+1]=clblack)        and (puf.Canvas.Pixels[cx2-1,cy2-1]=clblack)   and (puf.Canvas.Pixels[cx2+1,cy2-1]=clblack)
     and (puf.Canvas.Pixels[cx2-1,cy2+1]=clblack)
      then
     begin
       inc(meh);
        inc(meh);
     end;

     inc(a);
     dec(wen);
     dec(meh);
     
     if (ausweich=false) and (wen>1)
     then
     begin
     dec(spieler[i].kurs);
     if spieler[i].kurs<0
     then
     spieler[i].kurs:=179;
     ausweich:=true;
     end;

     if (ausweich=false ) and (meh>1)
     then
     begin
     inc(spieler[i].kurs);
     if spieler[i].kurs>179
     then
     spieler[i].kurs:=0;
     ausweich:=true;
     end;


     until (a=20) or (ausweich=true);

     if (a=20)
     then
     begin

     hops:=false;


     if (e<6) and (sprung=true)
     then
     begin
     springe(i);
     notplan:=false;
     end;

     if (schuss=true) and (hops=false)
     then
     begin
     feuer(i);
     notplan:=false;
     end;

     if (notplan=true) and (ausweich=false)
     then
     begin
     dec(spieler[i].kurs);
     if spieler[i].kurs<0
     then
     spieler[i].kurs:=179;
     ausweich:=true;
     end;


     end;

     end;

          end;

     end;

     if (random(250)=0)  and (sprung=true)
    then
    springe(i);

    if (random(250)=0) and (hops=false) and (schuss=true)
    then
    feuer(i);


 if (ausweich=false) and (beschl=true)
 then
 for e:=0 to 5 do
    if (spieler[e].typ<>0) and (i<>e)
    then
    begin

    parallel:=false;

    winkel:=spieler[e].kurs-spieler[i].kurs;

    winkel:=abs(winkel);

    if abs(winkel)<15
    then
    parallel:=true;


    
    winkel:=spieler[e].kurs-spieler[i].kurs-180;

    winkel:=abs(winkel);

    if abs(winkel)<15
    then
    parallel:=true;



    winkel:=spieler[e].kurs-spieler[i].kurs+180;

    winkel:=abs(winkel);

    if abs(winkel)<15
    then
    parallel:=true;


    if parallel=true
    then
    begin
    abstand:=(spieler[i].x-spieler[e].x)*(spieler[i].x-spieler[e].x)+(Spieler[i].y-spieler[e].y)*(spieler[i].y-spieler[e].y);
    if abstand<1000
    then
    begin
    abstand2:=(spieler[i].x-(spieler[e].x-3*qs[Spieler[e].kurs]))*(spieler[i].x-(spieler[e].x-3*qs[Spieler[e].kurs]))+(Spieler[i].y-(spieler[e].y+3*qc[Spieler[e].kurs]))*(spieler[i].y-(spieler[e].y+3*qc[Spieler[e].kurs]));

    if abstand2<abstand
    then
    begin
    
    if (schuss=true)  and (hops=false)
    then
    feuer(i);

    beschleunige(i);
    end;
    end;
    end;

    end
    else
    spieler[i].bspeed:=false;

  if ausweich=false
  then                           //noch was einfallen lassen
  begin

  end;

     end;
     end;





procedure Tform2.loadmap;
var F:file of Tdaten;
     i,e:integer;
begin             // Karte fürs Spiel laden

assignfile(F,'aktu.mp');
 reset(F);
 read(F,dat);
 closefile(F);

 karte.Width:=900;
 karte.Height:=768;

for i:=0 to 450 do
 for e:=0 to 384 do
 if dat.karte[i,e]=0
 then
 begin
 karte.Canvas.Pixels[i*2,e*2]:=clblack;
 karte.Canvas.Pixels[i*2+1,e*2]:=clblack;
 karte.Canvas.Pixels[i*2,e*2+1]:=clblack;
 karte.Canvas.Pixels[i*2+1,e*2+1]:=clblack;
 end
 else
 begin
 karte.Canvas.Pixels[i*2,e*2]:=clwhite;
 karte.Canvas.Pixels[i*2+1,e*2]:=clwhite;
 karte.Canvas.Pixels[i*2,e*2+1]:=clwhite;
 karte.Canvas.Pixels[i*2+1,e*2+1]:=clwhite;
 end;

 karte.Transparent:=true;
 karte.TransparentColor:=clblack;

 for i:=0 to 4 do
 if dat.gun[i].x<>-1
 then
 begin
 kanone[i].exist:=true;
 kanone[i].x:=dat.gun[i].x*2;
 kanone[i].y:=dat.gun[i].y*2;
 kanone[i].r:=random(180);
 kanone[i].ladung:=random(100);
 end;

 for i:=0 to 2 do
 if dat.ffield[i].x2<>-1
 then
 begin
 kraftfeld[i].exist1:=true;
 kraftfeld[i].exist2:=true;
 kraftfeld[i].x1:=dat.ffield[i].x1;
 kraftfeld[i].x2:=dat.ffield[i].x2;
 kraftfeld[i].y1:=dat.ffield[i].y1;
 kraftfeld[i].y2:=dat.ffield[i].y2;
 end;

 for i:=0 to 9 do
 if dat.mine[i].x<>-1
 then
 begin
 mine[i].exist:=true;
 mine[i].explo:=0;
 mine[i].x:=dat.mine[i].x;
 mine[i].y:=dat.mine[i].y;
 end;


 for i:=0 to 2 do
 if dat.builder[i].x<>-1
 then
 begin
 mauerbauer[i].exist:=true;
 mauerbauer[i].x:=dat.builder[i].x;
 mauerbauer[i].y:=dat.builder[i].y;
 mauerbauer[i].ax:=mauerbauer[i].x;
 mauerbauer[i].ay:=mauerbauer[i].y;
 mauerbauer[i].r:=random(180);
 mauerbauer[i].timer:=random(10);
 end;


end;


    procedure Tform2.kartensteuerung;
    begin       //Steurung von Karte mit Spezialeffekten

    if form1.RadioButton25.checked=true
    then
    puf.Canvas.Draw(0,0,karte);

    

    end;


 procedure Tform2.setpowerupdown;
 var i:integer;
 begin //Powerups-powerdowns setzen

 for i:=0 to 9 do
 begin
 powerud[i].typ:=0;
 powerud[i].aktiv:=0;
 end;
 
 if form1.checkbox18.checked=true
 then
 for i:=0 to 4 do
 begin
 powerud[i].x:=random(800)+50;
 powerud[i].y:=random(668)+50;
 powerud[i].typ:=1;
 powerud[i].aktiv:=100;
 end;

 if form1.checkbox19.checked=true
 then
 for i:=5 to 9 do
 begin
 powerud[i].x:=random(800)+50;
 powerud[i].y:=random(668)+50;
 powerud[i].typ:=2;
 powerud[i].aktiv:=100;
 end;


 end;

procedure Tform2.rechenpowerud;
var i,e,a,zz:integer;
entf:extended;
begin //Verwaltung der Power ups / downs
for e:=0 to 5 do
if spieler[e].typ<>0
then
for i:=0 to 9 do
if powerud[i].typ<>0
then
begin
if powerud[i].aktiv=99
then
begin
powerud[i].aktiv:=100;

repeat
powerud[i].x:=random(800)+50;
powerud[i].y:=random(668)+50;
until bild.Canvas.Pixels[powerud[i].x,powerud[i].y]=0;

end;
if powerud[i].aktiv=100
then
begin
entf:=(spieler[e].x-powerud[i].x)*(spieler[e].x-powerud[i].x)+(spieler[e].y-powerud[i].y)*(spieler[e].y-powerud[i].y);
if entf<100
then
begin
powerud[i].aktiv:=0;
zz:=random(3);
if powerud[i].typ=1
then
begin
if zz=0
then
spieler[e].speedup:=1000
else if zz=1
then
spieler[e].munition:=2000
else                            //NOCH WEITERE POWERUPS EINBAUEN!!!!!
spieler[e].jumper:=1000;
end
else
begin
spieler[e].speedup:=0;
spieler[e].munition:=0;
spieler[e].jumper:=0;
end;

end;
end
else
inc(powerud[i].aktiv);
end;



end;



end.
