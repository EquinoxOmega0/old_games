unit game;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, MPlayer;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Ende: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    MediaPlayer3: TMediaPlayer;
    Label18: TLabel;
    MediaPlayer4: TMediaPlayer;
    MediaPlayer5: TMediaPlayer;
    PaintBox1: TPaintBox;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel1Click(Sender: TObject);

      private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var

devmode,dd,zzz:TDevMode;
  d2:integer;
  dc:hdc;
  scrx,scry,farb:integer;

  Form1: TForm1;
  Bg:array[1..9,0..9] of TBitmap;
  alles,main:TBitmap;
  check:array[1..9,0..9] of boolean;
  deckung,logo,player,laser,Rakete,p1,p2,p3,al1,al2,ar1,ar2,energie,scout,fighter,destroyer,bomber,cruiser,battelship,warship,ladeleiste,lightescorte,heavyescorte,mothership,invador:TBitmap;
   xyz,abc,zerst,level,d,z,x,v,aktu,lade,wenergie,aenergie,senergie,panzerung,neu,wenergiea,aenergiea,senergiea,panzerunga,punkte:integer;
  feuer1,feuer2,feuer3,oot,er,el,jump,zz,reload,run:boolean;
  fx,fy:array[1..20] of integer;
   schu:array[1..20] of boolean;
   rx,ry:array[1..10] of integer;
   rv:array[1..10] of double;
   missel:array[1..10] of boolean;
   px,py,ok:array[1..5] of integer;
   plasma:array[1..5] of boolean;
   high:string;
   data:TextFile;
   feindsub,nvx,nvy,nvx2,nvy2:array[101..125] of integer;
    updown:array[121..124] of integer;
    invadorx:array[1..5]of integer;
   feindv,feindx,feindy,feindschilde,gx,gy,fp:array[1..125] of integer;
   feindtreff,feindstart:array[1..125] of boolean;
   fwx,fwy,feindlade:array[1..126,1..10] of integer;
   fwtyp:array[1..126,1..10] of string;
   fwtreff:array[1..126,1..10] of boolean;
    feindklasse:array[1..125] of string;
    fb,fsb,fl,flb:TBitmap;
    deckungx,deckungy,deckungzeit:integer;
    zeit:double;
    explo:array[1..125] of boolean;
    explot:array[1..125] of integer;
    ex,ey,r,dnf:integer;
    break,uber:boolean;
    mpp:array[1..3] of byte;
    endstart:boolean;




    

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var i,e:integer;
begin

dc:=getdc(0);
farb:=1 shl getdevicecaps(dc, Bitspixel);
releaseDC(0,dc);
scrx:=screen.width;
scry:=screen.height;


devmode.dmsize:=Sizeof(TDevmode);
devmode.dmdriverextra:=0;
d2:=0;


while EnumDisplaySettings(nil,d2,devmode)  do

begin

inc(d2);
if (devmode.dmpelswidth=1280) and (devmode.dmpelsheight=1024) and ((1 shl devmode.dmbitsperpel)=65536)
then
begin
dd:=devmode;
end;

if (devmode.dmpelswidth=scrx) and (devmode.dmpelsheight=scry) and ((1 shl devmode.dmbitsperpel)=farb)
then
begin
zzz:=devmode;
end;

end;

  changedisplaySettings(Tdevmode(dd),0);



                                 


     main:=tbitmap.create;
     main.loadfromfile('hinter/main.bmp');
     alles:=tbitmap.create;
     alles.height:=Paintbox1.height;
     alles.width:=Paintbox1.width;
for i:=0 to alles.height do
for e:=0 to alles.width do
alles.canvas.Pixels[e,i]:=clOlive;
alles.canvas.Draw(0,0,main);
 endstart:=false;
for i:=1 to 3 do
begin
   mpp[i]:=0;
end;
     MediaPlayer1.FileName := 'sound/laser.wav';
     MediaPlayer1.DeviceType:=dtWaveAudio;
     MediaPlayer2.FileName:='sound/missel.wav';
     MediaPlayer2.DeviceType:=dtWaveAudio;
   
     MediaPlayer4.FileName:='sound/explosion.wav';
     MediaPlayer4.DeviceType:=dtWaveAudio;
     MediaPlayer5.FileName:='sound/engine.wav';
     MediaPlayer5.DeviceType:=dtWaveAudio;
 

     MediaPlayer1.Open;
     MediaPlayer2.Open;
     
     MediaPlayer4.Open;
     MediaPlayer5.Open;

        MediaPlayer3.FileName:='sound/plasma.wav';
     MediaPlayer3.DeviceType:=dtWaveAudio;
      MediaPlayer3.Open;
if Getasynckeystate(68)<>0
then
i:=0;

if Getasynckeystate(65)<>0
then
i:=0;

if Getasynckeystate(83)<>0
then
i:=0;

if Getasynckeystate(87)<>0
then
i:=0;

if Getasynckeystate(81)<>0
then
i:=0;

if Getasynckeystate(69)<>0
then
i:=0;

if getasynckeystate(66)<>0
then
i:=0;

if getasynckeystate(27)<>0
then
i:=0;

     for i:=1 to 100 do
     feindstart[i]:=false;


     AssignFile(data, 'high.dll');
     reset(data);
    Readln(data,high);
     Statictext6.caption:=high;
    CloseFile(data);

      For i:=121 to 124 do
      updown[i]:=-25;


     for i:=1 to 100 do
     fp[i]:=0;


     zeit:=0;
     abc:=0;
     dnf:=106;

    For i:=1 to 9 do
    begin
    For e:=0 to 9 do
    begin
Bg[i,e]:=TBitmap.Create;

 Bg[i,e].LoadFromFile('hinter/'+inttostr(i)+inttostr(e)+'.bmp');
 end;
 end;
 laser:=TBitmap.Create;
 laser.LoadFromFile('laser.bmp');
 Player:=TBitmap.Create;
 Player.LoadFromFile('player.bmp');
 Player.Transparent:=true;
 Player.TransParentColor:= Player.canvas.pixels[0,0];
 Rakete:=TBitmap.Create;
 Rakete.LoadFromFile('rakete.bmp');
 Rakete.Transparent:=true;
 Rakete.TransParentColor:= Rakete.canvas.pixels[0,0];

 fl:=TBitmap.Create;
 fl.LoadFromFile('feindlaser.bmp');

  fb:=TBitmap.Create;
 fb.LoadFromFile('feindbombe.bmp');

  fsb:=TBitmap.Create;
 fsb.LoadFromFile('superbombe.bmp');
 fsb.Transparent:=true;
 fsb.TransParentColor:= fsb.canvas.pixels[0,0];
 fsb.TransparentMode := tmAuto;

   flb:=TBitmap.Create;
 flb.LoadFromFile('lenkbombe.bmp');
 flb.Transparent:=true;
 flb.TransParentColor:= flb.canvas.pixels[0,0];
 flb.TransparentMode := tmAuto;


 punkte:=0;
 p1:=TBitmap.Create;
 p1.LoadFromFile('plasma1.bmp');
 p1.Transparent:=true;
 p1.TransParentColor:= p1.canvas.pixels[0,0];

 p2:=TBitmap.Create;
 p2.LoadFromFile('plasma2.bmp');
 p2.Transparent:=true;
 p2.TransParentColor:= p2.canvas.pixels[0,0];

 p3:=TBitmap.Create;
 p3.LoadFromFile('plasma.bmp');
 p3.Transparent:=true;
 p3.TransParentColor:= p3.canvas.pixels[0,0];

 al1:=TBitmap.Create;
 al1.LoadFromFile('antrieb1.bmp');
 al1.Transparent:=true;
 al1.TransparentColor:=al1.canvas.Pixels[0,0];

 al2:=TBitmap.Create;
 al2.LoadFromFile('antrieb2.bmp');
 al2.Transparent:=true;
 al2.TransparentColor:=al2.canvas.Pixels[0,0];


 ar1:=TBitmap.Create;
 ar1.LoadFromFile('antrieb3.bmp');
 ar1.Transparent:=true;
 ar1.TransparentColor:=ar1.canvas.Pixels[0,0];


ar2:=TBitmap.Create;
 ar2.LoadFromFile('antrieb4.bmp');
 ar2.Transparent:=true;
 ar2.TransparentColor:=ar2.canvas.Pixels[0,0];

 scout:=TBitmap.Create;
 scout.LoadFromFile('enemy/scout.bmp');
 scout.Transparent:=true;
 scout.TransparentColor:=scout.canvas.Pixels[0,0];

  fighter:=TBitmap.Create;
 fighter.LoadFromFile('enemy/fighter.bmp');
 fighter.Transparent:=true;
 fighter.TransparentColor:=fighter.canvas.Pixels[0,0];

 destroyer:=TBitmap.Create;
 destroyer.LoadFromFile('enemy/destroyer.bmp');
 destroyer.Transparent:=true;
 destroyer.TransparentColor:=destroyer.canvas.Pixels[0,0];

 bomber:=TBitmap.Create;
 bomber.LoadFromFile('enemy/bomber.bmp');
 bomber.Transparent:=true;
 bomber.TransparentColor:=bomber.canvas.Pixels[0,0];

 cruiser:=TBitmap.Create;
 cruiser.LoadFromFile('enemy/cruiser.bmp');
 cruiser.Transparent:=true;
 cruiser.TransparentColor:=cruiser.canvas.Pixels[0,0];

 battelship:=TBitmap.Create;
 battelship.LoadFromFile('enemy/battelship.bmp');
 battelship.Transparent:=true;
 battelship.TransparentColor:=battelship.canvas.Pixels[0,0];

 warship:=TBitmap.Create;
 warship.LoadFromFile('enemy/warship.bmp');
 warship.Transparent:=true;
 warship.TransparentColor:=warship.canvas.Pixels[0,0];

 scout.TransparentMode := tmAuto;
 destroyer.TransparentMode := tmAuto;
 fighter.TransparentMode := tmAuto;
 bomber.TransparentMode := tmAuto;
 cruiser.TransparentMode := tmAuto;
 warship.TransparentMode := tmAuto;
 battelship.TransparentMode := tmAuto;

 lightescorte:=TBitmap.Create;
 lightescorte.LoadFromFile('enemy/lightescorte.bmp');
 lightescorte.Transparent:=true;
 lightescorte.TransparentColor:=lightescorte.canvas.Pixels[0,0];
 lightescorte.TransparentMode := tmAuto;

 heavyescorte:=TBitmap.Create;
 heavyescorte.LoadFromFile('enemy/heavyescorte.bmp');
 heavyescorte.Transparent:=true;
 heavyescorte.TransparentColor:=heavyescorte.canvas.Pixels[0,0];
 heavyescorte.TransparentMode := tmAuto;

 mothership:=TBitmap.Create;
 mothership.LoadFromFile('enemy/mothership.bmp');
 mothership.Transparent:=true;
 mothership.TransparentColor:=mothership.canvas.Pixels[0,0];
 mothership.TransparentMode := tmAuto;

 invador:=TBitmap.Create;
 invador.LoadFromFile('enemy/invador.bmp');
 invador.Transparent:=true;
 invador.TransparentColor:=invador.canvas.Pixels[0,0];
 invador.TransparentMode := tmAuto;


 ladeleiste:=TBitmap.Create;
 ladeleiste.Loadfromfile('lade.bmp');

  deckung:=TBitmap.Create;
 deckung.Loadfromfile('deckung.bmp');
 deckungx:=random(900)+50;
 deckungy:=800;
 deckungzeit:=0;

 logo:=TBitmap.Create;
 logo.LoadFromFile('EquinoxOmega.bmp');
 alles.canvas.draw(1050,100,logo);

    wenergie:=1000;
    senergie:=500;
    aenergie:=1000;
    panzerung:=100;
    For e:=1 to 10 do
     For i:=1 to 100 do
     feindlade[i,e]:=0;


    jump:=false;
     d:=500;

    er:=false;
    el:=false;
    oot:=true;
   lade:=100;
  v:=0;
 x:=500;
 feuer1:=false;
 feuer2:=false;
 aktu:=1;
 for i:=1 to 20 do
 begin
 fx[i]:=-5;
 fy[i]:=-5;
 schu[i]:=false;
 end;
 for i:=1 to 10 do
 begin
 rx[i]:=-5;
 ry[i]:=-5;
 rv[i]:=0;
 missel[i]:=false;
 end;


 for i:=1 to 5 do
 begin
 plasma[i]:=false;
 px[i]:=-5;
 py[i]:=-5;
 ok[i]:=0;
 end;

For i:=1 to 100 do
feindtreff[i]:=false;

 For i:=1 to 15 do
begin
feindv[i]:=25;
feindklasse[i]:='scout';
feindschilde[i]:=5;
feindx[i]:=50;
feindy[i]:=500+random(50);
gx[i]:=8;
gy[i]:=4;
end;



For i:=16 to 25 do
begin
feindv[i]:=20;
feindklasse[i]:='fighter';
feindschilde[i]:=15;
feindx[i]:=50;
feindy[i]:=575+random(25);
gx[i]:=10;
gy[i]:=5;
end;


For i:=26 to 35 do
begin
Feindv[i]:=15;
feindklasse[i]:='destroyer';
feindschilde[i]:=30;
feindx[i]:=50;
feindy[i]:=460+random(30);
gx[i]:=10;
gy[i]:=5;
end;



for i:= 36 to 50 do
begin
feindv[i]:=5;
feindklasse[i]:='bomber';
feindschilde[i]:=25;
feindx[i]:=50;
feindy[i]:=430+random(10);
gx[i]:=10;
gy[i]:=5;
end;


for i:=51 to 55 do
begin
feindv[i]:=10;
feindklasse[i]:='cruiser';
feindschilde[i]:=50;
feindx[i]:=50;
feindy[i]:=400;
gx[i]:=20;
gy[i]:=10;
end;


for i:=56 to 60 do
begin
feindv[i]:=10;
feindklasse[i]:='cruiser';
feindschilde[i]:=50;
feindx[i]:=50;
feindy[i]:=375;
 gx[i]:=20;
gy[i]:=10;
end;

for i:=61 to 63 do
begin
feindv[i]:=5;
feindklasse[i]:='battelship';
feindschilde[i]:=80;
feindx[i]:=50;
feindy[i]:=300;
 gx[i]:=35;
gy[i]:=15;
end;

For i:=64 to 70 do
begin
Feindv[i]:=15;
feindklasse[i]:='destroyer';
feindschilde[i]:=30;
feindx[i]:=50;
feindy[i]:=475;
gx[i]:=10;
gy[i]:=5;
end;


for i:=70 to 73 do
begin
feindv[i]:=5;
feindklasse[i]:='warship';
feindschilde[i]:=100;
feindx[i]:=50;
feindy[i]:=250;
gx[i]:=45;
gy[i]:=10;
end;

 For i:=74 to 80 do
begin
feindv[i]:=25;
feindklasse[i]:='scout';
feindschilde[i]:=5;
feindx[i]:=50;
feindy[i]:=525+random(20);
gx[i]:=8;
gy[i]:=4;
end;


For i:=81 to 90 do
begin
feindv[i]:=25;
feindklasse[i]:='scout';
feindschilde[i]:=5;
feindx[i]:=50;
feindy[i]:=500+random(20);
gx[i]:=8;
gy[i]:=4;
end;

For i:=91 to 95 do
begin
feindv[i]:=5;
feindklasse[i]:='bomber';
feindschilde[i]:=25;
feindx[i]:=435;
feindy[i]:=475;
gx[i]:=10;
gy[i]:=5;
end;


For i:=96 to 100 do
begin
feindv[i]:=10;
feindklasse[i]:='cruiser';
feindschilde[i]:=50;
feindx[i]:=50;
feindy[i]:=400-random(25);
gx[i]:=20;
gy[i]:=10;
end;


for i:=1 to 100 do
feindx[i]:=-50;


for i:=1 to 100 do
For e:=1 to 10 do
begin
fwtreff[i,e]:=true;
end;

for i:=1 to 100 do
explot[i]:=1;

For i:=101 to 115 do
begin
feindklasse[i]:='lightescorte';
feindschilde[i]:=45;
feindv[i]:=0;
feindx[i]:=random(800)+100;
feindy[i]:=random(300)+100;
gx[i]:=12;
gy[i]:=5;
if i<>101
then
for e:=101 to (i-1) do
begin

repeat
begin
uber:=true;
if (feindx[i]<feindx[e]+15) and (feindx[i]>feindx[e]-15) and (feindy[i]<feindy[e]+10) and (feindy[i]>feindy[e]-10)
then
begin
feindx[i]:=random(800)+100;
feindy[i]:=random(400)+100;
uber:=false;
end;
end;
until uber=true;
end;


end;

for i:=116 to 118 do
begin
feindv[i]:=5;
feindklasse[i]:='battelship';
feindschilde[i]:=80;
feindx[116]:=200;
feindx[117]:=500;
feindx[118]:=800;
feindy[i]:=550;
 gx[i]:=35;
gy[i]:=15;
end;


for i:=119 to 120 do
begin
feindv[i]:=5;
feindklasse[i]:='warship';
feindschilde[i]:=100;
feindx[119]:=300;
feindx[120]:=700;
feindy[i]:=600;
gx[i]:=45;
gy[i]:=10;
end;

for i:=116 to 120 do
feindx[i]:=0;

for i:=121 to 122 do
begin
feindv[i]:=10;
feindklasse[i]:='heavyescorte';
feindschilde[i]:=125;
feindx[i]:=200;
if i=121
then
feindy[i]:=300;
if i=122
then
feindy[i]:=600;
gx[i]:=30;
gy[i]:=15;
end;


for i:=123 to 124 do
begin
feindv[i]:=10;
feindklasse[i]:='heavyescorte';
feindschilde[i]:=125;
feindx[i]:=800;
if i=123
then
feindy[i]:=300;
if i=124
then
feindy[i]:=600;
gx[i]:=30;
gy[i]:=15;
end;

feindv[125]:=5;
feindklasse[125]:='mothership';
feindschilde[125]:=250;
feindx[125]:=500;
feindy[125]:=100;
gx[125]:=70;
gy[125]:=20;
level:=1;
   



invadorx[1]:=500;
invadorx[2]:=475;
invadorx[3]:=450;
invadorx[4]:=525;
invadorx[5]:=550;
break:=false;    
if Screen.Width>=1280
then
run:=true;    
xyz:=0;
end;














procedure TForm1.Timer1Timer(Sender: TObject);
 var i,e,o,a:integer;
begin

if xyz<15
then
inc(xyz);
if run=true
then
if getasynckeystate(66)<>0
then
if xyz=15
then
begin

xyz:=0;
if break=false
then
begin
break:=true;
end
else
begin
break:=false;
end;

end;

if getasynckeystate(27)<>0
then
run:=false;


if run=true
then
if break=false
then
begin


zeit:=zeit+1;



if Getasynckeystate(68)<>0
then
if aenergie>2
then
begin
el:=true;
   MediaPlayer5.Play;
aenergie:=aenergie-2;

if v<15
then
begin
inc(v) ;
inc(v) ;
end;
end;


if Getasynckeystate(65)<>0
then
if aenergie>2
then
begin
er:=true;
   MediaPlayer5.Play;
aenergie:=aenergie-2;
if v>-15
then
begin
dec(v) ;
 dec(v) ;

end;
end;

if Getasynckeystate(83)<>0
then
if aenergie>250
then
begin
   MediaPlayer3.FileName:='sound/jumper.wav';
     MediaPlayer3.DeviceType:=dtWaveAudio;
      MediaPlayer3.Open;
  MediaPlayer3.Play;
v:=0;
jump:=true;
aenergie:=aenergie-250;
x:=random(1000);
end;

if Getasynckeystate(87)<>0
then
if wenergie>30
then
begin
feuer1:=true;

end;

if Getasynckeystate(81)<>0
then
if wenergie>75
then
begin
feuer2:=true;

end;

if Getasynckeystate(69)<>0
then
if wenergie>225
then
begin
feuer3:=true;

end;





For i:=1 to 9 do
begin
For e:=0 to 9 do
begin
check[i,e]:=true;
alles.canvas.draw((e*100),((i-1)*100),bg[i,e]);
end;
end;





 if v<0
 then
 inc(v);

 if v>0
 then
 dec(v);

 
 x:=x+v;

if x<35
then x:=35;

if x>965
then x:=965;

Player.TransparentMode := tmAuto;
alles.Canvas.draw((x-25),825,player);




if feuer1=true
then
if lade>10
then
begin
i:=1;
repeat
begin
if schu[i]=false
then
begin
lade:=0;
fx[i]:=x-5;
fx[i+1]:=x+3;
schu[i]:=true;
schu[i+1]:=true;
fy[i]:=820;
fy[i+1]:=820;
wenergie:=wenergie-30;
i:=24;



 MediaPlayer1.Play;



end;

inc(i);
end;
until i=25;
end;


For i:=1 to 20 do
if schu[i]=true
then
begin
alles.canvas.draw(fx[i],fy[i],laser);
fy[i]:=fy[i]-10;
if fy[i]<0
then
begin
schu[i]:=false;
end;
end;


 if feuer2=true
 then
 if lade>25
 then
 begin
 i:=1;
repeat
begin
if missel[i]=false
then
begin
lade:=0;
if (i=1)or(i=3)or(i=5)or(i=7)or(1=9)
then
rx[i]:=x-4
else
rx[i]:=x+3;

rv[i]:=1/2;

     MediaPlayer2.Play;
missel[i]:=true;
wenergie:=wenergie-75;
ry[i]:=815;
i:=24;
end;

inc(i);
end;
until i=25;


 end;



 For i:=1 to 10 do
if missel[i]=true
then
begin
   Rakete.TransparentMode := tmAuto;
alles.Canvas.draw((rx[i]-2),ry[i],Rakete);

ry[i]:=ry[i]-round(rv[i]);
if rv[i]<5
then
rv[i]:=rv[i]+1/8;

if ry[i]<0
then
begin
missel[i]:=false;
end;
end;








if feuer3=true
then
if lade>75
then
begin
i:=1;
repeat
begin
if plasma[i]=false
then
begin
lade:=0;
px[i]:=x ;
      MediaPlayer3.FileName:='sound/plasma.wav';
     MediaPlayer3.DeviceType:=dtWaveAudio;
      MediaPlayer3.Open;
  MediaPlayer3.Play;
plasma[i]:=true;
 ok[i]:=0;
py[i]:=815;
wenergie:=wenergie-225;
i:=24;
end;

inc(i);
end;
until i=25;
end;


For i:=1 to 5 do
begin
if plasma[i]=true
then
begin
if py[i]=815
then
begin
p1.TransparentMode := tmAuto;
alles.Canvas.draw((px[i]-5),py[i],p1);
inc(ok[i]);
end;

if (py[i]=812) or (py[i]=809)
then
begin
p2.TransparentMode := tmAuto;
alles.Canvas.draw((px[i]-5),py[i],p2);
end;

if py[i]<809
then
begin
p3.TransparentMode := tmAuto;
alles.Canvas.draw((px[i]-5),py[i],p3);
end;

if ok[i]>1
then
py[i]:=py[i]-3;


if py[i]<0
then
plasma[i]:=false;
end;
end;







  inc(lade);

  if lade>100
  then
  lade:=100;

  alles.canvas.Draw(1035,490,ladeleiste);


  for i:=0 to lade do
  alles.canvas.pixels[1050,600-lade+i]:=ClRed;

  for i:=0 to lade do
  alles.canvas.pixels[1049,600-lade+i]:=ClRed;

  for i:=0 to lade do
  alles.canvas.pixels[1051,600-lade+i]:=ClRed;

  for i:=0 to lade do
  alles.canvas.pixels[1052,600-lade+i]:=ClRed;

  for i:=0 to lade do
  alles.canvas.pixels[1048,600-lade+i]:=ClRed;


  alles.canvas.pixels[1045,589]:=clblue;
  alles.canvas.pixels[1046,589]:=clblue;
  alles.canvas.pixels[1047,589]:=clblue;

  alles.canvas.pixels[1045,574]:=clblue;
  alles.canvas.pixels[1046,574]:=clblue;
  alles.canvas.pixels[1047,574]:=clblue;

  alles.canvas.pixels[1045,524]:=clblue;
  alles.canvas.pixels[1046,524]:=clblue;
  alles.canvas.pixels[1047,524]:=clblue;

   if d<1000
   then
   inc(d);

  if  d>250
  then
  if senergie<500
then
inc(senergie);

if aenergie<1000
then
inc(aenergie);

if wenergie<1000
then
inc(wenergie);

if senergie<0
then
begin;
panzerung:=panzerung+senergie;
senergie:=0;
d:=0;
end;

if panzerung<0
then  begin
run:=false;
panzerung:=0;
end;
with alles do
begin
canvas.Pen.width:=5;
    canvas.Pen.Color:=clBlack;
    canvas.moveto(1100,598);
    canvas.lineto(1100,403);
    canvas.Pen.Color:=clLime;
    canvas.Pen.width:=1;
    canvas.moveto(1100,600);
    canvas.lineto(1100,600-round(wenergie/5));
    canvas.moveto(1101,600);
    canvas.lineto(1101,600-round(wenergie/5));
    canvas.moveto(1102,600);
    canvas.lineto(1102,600-round(wenergie/5));
    canvas.moveto(1099,600);
    canvas.lineto(1099,600-round(wenergie/5));
    canvas.moveto(1098,600);
    canvas.lineto(1098,600-round(wenergie/5));

    canvas.Pen.width:=5;
    canvas.Pen.Color:=clBlack;
    canvas.moveto(1150,598);
    canvas.lineto(1150,403);
    canvas.Pen.Color:=clLime;
    canvas.Pen.width:=1;
    canvas.moveto(1150,600);
    canvas.lineto(1150,600-round(aenergie/5));
    canvas.moveto(1151,600);
    canvas.lineto(1151,600-round(aenergie/5));
    canvas.moveto(1152,600);
    canvas.lineto(1152,600-round(aenergie/5));
    canvas.moveto(1149,600);
    canvas.lineto(1149,600-round(aenergie/5));
    canvas.moveto(1148,600);
    canvas.lineto(1148,600-round(aenergie/5));

    canvas.Pen.width:=5;
    canvas.Pen.Color:=clBlack;
    canvas.moveto(1200,598);
    canvas.lineto(1200,403);
    canvas.Pen.Color:=clLime;
    canvas.Pen.width:=1;
    canvas.moveto(1200,600);
    canvas.lineto(1200,600-round(senergie/5*2));
    canvas.moveto(1201,600);
    canvas.lineto(1201,600-round(senergie/5*2));
    canvas.moveto(1202,600);
    canvas.lineto(1202,600-round(senergie/5*2));
    canvas.moveto(1199,600);
    canvas.lineto(1199,600-round(senergie/5*2));
    canvas.moveto(1198,600);
    canvas.lineto(1198,600-round(senergie/5*2));


         canvas.Pen.width:=5;
    canvas.Pen.Color:=clBlack;
    canvas.moveto(1250,598);
    canvas.lineto(1250,503);
    canvas.Pen.Color:=clMaroon;
    canvas.Pen.width:=1;
    canvas.moveto(1250,600);
    canvas.lineto(1250,600-round(panzerung));
    canvas.moveto(1251,600);
    canvas.lineto(1251,600-round(panzerung));
    canvas.moveto(1252,600);
    canvas.lineto(1252,600-round(panzerung));
    canvas.moveto(1249,600);
    canvas.lineto(1249,600-round(panzerung));
    canvas.moveto(1248,600);
    canvas.lineto(1248,600-round(panzerung));

 end;



if el=true
then
begin
if oot=true
then
begin
oot:=false;
al1.TransparentMode := tmAuto;
alles.Canvas.draw(x-33,840,al1);
end
else
begin
oot:=true;
al2.TransparentMode := tmAuto;
alles.Canvas.draw(x-33,840,al2);
end;
end;



if er=true
then
begin
if oot=true
then
begin
oot:=false;
ar1.TransparentMode := tmAuto;
alles.Canvas.draw(x+22,840,ar1);
end
else
begin
oot:=true;
ar2.TransparentMode := tmAuto;
alles.Canvas.draw(x+22,840,ar2);
end;

End;













   z:=0;



if level=1
then
For i:=1 to 100 do
begin

if feindschilde[i]<0
then
feindtreff[i]:=true;


if feindtreff[i]=false
then
if z<15
then
begin
inc(z);
zz:=true;
if feindstart[i]=false
then
begin
feindx[i]:=49    ;
feindstart[i]:=true;
end;
if feindx[i]=49
then
For o:=1 to i do
begin
if i<>o
then
If ((feindx[o]<150) and (feindx[o]>40))or  (feindx[o]>850)
then
if (feindy[i]-feindy[o]<20) and (feindy[i]-feindy[o]>-20)
then
begin
zz:=false;
feindstart[i]:=false;
end;
end;
if zz=true
then
begin

feindx[i]:=(feindv[i] div 5)+feindx[i];

if feindx[i]>950
then
feindx[i]:=50;

if feindklasse[i]='scout'
then
begin

alles.Canvas.draw(feindx[i]-8,feindy[i]-8,scout);
end;

if feindklasse[i]='fighter'
then
begin

alles.Canvas.draw(feindx[i]-10,feindy[i]-10,fighter);
end;

if feindklasse[i]='destroyer'
then
begin

alles.Canvas.draw(feindx[i]-13,feindy[i]-8,destroyer);
end;


if feindklasse[i]='bomber'
then
begin

alles.Canvas.draw(feindx[i]-12,feindy[i]-10,bomber);
end;

if feindklasse[i]='cruiser'
then
begin

alles.Canvas.draw(feindx[i]-20,feindy[i]-13,cruiser);
end;

if feindklasse[i]='battelship'
then
begin

alles.Canvas.draw(feindx[i]-38,feindy[i]-30,battelship);
end;

if feindklasse[i]='warship'
then
begin

alles.Canvas.draw(feindx[i]-50,feindy[i]-25,warship);
end;

For e:=1 to 20 do
if (fx[e]<feindx[i]+gx[i]) and (fx[e]>feindx[i]-gx[i]) and  (fy[e]<feindy[i]+gy[i]) and (fy[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-6;
schu[e]:=false;
fx[e]:=-5;
fy[e]:=-5;
end;

For e:=1 to 20 do
if (fx[e]<feindx[i]+gx[i]) and (fx[e]>feindx[i]-gx[i]) and  (fy[e]+3<feindy[i]+gy[i]) and (fy[e]+3>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-6;
schu[e]:=false;
fx[e]:=-5;
fy[e]:=-5;
end;

For e:=1 to 10 do
if (rx[e]<feindx[i]+gx[i]) and (rx[e]>feindx[i]-gx[i]) and  (ry[e]<feindy[i]+gy[i]) and (ry[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-30;
missel[e]:=false;
rx[e]:=-5;
ry[e]:=-5;
end;

For e:=1 to 10 do
if (rx[e]<feindx[i]+gx[i]) and (rx[e]>feindx[i]-gx[i]) and  (ry[e]+6<feindy[i]+gy[i]) and (ry[e]+6>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-30;
missel[e]:=false;
rx[e]:=-5;
ry[e]:=-5;
end;

For e:=1 to 10 do
if (px[e]<feindx[i]+gx[i]) and (px[e]>feindx[i]-gx[i]) and  (py[e]<feindy[i]+gy[i]) and (py[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-10;

end;

end;

end;
end;



if punkte=1505
then
level:=2;

if punkte=2265
then
level:=3;


if zeit=1 then
begin
feindx[116]:=200;
feindx[117]:=500;
feindx[118]:=800;
feindx[119]:=300;
feindx[120]:=700;
end;


if level=2
then
For i:=101 to 120 do
begin
if feindschilde[i]<0
then
feindtreff[i]:=true;

if feindtreff[101]=true
then
if feindtreff[102]=true
then
if feindtreff[103]=true
then
if feindtreff[104]=true
then
if feindtreff[105]=true
then
begin
For e:=106 to 110 do
feindstart[e]:=true;
end;



if feindtreff[106]=true
then
if feindtreff[107]=true
then
if feindtreff[108]=true
then
if feindtreff[109]=true
then
if feindtreff[110]=true
then
begin
For e:=111 to 115 do
feindstart[e]:=true;
end;





if feindtreff[i]=false
then
begin

if feindx[i]>950
then
feindx[i]:=50;


if feindklasse[i]='lightescorte'
then
 if feindstart[i]=true
then
begin
feindsub[i]:=feindsub[i]+random(2);
if feindsub[i]>100
then
begin
feindsub[i]:=0;
feindx[i]:=random(800)+100;
feindy[i]:=random(400)+100;
for e:=101 to 115 do
begin
if i<>e
then
repeat
begin
uber:=true;
if (feindx[i]<feindx[e]+15) and (feindx[i]>feindx[e]-15) and (feindy[i]<feindy[e]+10) and (feindy[i]>feindy[e]-10)
then
begin
feindx[i]:=random(800)+100;
feindy[i]:=random(400)+100;
uber:=false;
end;
end;
until uber=true;
end;

end;
alles.Canvas.draw(feindx[i]-15,feindy[i]-10,lightescorte);
end;



if feindklasse[i]='battelship'
then
begin
feindx[i]:=round(feindv[i]/5)+feindx[i];
alles.Canvas.draw(feindx[i]-38,feindy[i]-30,battelship);
end;

if feindklasse[i]='warship'
then
begin
feindx[i]:=round(feindv[i]/5)+feindx[i];
alles.Canvas.draw(feindx[i]-50,feindy[i]-25,warship);
end;

if feindstart[i]=true
then
begin

For e:=1 to 20 do
if (fx[e]<feindx[i]+gx[i]) and (fx[e]>feindx[i]-gx[i]) and  (fy[e]<feindy[i]+gy[i]) and (fy[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-6;
schu[e]:=false;
fx[e]:=-5;
fy[e]:=-5;
end;

For e:=1 to 20 do
if (fx[e]<feindx[i]+gx[i]) and (fx[e]>feindx[i]-gx[i]) and  (fy[e]+3<feindy[i]+gy[i]) and (fy[e]+3>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-6;
schu[e]:=false;
fx[e]:=-5;
fy[e]:=-5;
end;

For e:=1 to 10 do
if (rx[e]<feindx[i]+gx[i]) and (rx[e]>feindx[i]-gx[i]) and  (ry[e]<feindy[i]+gy[i]) and (ry[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-30;
missel[e]:=false;
rx[e]:=-5;
ry[e]:=-5;
end;

For e:=1 to 10 do
if (rx[e]<feindx[i]+gx[i]) and (rx[e]>feindx[i]-gx[i]) and  (ry[e]+6<feindy[i]+gy[i]) and (ry[e]+6>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-30;
missel[e]:=false;
rx[e]:=-5;
ry[e]:=-5;
end;

For e:=1 to 10 do
if (px[e]<feindx[i]+gx[i]) and (px[e]>feindx[i]-gx[i]) and  (py[e]<feindy[i]+gy[i]) and (py[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-10;

end;
 end;

  end;

end;

if level=2
then
for i:=116 to 120 do
feindstart[i]:=true;

if level=2
then
for i:=101 to 105 do
feindstart[i]:=true;


if level=3
then
For i:=121 to 125 do
Feindstart[i]:=true;


if level=3
then
For i:=121 to 125 do
begin
if feindschilde[i]<0
then
feindtreff[i]:=true;
if feindtreff[i]=false
then
begin

if feindklasse[i]='heavyescorte'
then
begin
if feindx[i]>x
then
feindx[i]:=feindx[i]-2;

if feindx[i]<x
then
feindx[i]:=feindx[i]+2;

if (feindx[i]>375) and (feindx[i]<625)
then
begin
if feindx[i]<380
then
feindx[i]:=375;

if feindx[i]>620
then
feindx[i]:=625;
end;



inc(updown[i]);

if updown[i]=25
then
updown[i]:=-25;

if updown[i]<0
then
inc(feindy[i])
else
dec(feindy[i]);





alles.Canvas.Draw(feindx[i]-30,feindy[i]-20,heavyescorte);
end;

if feindklasse[i]='mothership'
then
begin
inc(abc);
if abc=5
then
begin
abc:=0;
inc(Feindy[i]);
inc(feindschilde[i]);
if feindschilde[i]>300
then
feindschilde[i]:=300;
end;
alles.Canvas.Draw(feindx[i]-75,feindy[i]-37,mothership);
alles.Canvas.Draw(feindx[i]-75,feindy[i]-37,mothership);
end;


For e:=1 to 20 do
if (fx[e]<feindx[i]+gx[i]) and (fx[e]>feindx[i]-gx[i]) and  (fy[e]<feindy[i]+gy[i]) and (fy[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-6;
schu[e]:=false;
fx[e]:=-5;
fy[e]:=-5;
end;

For e:=1 to 20 do
if (fx[e]<feindx[i]+gx[i]) and (fx[e]>feindx[i]-gx[i]) and  (fy[e]+3<feindy[i]+gy[i]) and (fy[e]+3>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-6;
schu[e]:=false;
fx[e]:=-5;
fy[e]:=-5;
end;

For e:=1 to 10 do
if (rx[e]<feindx[i]+gx[i]) and (rx[e]>feindx[i]-gx[i]) and  (ry[e]<feindy[i]+gy[i]) and (ry[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-30;
missel[e]:=false;
rx[e]:=-5;
ry[e]:=-5;
end;

For e:=1 to 10 do
if (rx[e]<feindx[i]+gx[i]) and (rx[e]>feindx[i]-gx[i]) and  (ry[e]+6<feindy[i]+gy[i]) and (ry[e]+6>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-30;
missel[e]:=false;
rx[e]:=-5;
ry[e]:=-5;
end;

For e:=1 to 10 do
if (px[e]<feindx[i]+gx[i]) and (px[e]>feindx[i]-gx[i]) and  (py[e]<feindy[i]+gy[i]) and (py[e]>feindy[i]-gy[i])
then
begin
feindschilde[i]:=feindschilde[i]-10;

end;


end;
end;



For i:=1 to 125 do
begin

   If feindtreff[i]=false
   then
   if feindstart[i]=true
   then
   begin




 if feindklasse[i]='fighter'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
if feindlade[i,1]>100
then
begin
fwx[i,1]:=feindx[i];
fwy[i,1]:=feindy[i]+3;
fwtyp[i,1]:='laser';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;

end;

if feindklasse[i]='destroyer'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
feindlade[i,3]:=feindlade[i,3]+random(3);
if feindlade[i,1]>100
then
begin
fwx[i,1]:=feindx[i];
fwy[i,1]:=feindy[i]+4;
fwtyp[i,1]:='laser';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;
if feindlade[i,2]>100
then
begin
fwx[i,2]:=feindx[i]+5;
fwy[i,2]:=feindy[i]+4;
fwtyp[i,2]:='laser';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
end;
if feindlade[i,3]>100
then
begin
feindlade[i,3]:=0 ;
fwx[i,3]:=feindx[i]-5;
fwy[i,3]:=feindy[i]+4;
fwtyp[i,3]:='laser';
fwtreff[i,3]:=false;
end;

end;


if feindklasse[i]='bomber'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
if feindlade[i,1]>200
then
begin
fwx[i,1]:=feindx[i]-5;
fwy[i,1]:=feindy[i]+5;
fwtyp[i,1]:='bombe';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;
if feindlade[i,2]>200
then
begin
fwx[i,2]:=feindx[i]+5;
fwy[i,2]:=feindy[i]+5;
fwtyp[i,2]:='bombe';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
end;

end;

if feindklasse[i]='cruiser'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
feindlade[i,3]:=feindlade[i,3]+random(3);
feindlade[i,4]:=feindlade[i,4]+random(3);
feindlade[i,5]:=feindlade[i,5]+random(3);
if feindlade[i,1]>200
then
begin
fwx[i,1]:=feindx[i];
fwy[i,1]:=feindy[i]+7;
fwtyp[i,1]:='bombe';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;

if feindlade[i,2]>100
then
begin
fwx[i,2]:=feindx[i]+11;
fwy[i,2]:=feindy[i]+10;
fwtyp[i,2]:='laser';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
end;

if feindlade[i,3]>100
then
begin
fwx[i,3]:=feindx[i]-11;
fwy[i,3]:=feindy[i]+10;
fwtyp[i,3]:='laser';
fwtreff[i,3]:=false;
feindlade[i,3]:=0 ;
end;

if feindlade[i,4]>105
then
begin
fwx[i,4]:=feindx[i]+11;
fwy[i,4]:=feindy[i]+10;
fwtyp[i,4]:='laser';
fwtreff[i,4]:=false;
feindlade[i,4]:=0 ;
end;

if feindlade[i,5]>105
then
begin
fwx[i,5]:=feindx[i]-11;
fwy[i,5]:=feindy[i]+10;
fwtyp[i,5]:='laser';
fwtreff[i,5]:=false;
feindlade[i,5]:=0 ;
end;


end;

if feindklasse[i]='battelship'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
feindlade[i,3]:=feindlade[i,3]+random(3);
feindlade[i,4]:=feindlade[i,4]+random(3);
feindlade[i,5]:=feindlade[i,5]+random(3);
feindlade[i,6]:=feindlade[i,6]+random(3);
feindlade[i,7]:=feindlade[i,7]+random(3);
feindlade[i,8]:=feindlade[i,8]+random(3);
feindlade[i,9]:=feindlade[i,9]+random(3);


if feindlade[i,1]>300
then
begin
fwx[i,1]:=feindx[i];
fwy[i,1]:=feindy[i]+25;
fwtyp[i,1]:='superbombe';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;

if feindlade[i,2]>200
then
begin
fwx[i,2]:=feindx[i]+13;
fwy[i,2]:=feindy[i]+11;
fwtyp[i,2]:='bombe';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
end;

if feindlade[i,3]>200
then
begin
fwx[i,3]:=feindx[i]-13;
fwy[i,3]:=feindy[i]+11;
fwtyp[i,3]:='bombe';
fwtreff[i,3]:=false;
feindlade[i,3]:=0 ;
end;

if feindlade[i,4]>100
then
begin
fwx[i,4]:=feindx[i]+20;
fwy[i,4]:=feindy[i]+25;
fwtyp[i,4]:='laser';
fwtreff[i,4]:=false;
feindlade[i,4]:=0 ;
end;

if feindlade[i,5]>105
then
begin
fwx[i,5]:=feindx[i]+20;
fwy[i,5]:=feindy[i]+25;
fwtyp[i,5]:='laser';
fwtreff[i,5]:=false;
feindlade[i,5]:=0 ;
end;

if feindlade[i,6]>100
then
begin
fwx[i,6]:=feindx[i]-20;
fwy[i,6]:=feindy[i]+25;
fwtyp[i,6]:='laser';
fwtreff[i,6]:=false;
feindlade[i,6]:=0 ;
end;

if feindlade[i,7]>105
then
begin
fwx[i,7]:=feindx[i]-20;
fwy[i,7]:=feindy[i]+25;
fwtyp[i,7]:='laser';
fwtreff[i,7]:=false;
feindlade[i,7]:=0 ;
end;

if feindlade[i,8]>100
then
begin
fwx[i,8]:=feindx[i]-27;
fwy[i,8]:=feindy[i]+10;
fwtyp[i,8]:='laser';
fwtreff[i,8]:=false;
feindlade[i,8]:=0 ;
end;

if feindlade[i,9]>100
then
begin
fwx[i,9]:=feindx[i]+27;
fwy[i,9]:=feindy[i]+10;
fwtyp[i,9]:='laser';
fwtreff[i,9]:=false;
feindlade[i,9]:=0 ;
end;


end;

if feindklasse[i]='warship'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
feindlade[i,3]:=feindlade[i,3]+random(3);
feindlade[i,4]:=feindlade[i,4]+random(3);
feindlade[i,5]:=feindlade[i,5]+random(3);
feindlade[i,6]:=feindlade[i,6]+random(3);
feindlade[i,7]:=feindlade[i,7]+random(3);
feindlade[i,8]:=feindlade[i,8]+random(3);
feindlade[i,9]:=feindlade[i,9]+random(3);

if feindlade[i,1]>300
then
begin
fwx[i,1]:=feindx[i];
fwy[i,1]:=feindy[i]+10;
fwtyp[i,1]:='superbombe';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;

if feindlade[i,2]>300
then
begin
fwx[i,2]:=feindx[i]+33;
fwy[i,2]:=feindy[i]+10;
fwtyp[i,2]:='superbombe';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
end;

if feindlade[i,3]>300
then
begin
fwx[i,3]:=feindx[i]-33;
fwy[i,3]:=feindy[i]+10;
fwtyp[i,3]:='superbombe';
fwtreff[i,3]:=false;
feindlade[i,3]:=0 ;
end;

if feindlade[i,4]>100
then
begin
fwx[i,4]:=feindx[i]+13;
fwy[i,4]:=feindy[i]+7;
fwtyp[i,4]:='laser';
fwtreff[i,4]:=false;
feindlade[i,4]:=0 ;
end;

if feindlade[i,5]>100
then
begin
fwx[i,5]:=feindx[i]-13;
fwy[i,5]:=feindy[i]+7;
fwtyp[i,5]:='laser';
fwtreff[i,5]:=false;
feindlade[i,5]:=0 ;
end;

if feindlade[i,6]>100
then
begin
fwx[i,6]:=feindx[i]+19;
fwy[i,6]:=feindy[i]+7;
fwtyp[i,6]:='laser';
fwtreff[i,6]:=false;
feindlade[i,6]:=0 ;
end;

if feindlade[i,7]>100
then
begin
fwx[i,7]:=feindx[i]-19;
fwy[i,7]:=feindy[i]+7;
fwtyp[i,7]:='laser';
fwtreff[i,7]:=false;
feindlade[i,7]:=0 ;
end;

if feindlade[i,8]>100
then
begin
fwx[i,8]:=feindx[i]+24;
fwy[i,8]:=feindy[i]+7;
fwtyp[i,8]:='laser';
fwtreff[i,8]:=false;
feindlade[i,8]:=0 ;
end;

if feindlade[i,9]>100
then
begin
fwx[i,9]:=feindx[i]-24;
fwy[i,9]:=feindy[i]+7;
fwtyp[i,9]:='laser';
fwtreff[i,9]:=false;
feindlade[i,9]:=0 ;
end;





end;








 if feindklasse[i]='lightescorte'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
feindlade[i,3]:=feindlade[i,3]+random(3);
feindlade[i,4]:=feindlade[i,4]+random(3);
feindlade[i,5]:=feindlade[i,5]+random(3);
feindlade[i,6]:=feindlade[i,6]+random(3);
feindlade[i,7]:=feindlade[i,7]+random(3);
if feindlade[i,1]>100
then
begin
fwx[i,1]:=feindx[i];
fwy[i,1]:=feindy[i]+5;
fwtyp[i,1]:='laser';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;

if feindlade[i,2]>105
then
begin
fwx[i,2]:=feindx[i];
fwy[i,2]:=feindy[i]+5;
fwtyp[i,2]:='laser';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
end;


if feindlade[i,3]>200
then
begin
fwx[i,3]:=feindx[i];
fwy[i,3]:=feindy[i]+5;
fwtyp[i,3]:='bombe';
fwtreff[i,3]:=false;
feindlade[i,3]:=0 ;
end;

if feindlade[i,4]>95
then
begin
fwx[i,4]:=feindx[i];
fwy[i,4]:=feindy[i]+5;
fwtyp[i,4]:='laser';
fwtreff[i,4]:=false;
feindlade[i,4]:=0 ;
end;

if feindlade[i,5]>200
then
begin
fwx[i,5]:=feindx[i];
fwy[i,5]:=feindy[i]+5;
fwtyp[i,5]:='bombe';
fwtreff[i,5]:=false;
feindlade[i,5]:=0 ;
end;

if feindlade[i,6]>350
then
begin
fwx[i,6]:=feindx[i];
fwy[i,6]:=feindy[i]+5;
fwtyp[i,6]:='superbombe';
fwtreff[i,6]:=false;
feindlade[i,6]:=0 ;
end;

if feindlade[i,7]>500
then
begin
fwtyp[i,7]:='neutralisator';
fwtreff[i,7]:=false;
feindlade[i,7]:=0 ;
nvx[i]:=x-feindx[i];
nvy[i]:=825-feindy[i]+5;
nvx[i]:=round(10*nvx[i]/sqrt(sqr(nvx[i])+sqr(nvy[i])));
nvy[i]:=round(10*nvy[i]/sqrt(sqr(nvx[i])+sqr(nvy[i])));
fwx[i,7]:=feindx[i];
fwy[i,7]:=feindy[i]+5;
end;


end;


 if feindklasse[i]='heavyescorte'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
feindlade[i,3]:=feindlade[i,3]+random(3);
feindlade[i,4]:=feindlade[i,4]+random(3);
feindlade[i,5]:=feindlade[i,5]+random(3);
feindlade[i,6]:=feindlade[i,6]+random(3);
feindlade[i,7]:=feindlade[i,7]+random(3);
feindlade[i,8]:=feindlade[i,8]+random(3);
feindlade[i,9]:=feindlade[i,9]+random(3);

if feindlade[i,1]>100
then
begin
fwx[i,1]:=feindx[i]+7;
fwy[i,1]:=feindy[i]+12;
fwtyp[i,1]:='laser';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
if feindschilde[i]<125
then
inc(feindschilde[i]);
end;

if feindlade[i,2]>100
then
begin
fwx[i,2]:=feindx[i]-7;
fwy[i,2]:=feindy[i]+12;
fwtyp[i,2]:='laser';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
if feindschilde[i]<125
then
inc(feindschilde[i]);
end;


if feindlade[i,3]>300
then
begin
fwx[i,3]:=feindx[i];
fwy[i,3]:=feindy[i]+14;
fwtyp[i,3]:='superbombe';
fwtreff[i,3]:=false;
feindlade[i,3]:=0 ;
end;


if feindlade[i,4]>200
then
begin
fwx[i,4]:=feindx[i]+17;
fwy[i,4]:=feindy[i]+10;
fwtyp[i,4]:='bombe';
fwtreff[i,4]:=false;
feindlade[i,4]:=0 ;
end;

if feindlade[i,5]>200
then
begin
fwx[i,5]:=feindx[i]-17;
fwy[i,5]:=feindy[i]+10;
fwtyp[i,5]:='bombe';
fwtreff[i,5]:=false;
feindlade[i,5]:=0 ;
end;



if feindlade[i,6]>200
then
begin
fwx[i,6]:=feindx[i]+27;
fwy[i,6]:=feindy[i]+3;
fwtyp[i,6]:='bombe';
fwtreff[i,6]:=false;
feindlade[i,6]:=0 ;
end;

if feindlade[i,7]>200
then
begin
fwx[i,7]:=feindx[i]-27;
fwy[i,7]:=feindy[i]+3;
fwtyp[i,7]:='bombe';
fwtreff[i,7]:=false;
feindlade[i,7]:=0 ;
end;

if feindlade[i,8]>500
then
begin
fwtyp[i,8]:='neutralisator';
fwtreff[i,8]:=false;
feindlade[i,8]:=0 ;
nvx2[i]:=x-feindx[i];
nvy2[i]:=825-feindy[i]+13;
nvx2[i]:=round(10*nvx2[i]/sqrt(sqr(nvx2[i])+sqr(nvy2[i])));
nvy2[i]:=round(10*nvy2[i]/sqrt(sqr(nvx2[i])+sqr(nvy2[i])));
fwx[i,8]:=feindx[i];
fwy[i,8]:=feindy[i]+13;
end;

if feindlade[i,9]>500
then
begin
fwtyp[i,9]:='neutralisator';
fwtreff[i,9]:=false;
feindlade[i,9]:=0 ;
nvx[i]:=x-feindx[i];
nvy[i]:=825-feindy[i]+13;
nvx[i]:=round(10*nvx[i]/sqrt(sqr(nvx[i])+sqr(nvy[i])));
nvy[i]:=round(10*nvy[i]/sqrt(sqr(nvx[i])+sqr(nvy[i])));
fwx[i,9]:=feindx[i];
fwy[i,9]:=feindy[i]+13;
end;

end;





 if feindklasse[i]='mothership'
then
begin
feindlade[i,1]:=feindlade[i,1]+random(3);
feindlade[i,2]:=feindlade[i,2]+random(3);
feindlade[i,3]:=feindlade[i,3]+random(3);
feindlade[i,4]:=feindlade[i,4]+random(3);
feindlade[i,5]:=feindlade[i,5]+random(3);
feindlade[i,6]:=feindlade[i,6]+random(3);
feindlade[i,7]:=feindlade[i,7]+random(3);
feindlade[i,8]:=feindlade[i,8]+random(3);
feindlade[i,9]:=feindlade[i,9]+random(3);
feindlade[i,10]:=feindlade[1,10]+random(3);
feindlade[1,1]:=feindlade[1,1]+random(3);
feindlade[1,2]:=feindlade[1,2]+random(3);
feindlade[1,3]:=feindlade[1,3]+random(3);
feindlade[1,4]:=feindlade[1,4]+random(3);
feindlade[1,5]:=feindlade[1,5]+random(3);
feindlade[1,6]:=feindlade[1,6]+random(3);
feindlade[1,7]:=feindlade[1,7]+random(3);
feindlade[1,8]:=feindlade[1,8]+random(3);
feindlade[1,9]:=feindlade[1,9]+random(3);
feindlade[1,10]:=feindlade[1,10]+random(3);

if feindlade[i,1]>100
then
begin
fwx[i,1]:=feindx[i]+65;
fwy[i,1]:=feindy[i]+3;
fwtyp[i,1]:='laser';
fwtreff[i,1]:=false;
feindlade[i,1]:=0 ;
end;


if feindlade[i,2]>100
then
begin
fwx[i,2]:=feindx[i]-65;
fwy[i,2]:=feindy[i]+3;
fwtyp[i,2]:='laser';
fwtreff[i,2]:=false;
feindlade[i,2]:=0 ;
end;

if feindlade[i,3]>200
then
begin
fwx[i,3]:=feindx[i];
fwy[i,3]:=feindy[i]+23;
fwtyp[i,3]:='bombe';
fwtreff[i,3]:=false;
feindlade[i,3]:=0 ;
end;

if feindlade[i,4]>205
then
begin
fwx[i,4]:=feindx[i];
fwy[i,4]:=feindy[i]+23;
fwtyp[i,4]:='bombe';
fwtreff[i,4]:=false;
feindlade[i,4]:=0 ;
end;

if feindlade[i,5]>350
then
begin
fwx[i,5]:=feindx[i];
fwy[i,5]:=feindy[i]+23;
fwtyp[i,5]:='superbombe';
fwtreff[i,5]:=false;
feindlade[i,5]:=0 ;
end;

if feindlade[i,6]>355
then
begin
fwx[i,6]:=feindx[i];
fwy[i,6]:=feindy[i]+23;
fwtyp[i,6]:='superbombe';
fwtreff[i,6]:=false;
feindlade[i,6]:=0 ;
end;

if feindlade[i,7]>100
then
begin
fwx[i,7]:=feindx[i];
fwy[i,7]:=feindy[i]+23;
fwtyp[i,7]:='laser';
fwtreff[i,7]:=false;
feindlade[i,7]:=0 ;
end;

if feindlade[i,8]>400
then
begin
fwtyp[i,8]:='neutralisator';
fwtreff[i,8]:=false;
feindlade[i,8]:=0 ;
nvx2[i]:=x-feindx[i];
nvy2[i]:=825-feindy[i]+23;
nvx2[i]:=round(10*nvx2[i]/sqrt(sqr(nvx2[i])+sqr(nvy2[i])));
nvy2[i]:=round(10*nvy2[i]/sqrt(sqr(nvx2[i])+sqr(nvy2[i])));
fwx[i,8]:=feindx[i];
fwy[i,8]:=feindy[i]+23;
end;

if feindlade[i,9]>405
then
begin
fwtyp[i,9]:='neutralisator';
fwtreff[i,9]:=false;
feindlade[i,9]:=0 ;
nvx[i]:=x-feindx[i];
nvy[i]:=825-feindy[i]+23;
nvx[i]:=round(10*nvx[i]/sqrt(sqr(nvx[i])+sqr(nvy[i])));
nvy[i]:=round(10*nvy[i]/sqrt(sqr(nvx[i])+sqr(nvy[i])));
fwx[i,9]:=feindx[i];
fwy[i,9]:=feindy[i]+23;
end;

if feindlade[i,10]>500
then
begin
fwx[i,10]:=feindx[i];
fwy[i,10]:=feindy[i]+23;
fwtyp[i,10]:='lenkbombe';
fwtreff[i,10]:=false;
feindlade[i,10]:=0 ;
end;

if feindlade[1,1]>100
then
begin
fwx[1,1]:=feindx[i]+65;
fwy[1,1]:=feindy[i]-27;
fwtyp[1,1]:='laser';
fwtreff[1,1]:=false;
feindlade[1,1]:=0 ;
end;

if feindlade[1,2]>100
then
begin
fwx[1,2]:=feindx[i]-65;
fwy[1,2]:=feindy[i]-27;
fwtyp[1,2]:='laser';
fwtreff[1,2]:=false;
feindlade[1,2]:=0 ;
end;

if feindlade[1,3]>105
then
begin
fwx[1,3]:=feindx[i]+65;
fwy[1,3]:=feindy[i]-27;
fwtyp[1,3]:='laser';
fwtreff[1,3]:=false;
feindlade[1,3]:=0 ;
end;

if feindlade[1,4]>105
then
begin
fwx[1,4]:=feindx[i]-65;
fwy[1,4]:=feindy[i]-27;
fwtyp[1,4]:='laser';
fwtreff[1,4]:=false;
feindlade[1,4]:=0 ;
end;



if feindlade[1,5]>200
then
begin
fwx[1,5]:=feindx[i]-42;
fwy[1,5]:=feindy[i]+17;
fwtyp[1,5]:='bombe';
fwtreff[1,5]:=false;
feindlade[1,5]:=0 ;
end;

if feindlade[1,6]>200
then
begin
fwx[1,6]:=feindx[i]+42;
fwy[1,6]:=feindy[i]+17;
fwtyp[1,6]:='bombe';
fwtreff[1,6]:=false;
feindlade[1,6]:=0 ;
end;


if feindlade[1,7]>500
then
begin
fwx[1,7]:=feindx[i]-42;
fwy[1,7]:=feindy[i]+17;
fwtyp[1,7]:='lenkbombe';
fwtreff[1,7]:=false;
feindlade[1,7]:=0 ;
end;


if feindlade[1,8]>500
then
begin
fwx[1,8]:=feindx[i]+42;
fwy[1,8]:=feindy[i]+17;
fwtyp[1,8]:='lenkbombe';
fwtreff[1,8]:=false;
feindlade[1,8]:=0 ;
end;

if feindlade[1,9]>350
then
begin
fwx[1,9]:=feindx[i]-42;
fwy[1,9]:=feindy[i]+17;
fwtyp[1,9]:='superbombe';
fwtreff[1,9]:=false;
feindlade[1,9]:=0 ;
end;

if feindlade[1,10]>350
then
begin
fwx[1,10]:=feindx[i]+42;
fwy[1,10]:=feindy[i]+17;
fwtyp[1,10]:='superbombe';
fwtreff[1,10]:=false;
feindlade[1,10]:=0 ;
end;









end;









  end;
  For e:=1 to 10 do
  begin
  if fwy[i,e]>850
  then
  fwtreff[i,e]:=true;

  if fwtreff[i,e]=false
  then
  begin


   if fwtyp[i,e]='laser'
  then
  begin
  
  fwy[i,e]:=fwy[i,e]+10;
   alles.canvas.Draw(fwx[i,e],fwy[i,e],fl);
  end;

  if fwtyp[i,e]='bombe'
  then
  begin
   fwy[i,e]:=fwy[i,e]+6;
    alles.canvas.Draw(fwx[i,e]-1,fwy[i,e]-1,fb);
 end;
  if fwtyp[i,e]='superbombe'
  then
  begin
   fwy[i,e]:=fwy[i,e]+4;
   alles.canvas.Draw(fwx[i,e]-3,fwy[i,e]-3,fsb);
  end;

   if fwtyp[i,e]='lenkbombe'
  then
  begin
  if fwx[i,e]<x
  then
  inc(fwx[i,e]);

  if fwx[i,e]>x
  then
  dec(fwx[i,e]);

   fwy[i,e]:=fwy[i,e]+5;
   alles.canvas.Draw(fwx[i,e]-2,fwy[i,e]-3,flb);
  end;

    if e<>8
    then
    if fwtyp[i,e]='neutralisator'
  then
  begin
  alles.Canvas.Pen.Color:=clPurple;
  alles.canvas.Pen.width:=2;
  alles.canvas.moveto(fwx[i,e],fwy[i,e]);
  fwx[i,e]:=fwx[i,e]+nvx[i];
  fwy[i,e]:=fwy[i,e]+nvy[i];
  alles.canvas.lineto(fwx[i,e],fwy[i,e]);
  end;

     if e=8
    then
    if fwtyp[i,e]='neutralisator'
  then
  begin
  alles.Canvas.Pen.Color:=clPurple;
  alles.canvas.Pen.width:=2;
  alles.canvas.moveto(fwx[i,e],fwy[i,e]);
  fwx[i,e]:=fwx[i,e]+nvx2[i];
  fwy[i,e]:=fwy[i,e]+nvy2[i];
  alles.canvas.lineto(fwx[i,e],fwy[i,e]);
  end;

  If (fwy[i,e]>830) and (fwx[i,e]<x+23) and (fwx[i,e]>x-23)
  then
  begin
  if fwtyp[i,e]='laser'
  then
  senergie:=senergie-30;

  if fwtyp[i,e]='bombe'
  then
  begin
  senergie:=senergie-100;
  panzerung:=panzerung-1;
  end;

    if fwtyp[i,e]='superbombe'
  then
  begin
  senergie:=senergie-200;
  panzerung:=panzerung-5;
  wenergie:=wenergie-100;
  aenergie:=aenergie-100;

  if wenergie<0
  then wenergie:=0;
  if aenergie<0 then
  aenergie:=0;
  end;

      if fwtyp[i,e]='neutralisator'
  then
  begin
  senergie:=senergie-50;
  wenergie:=wenergie-250;
  aenergie:=aenergie-250;

  if wenergie<0
  then wenergie:=0;
  if aenergie<0 then
  aenergie:=0;
  end;

     if fwtyp[i,e]='lenkbombe'
  then
  begin
  senergie:=senergie-250;
  panzerung:=panzerung-10;
  end;



    fwtreff[i,e]:=true;
   end;


  end;


  end;

end;






for i:=1 to 125 do
begin
if feindtreff[i]=true
then
dec(fp[i]);

if fp[i]<-5
then
inc(fp[i]);

if fp[i]=-1
then
 begin

 if feindklasse[i]='scout'
then
begin
Punkte:=punkte+5;
end;

 if feindklasse[i]='fighter'
then
begin
Punkte:=punkte+10;
end;

if feindklasse[i]='destroyer'
then
begin
Punkte:=punkte+15;
end;


if feindklasse[i]='bomber'
then
begin
Punkte:=punkte+20;
end;

if feindklasse[i]='cruiser'
then
begin
Punkte:=punkte+25;
end;

if feindklasse[i]='battelship'
then
begin
Punkte:=punkte+30;
end;

if feindklasse[i]='warship'
then
begin
Punkte:=punkte+35;
end;

if feindklasse[i]='lightescorte'
then
begin
Punkte:=punkte+40;
end;

if feindklasse[i]='heavyescorte'
then
begin
Punkte:=punkte+45;
end;

if feindklasse[i]='mothership'
then
begin
Punkte:=punkte+100;
end;

 end;



 end;





if punkte>strtoint(high)
then
begin
high:=inttostr(punkte);
AssignFile(data, 'high.dll');
rewrite(data);
write(data,high);
CloseFile(data);
staticText6.caption:=high;
end;


 for i:=1 to 125 do
 if feindtreff[i]=true
 then
 if explot[i]=20
 then
 begin
 feindx[i]:=-100;
 feindy[i]:=-100;   
 end;
  

for i:=1 to 125 do
begin
if feindtreff[i]=true
then
if explot[i]<20
then
begin
inc(explot[i]);
if explot[i]=2
then
MediaPlayer4.Play;
For e:=1 to round((gx[i]*gy[i])/explot[i]) do
begin
r:=round(random(gx[i])*random(gx[i])/5);
if random(2)=1
then
r:=r*(-1);
ex:=round(feindv[i]*(explot[i]-1)/10+feindx[i]+r) ;

r:=round(random(gx[i])*random(gx[i])/5);
if random(2)=1
then
r:=r*(-1);
ey:=round(feindy[i]+r) ;

if (ex>999) or (ex<1)
then
ex:=round(feindv[i]*(explot[i]-1)/10+feindx[i]+random((2*gx[i])-gx[i])) ;
if (ey>800) or (ey<1)
then
ey:=round(feindy[i]+random((2*gy[i])-gy[i])) ;

alles.canvas.pixels[ex,ey]:=clyellow;



r:=round(random(gx[i])*random(gx[i])/5);
if random(2)=1
then
r:=r*(-1);
ex:=round(feindv[i]*(explot[i]-1)/10+feindx[i]+r) ;

r:=round(random(gx[i])*random(gx[i])/5);
if random(2)=1
then
r:=r*(-1);
ey:=round(feindy[i]+r) ;

if (ex>999) or (ex<1)
then
ex:=round(feindv[i]*(explot[i]-1)/10+feindx[i]+random((2*gx[i])-gx[i])) ;
if (ey>800) or (ey<1)
then
ey:=round(feindy[i]+random((2*gy[i])-gy[i])) ;

alles.canvas.pixels[ex,ey]:=clred;



r:=round(random(gx[i])*random(gx[i])/5);
if random(2)=1
then
r:=r*(-1);
ex:=round(feindv[i]*(explot[i]-1)/10+feindx[i]+r) ;

r:=round(random(gx[i])*random(gx[i])/5);
if random(2)=1
then
r:=r*(-1);
ey:=round(feindy[i]+r) ;

if (ex>999) or (ex<1)
then
ex:=round(feindv[i]*(explot[i]-1)/10+feindx[i]+random((2*gx[i])-gx[i])) ;
if (ey>800) or (ey<1)
then
ey:=round(feindy[i]+random((2*gy[i])-gy[i])) ;

alles.canvas.pixels[ex,ey]:=clMaroon;





end;


end;
end;





 if feindy[125]>800
 then
 begin
 run:=false;
 panzerung:=0;
 For i:=1 to 5 do
 alles.canvas.draw(invadorx[i],835,invador);
 end;



 if (getasynckeystate(17)<>0 ) and (getasynckeystate(49)<>0 ) and (getasynckeystate(76)<>0 )
 then
 For i:=1 to 50 do
 Feindtreff[i]:=true;

  if (getasynckeystate(17)<>0 ) and (getasynckeystate(50)<>0 ) and (getasynckeystate(76)<>0 )
 then
 For i:=1 to 75 do
 Feindtreff[i]:=true;

 if (getasynckeystate(17)<>0 ) and (getasynckeystate(51)<>0 ) and (getasynckeystate(76)<>0 )
 then
 For i:=1 to 100 do
 Feindtreff[i]:=true;

  if (getasynckeystate(17)<>0 ) and (getasynckeystate(52)<>0 ) and (getasynckeystate(76)<>0 )
 then
 For i:=1 to 120 do
 Feindtreff[i]:=true;

   if (getasynckeystate(17)<>0 ) and (getasynckeystate(53)<>0 ) and (getasynckeystate(76)<>0 )
 then
 For i:=1 to 125 do
 Feindtreff[i]:=true;

 if (getasynckeystate(17)<>0 ) and (getasynckeystate(49)<>0 ) and (getasynckeystate(80)<>0 )
 then
wenergie:=1000;

   if (getasynckeystate(17)<>0 ) and (getasynckeystate(50)<>0 ) and (getasynckeystate(80)<>0 )
 then
aenergie:=1000;
  if (getasynckeystate(17)<>0 ) and (getasynckeystate(51)<>0 ) and (getasynckeystate(80)<>0 )
 then
senergie:=500;
  if (getasynckeystate(17)<>0 ) and (getasynckeystate(52)<>0 ) and (getasynckeystate(80)<>0 )
 then
  panzerung:=100;


  

  Statictext7.Caption:=inttostr(level);

 if zeit=1
 then
alles.canvas.draw(1050,100,logo);

feuer1:=false;
feuer2:=false;
feuer3:=false;
el:=false;
er:=false;
jump:=false;

if punkte=2545
then
begin
punkte:=2550;
punkte:=punkte+panzerung;
run:=false;
end;


if punkte>strtoint(high)
then
begin
high:=inttostr(punkte);
AssignFile(data, 'high.dll');
rewrite(data);
write(data,high);
CloseFile(data);
Statictext6.caption:=high;
end;

  staticText3.caption:=inttostr(punkte);
  Paintbox1.canvas.draw(0,0,alles);
       end;


if run=false
then
Ende.caption:='Game quitted';

if panzerung<=0
then
Ende.caption:='Game over';

if punkte>2550
then
begin

Ende.caption:='You have won the game!';
if endstart=false
then
begin
MediaPlayer1.FileName:='sound/win.wav';
MediaPlayer1.DeviceType:=dtWaveAudio;
MediaPlayer1.Open;
Mediaplayer1.Play;
endstart:=true;
end;
end;



end;


























 procedure TForm1.Panel1Click(Sender: TObject);
begin
   changedisplaySettings(Tdevmode(zzz),0);
   close;
end;

end.

