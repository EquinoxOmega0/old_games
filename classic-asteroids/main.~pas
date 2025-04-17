unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, math, MPlayer;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    MediaPlayer3: TMediaPlayer;
    MediaPlayer4: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Tastenlesen;
    procedure Zeichne;
    procedure Berechnung;
    function Beschraenken(zahl:integer):integer;
    procedure Bildschirmvoll;
    procedure Bildschirmnormal;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type Tschwerpkt=record
  x,y,vx,vy:extended;
  d:integer;
  end;

var
  Form1: TForm1;
  Bild,livepic:Tbitmap;
  schiff:Tschwerpkt;
  schuss:array[0..7] of Tschwerpkt;
  astro:array[0..15] of Tschwerpkt;
  gas,feuer,aktiv,ufoon,sieg:boolean;
  ladezeit,punkte,leben,sound:integer;
  qc,qs:array[0..71] of extended;
  formastro:array[0..15,0..17] of integer;
  sx,sy,sr,st:array[0..15] of integer;
  ufo:TSchwerpkt;

  ddevmode,ddd,dzz:TDevMode;
  dd:integer;                    //Bildschirm Variablen
  ddc:hdc;
  dscrx,dscry,dfarb:integer;


implementation

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
if (ddevmode.dmpelswidth=800) and (ddevmode.dmpelsheight=600) and ((1 shl ddevmode.dmbitsperpel)=65536)
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

procedure TForm1.FormCreate(Sender: TObject);
var F:textfile;
    s:string;
    i,e:integer;
begin
randomize;                //Initisalisierung
assignfile(F,'speed.dat');
reset(F);
read(F,s);
timer1.Interval:=strtoint(s);
closefile(F);

Bild:=TBitmap.create;
bild.width:=800;
bild.height:=600;
bild.canvas.Brush.color:=clblack;
bild.canvas.Pen.Color:=clwhite;
bild.canvas.fillrect(rect(0,0,800,600));
bild.canvas.Font.Name:='Arial';
bild.Canvas.Font.Color:=clwhite;



for i:=0 to 7 do
schuss[i].d:=-1;


schiff.x:=400.01;
schiff.y:=300.01;
schiff.vx:=0;
schiff.vy:=0;
schiff.d:=0;
gas:=false;
feuer:=false;
ladezeit:=0;
punkte:=0;
leben:=3;
aktiv:=true;
ufoon:=false;
sieg:=false;
sound:=0;

for i:=0 to 71 do
begin
qc[i]:=cos(i*PI/36);
qs[i]:=sin(i*PI/36);
end;

livepic:=TBitmap.create;
livepic.width:=10;
livepic.height:=10;
livepic.canvas.Brush.color:=clblack;
livepic.canvas.Pen.Color:=clwhite;
livepic.canvas.fillrect(rect(0,0,800,600));
livepic.Canvas.MoveTo(round(5+qs[0]*5),round(5-qc[0]*5));
livepic.Canvas.LineTo(round(5+qs[30]*5),round(5-qc[30]*5));
livepic.Canvas.LineTo(round(5+qs[42]*5),round(5-qc[42]*5));
livepic.Canvas.LineTo(round(5+qs[0]*5),round(5-qc[0]*5));

for i:=0 to 15 do
st[i]:=0;

for i:=0 to 15 do
for e:=0 to 17 do
formastro[i,e]:=(random(100));

for i:=4 to 15 do
astro[i].d:=0;

for i:=0 to 3 do
begin
astro[i].d:=4;
repeat
astro[i].x:=random(700)+50;
astro[i].y:=random(500)+50;
until ((astro[i].x-400)*(astro[i].x-400)+(astro[i].y-300)*(astro[i].y-300)>20000);

repeat
astro[i].vx:=(random(101)-50)/50;
astro[i].vy:=(random(101)-50)/50;
until (astro[i].vx<>0) or (astro[i].vy<>0);

end;


MediaPlayer1.Filename := 'sounds/schuss.wav';
MediaPlayer1.Open;

MediaPlayer2.Filename := 'sounds/antrieb.wav';
MediaPlayer2.Open;

MediaPlayer3.Filename := 'sounds/explosion.wav';
MediaPlayer3.Open;

MediaPlayer4.Filename := 'sounds/ufo.wav';
MediaPlayer4.Open;


Bildschirmvoll;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i,a:integer;             //Hauptschleife
begin
if getasynckeystate(27)<>0
then
begin
Bildschirmnormal;
close;
end;
Tastenlesen;

if sieg=true
then
begin
feuer:=false;

end;

Berechnung;

Zeichne;

a:=0;

for i:=0 to 15 do
if astro[i].d=0
then
inc(a);

if a=16
then
sieg:=true;


if ufoon=false
then
begin
if sound=0
then
begin

if random(50)=1
then
begin
MediaPlayer4.Close;
MediaPlayer4.Filename := 'sounds/beep'+inttostr(random(8))+'.wav';
MediaPlayer4.Open;
MediaPlayer4.play;
sound:=25;
end;

end
else
dec(sound);    //sounds

end;

gas:=false;
feuer:=false;
Form1.Canvas.draw(0,0,bild);
end;

procedure Tform1.tastenlesen;
begin            //Steuerung

if getasynckeystate(38)<>0
then                           //up
begin
gas:=true;
end;

if getasynckeystate(39)<>0
then                          //right
begin
inc(schiff.d);
schiff.d:=beschraenken(schiff.d);
end;

if getasynckeystate(32)<>0     //down
then
begin
feuer:=true;
end;

if getasynckeystate(37)<>0       //left
then
begin
dec(schiff.d);
schiff.d:=beschraenken(schiff.d);
end;

end;


procedure Tform1.Zeichne;
var hilf,hx,hy,hr:integer;
    i,e:integer;
    hhx,hhy:extended;
begin                //Zeichnen

bild.canvas.fillrect(rect(0,0,800,600));

if aktiv=true
then
begin
bild.Canvas.MoveTo(round(schiff.x+qs[schiff.d]*10),round(schiff.y-qc[schiff.d]*10));
hilf:=schiff.d+30;
hilf:=beschraenken(hilf);
bild.Canvas.LineTo(round(schiff.x+qs[hilf]*10),round(schiff.y-qc[hilf]*10));
hilf:=schiff.d-30;
hilf:=beschraenken(hilf);
bild.Canvas.LineTo(round(schiff.x+qs[hilf]*10),round(schiff.y-qc[hilf]*10));
bild.Canvas.LineTo(round(schiff.x+qs[schiff.d]*10),round(schiff.y-qc[schiff.d]*10));

if gas=true
then
begin
for i:=0 to 15 do
begin
hilf:=schiff.d-36;
hilf:=beschraenken(hilf);
hx:=schiff.d-36+random(19)-9;
hy:=schiff.d-36+random(19)-9;
hr:=random(10);
hx:=beschraenken(hx);
hy:=beschraenken(hy);
hhx:=hr*qs[hx];
hhy:=hr*qc[hy];
bild.Canvas.Pixels[round(schiff.x+qs[hilf]*10+hhx),round(schiff.y-qc[hilf]*10-hhy)]:=clwhite;
end;
end;

end;

for i:=0 to 15 do
if astro[i].d<>0
then
begin
bild.canvas.moveto(round(astro[i].x+qs[68]*(astro[i].d*(10-formastro[i,17]/33))),round(astro[i].y-qc[68]*(astro[i].d*(10-formastro[i,17]/33))));

for e:=0 to 17 do
bild.canvas.lineto(round(astro[i].x+qs[e*4]*(astro[i].d*(10-formastro[i,e]/33))),round(astro[i].y-qc[e*4]*(astro[i].d*(10-formastro[i,e]/33))));



end;


if ufoon=true
then
begin
bild.canvas.MoveTo(round(ufo.x-15),round(ufo.y));
bild.canvas.LineTo(round(ufo.x+15),round(ufo.y));
bild.canvas.LineTo(round(ufo.x+8),round(ufo.y+5));
bild.canvas.LineTo(round(ufo.x-8),round(ufo.y+5));
bild.canvas.LineTo(round(ufo.x-15),round(ufo.y));
bild.canvas.LineTo(round(ufo.x-8),round(ufo.y-5));
bild.canvas.LineTo(round(ufo.x+8),round(ufo.y-5));
bild.canvas.LineTo(round(ufo.x+15),round(ufo.y));
bild.canvas.MoveTo(round(ufo.x-5),round(ufo.y+5));
bild.canvas.LineTo(round(ufo.x),round(ufo.y+8));
bild.canvas.LineTo(round(ufo.x+5),round(ufo.y+5));
bild.canvas.MoveTo(round(ufo.x-5),round(ufo.y-5));
bild.canvas.LineTo(round(ufo.x),round(ufo.y-8));
bild.canvas.LineTo(round(ufo.x+5),round(ufo.y-5));
end;



for i:=0 to 7 do
if schuss[i].d<>-1
then
begin
bild.canvas.Pixels[round(schuss[i].x+0.5),round(schuss[i].y+0.5)]:=clwhite;
bild.canvas.Pixels[round(schuss[i].x-0.5),round(schuss[i].y+0.5)]:=clwhite;
bild.canvas.Pixels[round(schuss[i].x+0.5),round(schuss[i].y-0.5)]:=clwhite;
bild.canvas.Pixels[round(schuss[i].x-0.5),round(schuss[i].y-0.5)]:=clwhite;
end;

for i:=0 to 15 do
if st[i]<>0
then
begin

for e:=0 to round(st[i]*sr[i]/10) do
begin     

hr:=random(sr[i])+1;
hilf:=random(360);
hx:=round(hr*sin(PI*hilf/180));
hy:=round(hr*cos(PI*hilf/180));

bild.Canvas.Pixels[sx[i]+hx,sy[i]+hy]:=clwhite;

end;
end;


bild.canvas.font.Size:=10;

bild.canvas.TextOut(700,5,'Punkte: '+inttostr(punkte));


for i:=1 to leben do
bild.canvas.Draw(i*15,5,livepic);

if leben<0
then
begin
bild.canvas.Font.Size:=20;
bild.canvas.TextOut(320,290,'GAME OVER!');
end;

if sieg=true
then
begin
bild.canvas.Font.Size:=20;
bild.canvas.TextOut(330,290,'GEWONNEN!');
end;

end;


procedure Tform1.Berechnung;
var i,e,a,winkel:integer;
begin                //Berechnung der Bewegung








if aktiv=false
then
begin
aktiv:=true;
for i:=0 to 15 do
if astro[i].d<>0
then
if ((astro[i].x-400)*(astro[i].x-400)+(astro[i].y-300)*(astro[i].y-300)<20000)
then
aktiv:=false;

if aktiv=true
then
begin
schiff.x:=400.01;
schiff.y:=300.01;
schiff.vx:=0;
schiff.vy:=0;
schiff.d:=0;
gas:=false;
feuer:=false;

end;

end;



if leben<0
then
aktiv:=false;



if sieg=false
then
begin


if ufoon=false
then
begin

if (random(2500)=1) and (aktiv=true)
then
begin
ufoon:=true;

ufo.x:=10.0001;
ufo.y:=random(500)+50.0001;
ufo.vx:=2;
ufo.vy:=0;
ufo.d:=0;
Mediaplayer4.Close;
MediaPlayer4.Filename := 'sounds/ufo.wav';
MediaPlayer4.Open;
mediaplayer4.position:=0;
mediaplayer4.Play;

end;

end
else
begin
mediaplayer4.Play;

if random(100)=1
then
begin
winkel:=random(71);
ufo.vx:=2*qs[winkel];
ufo.vy:=-2*qc[winkel];
end;

ufo.x:=ufo.x+ufo.vx;
ufo.y:=ufo.y+ufo.vy;

if ufo.x>790
then
ufo.x:=10;

if ufo.x<10
then
ufo.x:=790;

if ufo.y>590
then
ufo.y:=10;

if ufo.y<10
then
ufo.y:=590;


if ufo.d=0
then
begin


if schuss[7].d=-1
then
begin

if ufo.x-schiff.x<>0
then
begin


winkel:=round(arctan2((ufo.y-schiff.y),(ufo.x-schiff.x))*36/PI)
end
else
winkel:=0;

winkel:=beschraenken(winkel);
winkel:=winkel-18;
winkel:=beschraenken(winkel);


schuss[7].x:=ufo.x+17*qs[winkel];
schuss[7].y:=ufo.y-17*qc[winkel];
schuss[7].vx:=5*qs[winkel];
schuss[7].vy:=-5*qc[winkel];
schuss[7].d:=150;

ufo.d:=50;

Mediaplayer1.Position:=0;
MediaPlayer1.Play;
end;

end
else
dec(ufo.d);


end;
end;



if aktiv=true
then
begin



if gas=true
then
begin
schiff.vx:=schiff.vx+qs[schiff.d]/10;
schiff.vy:=schiff.vy-qc[schiff.d]/10;
MediaPlayer2.Play;
end;

 if schiff.vx>0
  then
  schiff.vx:=schiff.vx-sqr(schiff.vx/25);

  if schiff.vy>0
  then
  schiff.vy:=schiff.vy-sqr(schiff.vy/25);

    if schiff.vx<0
  then
  schiff.vx:=schiff.vx+sqr(schiff.vx/25);

  if schiff.vy<0
  then
  schiff.vy:=schiff.vy+sqr(schiff.vy/25);

schiff.x:=schiff.x+schiff.vx;
schiff.y:=schiff.y+schiff.vy;

if schiff.x>790
then
schiff.x:=10;

if schiff.x<10
then
schiff.x:=790;

if schiff.y>590
then
schiff.y:=10;

if schiff.y<10
then
schiff.y:=590;


if feuer=true
then
if ladezeit=0
then
begin
i:=-1;
repeat
inc(i)
until (schuss[i].d=-1) or (i=6);
if schuss[i].d=-1
then
begin
schuss[i].x:=schiff.x+qs[schiff.d]*10;
schuss[i].y:=schiff.y-qc[schiff.d]*10;
schuss[i].vx:=qs[schiff.d]*5;
schuss[i].vy:=-qc[schiff.d]*5;
schuss[i].d:=150;

Mediaplayer1.Position:=0;
MediaPlayer1.Play;

end;

ladezeit:=10;
end;


end;

for i:=0 to 7 do
if schuss[i].d>-1
then
begin
dec(schuss[i].d);
schuss[i].x:=schuss[i].x+schuss[i].vx;
schuss[i].y:=schuss[i].y+schuss[i].vy;

if schuss[i].x>795
then
schuss[i].x:=5;

if schuss[i].x<5
then
schuss[i].x:=795;

if schuss[i].y>595
then
schuss[i].y:=5;

if schuss[i].y<5
then
schuss[i].y:=595;

end;




if ladezeit<>0
then
dec(ladezeit);






for i:=0 to 15 do
begin
if astro[i].d<>0
then
begin
astro[i].x:=astro[i].x+astro[i].vx;
astro[i].y:=astro[i].y+astro[i].vy;

if astro[i].x>790
then
astro[i].x:=10;

if astro[i].x<10
then
astro[i].x:=790;

if astro[i].y>590
then
astro[i].y:=10;

if astro[i].y<10
then
astro[i].y:=590;

end;
end;

for i:=0 to 15 do
if st[i]<>0
then
dec(st[i]);



for i:=0 to 7 do
begin
if schuss[i].d<>-1
then
for e:=0 to 15 do
if astro[e].d<>0
then
begin

if sqr(astro[e].x-schuss[i].x)+sqr(astro[e].y-schuss[i].y)<sqr(astro[e].d*9)
then
begin
if schuss[i].d<>-1
then
begin
schuss[i].d:=-1;
Mediaplayer3.Position:=0;
MediaPlayer3.Play;



a:=-1;
repeat
inc(a);
until (a=15) or (astro[a].d=0);
if astro[a].d=0
then
begin


winkel:=-1;                                //winkel als Hilfsvariable
repeat
inc(winkel);
until (winkel=15) or (st[winkel]=0);
if st[winkel]=0
then
begin
sr[winkel]:=astro[e].d*10;
st[winkel]:=50;
sx[winkel]:=round(astro[e].x);
sy[winkel]:=round(astro[e].y);
end;



winkel:=random(71);

astro[a].x:=astro[e].x+qs[winkel]*astro[e].d*5;
astro[a].y:=astro[e].y-qc[winkel]*astro[e].d*5;

repeat
astro[a].vx:=(random(101)-50)/50;
astro[a].vy:=(random(101)-50)/50;
until (astro[a].vx<>0) or (astro[a].vy<>0);

if i<>7
then
punkte:=punkte+5-astro[e].d;

astro[a].d:=astro[e].d div 2;
if astro[a].d=astro[e].d
then
astro[a].d:=0;

astro[e].x:=astro[e].x-qs[winkel]*astro[e].d*5;
astro[e].y:=astro[e].y+qc[winkel]*astro[e].d*5;

repeat
astro[e].vx:=(random(101)-50)/50;
astro[e].vy:=(random(101)-50)/50;
until (astro[e].vx<>0) or (astro[e].vy<>0);

astro[e].d:=astro[a].d;

end;

end;

end;
end;
end;




if ufoon=true
then
begin




for i:=0 to 15 do
if astro[i].d<>0
then
begin
if sqr(astro[i].x-ufo.x)+sqr(astro[i].y-ufo.y)<sqr(astro[i].d*10+13)
then
begin

Mediaplayer3.Position:=0;
MediaPlayer3.Play;


ufoon:=false;


a:=-1;
repeat
inc(a);
until (a=15) or (astro[a].d=0);
if astro[a].d=0
then
begin


winkel:=-1;                                //winkel als Hilfsvariable
repeat
inc(winkel);
until (winkel=15) or (st[winkel]=0);
if st[winkel]=0
then
begin
sr[winkel]:=astro[i].d*10;
st[winkel]:=50;
sx[winkel]:=round(astro[i].x);
sy[winkel]:=round(astro[i].y);
end;



winkel:=random(71);

astro[a].x:=astro[i].x+qs[winkel]*astro[i].d*5;
astro[a].y:=astro[i].y-qc[winkel]*astro[i].d*5;

repeat
astro[a].vx:=(random(101)-50)/50;
astro[a].vy:=(random(101)-50)/50;
until (astro[a].vx<>0) or (astro[a].vy<>0);



astro[a].d:=astro[i].d div 2;
if astro[a].d=astro[i].d
then
astro[a].d:=0;

astro[i].x:=astro[i].x-qs[winkel]*astro[i].d*5;
astro[i].y:=astro[i].y+qc[winkel]*astro[i].d*5;

repeat
astro[i].vx:=(random(101)-50)/50;
astro[i].vy:=(random(101)-50)/50;
until (astro[i].vx<>0) or (astro[i].vy<>0);

astro[i].d:=astro[a].d;


end;


a:=-1;
repeat
inc(a);
until (a=15) or (st[a]=0);
if st[a]=0
then
begin
sr[a]:=15;
st[a]:=50;
sx[a]:=round(ufo.x);
sy[a]:=round(ufo.y);
end;



end;


end;

for i:=0 to 7 do
if schuss[i].d<>-1
then
begin

if sqr(schuss[i].x-ufo.x)+sqr(schuss[i].y-ufo.y)<200
then
begin
schuss[i].d:=-1;


Mediaplayer3.Position:=0;
MediaPlayer3.Play;

ufoon:=false;

if i<>7
then
punkte:=punkte+8;

a:=-1;
repeat
inc(a);
until (a=15) or (st[a]=0);
if st[a]=0
then
begin
sr[a]:=15;
st[a]:=50;
sx[a]:=round(ufo.x);
sy[a]:=round(ufo.y);
end;


end;





end;




if sqr(schiff.x-ufo.x)+sqr(schiff.y-ufo.y)<400
then
begin

Mediaplayer3.Position:=0;
MediaPlayer3.Play;

ufoon:=false;
dec(leben);
aktiv:=false;

a:=-1;
repeat
inc(a);
until (a=15) or (st[a]=0);
if st[a]=0
then
begin
sr[a]:=15;
st[a]:=50;
sx[a]:=round(ufo.x);
sy[a]:=round(ufo.y);
end;


a:=-1;
repeat
inc(a);
until (a=15) or (st[a]=0);
if st[a]=0
then
begin
sr[a]:=10;
st[a]:=50;
sx[a]:=round(schiff.x);
sy[a]:=round(schiff.y);
end;



end;




end;










if aktiv=true
then
begin

for i:=0 to 15 do
if astro[i].d<>0
then
begin
if sqr(astro[i].x-schiff.x)+sqr(astro[i].y-schiff.y)<sqr(astro[i].d*10+8)
then
begin
dec(leben);
aktiv:=false;
Mediaplayer3.Position:=0;
MediaPlayer3.Play;





a:=-1;
repeat
inc(a);
until (a=15) or (astro[a].d=0);
if astro[a].d=0
then
begin


winkel:=-1;                                //winkel als Hilfsvariable
repeat
inc(winkel);
until (winkel=15) or (st[winkel]=0);
if st[winkel]=0
then
begin
sr[winkel]:=astro[i].d*10;
st[winkel]:=50;
sx[winkel]:=round(astro[i].x);
sy[winkel]:=round(astro[i].y);
end;



winkel:=random(71);

astro[a].x:=astro[i].x+qs[winkel]*astro[i].d*5;
astro[a].y:=astro[i].y-qc[winkel]*astro[i].d*5;

repeat
astro[a].vx:=(random(101)-50)/50;
astro[a].vy:=(random(101)-50)/50;
until (astro[a].vx<>0) or (astro[a].vy<>0);



astro[a].d:=astro[i].d div 2;
if astro[a].d=astro[i].d
then
astro[a].d:=0;

astro[i].x:=astro[i].x-qs[winkel]*astro[i].d*5;
astro[i].y:=astro[i].y+qc[winkel]*astro[i].d*5;

repeat
astro[i].vx:=(random(101)-50)/50;
astro[i].vy:=(random(101)-50)/50;
until (astro[i].vx<>0) or (astro[i].vy<>0);

astro[i].d:=astro[a].d;


end;


a:=-1;
repeat
inc(a);
until (a=15) or (st[a]=0);
if st[a]=0
then
begin
sr[a]:=10;
st[a]:=50;
sx[a]:=round(schiff.x);
sy[a]:=round(schiff.y);
end;



end;


end;

for i:=0 to 7 do
if schuss[i].d<>-1
then
begin

if sqr(schuss[i].x-schiff.x)+sqr(schuss[i].y-schiff.y)<64
then
begin
schuss[i].d:=-1;

dec(leben);
aktiv:=false;
Mediaplayer3.Position:=0;
MediaPlayer3.Play;

a:=-1;
repeat
inc(a);
until (a=15) or (st[a]=0);
if st[a]=0
then
begin
sr[a]:=10;
st[a]:=50;
sx[a]:=round(schiff.x);
sy[a]:=round(schiff.y);
end;


end;


end;

end;


end;


function Tform1.Beschraenken(zahl:integer):integer;
begin   //0 .. 71 Einschränkung

Beschraenken:=zahl;

if zahl>71
then
Beschraenken:=zahl-72;

if zahl<0
then
Beschraenken:=zahl+72;



end;

end.
