unit game;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, MPlayer, math, Menus ,ked;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    MediaPlayer1: TMediaPlayer;
    playwert1: TPaintBox;
    playwert2: TPaintBox;
    Panel8: TPanel;
    Panel12: TPanel;
    Panel9: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Panel10: TPanel;
    Label22: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    MediaPlayer2: TMediaPlayer;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label23: TLabel;
    MediaPlayer3: TMediaPlayer;
    ScrollBar1: TScrollBar;
    Label24: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Malen;
    procedure Tastatur;
    procedure Berechne;
    procedure Anzeige;
    procedure Kolli;
    procedure Einstellung;
    procedure Spezial;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ssch2(spieler:byte);
    procedure ssch5(spieler:byte);
    procedure ssch9(spieler:byte);
    procedure ssch3(spieler:byte);
    procedure ssch7(spieler:byte);
    procedure ssch10(spieler:byte);
    procedure waffen;
    procedure waffgrav;
    procedure ssch12(spieler:byte);
    procedure ssch11(spieler:byte);
    procedure ssch6(spieler:byte);
    procedure ssch8(spieler:byte);
    procedure ssch4(spieler:byte);
    procedure ssch1(spieler:byte);
    Procedure Waffkolli(wkx,wky:extended);
    procedure Panel12Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Waffkord;
    procedure Torpedo(spieler:byte);
    procedure Beam(spieler:byte);
    procedure Musik;
    procedure KI;
    procedure Panel10Click(Sender: TObject);
    procedure Ende;
    procedure Ereignis;
    Procedure Init;
    procedure Panel11Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure beendClick(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel17Click(Sender: TObject);
    procedure kendeClick;
    procedure mendeClick(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
    procedure newmapClick(Sender: TObject);
    procedure loadmapClick(Sender: TObject);
    procedure savemapClick(Sender: TObject);
    procedure mapfgameClick(Sender: TObject);
    procedure sonneClick(Sender: TObject);
    procedure astroidenClick(Sender: TObject);
    procedure anomalieClick(Sender: TObject);
    procedure lochClick(Sender: TObject);
    procedure nebelClick(Sender: TObject);
    procedure raumschiffClick(Sender: TObject);
    procedure setposition(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mpnow(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure newtastClick;
    procedure keysaveClick;
    procedure orginalClick;
    procedure FKeyDown(Key:word);
  procedure pokClick;
    procedure ScrollBar1Change(Sender: TObject);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
 
  Ttasta = record
  ende,gpause:byte;
  gas,halt,links,rechts,laserf,torpf,spezein,spezaus,fmodus:array[1..2] of byte;
  end;

  Tlese = record
  msx,msy,manox,manoy,mwax,mway,mnx,mny:integer;
  mschiffsx,mschiffsy:array[1..2] of integer;
  mastx,masty:array[1..10] of integer;
  end;

var
devmode,dd,zz:TDevMode;
  d:integer;
  dc:hdc;
  scrx,scry,farb:integer;

  Form1: TForm1;
  fenster,keyhelp,mapedit:TForm;
  tastwert,korrdinat:TLabel;
  hilf:TMemo;
  setzen:byte;
  spielpause:boolean;
  tastdatei:file of Ttasta;
  tastlese,zwischtast:Ttasta;
  datei:file of Tlese;
  lese:Tlese;
  sgra:integer;
  auswahldat:string;
  pok,newtast,keysave,orginal,beend,kende,mende,newmap,savemap,loadmap,mapfgame,sonne,astroiden,anomalie,loch,nebel,raumschiff:TPanel;
  karte:Tpaintbox;
  msx,msy,manox,manoy,mwax,mway,mnx,mny,nxspeich,nyspeich,astronum,keyeingab:integer;
  mmschiffsx,mmschiffsy,mschiffsx,mschiffsy:array[1..2] of integer;
  mastx,masty:array[1..10] of integer;
 schirm:Tbitmap;
  a,j,g,t,h,b,es,ww,vv,m,ss,f:Tbitmap;
  shut:array[0..35] of TBitmap;
  bild:array[1..2,0..35] of TBitmap;
  torp:array[1..13] of Tbitmap;
  neb,mapship,mpuffer,mapneb,nova,load,explo,astr1,astr2,astr3,astr4,sun,wurm,ano,equinox,slip,sub,mine,power,globe,feind:Tbitmap;
  x,y,ax,ay,vx,vy:array[1..2] of extended;
  v,kurs,akurs:array[1..2] of shortint;
  schiff:array[1..2] of byte;
  noneb,nx,ny,i,e,sx,sy,wx1,wy1,wx2,wy2,akt,anox,anoy,gga,ggaz,wax,way,wag,other,kk,nt,u,iii,eee,anderer:integer;
  starx,stary,starax,staray:array[1..250] of integer;
  start,sund,rd,nc,run,two,ntwo,change,novao,pressstart:boolean;
  cd,sd:array[0..35] of extended;
  astx,asty:array[1..10] of integer;
  npx,npy,npc:array[1..1000] of integer;
  npe:array[1..1000] of boolean;
  schild,schilda:array[1..2] of integer;
  vis:array[1..2] of boolean;
  wander,ander,novazeit:integer;
  nxs,nys:array[1..1000] of integer;
  w:array[1..2] of integer;
  spez,slipexist:array[1..2] of boolean;
  ssch2check,sschaus,uberm,rauch,tarn,multi:array[1..2] of boolean;
  tarnzeit:array[1..2] of byte;
  espez:array[1..2] of extended;
  slipx,slipy,slipx2,slipy2,slipzeit:array[1..2] of integer;
  subx,asubx,asuby,suby,subvx,subvy:array[1..2]of extended;
  subzeit,subkurs:array[1..2] of integer;
  subexist:array[1..2]of boolean;
  wgx,wgy:extended;
   sdown:array[1..2] of boolean;
  mx,my,mvx,mvy:array[1..2,1..10] of extended;
  mexist:array[1..2,1..10] of boolean;
  mzeit,mtreff:array[1..2,1..10] of integer;
  mpos:array[1..2] of byte;
  aschil:array[1..2] of integer;
  sschil:array[1..2] of boolean;
  px,py,pvx,pvy:array[1..2] of extended;
  pexist,sperr:array[1..2] of boolean;
  pzeit,ptreff,pkurs:array[1..2] of integer;
  swx,swy:array[1..2] of extended;
  swkurs,swzeit:array[1..2] of integer;
  swexist,swtreff:array[1..2] of boolean;
  shutx,shuty:array[1..2] of extended;
  shutzeit,shutkurs,shutakurs,shutline:array[1..2] of integer;
  shutexist,shutld:array[1..2] of boolean;
  rx,ry:array[1..2,1..20]of integer;
  lx,ly:array[1..2,1..3] of extended;
  lzeit,ltreff,lkurs,lakurs:array[1..2,1..3] of integer;
  lexist:array[1..2,1..3] of boolean;
  lpos:array[1..2] of byte;
  alpha,aaa,bbb: extended;
  kkurs,uu,warten,abcde:integer;
  wktreff,schwa,musikstart:boolean;
  tx,ty,tvx,tvy:array[1..2,1..10] of extended;
  texist:array[1..2,1..10] of boolean;
  tzeit,tkurs,tpower,tv,tlade:array[1..2,1..10] of integer;
  tfeuer,lfeuer:array[1..2] of boolean;
  feuermode,fmt:array[1..2] of byte;
  spezon,nebon,sunon,astroon,anoon,lochon,wormon,eveon,computer:boolean;
  wpostx,wposty,wposlx,wposly:array[1..2,1..10] of integer;
  tpos,bpos,bmax:array[1..2] of byte;
  bx,by,bax,bay:array[1..2,1..10] of extended;
  bexist:array[1..2,1..10] of boolean;
  bzeit,bkurs,bpower,bv,blade:array[1..2,1..10] of integer;
  tbreit:array[1..12] of integer;
  bfarb:array[1..12] of tcolor;
  zx,zy:extended;
  danger:boolean;
  bumm:array[1..2] of boolean;
  bummzeit:array[1..2] of integer;
  fx,fy,fvx,fvy:extended;
  fkurs,fakurs,fzeit,fschild:integer;
  fe:array[1..2] of integer;
  fsch:array[1..10] of boolean;
  fsx,fsy,fsvx,fsvy:array[1..10] of extended;
  fszeit,fskurs:array[1..10] of integer;
  asthx,asthy,asthvx,asthvy:array[1..5] of extended;
  asthexist,astsd:array[1..5] of boolean;
  astlos,neuint:boolean;
  fexplo:integer;
  punkte,treffdick:array[1..2] of Integer;



implementation

{$R *.DFM}






procedure TForm1.FormCreate(Sender: TObject);
begin

dc:=getdc(0);
farb:=1 shl getdevicecaps(dc, Bitspixel);
releaseDC(0,dc);
scrx:=screen.width;
scry:=screen.height;


devmode.dmsize:=Sizeof(TDevmode);
devmode.dmdriverextra:=0;
d:=0;


while EnumDisplaySettings(nil,d,devmode)  do

begin

inc(d);
if (devmode.dmpelswidth=800) and (devmode.dmpelsheight=600) and ((1 shl devmode.dmbitsperpel)=65536)
then
begin
dd:=devmode;
end;

if (devmode.dmpelswidth=scrx) and (devmode.dmpelsheight=scry) and ((1 shl devmode.dmbitsperpel)=farb)
then
begin
zz:=devmode;
end;

end;

  changedisplaySettings(Tdevmode(dd),0);





neuint:=false;
sgra:=2500;
                     spielpause:=false;
  {Ttasta = record
  ende,gpause:byte;
  gas,halt,links,rechts,laserf,torpf,spezein,spezaus,fmodus:array[1..2] of byte;
  end;               }

      {
tastlese.ende:=27;
tastlese.gpause:=19;

tastlese.gas[1]:=87;
tastlese.halt[1]:=83;
tastlese.links[1]:=65;
tastlese.rechts[1]:=68;
tastlese.laserf[1]:=81;
tastlese.torpf[1]:=69;
tastlese.spezein[1]:=67;
tastlese.spezaus[1]:=88;
tastlese.fmodus[1]:=70;

tastlese.gas[2]:=38;
tastlese.halt[2]:=40;
tastlese.links[2]:=37;
tastlese.rechts[2]:=39;
tastlese.laserf[2]:=17;
tastlese.torpf[2]:=16;
tastlese.spezein[2]:=96;
tastlese.spezaus[2]:=97;
tastlese.fmodus[2]:=98;
              }
assignfile(tastdatei,'key.cfg');
reset(tastdatei);
read(tastdatei,tastlese);
closefile(tastdatei);

      {
MediaPlayer1.FileName :='sounds/objectsound.wav';
MediaPlayer1.DeviceType:=dtWaveAudio;
Mediaplayer1.Open;
                       }
MediaPlayer1.FileName :='sounds/beep.wav';
MediaPlayer1.DeviceType:=dtWaveAudio;
Mediaplayer1.Open;

MediaPlayer2.FileName :='sounds/bg.mid';
MediaPlayer2.DeviceType:=dtAutoSelect;
Mediaplayer2.Open;       

MediaPlayer3.FileName :='sounds/beam.wav';
MediaPlayer3.DeviceType:=dtWaveAudio;
Mediaplayer3.Open;



for i:=1 to 5 do
begin
astsd[i]:=false;
asthexist[i]:=false;
asthx[i]:=-10;
asthy[i]:=-10;
end;
fx:=0;
fy:=0;

fkurs:=0;
fakurs:=0;
fvx:=0;
fvy:=0;
fzeit:=0;
fexplo:=0;

for i:=1 to 10 do
begin
fsch[i]:=false;
fsx[i]:=0;
fsy[i]:=0;
fskurs[i]:=0;
fszeit[i]:=0;
end;



schirm:=Tbitmap.create;
schirm.width:=750;
schirm.height:=600;

    warten:=-1;
musikstart:=true;
start:=false;
     run:=false;
     randomize;
     change:=false;
     computer:=false;
     spezon:=true;
     nebon:=true;
     sunon:=true;
     astroon:=true;
     anoon:=true;
     lochon:=true;
     wormon:=true;
     eveon:=true;
     novao:=false;
     novazeit:=0;
     nt:=1;
     noneb:=0;
     bfarb[1]:=clred;
     bfarb[2]:=claqua;
     bfarb[3]:=clyellow;
     bfarb[4]:=clred;
     bfarb[5]:=clpurple;
     bfarb[6]:=cllime;
     bfarb[7]:=clblue;
     bfarb[8]:=cllime;
     bfarb[9]:=cllime;
     bfarb[10]:=clyellow;
     bfarb[11]:=clblue;
     bfarb[12]:=clred;

      for i:=1 to 2 do
      begin
      punkte[i]:=0;
      tfeuer[i]:=false;
                   bumm[i]:=false;
      lfeuer[i]:=false;
      feuermode[i]:=1;
      fmt[i]:=0;
      lpos[i]:=1;
      bpos[i]:=1;
      bummzeit[i]:=0;
      For e:=1 to 3 do
     begin
       lx[i,e]:=0;
       ly[i,e]:=0;
  lzeit[i,e]:=0;
  ltreff[i,e]:=0;
  lkurs[i,e]:=0;
    lexist[i,e]:=false;
       end;
       for e:=1 to 10 do
       begin
       tlade[i,e]:=200-(10*(e+5));
       texist[i,e]:=false;
       blade[i,e]:=e*5;
       bexist[i,e]:=false;
       bx[i,e]:=0;
       bax[i,e]:=0;

       by[i,e]:=0;
       bay[i,e]:=0;

       end;
           tpos[i]:=1;
      shutzeit[i]:=0;
      shutexist[i]:=false;
      shutx[i]:=0;
      shuty[i]:=0;
      shutkurs[i]:=0;
      swx[i]:=0;
      shutld[i]:=false;
      swy[i]:=0;
      swkurs[i]:=0;
      swzeit[i]:=0;
      swexist[i]:=false;
      subx[i]:=0;
      swtreff[i]:=false;
      suby[i]:=0;
      pkurs[i]:=0;
      subzeit[i]:=0;
      sperr[i]:=false;
      subkurs[i]:=0;
      subexist[i]:=false;
     ssch2check[i]:=false;
            tarn[i]:=false;
       sschaus[i]:=false;
       uberm[i]:=false;
             rauch[i]:=false;
             tarnzeit[i]:=0;
           espez[i]:=150;
           slipx[i]:=0;
           slipy[i]:=0;
           slipx2[i]:=0;
           slipy2[i]:=0;
           slipexist[i]:=false;
           slipzeit[i]:=0;
           mpos[i]:=1;
           aschil[i]:=0;
           sschil[i]:=false;
           px[i]:=0;
           py[i]:=0;
           pexist[i]:=false;
           pzeit[i]:=0;
           ptreff[i]:=0;
           For e:=1 to 10 do
           begin
           my[i,e]:=0;
           mx[i,e]:=0;
           mzeit[i,e]:=0;
           mexist[i,e]:=false;
           mtreff[i,e]:=0;
           end;

     end;

      two:=false;
      ntwo:=false;

 wag:=550;
for i:=0 to 255 do
if getasynckeystate(i)<>0
then
e:=0;

      akt:=0;

For i:=0 to 35 do
begin
cd[i]:=cos(i*PI/18);
sd[i]:=sin(i*PI/18);
end;


for i:=1 to 250 do
begin
starx[i]:=random(750);
stary[i]:=random(600);
end;
 x[1]:=100;
 y[1]:=300;
 kurs[1]:=9;

 x[2]:=650;
 y[2]:=300;
 kurs[2]:=27;
 v[2]:=0;
  v[1]:=0;
   i:=0;

 j:=Tbitmap.create;

 j.loadfromfile('ships/j'+(inttostr(i*10))+'.bmp');
 j.Transparent:=true;
 j.TransParentColor:= j.canvas.pixels[0,0];
j.TransparentMode := tmAuto;





 a:=Tbitmap.create;

 a.loadfromfile('ships/a'+(inttostr(i*10))+'.bmp');
   a.Transparent:=true;
 a.TransParentColor:= a.canvas.pixels[0,0];
a.TransparentMode := tmAuto;







 g:=Tbitmap.create;

 g.loadfromfile('ships/g'+(inttostr(i*10))+'.bmp');
  g.Transparent:=true;
 g.TransParentColor:= g.canvas.pixels[0,0];
g.TransparentMode := tmAuto;

 t:=Tbitmap.create;

 t.loadfromfile('ships/t'+(inttostr(i*10))+'.bmp');
  t.Transparent:=true;
 t.TransParentColor:= t.canvas.pixels[0,0];
t.TransparentMode := tmAuto;


h:=Tbitmap.create;

h.loadfromfile('ships/h'+(inttostr(i*10))+'.bmp');
 h.Transparent:=true;
h.TransParentColor:= h.canvas.pixels[0,0];
h.TransparentMode := tmAuto;



 b:=Tbitmap.create;

 b.loadfromfile('ships/b'+(inttostr(i*10))+'.bmp');
b.Transparent:=true;
 b.TransParentColor:= b.canvas.pixels[0,0];
b.TransparentMode := tmAuto;



 es:=Tbitmap.create;

 es.loadfromfile('ships/e'+(inttostr(i*10))+'.bmp');
es.Transparent:=true;
 es.TransParentColor:= es.canvas.pixels[0,0];
es.TransparentMode := tmAuto;




 ww:=Tbitmap.create;

 ww.loadfromfile('ships/w'+(inttostr(i*10))+'.bmp');
ww.Transparent:=true;
ww.TransParentColor:= ww.canvas.pixels[0,0];
ww.TransparentMode := tmAuto;


  vv:=Tbitmap.create;

vv.loadfromfile('ships/v'+(inttostr(i*10))+'.bmp');
vv.Transparent:=true;
vv.TransParentColor:= vv.canvas.pixels[0,0];
vv.TransparentMode := tmAuto;




m:=Tbitmap.create;

m.loadfromfile('ships/m'+(inttostr(i*10))+'.bmp');
m.Transparent:=true;
m.TransParentColor:= m.canvas.pixels[0,0];
m.TransparentMode := tmAuto;


ss:=Tbitmap.create;

ss.loadfromfile('ships/s'+(inttostr(i*10))+'.bmp');
ss.Transparent:=true;
ss.TransParentColor:= ss.canvas.pixels[0,0];
ss.TransparentMode := tmAuto;


f:=Tbitmap.create;

f.loadfromfile('ships/f'+(inttostr(i*10))+'.bmp');
f.Transparent:=true;
f.TransParentColor:= f.canvas.pixels[0,0];
f.TransparentMode := tmAuto;


for i:=1 to 13 do
torp[i]:=Tbitmap.create;

torp[1].loadfromfile('weapons/photonentorp.bmp');
tbreit[1]:=1;
torp[2].loadfromfile('weapons/polarontorp.bmp');
tbreit[2]:=3;
torp[3].loadfromfile('weapons/naquadatorp.bmp');
tbreit[3]:=2;
torp[4].loadfromfile('weapons/microtorp.bmp');
tbreit[4]:=1;
torp[5].loadfromfile('weapons/microtorp.bmp');
tbreit[5]:=1;
torp[6].loadfromfile('weapons/speedtorp.bmp');
tbreit[6]:=1;
torp[7].loadfromfile('weapons/speedtorp.bmp');
tbreit[7]:=1;
torp[8].loadfromfile('weapons/plasmatorp.bmp');
tbreit[8]:=2;
torp[9].loadfromfile('weapons/polarontorp.bmp');
tbreit[9]:=3;
torp[10].loadfromfile('weapons/photonentorp.bmp');
tbreit[10]:=1;
torp[11].loadfromfile('weapons/plasmatorp.bmp');
tbreit[11]:=2;
torp[12].loadfromfile('weapons/quantentorp.bmp');
tbreit[12]:=1;
torp[13].loadfromfile('weapons/enemytorp.bmp');


nova:=Tbitmap.create;
nova.LoadFromFile('objects/nova.bmp');
nova.Transparent:=true;
nova.TransParentColor:=clBlack;
nova.TransparentMode := tmAuto;

feind:=Tbitmap.create;
feind.LoadFromFile('objects/enemy.bmp');
feind.Transparent:=true;
feind.TransParentColor:=clBlack;
feind.TransparentMode := tmAuto;

explo:=Tbitmap.create;
explo.LoadFromFile('weapons/explosion.bmp');
explo.Transparent:=true;
explo.TransParentColor:=clBlack;
explo.TransparentMode := tmAuto;

load:=Tbitmap.create;
load.LoadFromFile('loading.bmp');

globe:=Tbitmap.create;
globe.loadfromfile('weapons/globe.bmp');
globe.Transparent:=true;
globe.TransParentColor:=globe.canvas.pixels[0,0];
globe.TransparentMode := tmAuto;


power:=Tbitmap.create;
power.loadfromfile('weapons/powerdown.bmp');
power.Transparent:=true;
power.TransParentColor:=power.canvas.pixels[0,0];
power.TransparentMode := tmAuto;


slip:=Tbitmap.create;
slip.loadfromfile('weapons/slipstream.bmp');
slip.Transparent:=true;
slip.TransParentColor:= slip.canvas.pixels[0,0];
slip.TransparentMode := tmAuto;



sub:=Tbitmap.create;
sub.loadfromfile('weapons/subspace.bmp');
sub.Transparent:=true;
sub.TransParentColor:= sub.canvas.pixels[0,0];
sub.TransparentMode := tmAuto;

for i:=0 to 35 do
begin
shut[i]:=Tbitmap.create;
shut[i].loadfromfile('weapons/s'+(inttostr(i*10))+'.bmp');
shut[i].Transparent:=true;
shut[i].TransParentColor:= shut[i].canvas.pixels[0,0];
shut[i].TransparentMode := tmAuto;
end;

mine:=Tbitmap.create;
mine.loadfromfile('weapons/mine.bmp');


   equinox:=Tbitmap.create;
equinox.loadfromfile('EquinoxOmega.bmp');


    astr1:=Tbitmap.create;
astr1.loadfromfile('objects/astroid1.bmp');
astr1.Transparent:=true;
astr1.TransParentColor:= astr1.canvas.pixels[0,0];
astr1.TransparentMode := tmAuto;


astr2:=Tbitmap.create;
astr2.loadfromfile('objects/astroid2.bmp');
astr2.Transparent:=true;
astr2.TransParentColor:= astr2.canvas.pixels[0,0];
astr2.TransparentMode := tmAuto;

astr3:=Tbitmap.create;
astr3.loadfromfile('objects/astroid3.bmp');
astr3.Transparent:=true;
astr3.TransParentColor:= astr3.canvas.pixels[0,0];
astr3.TransparentMode := tmAuto;

astr4:=Tbitmap.create;
astr4.loadfromfile('objects/astroid4.bmp');
astr4.Transparent:=true;
astr4.TransParentColor:= astr4.canvas.pixels[0,0];
astr4.TransparentMode := tmAuto;

     sund:=true;

sun:=Tbitmap.create;
sun.loadfromfile('objects/sun.bmp');
sun.Transparent:=true;
sun.TransParentColor:= sun.canvas.pixels[0,0];
sun.TransparentMode := tmAuto;

wurm:=Tbitmap.create;
wurm.loadfromfile('objects/wormhole.bmp');
wurm.Transparent:=true;
wurm.TransParentColor:= wurm.canvas.pixels[0,0];
wurm.TransparentMode := tmAuto;




ano:=Tbitmap.create;
ano.loadfromfile('objects/anomalie.bmp');
ano.Transparent:=true;
ano.TransParentColor:= ano.canvas.pixels[0,0];
ano.TransparentMode := tmAuto;



for i:=1 to 2 do
begin
vx[i]:=0;
vy[i]:=0;
end;

 Schiff[1]:=0;
 Schiff[2]:=0;

        ggaz:=0;


  anox:=100;
  anoy:=100;

  wx1:=250;
  wy1:=100 ;
  wx2:=700  ;
  wy2:=500   ;


  wax:=375;
way:=300;

  For i:=1 to 10 do
  begin


  astx[i]:=400+random(200);
  asty[i]:=400+random(200);

  end;

 sx:=500;


 sy:=200;














for i:=1 to 2 do
begin
schild[i]:=500;
vis[i]:=true;

end;

  nx:=100;
  ny:=400;





  
   For i:=1 to 1000 do

 begin
nx:=nx+random(5)-2;
ny:=ny+random(5)-2;
npx[i]:=nx+random(51)+sqr(random(10));
npy[i]:=ny+random(51)+sqr(random(10));
npc[i]:=100000000*Random(10);
npe[i]:=true;
nxs[i]:=nx;
nys[i]:=ny;
 end;
       spez[1]:=false;
       spez[2]:=false;

neb:=Tbitmap.create;
neb.height:=400;
neb.width:=400;
neb.Transparent:=true;
neb.TransParentColor:= clBlack;
neb.TransparentMode := tmAuto;
 
   schiff[1]:=0;
   schiff[2]:=0;
   schwa:=true;
   for i:=1 to 2 do
   begin
   mmschiffsx[i]:=round(x[i]);
   mmschiffsy[i]:=round(y[i]);
 end;

 end;











  procedure TForm1.Einstellung;
  begin

  if neuint=true
  then
  neuint:=false;

  if run=false
  then
  begin

  if schwa=true
  then
  begin
   canvas.Pen.color:=clBlack    ;
  canvas.fillrect(Rect(40,40,600,100));
  canvas.fillrect(Rect(30,190,600,250));
   canvas.pen.color:=clAqua   ;
canvas.pen.width:=2;

if schiff[2]<7
then
canvas.Rectangle((43+((schiff[2]-1)*100)),43,(97+((schiff[2]-1)*100)),97)
else
canvas.Rectangle((43+((schiff[2]-7)*100)),193,(97+((schiff[2]-7)*100)),247) ;

canvas.Pen.color:=clYellow    ;

if schiff[1]<7
then
canvas.Rectangle((45+((schiff[1]-1)*100)),45,(95+((schiff[1]-1)*100)),95)
else
canvas.Rectangle((45+((schiff[1]-7)*100)),195,(95+((schiff[1]-7)*100)),245) ;


canvas.Pen.width:=1;
canvas.Pen.color:=clBlack    ;
  canvas.draw(50,50,a);
  canvas.draw(150,50,j);
  canvas.draw(250,50,g);        
  canvas.draw(350,50,t);
  canvas.draw(450,50,h);
  canvas.draw(550,50,b);

  canvas.draw(30,185,es);
  canvas.draw(135,185,ww);
    canvas.draw(240,200,vv);
  canvas.draw(350,200,m);
    canvas.draw(445,190,ss);
      canvas.draw(540,190,f);

  canvas.draw(300,390,equinox);
  end;

  end;
  
if (pressstart=true) and (run=false) and(schiff[1]<>0)and(schiff[2]<>0)
then
begin
pressstart:=false;
run:=true;
canvas.brush.color:=clblack;
canvas.fillrect(Rect(0,0,750,600));
    canvas.draw(350,300,load);
    label24.caption:='';
Label9.caption:='';
Label10.caption:='';
Label11.caption:='';
Label12.caption:='';
Label13.caption:='';
Label14.caption:='';
Label15.caption:='';
Label16.caption:='';
Label17.caption:='';
Label18.caption:='';
Label19.caption:='';
Label20.caption:='';
Label23.caption:='';

sund:=true;
   {
Panel3.Caption:='';
Panel4.caption:='';
Panel5.caption:='';
Panel6.Caption:='';
panel7.Caption:='';
Panel8.Caption:='';
panel9.Caption:='';
panel10.Caption:='';
Panel12.Caption:='';      }

Panel3.Visible:=false;
Panel4.Visible:=false;
Panel5.Visible:=false;
Panel6.Visible:=false;
Panel7.Visible:=false;
Panel8.Visible:=false;
panel9.Visible:=false;
panel10.Visible:=false;
Panel11.Visible:=false;
Panel12.Visible:=false;
Panel13.Visible:=false;
Panel14.Visible:=false;
Panel15.Visible:=false;
Panel16.Visible:=false;
Panel17.Visible:=false;


For i:=0 to 255 do
if getasynckeystate(i)<>0
then
run:=true;

waffkord;


  For i:=1 to 2 do
   Case schiff[i] of
   1: begin  w[i]:=17;
       treffdick[i]:=11;

   end;
   2: begin w[i]:=17;
         treffdick[i]:=13;
   end;
     3: begin w[i]:=20;
          treffdick[i]:=15;
    end;
     4:begin w[i]:=12;
          treffdick[i]:=7;
     end;
     5: begin w[i]:=12;
          treffdick[i]:=9;
     end;
     6: begin w[i]:=15;
         treffdick[i]:=11;
     end;
     7: begin w[i]:=35;
         treffdick[i]:=19;
    end;
     8: begin w[i]:=35;
         treffdick[i]:=22;
    end;
     9: begin w[i]:=20;
         treffdick[i]:=14;
    end;
     10: begin w[i]:=15;
        treffdick[i]:=10;
   end;
     11: begin w[i]:=25;
        treffdick[i]:=16;
    end;
     12: begin w[i]:=25;
        treffdick[i]:=14;
   end;
  end;



  For u:=1 to 2 do
 for i:=0 to 35 do   begin

  if (schiff[u]=2)
 then
 begin
 bild[u,i]:=Tbitmap.create;

 bild[u,i].loadfromfile('ships/j'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;

  end;

  if (schiff[u]=1)
 then
 begin

 bild[u,i]:=Tbitmap.create;

 bild[u,i].loadfromfile('ships/a'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;


  end;




   if (schiff[u]=3)
 then
 begin
 bild[u,i]:=Tbitmap.create;

 bild[u,i].loadfromfile('ships/g'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;


 end;
 if (schiff[u]=4)
 then
 begin
 bild[u,i]:=Tbitmap.create;

 bild[u,i].loadfromfile('ships/t'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
          end;

   if (schiff[u]=5)
 then
 begin
 bild[u,i]:=Tbitmap.create;

 bild[u,i].loadfromfile('ships/h'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
     end;

  if (schiff[u]=6)
 then
 begin
 bild[u,i]:=Tbitmap.create;

 bild[u,i].loadfromfile('ships/b'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
  end;

  if (schiff[u]=7)
 then
 begin
 bild[u,i]:=Tbitmap.create;

 bild[u,i].loadfromfile('ships/e'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
 end;

 if (schiff[u]=8)
 then
 begin
 bild[u,i]:=Tbitmap.create;
 bild[u,i].loadfromfile('ships/w'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
   end;


    if (schiff[u]=9)
 then
 begin                                                                
 bild[u,i]:=Tbitmap.create;
 bild[u,i].loadfromfile('ships/v'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
   end;

                                                                             

    if (schiff[u]=10)   
 then
 begin
 bild[u,i]:=Tbitmap.create;
 bild[u,i].loadfromfile('ships/m'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
   end;



    if (schiff[u]=11)
 then
 begin
 bild[u,i]:=Tbitmap.create;
 bild[u,i].loadfromfile('ships/s'+(inttostr(i*10))+'.bmp');     
 bild[u,i].Transparent:=true;
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
   end;



    if (schiff[u]=12)
 then
 begin
 bild[u,i]:=Tbitmap.create;
 bild[u,i].loadfromfile('ships/f'+(inttostr(i*10))+'.bmp');
 bild[u,i].Transparent:=true;      
 bild[u,i].TransParentColor:=  bild[u,i].canvas.pixels[0,0];
 bild[u,i].TransparentMode := tmAuto;
   end;



 end;
       {
MediaPlayer2.FileName :='sounds/shipsound.wav';
MediaPlayer2.DeviceType:=dtWaveAudio;
Mediaplayer2.Open;    }

 for i:=1 to 2 do
 begin

x[i]:=mmschiffsx[i];
y[i]:=mmschiffsy[i];
  end;

 nxspeich:=nx;
 nyspeich:=ny;

  For e:=1 to 1000 do
 begin
nx:=nx+random(5)-2;
ny:=ny+random(5)-2;
npx[e]:=nx+random(51)+sqr(random(10));
npy[e]:=ny+random(51)+sqr(random(10));
npc[e]:=100000000*Random(10);
npe[e]:=true;
nxs[e]:=nx;
nys[e]:=ny;
 end;

 nx:=nxspeich;
 ny:=nyspeich;

  MediaPlayer1.FileName :='sounds/torp.wav';
MediaPlayer1.DeviceType:=dtWaveAudio;
Mediaplayer1.Open;


canvas.brush.color:=clblack;
canvas.fillrect(Rect(0,0,750,600));
   {
for i:=1 to 2 do
for e:=0 to 35 do
begin

for u:=0 to ubermal[i,e].width do
for uu:=0 to ubermal[i,e].height do
if ubermal[i,e].canvas.pixels[u,uu]=clblack
then
ubermal[i,e].canvas.pixels[u,uu]:=clwhite;

for u:=0 to ubermal[i,e].width do
for uu:=0 to ubermal[i,e].height do
if ubermal[i,e].canvas.pixels[u,uu]<>clwhite
then
ubermal[i,e].canvas.pixels[u,uu]:=clblack;

ubermal[i,e].Transparent:=true;
ubermal[i,e].TransParentColor:=clwhite;
ubermal[i,e].TransparentMode :=tmAuto;
end;     }


end;



schwa:=false;
  end;



 procedure TForm1.Malen;
 begin


 schirm.canvas.Brush.color:=clblack;
 schirm.canvas.pen.color:=clblack;
 schirm.canvas.FillRect(rect(0,0,750,600));

for i:=1 to 2 do
begin

 vis[i]:=true;

 if nebon=true
 then
for e:=1 to 1000 do
if npe[e]=true
then
if sqr(nxs[e]+70-x[i])+sqr(nys[e]+70-y[i])<1000
then
vis[i]:=false ;


    if tarn[i]=true
    then
    begin
    vis[i]:=false;
    tarn[i]:=false;
    end;
       if i=1
       then
       ander:=2;

     if i=2
     then
     ander:=1;


     if bummzeit[i]>1
     then
     vis[i]:=false;



 end;




if eveon=true
then
if novao=true
then
begin
inc(novazeit);
sgra:=15000;
sund:=true;
schirm.canvas.stretchdraw(rect(sx-novazeit,sy-novazeit,sx+novazeit,sy+novazeit),nova);
end;


       if wormon=true
       then
      if ((sqr(wx1-x[1])+sqr(wy1-y[1])<1500)  or (sqr(wx1-x[2])+sqr(wy1-y[2])<1500) or (sqr(wx2-x[1])+sqr(wy2-y[1])<1500)  or (sqr(wx2-x[2])+sqr(wy2-y[2])<1500)) and (akt<>19)
     then
     begin
     schirm.canvas.draw(wx1-13,wy1-13,wurm);
     schirm.canvas.draw(wx2-13,wy2-13,wurm);
 end;

for i:=1 to 5 do
if asthexist[i]=true
then
schirm.canvas.draw(round(asthx[i]-7),round(asthy[i]-7),astr4);



  For i:=1 to 2 do
  begin
              if i=1
       then
       ander:=2;

     if i=2
     then
     ander:=1;



for e:=1 to 10 do
begin



if (bzeit[i,e]<49) and (bexist[i,e]=true)
then
begin
schirm.canvas.pen.color:=bfarb[schiff[i]];
schirm.canvas.pen.width:=1;
schirm.canvas.moveto(round(bx[i,e]),round(by[i,e]));
schirm.canvas.lineto(round(bax[i,e]),round(bay[i,e]));

end;


if bzeit[i,e]=49
then
begin
bzeit[i,e]:=200;
bexist[i,e]:=false;
sund:=true;
bx[i,e]:=0;
by[i,e]:=0;
bax[i,e]:=0;
bay[i,e]:=0;

end;

      end;







for e:=1 to 10 do
begin
if tzeit[i,e]=99
then
begin
tzeit[i,e]:=200;
texist[i,e]:=false;
tx[i,e]:=0;
ty[i,e]:=0;
end;


if texist[i,e]=true
then
begin
schirm.canvas.draw(round(tx[i,e]-tbreit[schiff[i]]),round(ty[i,e]-tbreit[schiff[i]]),torp[schiff[i]]);
end;
      end;

       for e:=1 to 3 do
     if (lexist[i,e]=true) or (ltreff[i,e]>0) or (lzeit[i,e]=149)
     then
     begin




     if ltreff[i,e]=9
     then
     begin
         lx[i,e]:=0;
ly[i,e]:=0;

       end;
       end;




  if (shutexist[i]=true) or   (shutzeit[i]=249)
  then
  begin
   if (shutzeit[i]=249)
  then
  begin
  shutx[i]:=0;
  shuty[i]:=0;
  shutzeit[i]:=1000;
  shutexist[i]:=false;
  end;
  end;








 if swexist[i]=true
 then
for e:=1 to 10 do
begin
schirm.canvas.pen.color:=random(100000);
rx[i,e]:=random(10)-5;
ry[i,e]:=random(10)-5;
rx[i,e+10]:=random(10)-5;
ry[i,e+10]:=random(10)-5;
schirm.canvas.moveto(round(swx[i]-(cd[swkurs[i]]*20)+rx[i,e]),round(swy[i]-(sd[swkurs[i]]*20)+ry[i,e]));
schirm.canvas.lineto(round(swx[i]+(cd[swkurs[i]]*20)+rx[i,e+10]),round(swy[i]+(sd[swkurs[i]]*20)+ry[i,e+10]));
     end;



 if swzeit[i]=124
  then
  begin
  swzeit[i]:=150;
  end;


  if pexist[i]=true
  then
  begin
 schirm.canvas.draw(round(px[i]-5),round(py[i]-5),power);

end;

  if pzeit[i]=99
  then
  begin
      pzeit[i]:=150;

   px[i]:=0;
py[i]:=0;

  end;


   if (sschil[i]=true) and (vis[i]=true)
  then
  begin
  schirm.canvas.Brush.color:=clblack;
  schirm.canvas.Pen.color:=claqua;
  schirm.canvas.Pen.width:=2;
  schirm.canvas.ellipse(round(x[i])-23,round(y[i])-23,round(x[i])+24,round(y[i])+24);
  schirm.canvas.Pen.width:=1;
  end;



  For e:=1 to 10 do
  begin
  if mexist[i,e]=true
  then
  begin


schirm.canvas.draw(round(mx[i,e]-2),round(my[i,e]-2),mine);
 end;
if mzeit[i,e]=199
then
begin
mzeit[i,e]:=300;
end;



  if (mtreff[i,e]>0) and (mtreff[i,e]<10)
  then
  begin
  schirm.canvas.pen.color:=clblack;
  schirm.canvas.brush.color:=clred;
  schirm.canvas.ellipse(round(mx[i,e]-mtreff[i,e]/2),round(my[i,e]-mtreff[i,e]/2),round(mx[i,e]+mtreff[i,e]/2),round(my[i,e]+mtreff[i,e]/2));

  if mtreff[i,e]=9
  then
  begin
  schirm.canvas.pen.color:=clblack;
  schirm.canvas.brush.color:=clblack;
  schirm.canvas.fillrect(rect(round(mx[i,e]-5),round(my[i,e]-5),round(mx[i,e]+6),round(my[i,e]+6)));
  sund:=true;
 mx[i,e]:=0;
my[i,e]:=0;

mtreff[i,e]:=100;
  end;
  end;

  end;




  if (slipzeit[i]<49) and (slipzeit[i]>0)
  then
  begin
  schirm.canvas.draw(slipx[i]-10,slipy[i]-10,slip);
  schirm.canvas.draw(slipx2[i]-10,slipy2[i]-10,slip);
  if slipzeit[i]=48
  then
  begin
  slipzeit[i]:=100;
  slipexist[i]:=false;
  end;
  end;


  if (rauch[i]=true) and (vis[i]=true)
  then
  begin
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11)),round(y[i]+(cd[kurs[i]]*11))]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))+random(5),round(y[i]+(cd[kurs[i]]*11))+random(5)]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))+random(5),round(y[i]+(cd[kurs[i]]*11))-random(5)]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))-random(5),round(y[i]+(cd[kurs[i]]*11))+random(5)]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))-random(5),round(y[i]+(cd[kurs[i]]*11))-random(5)]:=clred;
  schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11)),round(y[i]+(cd[kurs[i]]*11))]:=clyellow;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))+random(5),round(y[i]+(cd[kurs[i]]*11))+random(5)]:=clyellow;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))+random(5),round(y[i]+(cd[kurs[i]]*11))-random(5)]:=clyellow;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))-random(5),round(y[i]+(cd[kurs[i]]*11))+random(5)]:=clyellow;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))-random(5),round(y[i]+(cd[kurs[i]]*11))-random(5)]:=clyellow;
schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11)),round(y[i]+(cd[kurs[i]]*11))]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))+random(5),round(y[i]+(cd[kurs[i]]*11))+random(5)]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))+random(5),round(y[i]+(cd[kurs[i]]*11))-random(5)]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))-random(5),round(y[i]+(cd[kurs[i]]*11))+random(5)]:=clred;
 schirm.canvas.Pixels[round(x[i]+(sd[kurs[i]]*-11))-random(5),round(y[i]+(cd[kurs[i]]*11))-random(5)]:=clred;


  rauch[i]:=false;
  end;



     if ssch2check[i]=true
     then
      begin

       if i=1
       then
       ander:=2;

     if i=2
     then
     ander:=1;

      schirm.canvas.pen.color:=cllime;
       schirm.canvas.pen.width:=1;
       schirm.canvas.moveto(round(x[i]),round(y[i]));
       schirm.canvas.LineTo(round(x[ander]),round(y[ander]));
       for abcde:=1 to 5 do
       begin
       schirm.canvas.moveto(round(x[i]),round(y[i]));
       schirm.canvas.LineTo(round(x[ander]+random(17)-8),round(y[ander]+random(17)-8));
    
       {schirm.canvas.moveto(round(x[i]),round(y[i]));
       schirm.canvas.LineTo(round(x[ander]+5),round(y[ander]+5));
       schirm.canvas.moveto(round(x[i]),round(y[i]));
       schirm.canvas.LineTo(round(x[ander]-5),round(y[ander]-5));
       schirm.canvas.moveto(round(x[i]),round(y[i]));
       schirm.canvas.LineTo(round(x[ander]+5),round(y[ander]-5));
        schirm.canvas.moveto(round(x[i]),round(y[i]));
      schirm.canvas.LineTo(round(x[ander]-5),round(y[ander]+5));  }
       end;

      ssch2check[i]:=false;
     end;
     end;


     For i:=1 to 2 do
  begin

   Case schiff[i] of
   1:   if vis[i]=true then
    schirm.canvas.draw(round(x[i])-17,round(y[i])-17,bild[i,kurs[i]]);
   2:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-17,round(y[i])-17,bild[i,kurs[i]]);
     3:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-20,round(y[i])-20,bild[i,kurs[i]]);
    4:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-12,round(y[i])-12,bild[i,kurs[i]]);
     5:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-12,round(y[i])-12,bild[i,kurs[i]]);
         6:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-15,round(y[i])-15,bild[i,kurs[i]]);
           7:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-35,round(y[i])-35,bild[i,kurs[i]]);
              8:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-35,round(y[i])-35,bild[i,kurs[i]]);
    9:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-20,round(y[i])-20,bild[i,kurs[i]]);
        10:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-15,round(y[i])-15,bild[i,kurs[i]]);
            11:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-25,round(y[i])-25,bild[i,kurs[i]]);
          12:  if vis[i]=true then
    schirm.canvas.draw(round(x[i])-25,round(y[i])-25,bild[i,kurs[i]]);
                                            


  end;

      if i=1
       then
       ander:=2;

     if i=2
     then
     ander:=1;

  if (tarnzeit[i]<>0) and (tarnzeit[i]<>30)
  then
  begin
  for e:=1 to (tarnzeit[i]*20) do
  begin
  schirm.canvas.pixels[round(x[i]+random(20)),round(y[i]+random(20))]:=clBlack;
    schirm.canvas.pixels[round(x[i]-random(20)),round(y[i]+random(20))]:=clBlack;
      schirm.canvas.pixels[round(x[i]+random(20)),round(y[i]-random(20))]:=clBlack;
        schirm.canvas.pixels[round(x[i]-random(20)),round(y[i]-random(20))]:=clBlack;
  end;
   inc(tarnzeit[i])   ;
  end;

   if (spez[i]=false) and (tarnzeit[i]=30)
  then
  begin
  tarnzeit[i]:=29;
    end;
  if (spez[i]=false)  and (tarnzeit[i]<>0)
  then
  begin

   dec(tarnzeit[i])   ;
   dec(tarnzeit[i])   ;
    if tarnzeit[i]<2
   then
   tarnzeit[i]:=0;
  end;



  end;

  For i:=1 to 10 do
  if (fsch[i]=true) and (fszeit[i]<99)
  then
  schirm.canvas.draw(round(fsx[i]-5),round(fsy[i]-5),torp[13])
  else
  begin
  fszeit[i]:=110;
  fsch[i]:=false;
  end;

  if fzeit<>0
  then
  schirm.canvas.draw(round(fx-15),round(fy-15),feind);

  if (fexplo>0) and (fexplo<25)
  then
  begin
  schirm.canvas.stretchdraw(rect(round(fx-fexplo),round(fy-fexplo),round(fx+fexplo),round(fy+fexplo)),explo);
   inc(fexplo);
  end;

 if fexplo=25
 then
 begin
 fexplo:=0;
 sund:=true;
 fx:=-100;
 fy:=-100;
 end;


for i:=1 to 2 do
begin

       if i=1
       then
       ander:=2;

     if i=2
     then
     ander:=1;



  if (ptreff[i]>0)and (vis[ander]=true)
  then
  begin
  for e:=1 to w[ander]*3 do
  begin
  rx[i,1]:=round(x[ander]-w[ander]+2+random((w[ander]-2)*2));
  ry[i,1]:=round(y[ander]-w[ander]+2+random((w[ander]-2)*2));
  if schirm.canvas.pixels[rx[i,1],ry[i,1]]<>clblack
  then
  schirm.canvas.pixels[rx[i,1],ry[i,1]]:=claqua;
  end;
  schirm.canvas.moveto(round(x[ander]),round(y[ander]));
  for e:=1 to round(w[ander]) do
  begin
  schirm.canvas.Pen.color:=claqua;
  rx[i,1]:=round(x[ander]-w[ander]+2+random((w[ander]-2)*2));
  ry[i,1]:=round(y[ander]-w[ander]+2+random((w[ander]-2)*2));
  if schirm.canvas.pixels[rx[i,1],ry[i,1]]<>clblack
  then
  schirm.canvas.moveto(rx[i,1],ry[i,1]);

  rx[i,1]:=round(x[ander]-w[ander]+2+random((w[ander]-2)*2));
  ry[i,1]:=round(y[ander]-w[ander]+2+random((w[ander]-2)*2));
  if schirm.canvas.pixels[rx[i,1],ry[i,1]]<>clblack
  then
  schirm.canvas.lineto(rx[i,1],ry[i,1]);
  end;
  end;

  schirm.canvas.Pen.color:=clBlack;


For e:=1 to 3 do
begin
if lexist[i,e]=true
then
begin
schirm.canvas.Pen.color:=cllime;
schirm.canvas.pen.width:=1;
schirm.canvas.moveto(round(lx[i,e]+(sd[lkurs[i,e]]*3)),round(ly[i,e]+(cd[lkurs[i,e]]*-3)));
schirm.canvas.lineto(round(lx[i,e]+(sd[lkurs[i,e]]*-3)),round(ly[i,e]+(cd[lkurs[i,e]]*3)));     {
canvas.Pixels[round(lx[i,e]),round(ly[i,e])]:=cllime;

canvas.Pixels[round(lx[i,e]+(sd[lkurs[i,e]]*1)),round(ly[i,e]+(cd[lkurs[i,e]]*-1))]:=cllime;
canvas.Pixels[round(lx[i,e]+(sd[lkurs[i,e]]*1)),round(ly[i,e]+(cd[lkurs[i,e]]*-2))]:=cllime;
canvas.Pixels[round(lx[i,e]+(sd[lkurs[i,e]]*3)),round(ly[i,e]+(cd[lkurs[i,e]]*-3))]:=cllime;

canvas.Pixels[round(lx[i,e]+(sd[lkurs[i,e]]*-1)),round(ly[i,e]+(cd[lkurs[i,e]]*1))]:=cllime;
canvas.Pixels[round(lx[i,e]+(sd[lkurs[i,e]]*-2)),round(ly[i,e]+(cd[lkurs[i,e]]*2))]:=cllime;
canvas.Pixels[round(lx[i,e]+(sd[lkurs[i,e]]*-3)),round(ly[i,e]+(cd[lkurs[i,e]]*3))]:=cllime;  }
end;



if (lzeit[i,e]=149)
then
  begin
lzeit[i,e]:=200;
       end;



       if (ltreff[i,e]>0)
       then
       if   (ltreff[i,e]<9)
       then
       begin
       for u:=1 to Ltreff[i,e] do
       begin
       schirm.canvas.pixels[round(lx[i,e]+3-random(6)),round(ly[i,e]+3-random(6))]:=cllime;
       end;

       end;


end;




if (shutexist[i]=true)
  then
  begin
  schirm.canvas.draw(round(shutx[i]-5),round(shuty[i]-5),shut[shutkurs[i]]);
  end;

  if shutline[i]=1
  then
  begin
  shutline[i]:=2;
  schirm.canvas.pen.width:=1;
  schirm.canvas.pen.color:=clred;
 schirm.canvas.moveto(round(shutx[i]+(sd[shutkurs[i]]*5)),round(shuty[i]+(cd[shutkurs[i]]*-5)));
    rx[i,1]:=5-random(10);
    ry[i,1]:=5-random(10) ;
  schirm.canvas.lineto(round(x[ander]+rx[i,1]),round(y[ander]+ry[i,1]));

  shutld[i]:=true;
  end;


    if bumm[i]=true
    then
    begin
    inc(bummzeit[i]);
    x[i]:=ax[i];
    y[i]:=ay[i];
schirm.canvas.stretchdraw(Rect(round(x[i]-((bummzeit[i])*2)),round(y[i]-((bummzeit[i])*2)),round(x[i]+((bummzeit[i])*2)),round(y[i]+((bummzeit[i])*2))),explo);

    end;








  if subexist[i]=true
  then
begin
if subzeit[i]<100
then
begin


schirm.canvas.Draw(round(subx[i]-3),round(suby[i]-3),sub);

end;

if (subzeit[i]>99)
then
begin

schirm.canvas.stretchdraw(Rect(round(subx[i]-((subzeit[i]-100)*2)),round(suby[i]-((subzeit[i]-100)*2)),round(subx[i]+((subzeit[i]-100)*2)),round(suby[i]+((subzeit[i]-100)*2))),globe);

end;


if subzeit[i]>148
then
begin
subzeit[i]:=200;
subx[i]:=0;
suby[i]:=0;
asubx[i]:=0;
asuby[i]:=0;
subexist[i]:=false;
end;

end;





end;








For i:=1 to 250 do
begin
wgx:=starx[i];
wgy:=stary[i];
waffgrav;
starax[i]:=starx[i]+round(wgx*3);
staray[i]:=stary[i]+round(wgy*3);

if schirm.canvas.Pixels[starax[i],staray[i]]=clBlack
then
schirm.canvas.Pixels[starax[i],staray[i]]:=clwhite;
end;

  if (sunon=true) and   (novao=false)
  then
  begin
     schirm.canvas.draw(sx-25,sy-25,sun);
    end;




    if astroon=true
    then
    begin
    for i:=1 to 5 do
    schirm.canvas.draw(astx[i]-5,asty[i]-5,astr1);

     for i:=6 to 8 do
   schirm.canvas.draw(astx[i]-5,asty[i]-5,astr1);

     for i:=9 to 10 do
   schirm.canvas.draw(astx[i]-5,asty[i]-5,astr1);

    end;


 { if ((ax[1]>350) and (ay[1]>350) and (ay[1]<650) and (ax[1]<650)) or
    ((ax[2]>350) and (ay[2]>350) and (ay[2]<650) and (ax[2]<650))  or
     (sund=true)
    then
   begin
        For i:=1 to 5 do

        For i:=6 to 8 do
        canvas.draw(astx[i]-5,asty[i]-5,astr2);
        For i:=9 to 10 do
        canvas.draw(astx[i]-5,asty[i]-5,astr3);
    end;
            }
    if anoon=true
  then
  schirm.canvas.draw(anox-15,anoy-15,ano);



for i:=1 to 2 do
begin
if novao=true
then
begin
for u:=1 to 1000 do
if (sqr(sx-npx[u]+10)+sqr(sy-npy[u]+10))<sqr(novazeit)
then
begin
if noneb=0
then
begin
noneb:=1;
for e:=1 to 1000 do
begin
npc[e]:=random(10000)+10000;
if random(10)=1
then
npc[e]:=clpurple;
if random(10)=1
then
npc[e]:=clyellow;
end;
end;
end;

end;

for iii:=1 to 3 do
if (ltreff[i,iii]=3)
then
for u:=1 to 1000 do
if npe[u]=true
then
if (sqr(npx[u]+10-lx[i,iii])+sqr(npy[u]+10-ly[i,iii])<100)
then
begin
if noneb=0
then
begin
noneb:=1;
for e:=1 to 1000 do
begin
npc[e]:=random(10000)+10000;
if random(10)=1
then
npc[e]:=clpurple;
if random(10)=1
then
npc[e]:=clyellow;
end;
end;

end;







if (subexist[i]=true)
then
for u:=1 to 1000 do
if (sqr(npx[u]+10-subx[i])+sqr(npy[u]+10-suby[i])<sqr(subzeit[i]-100))
then
if (subzeit[i]>110)
then
begin
if noneb=0
then
begin
noneb:=1;
for e:=1 to 1000 do
begin
npc[e]:=random(10000)+10000;
if random(10)=1
then
npc[e]:=clpurple;
if random(10)=1
then
npc[e]:=clyellow;
end;
end;

end;
  end;

if noneb>0
then
begin
inc(noneb);

 if nebon=true
 then
for i:=1 to 2 do
begin
  sdown[i]:=false;
for e:=1 to 1000 do
if npe[e]=true
then
if sqr(nxs[e]+70-x[i])+sqr(nys[e]+70-y[i])<1000
then
sdown[i]:=true;



end;
end;
 if nebon=true
 then
 begin
if (noneb=45)
then
begin

for e:=1 to 1000  do
npc[e]:=clblack;
end;


if (noneb=100)
then
begin
neb.canvas.Brush.color:=clblack;
neb.canvas.pen.color:=clblack;
neb.canvas.fillrect(rect(0,0,neb.width,neb.height));
noneb:=0;
for e:=1 to 1000  do
begin
npe[e]:=false;
npc[e]:=100000000*Random(10);
end;
end;

     npe[nt]:=true;
     inc(nt);
     if nt>1000
     then
     nt:=1;

  For i:=1 to 1000 do
  begin

  if npe[i]=true
  then
  begin
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1)-nx+100,npy[i]+sqr(random(5))+random(1)-ny+100]:=npc[i];
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1)-nx+100,npy[i]+sqr(random(5))+random(1)-ny+100]:=npc[i]; {
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1),npy[i]+sqr(random(5))+random(1)]:=npc[i];
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1),npy[i]+sqr(random(5))+random(1)]:=npc[i];
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1),npy[i]+sqr(random(5))+random(1)]:=npc[i];
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1),npy[i]+sqr(random(5))+random(1)]:=npc[i];
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1),npy[i]+sqr(random(5))+random(1)]:=npc[i];
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1),npy[i]+sqr(random(5))+random(1)]:=npc[i];
neb.canvas.pixels[npx[i]+sqr(random(5))+random(1),npy[i]+sqr(random(5))+random(1)]:=npc[i];  }
 end;
   end;
schirm.canvas.draw(nx-100,ny-100,neb);

     end;





 if sund=true
 then
 begin
 For i:=1 to 2 do
   Case schiff[i] of

   1: if i=1 then
      Paintbox1.canvas.draw(0,0,a)
      else
      Paintbox2.canvas.draw(0,0,a) ;
   2:    if i=1 then
      Paintbox1.canvas.draw(0,0,j)
      else
      Paintbox2.canvas.draw(0,0,j) ;

     3:    if i=1 then
      Paintbox1.canvas.draw(0,0,g)
      else
      Paintbox2.canvas.draw(0,0,g) ;

        4:    if i=1 then
      Paintbox1.canvas.draw(0,0,t)
      else
      Paintbox2.canvas.draw(0,0,t) ;


          5:    if i=1 then
      Paintbox1.canvas.draw(0,0,h)
      else
      Paintbox2.canvas.draw(0,0,h) ;



          6:    if i=1 then
      Paintbox1.canvas.draw(0,0,b)
      else
      Paintbox2.canvas.draw(0,0,b) ;


          7:    if i=1 then
      Paintbox1.canvas.draw(-15,-15,es)
      else
      Paintbox2.canvas.draw(-15,-15,es) ;



         8:    if i=1 then
      Paintbox1.canvas.draw(-15,-15,ww)
      else
      Paintbox2.canvas.draw(-15,-15,ww) ;


           9:    if i=1 then
      Paintbox1.canvas.draw(0,0,vv)
      else
      Paintbox2.canvas.draw(0,0,vv) ;



           10:    if i=1 then
      Paintbox1.canvas.draw(0,0,m)
      else
      Paintbox2.canvas.draw(0,0,m) ;



                 11:    if i=1 then
      Paintbox1.canvas.draw(-5,-10,ss)
      else
      Paintbox2.canvas.draw(-5,-10,ss) ;


                 12:    if i=1 then
      Paintbox1.canvas.draw(-10,-10,f)
      else
      Paintbox2.canvas.draw(-10,-10,f) ;



  end;

 end;


   sund:=false;


   if ntwo=false
   then
   two:=true;
   if two=true
     then
     begin
     sund:=true;
     ntwo:=true;
     two:=false;
     change:=true;
     end;

     canvas.draw(0,0,schirm);
 end;






 Procedure TForm1.Kolli;
 begin
 For i:=1 to 2 do

 begin
   if sunon=true
  then
 if (sqr(sx-x[i])+sqr(sy-y[i])<sqr(treffdick[i]+30))
 then
 begin
 if sschil[i]=false
then
 schild[i]:=schild[i]-25;
  end;

         if wormon=true
       then
 if (sqr(wx1-x[i])+sqr(wy1-y[i])<500)
 then
 dec(schild[i]);

 if eveon=true
 then
 For e:=1 to 5 do
 begin
 if asthexist[e]=true
 then
 if (sqr(asthx[e]-x[i])+sqr(asthy[e]-y[i])<sqr(treffdick[i]+7))
 then
 begin
 if sschil[i]=false
then
schild[i]:=schild[i]-25;
if multi[i]=false
then
begin
vx[i]:=vx[i]*(-1);
vy[i]:=vy[i]*(-1);
x[i]:=x[i]+3*vx[i];
y[i]:=y[i]+3*vy[i];
 end;
 end;
 end;


   if anoon=true
    then
 if (sqr(anox-x[i])+sqr(anoy-y[i])<sqr(treffdick[i]+15))
 then
  if sschil[i]=false
then
 schild[i]:=schild[i]-random(25);

   if astroon=true
    then
 For e:=1 to 10 do
 begin
 if (sqr(astx[e]-x[i])+sqr(asty[e]-y[i])<sqr(treffdick[i]+4))
 then
 begin
  if sschil[i]=false
then
 schild[i]:=schild[i]-15;
 if multi[i]=false
 then
 begin
 vx[i]:=vx[i]*(-1);
 vy[i]:=vy[i]*(-1);
 x[i]:=x[i]+3*vx[i];
  y[i]:=y[i]+3*vy[i];
 end;
 end;

 end;

 if (multi[1]=false) and (multi[2]=false)
 then
 if (sqr(x[1]-x[2])+sqr(y[1]-y[2])<sqr(treffdick[1]+treffdick[2]))
 then
 begin
  vx[i]:=vx[i]*(-1);
 vy[i]:=vy[i]*(-1);
 x[i]:=x[i]+3*vx[i];
  y[i]:=y[i]+3*vy[i];
   end;

   if (multi[i]=false) and (fzeit<>0)
 then
 if (sqr(fx-x[i])+sqr(fy-y[i])<1000)
 then
 begin
  vx[i]:=vx[i]*(-1);
 vy[i]:=vy[i]*(-1);
 x[i]:=x[i]+2*vx[i];
  y[i]:=y[i]+2*vy[i];
   end;


 if (sdown[i]=true) and (sschil[i]=false)
then
schild[i]:=schild[i]-5;

   sdown[i]:=false;

   if eveon=true
   then
    if novao=true
 then
if (sqr(sx-x[i])+sqr(sy-y[i]))<sqr(novazeit)
then
if sschil[i]=false
then
schild[i]:=schild[i]-100;



  if schild[i]<=0
  then
  begin
  Schild[i]:=0;
for e:=1 to 10 do
begin
blade[i,e]:=0;
tlade[i,e]:=0;
end;
  espez[i]:=0;
  end;





 end;

 end;

  Procedure TForm1.Berechne;
   begin



     if akt<100
     then
     inc(akt);
      For i:=1 to 2 do
      if bumm[i]=false
      then
      begin
if kurs[i]=-1
then
kurs[i]:=35;
if kurs[i]=36
then
kurs[i]:=0;



vx[i]:=vx[i]+(sd[kurs[i]]*(v[i]));
vy[i]:=vy[i]+(cd[kurs[i]]*(-v[i]));
if (multi[i]=false)
then
begin

  if sunon=true
  then
  begin
if ((sqr(sx-x[i]) + sqr(sy-y[i]))<300)
then
begin
vx[i]:=vx[i]+(10/21*(sx-x[i])/sqrt(sqr(sx-x[i])+sqr(sy-y[i])));
 if vx[i]>0
  then
  vx[i]:=vx[i]-sqr(vx[i]/8);

  if vy[i]>0
  then
  vy[i]:=vy[i]-sqr(vy[i]/8);

    if vx[i]<0
  then
  vx[i]:=vx[i]+sqr(vx[i]/8);

  if vy[i]<0
  then
  vy[i]:=vy[i]+sqr(vy[i]/8);
vy[i]:=vy[i]+(10/21*(sy-y[i])/sqrt(sqr(sx-x[i])+sqr(sy-y[i])));
end
else
begin
vx[i]:=vx[i]+((sgra/(sqr(sx-x[i]) + sqr(sy-y[i])))*(sx-x[i])/sqrt(sqr(sx-x[i])+sqr(sy-y[i])));

vy[i]:=vy[i]+((sgra/(sqr(sx-x[i]) + sqr(sy-y[i])))*(sy-y[i])/sqrt(sqr(sx-x[i])+sqr(sy-y[i])));

end;
                  end;
                  end;
if lochon=true
then
begin
wax:=wax+random(9)-4;
way:=way+random(9)-4;

if (wax<0) or (wax>750) or (way<0) or (way>600)
then
begin
wax:=375;
way:=300;
end;

if ((sqr(wax-x[i]) + sqr(way-y[i]))>150)  and (multi[i]=false)
then
begin
vx[i]:=vx[i]+((wag/(sqr(wax-x[i]) + sqr(way-y[i])))*(wax-x[i])/sqrt(sqr(wax-x[i])+sqr(way-y[i])));
vy[i]:=vy[i]+((wag/(sqr(wax-x[i]) + sqr(way-y[i])))*(way-y[i])/sqrt(sqr(wax-x[i])+sqr(way-y[i])));
 end;


end;

  if anoon=true
    then
    begin

if (anox<>x[i]) and (anoy<>y[i])
then
begin
inc(ggaz);
if ggaz=20
then
begin
gga:=1500-random(3000);
ggaz:=0;
end;
if ((sqr(anox-x[i]) + sqr(anoy-y[i]))>100) and (multi[i]=false)
then
 begin
vx[i]:=vx[i]+((gga/(sqr(anox-x[i]) + sqr(anoy-y[i])))*(anox-x[i])/sqrt(sqr(anox-x[i])+sqr(anoy-y[i])));
vy[i]:=vy[i]+((gga/(sqr(anox-x[i]) + sqr(anoy-y[i])))*(anoy-y[i])/sqrt(sqr(anox-x[i])+sqr(anoy-y[i])));
end;
end;
                end;


                       if wormon=true
       then
       begin
if ((sqr(wx1-x[i])+sqr(wy1-y[i])<1000) and (akt>50)) and (multi[i]=false)
then
begin
vx[i]:=vx[i]+((3000/(sqr(wx1-x[i]) + sqr(wy1-y[i])))*(wx1-x[i])/sqrt(sqr(wx1-x[i])+sqr(wy1-y[i])));

vy[i]:=vy[i]+((3000/(sqr(wx1-x[i]) + sqr(wy1-y[i])))*(wy1-y[i])/sqrt(sqr(wx1-x[i])+sqr(wy1-y[i])));
end;





  if  ((sqr(wx2-x[i])+sqr(wy2-y[i])<1000) and (akt>50)) and (multi[i]=false)
     then
     begin

     vx[i]:=vx[i]+((3000/(sqr(wx2-x[i]) + sqr(wy2-y[i])))*(wx2-x[i])/sqrt(sqr(wx2-x[i])+sqr(wy2-y[i])));

vy[i]:=vy[i]+((3000/(sqr(wx2-x[i]) + sqr(wy2-y[i])))*(wy2-y[i])/sqrt(sqr(wx2-x[i])+sqr(wy2-y[i])));
end;


if (sqr(wx1-x[i])+sqr(wy1-y[i])<100) and (akt>50)
then
begin
x[i]:=wx2;
y[i]:=wy2;
  akt:=0;
end;





  if  (sqr(wx2-x[i])+sqr(wy2-y[i])<100) and (akt>50)
     then
     begin
    x[i]:=wx1;
y[i]:=wy1;
 akt:=0;
 end;



if akt=20
then
begin
repeat
wx1:=random(650)+50;
wx2:=random(650)+50;
wy1:=random(500)+50;
wy2:=random(500)+50;
until (((wx1>sx+50) or (wx1<sx-50)) and ((wy1>sy+50) or (wy1<sy-50))) and
(((wx2>sx+50) or (wx2<sx-50)) and ((wy2>sy+50) or (wy2<sy-50))) and (((wx1>anox+50) or (wx1<anox-50)) and ((wy1>sy+50) or (wy1<sy-50))) and
(((wx2>anox+50) or (wx2<anox-50)) and ((wy2>anoy+50) or (wy2<anoy-50)));
end;

    end;





if slipexist[i]=true
then
begin
vx[i]:=vx[i]+((1000/(sqr(slipx[i]-x[i]) + sqr(slipy[i]-y[i])))*(slipx[i]-x[i])/sqrt(sqr(slipx[i]-x[i])+sqr(slipy[i]-y[i])));
vy[i]:=vy[i]+((1000/(sqr(slipx[i]-x[i]) + sqr(slipy[i]-y[i])))*(slipy[i]-y[i])/sqrt(sqr(slipx[i]-x[i])+sqr(slipy[i]-y[i])));

if i=1
then
other:=2;

if i=2
then
other:=1;

vx[other]:=vx[other]+((1000/(sqr(slipx[i]-x[other]) + sqr(slipy[i]-y[other])))*(slipx[i]-x[other])/sqrt(sqr(slipx[i]-x[other])+sqr(slipy[i]-y[other])));
vy[other]:=vy[other]+((1000/(sqr(slipx[i]-x[other]) + sqr(slipy[i]-y[other])))*(slipy[i]-y[other])/sqrt(sqr(slipx[i]-x[other])+sqr(slipy[i]-y[other])));




inc(slipzeit[i]);
if slipzeit[i]=50
then
slipexist[i]:=false;




if (sqr(slipx[i]-x[i])+sqr(slipy[i]-y[i])<100)
then
begin
x[i]:=slipx2[i];
y[i]:=slipy2[i];
end;


if (sqr(slipx[i]-x[other])+sqr(slipy[i]-y[other])<100)
then
begin
x[other]:=slipx2[i];
y[other]:=slipy2[i];
end;


 end;
















if vx[i]>100
then
vx[i]:=100;

if vx[i]<-100
then
vx[i]:=100;

if vy[i]>100
then
vy[i]:=100;

             if vy[i]<-100
then
vy[i]:=100;



 if vx[i]>0
  then
  vx[i]:=vx[i]-sqr(vx[i]/8);

  if vy[i]>0
  then
  vy[i]:=vy[i]-sqr(vy[i]/8);

    if vx[i]<0
  then
  vx[i]:=vx[i]+sqr(vx[i]/8);

  if vy[i]<0
  then
  vy[i]:=vy[i]+sqr(vy[i]/8);






x[i]:=x[i]+vx[i];
y[i]:=y[i]+vy[i];



if x[i]>(745-w[i]) then
begin
x[i]:=(745-w[i]);
vx[i]:=vx[i]*(-1);
end;

if x[i]<(5+w[i])
then
begin
vx[i]:=vx[i]*(-1);
x[i]:=(5+w[i]);
end;

if y[i]<(5+w[i])
then
begin
vy[i]:=vy[i]*(-1);
y[i]:=(5+w[i]);
end;

if y[i]>(595-w[i])
then
begin
vy[i]:=vy[i]*(-1);
y[i]:=(595-w[i]);
end;
  v[i]:=0;

   if (spez[i]=false) and (multi[i]=true)
   then
   multi[i]:=false;
end;
Spezial;
waffen;


Kolli;

   end;



Procedure TForm1.Tastatur;
begin
akurs[1]:=kurs[1];
akurs[2]:=kurs[2];
 if getasynckeystate(tastlese.ende)<>0
then
begin
schild[1]:=0;
schild[2]:=0;
end;

if sperr[1]=false
then
if computer=true
then
begin
KI;
end
else
begin

        
if getasynckeystate(tastlese.torpf[2])<>0
then
tfeuer[2]:=true;

if getasynckeystate(tastlese.laserf[2])<>0
then
lfeuer[2]:=true;

if getasynckeystate(tastlese.fmodus[2])<>0
then
begin
if fmt[2]=0
then
begin
inc(fmt[2]);
inc(feuermode[2]);
if feuermode[2]=4
then
feuermode[2]:=1;
end;
end;

if fmt[2]<>0
then
inc(fmt[2]);

if fmt[2]=10
then
fmt[2]:=0;


if getasynckeystate(tastlese.links[2])<>0
then
dec(kurs[2]);
if getasynckeystate(tastlese.gas[2])<>0
then
inc(v[2]);
if getasynckeystate(tastlese.rechts[2])<>0
then
inc(kurs[2]);

if getasynckeystate(tastlese.halt[2])<>0
then
begin
vx[2]:=vx[2]/8*7;
vy[2]:=vy[2]/8*7;
end;
if getasynckeystate(tastlese.spezein[2])<>0
then
begin
  if (espez[2]>10)
  then
spez[2]:=true;



end;
if getasynckeystate(tastlese.spezaus[2])<>0
then
begin
spez[2]:=false;
      sund:=true;
       sschaus[2]:=true;
       uberm[2]:=true;
       if (subexist[2]=true) and (subzeit[2]<100)
       then
       subzeit[2]:=100;
 end;

 end;
 if sperr[2]=false
 then
 begin

if getasynckeystate(tastlese.torpf[1])<>0
then
tfeuer[1]:=true;

if getasynckeystate(tastlese.laserf[1])<>0
then
lfeuer[1]:=true;

if getasynckeystate(tastlese.fmodus[1])<>0
then
begin
if fmt[1]=0
then
begin
inc(fmt[1]);
inc(feuermode[1]);
if feuermode[1]=4
then
feuermode[1]:=1;
end;
end;

if fmt[1]<>0
then
inc(fmt[1]);

if fmt[1]=10
then
fmt[1]:=0;


if getasynckeystate(tastlese.links[1])<>0
then
dec(kurs[1]);
if getasynckeystate(tastlese.gas[1])<>0
then
inc(v[1]);
if getasynckeystate(tastlese.rechts[1])<>0
then
inc(kurs[1]);
if getasynckeystate(tastlese.halt[1])<>0
then
begin
vx[1]:=vx[1]/8*7;
vy[1]:=vy[1]/8*7;
end;
if getasynckeystate(tastlese.spezein[1])<>0
then
begin
  if (espez[1]>10)
  then
spez[1]:=true;
                            {   Ttasta = record
  ende,gpause:byte;
  gas,halt,links,rechts,laserf,torpf,spezein,spezaus,fmodus:array[1..2] of byte;
  end;           }
end;
if getasynckeystate(tastlese.spezaus[1])<>0
then
begin
      sund:=true; 
spez[1]:=false;
sschaus[1]:=true;
uberm[1]:=true;
    if (subexist[1]=true) and (subzeit[1]<100)
       then
       subzeit[1]:=100;
end;


end;

if getasynckeystate(1)<>0
then
sund:=true;
end;



Procedure TForm1.Anzeige;
begin

case feuermode[1] of
1:Label4.Caption:='auto';
2:Label4.Caption:='man.';
3:Label4.Caption:='alt.';
end;

case feuermode[2] of
1:Label6.Caption:='auto';
2:Label6.Caption:='man.';
3:Label6.Caption:='alt.';
end;


for i:=1 to 10 do
begin
if tv[1,i]<>0
then
begin
Playwert1.Canvas.Pen.width:=1;
Playwert1.canvas.pen.color:=tlade[1,i]+5;

if (tlade[1,i]=200) and (tv[1,i]>0)
then
Playwert1.canvas.pen.color:=$11FF00;

if (tlade[1,i]=200) and (tv[1,i]<0)
then
Playwert1.canvas.pen.color:=$00AA00;



Playwert1.canvas.ellipse(20,(i*10)+75,25,(i*10)+80);
end;

if bv[1,i]<>0
then
begin
Playwert1.Canvas.Pen.width:=1;
Playwert1.canvas.pen.color:=blade[1,i]*2+5;

if (blade[1,i]=100)
then
Playwert1.canvas.pen.color:=clblue;

Playwert1.canvas.ellipse(30,(i*10)+75,35,(i*10)+80);
 end;


if bv[2,i]<>0
then
begin
Playwert2.Canvas.Pen.width:=1;
Playwert2.canvas.pen.color:=blade[2,i]*2+5;

if (blade[2,i]=100)
then
Playwert2.canvas.pen.color:=clblue;

Playwert2.canvas.ellipse(30,(i*10)+75,35,(i*10)+80);
 end;


if tv[2,i]<>0
then
begin
Playwert2.Canvas.Pen.width:=1;
Playwert2.canvas.pen.color:=tlade[2,i]+5;

if (tlade[2,i]=200) and (tv[2,i]>0)
then
Playwert2.canvas.pen.color:=$11FF00;

if (tlade[2,i]=200) and (tv[2,i]<0)
then
Playwert2.canvas.pen.color:=$00AA00;



Playwert2.canvas.ellipse(20,(i*10)+75,25,(i*10)+80);
end;

end;


if (schild[1]<>schilda[1]) or (sund=true)
then
with Playwert1.Canvas do
begin
pen.color:=clblack;
pen.width:=1;
moveto(2,190);
lineto(2,0);
moveto(1,190);
lineto(1,0);
moveto(3,190);
lineto(3,0);

pixels[1,23]:=clsilver;
pixels[2,23]:=clsilver;
pixels[3,23]:=clsilver;

pen.color:=clred;
pen.width:=1;
moveto(2,190);
lineto(2,190-round(schild[1]/3));
moveto(1,190);
lineto(1,190-round(schild[1]/3));
moveto(3,190);
lineto(3,190-round(schild[1]/3));

end;

if (change=true) or (sund=true)
then
with Playwert1.Canvas do
begin
pen.color:=clblack;
pen.width:=1;
moveto(12,190);
lineto(12,0);
moveto(11,190);
lineto(11,0);
moveto(13,190);
lineto(13,0);

pixels[12,40]:=clsilver;
pixels[13,40]:=clsilver;
pixels[11,40]:=clsilver;

pen.color:=clyellow;
pen.width:=1;
moveto(12,190);
lineto(12,190-round(espez[1]));
moveto(11,190);
lineto(11,190-round(espez[1]));
moveto(13,190);
lineto(13,190-round(espez[1]));

end;

if (schild[2]<>schilda[2]) or (sund=true)
then
with Playwert2.Canvas do
begin
pen.color:=clblack;
pen.width:=1;
moveto(2,190);
lineto(2,0);
moveto(1,190);
lineto(1,0);
moveto(3,190);
lineto(3,0);

pixels[1,23]:=clsilver;
pixels[2,23]:=clsilver;
pixels[3,23]:=clsilver;

pen.color:=clred;
pen.width:=1;
moveto(2,190);
lineto(2,190-round(schild[2]/3));
moveto(1,190);
lineto(1,190-round(schild[2]/3));
moveto(3,190);
lineto(3,190-round(schild[2]/3));

end;

if (change=true) or (sund=true)
then
with Playwert2.Canvas do
begin
pen.color:=clblack;
pen.width:=1;
moveto(12,190);
lineto(12,0);
moveto(11,190);
lineto(11,0);
moveto(13,190);
lineto(13,0);

pixels[12,40]:=clsilver;
pixels[13,40]:=clsilver;
pixels[11,40]:=clsilver;

pen.color:=clyellow;
pen.width:=1;
moveto(12,190);
lineto(12,190-round(espez[2]));
moveto(11,190);
lineto(11,190-round(espez[2]));
moveto(13,190);
lineto(13,190-round(espez[2]));

end;

end;


procedure TForm1.Timer1Timer(Sender: TObject);

begin

Musik;
if getasynckeystate(tastlese.gpause)<>0
then
begin

if spielpause=false
then
spielpause:=true
else
spielpause:=false;


end;

if spielpause=false
then
begin
Einstellung;
pressstart:=false;
if run=true
then
begin
schilda[1]:=schild[1];
schilda[2]:=schild[2];
      ax[1]:=x[1];
     ay[1]:=y[1];
     ax[2]:=x[2];
     ay[2]:=y[2];
   Tastatur;

   if eveon=true
   then
   Ereignis;

   Berechne;




  anzeige;
   change:=false;
   
  if (schild[1]=0) or (schild[2]=0)
  then
 Ende;
  if neuint=false
 then
 begin

 Malen;
 end;

 end;


end;


     end;












procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
schwa:=true;
if run=false
then
begin

For i:=1 to 6 do
begin
if ( (x>(50+((i-1)*100))) and (x<(100+((i-1)*100))) and (y>50) and (y<100))
then
begin
if Button=mbleft
then
begin
schiff[1]:=i;

end;

if computer=false
then
if Button=mbright
then
begin
schiff[2]:=i;

end;

end;
end;






For i:=7 to 12 do
begin
if ( (x>(50+((i-7)*100))) and (x<(100+((i-7)*100))) and (y>200) and (y<250))
then
begin
if Button=mbleft
then
begin
schiff[1]:=i;

end;

if computer=false
then
if Button=mbright
then
begin
schiff[2]:=i;

end;

end;
end;




end;

end;







   Procedure TForm1.Spezial;
   begin
   for i:=1 to 2 do
   begin

    sschil[i]:=false;
   if (espez[i]<=0)
   then
   begin
   spez[i]:=false;
   sschaus[i]:=true;
   uberm[i]:=true;
sund:=true;
   end;

   if (spez[i]=true)
   then
   begin
   change:=true;
   case schiff[i] of
   1:ssch1(i);
   2:ssch2(i);
   3:ssch3(i);
   4:ssch4(i);
   5:ssch5(i);
   6:ssch6(i);
   7:ssch7(i);
   8:ssch8(i);
   9:ssch9(i);
   10:ssch10(i);
   11:ssch11(i);
   12:ssch12(i);
   end;

             end;

   if spezon=false
   then
   begin
   espez[i]:=0;
      change:=true;

end;
if espez[i]<150
then
begin
espez[i]:=espez[i]+1/3;
change:=true;
 end;
       end;

   end;






 procedure Tform1.ssch2(spieler:byte);
 begin

 if spieler=1
 then
 anderer:=2;
 if spieler=2
 then
 anderer:=1;


   if (vis[anderer]=false) or  (multi[anderer]=true)
     then
              begin
     spez[spieler]:=false;
sschaus[spieler]:=true;
sund:=true;
   end;

   if spez[spieler]=true
   then
   begin
 if ((sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer]))>3500) and  ((sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer]))<50000)
 then
 begin
vx[anderer]:=vx[anderer]+((25000/(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])))*(x[spieler]-x[anderer])/sqrt(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])));
       ssch2check[spieler]:=true;
              espez[spieler]:=espez[spieler]-2;
vy[anderer]:=vy[anderer]+((25000/(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])))*(y[spieler]-y[anderer])/sqrt(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])));

 end;

 if (sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer]))<3500
 then
 begin
vx[anderer]:=vx[anderer]+((-25000/(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])))*(x[spieler]-x[anderer])/sqrt(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])));
         ssch2check[spieler]:=true;
      espez[spieler]:=espez[spieler]-2;
vy[anderer]:=vy[anderer]+((-25000/(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])))*(y[spieler]-y[anderer])/sqrt(sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])));


 end;

if sqr(x[spieler]-x[anderer]) + sqr(y[spieler]-y[anderer])>50000
then
begin
spez[spieler]:=false;
sschaus[spieler]:=true;
sund:=true;
end;
     end;

end;




Procedure TForm1.ssch5(Spieler:byte);
begin
vx[Spieler]:=vx[Spieler]+(sd[kurs[Spieler]]*5);
vy[Spieler]:=vy[Spieler]+(cd[kurs[Spieler]]*-5);
rauch[Spieler]:=true;
espez[spieler]:=espez[spieler]-2;

end;


Procedure TForm1.ssch9(Spieler:byte);
begin
if tarnzeit[Spieler]=0
then
inc(tarnzeit[Spieler]);



if tarnzeit[i]=30
then
begin
Tarn[spieler]:=true;
  espez[spieler]:=espez[spieler]-2;
end;
end;



     procedure TForm1.ssch3(spieler:byte);
     begin
      multi[spieler]:=true;
  espez[spieler]:=espez[spieler]-2;

  if spieler=2
then
begin
vx[1]:=vx[1]-((-1500/(sqr(x[1]-x[2]) + sqr(y[1]-y[2])))*(x[1]-x[2])/sqrt(sqr(x[1]-x[2])+sqr(y[1]-y[2])));
vy[1]:=vy[1]-((-1500/(sqr(x[1]-x[2]) + sqr(y[1]-y[2])))*(y[1]-y[2])/sqrt(sqr(x[1]-x[2])+sqr(y[1]-y[2])));

end;

if spieler=1
then
begin
vx[2]:=vx[2]-((-1500/(sqr(x[2]-x[1]) + sqr(y[2]-y[1])))*(x[2]-x[1])/sqrt(sqr(x[2]-x[1])+sqr(y[2]-y[1])));
vx[2]:=vx[2]-((-1500/(sqr(x[2]-x[1]) + sqr(y[2]-y[1])))*(y[2]-y[1])/sqrt(sqr(x[2]-x[1])+sqr(y[2]-y[1])));

end;


     end;


     procedure TForm1.ssch7(spieler:byte);
     begin
     if espez[spieler]>145
     then
     begin







slipx[spieler]:=round(x[Spieler]+(sd[kurs[Spieler]]*50));
slipy[spieler]:=round(y[Spieler]+(cd[kurs[Spieler]]*-50));



repeat
slipx2[spieler]:=random(650)+50;
slipy2[spieler]:=random(500)+50;
until (((slipx2[spieler]>sx+50) or (slipx2[spieler]<sx-50)) and ((slipy2[spieler]>sy+50) or (slipy2[spieler]<sy-50))) and
(((slipx2[spieler]>anox+50) or (slipx2[spieler]<anox-50)) and ((slipy2[spieler]>anox+50) or (slipy2[spieler]<anox-50)));

slipzeit[spieler]:=0;
slipexist[spieler]:=true;
      espez[i]:=0;
     end;
    
     spez[spieler]:=false;
     end;



procedure TForm1.ssch10(spieler:byte);
begin
if espez[spieler]>145
then
begin
espez[spieler]:=0;
subexist[spieler]:=true;
subkurs[spieler]:=kurs[spieler];
subzeit[spieler]:=0;
subx[spieler]:=round(x[Spieler]+(sd[kurs[Spieler]]*10));
suby[spieler]:=round(y[Spieler]+(cd[kurs[Spieler]]*-10));
subvx[spieler]:=(sd[kurs[Spieler]]*7);
subvy[spieler]:=(cd[kurs[Spieler]]*-7);
end;
spez[spieler]:=false;


end;






procedure Tform1.waffen;
begin
For i:=1 to 2 do
begin
if i=1
then
anderer:=2;

if i=2
then
anderer:=1;

if subexist[i]=true
then
begin
inc(subzeit[i]);
if subzeit[i]<100
then
begin
asubx[i]:=subx[i];
asuby[i]:=suby[i];
 {
subx[i]:=(subx[i]+(sd[subkurs[i]]*7));
suby[i]:=(suby[i]+(cd[subkurs[i]]*-7));    }


wgx:=subx[i];
wgy:=suby[i];
waffgrav;
subvx[i]:=subvx[i]+wgx;
subvy[i]:=subvy[i]+wgy;  {
subx[i]:=wgx;
suby[i]:=wgy;    }

 subx[i]:= subx[i]+subvx[i];
suby[i]:= suby[i]+subvy[i];

if (sqr(subx[i]-sx) +sqr(suby[i]-sy)<700) and (novao=false) and (eveon=true)
then
begin
novao:=true;
novazeit:=0;
subzeit[i]:=150;
end
else
begin
waffkolli(subx[i],suby[i]);
if wktreff=true
then
begin
subzeit[i]:=100;
end;
end;



if (sqr(subx[i]-x[anderer])+sqr(suby[i]-y[anderer]))<sqr(treffdick[anderer]+3)
then
begin
subzeit[i]:=100;
if sschil[anderer]=false
then
schild[anderer]:=schild[anderer]-20;
end;

if subx[i]<25
then
subzeit[i]:=100;

if subx[i]>725
then
subzeit[i]:=100;

if suby[i]<25
then
subzeit[i]:=100;

if suby[i]>575
then
subzeit[i]:=100;   
end;    


if subzeit[i]>99
then
begin
if (sqr(subx[i]-x[i])+sqr(suby[i]-y[i]))<(sqr((subzeit[i]-95)*2))
then
schild[i]:=schild[i]-10;
                      
if (sqr(subx[i]-x[anderer])+sqr(suby[i]-y[anderer]))<(sqr((subzeit[i]-95)*2))
then
if sschil[anderer]=false
then
schild[anderer]:=schild[anderer]-10;

For e:=1 to 2 do
begin
if (sqr(subx[i]-shutx[e])+sqr(suby[i]-shuty[e]))<(sqr((subzeit[i]-100)*2))
then
begin
shutexist[e]:=false;
shutzeit[e]:=249;
shutline[e]:=0;
end;

end;

end;


if subzeit[i]=150
then
subexist[i]:=false;

end;


For e:=1 to 10 do
begin
if mexist[i,e]=true
then
begin

wgx:=mx[i,e];
wgy:=my[i,e];
waffgrav;
mvx[i,e]:=mvx[i,e]+wgx;
mvy[i,e]:=mvy[i,e]+wgy;
mx[i,e]:=mx[i,e]+mvx[i,e];
my[i,e]:=my[i,e]+mvy[i,e];



inc(mzeit[i,e]);



waffkolli(mx[i,e],my[i,e]);
if wktreff=true
then
begin
mexist[i,e]:=false;
mtreff[i,e]:=1;
 end;




if sqr(mx[i,e]-x[1])+sqr(my[i,e]-y[1])<sqr(treffdick[1]+3)
then
begin
mexist[i,e]:=false;
mtreff[i,e]:=1;
schild[1]:=schild[1]-20;
end;

if sqr(mx[i,e]-x[2])+sqr(my[i,e]-y[2])<sqr(treffdick[2]+3)
then
begin
mexist[i,e]:=false;
mtreff[i,e]:=1;
schild[2]:=schild[2]-20;
end;



if mzeit[i,e]=195
then
begin
mexist[i,e]:=false;

if mexist[i,e]=false
then
mzeit[i,e]:=199;
  end;

end;
if mtreff[i,e]>0
then
begin
mexist[i,e]:=false;
inc(mtreff[i,e]);
if mtreff[i,e]=10
then
mtreff[i,e]:=0;
end;


end;


if pexist[i]=true
then
begin
      {
px[i]:=(px[i]+(sd[pkurs[i]]*10));
py[i]:=(py[i]+(cd[pkurs[i]]*-10));     }

wgx:=px[i];
wgy:=py[i];
waffgrav;
pvx[i]:=pvx[i]+wgx;
pvy[i]:=pvy[i]+wgy;
px[i]:=px[i]+pvx[i];
py[i]:=py[i]+pvy[i];

inc(pzeit[i]);

if (sqr(px[i]-sx) +sqr(py[i]-sy)<700) and (novao=false) and (eveon=true)
then
begin
novao:=true;
novazeit:=0;
end;

waffkolli(px[i],py[i]);
if wktreff=true
then
pexist[i]:=false;


if (sqr(px[i]-x[anderer])+sqr(py[i]-y[anderer]))<150
then
begin
if sschil[anderer]=false
then
ptreff[i]:=1;

pexist[i]:=false;
end;




if pzeit[i]=100
then
pexist[i]:=false;

if pexist[i]=false
then
pzeit[i]:=99;

end;


if ptreff[i]>0
then
begin
espez[anderer]:=0;
for e:=1 to 10 do
begin
tlade[anderer,e]:=0;
blade[anderer,e]:=0;
end;
sperr[i]:=true;
inc(ptreff[i]);
if ptreff[i]=150
then
begin
ptreff[i]:=0;
sperr[i]:=false;
end;
end;

if swexist[i]=true
then
begin
inc(swzeit[i]);

swx[i]:=swx[i]+(sd[swkurs[i]]*9);
swy[i]:=swy[i]+(cd[swkurs[i]]*-9);
swtreff[i]:=false;

if (swexist[1]=true) and (swexist[2]=true)
then
if sqr(swx[1]-swx[2])+sqr(swy[1]-swy[2])<500
then
begin
subexist[1]:=true;
subzeit[1]:=100;
subx[1]:=(swx[1]+swx[2])/2;
suby[1]:=(swy[1]+swy[2])/2;
swexist[1]:=false;
swzeit[1]:=124;
swexist[2]:=false;
swzeit[2]:=124;
swx[1]:=0;
swx[2]:=0;
swy[1]:=0;
swy[2]:=0;
end;

if (sqr(swx[i]-sx) +sqr(swy[i]-sy)<1000) and (novao=false) and (eveon=true)
then
begin
novao:=true;
novazeit:=0;
end;

if sunon=true
then
if (sqr(sx-swx[i])+sqr(sy-swy[i])<1000)
then
swexist[i]:=false;


    if anoon=true
    then
 if (sqr(anox-swx[i])+sqr(anoy-swy[i])<500)
 then
swexist[i]:=false;

  if astroon=true
    then
 For u:=1 to 10 do
 if (sqr(astx[u]-swx[i])+sqr(asty[u]-swy[i])<40)
 then
swexist[i]:=false;


 if swx[i]<5
then
swexist[i]:=false;

if swx[i]>745
then
swexist[i]:=false;

if swy[i]<5
then
swexist[i]:=false;

if swy[i]>595
then
swexist[i]:=false;
  {
waffkolli(swx[i]-(cd[swkurs[i]]*20),swy[i]-(sd[swkurs[i]]*20));
if wktreff=true
then
swexist[i]:=false;

waffkolli(swx[i]+(cd[swkurs[i]]*20),swy[i]+(sd[swkurs[i]]*20));
if wktreff=true
then
swexist[i]:=false;

waffkolli(swx[i],swy[i]);
if wktreff=true
then
swexist[i]:=false;
               }

if sqr(swx[i]-x[anderer])+sqr(swy[i]-y[anderer])<sqr(treffdick[anderer]+5)
then
swtreff[i]:=true;

if sqr(swy[i]-(sd[swkurs[i]]*20)-y[anderer])+sqr(swx[i]-(cd[swkurs[i]]*20)-x[anderer])<sqr(treffdick[anderer]+5)
then
swtreff[i]:=true;

if sqr(swy[i]+(sd[swkurs[i]]*20)-y[anderer])+sqr(swx[i]+(cd[swkurs[i]]*20)-x[anderer])<sqr(treffdick[anderer]+5)
then
swtreff[i]:=true;


if (swtreff[i]=true)
then
begin
if    (sschil[anderer]=false)
then
schild[anderer]:=schild[anderer]-12;
if multi[anderer]=false
then
begin
vx[anderer]:=vx[anderer]+(sd[swkurs[i]]*14);
vy[anderer]:=vy[anderer]+(cd[swkurs[i]]*-14);
end;
end;



 if swzeit[i]>10
 then
 begin
swtreff[i]:=false;

if sqr(swx[i]-x[i])+sqr(swy[i]-y[i])<sqr(treffdick[i]+5)
then
swtreff[i]:=true;

if sqr(swy[i]-(sd[swkurs[i]]*20)-y[i])+sqr(swx[i]-(cd[swkurs[i]]*20)-x[i])<sqr(treffdick[i]+5)
then
swtreff[i]:=true;

if sqr(swy[i]+(sd[swkurs[i]]*20)-y[i])+sqr(swx[i]+(cd[swkurs[i]]*20)-x[i])<sqr(treffdick[i]+5)
then
swtreff[i]:=true;


if (swtreff[i]=true)
then
begin
schild[i]:=schild[i]-12;
if multi[i]=false
then
begin
vx[i]:=vx[i]+(sd[swkurs[i]]*14);
vy[i]:=vy[i]+(cd[swkurs[i]]*-14);
end;
end;
       end;
{canvas.pixels[round(swx[i]),round(swy[i])]:=clred;}


if swzeit[i]=125
then
swexist[i]:=false;

swtreff[i]:=false;

if swexist[i]=false
then
begin
swzeit[i]:=124;
     end;
end;




if shutexist[i]=true
then
begin

shutakurs[i]:=shutkurs[i];
inc(shutzeit[i]);


aaa:=shutx[i]-x[anderer]  ;
bbb:=shuty[i]-y[anderer] ;

alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

shutkurs[i]:=round(alpha)   ;

shutkurs[i]:=shutkurs[i]-9;

if shutkurs[i]<0
then
shutkurs[i]:=shutkurs[i]+36;

if shutkurs[i]>35
then
shutkurs[i]:=shutkurs[i]-36;

if vis[anderer]=false
then
shutkurs[i]:=shutakurs[i];


if sqr(shutx[i]-x[anderer])+sqr(shuty[i]-y[anderer])>1000
then
if vis[anderer]=true
then
begin
shutx[i]:=round(shutx[i]+(sd[shutkurs[i]]*5));
shuty[i]:=round(shuty[i]+(cd[shutkurs[i]]*-5));
end;


wgx:=shutx[i];
wgy:=shuty[i];
waffgrav;
shutx[i]:=shutx[i]+wgx;
shuty[i]:=shuty[i]+wgy;



{canvas.pixels[round(shutx[i]),round(shuty[i])]:=clred; }

waffkolli(shutx[i],shuty[i]);
if wktreff=true
then
begin
shutexist[i]:=false;
end;


if (sqr(shutx[i]-x[anderer])+sqr(shuty[i]-y[anderer])<3000) and (vis[anderer]=true) and (shutzeit[i]<245)
then
if sschil[anderer]=false
then
begin
shutline[i]:=1;
schild[anderer]:=schild[anderer]-2;
end;

if shutline[i]=2
then
shutline[i]:=0;

if shutzeit[i]=250
then
shutexist[i]:=false;



if shutexist[i]=false
then
begin
shutline[i]:=0;
shutzeit[i]:=249;
end;
end;

for  e:=1 to 3 do
BEGIN
if lexist[i,e]=true
then
begin


lakurs[i,e]:=lkurs[i,e];
inc(lzeit[i,e]);

if   (sqr(lx[i,e]-x[anderer])+sqr(ly[i,e]-y[anderer])>500)
then

begin
aaa:=lx[i,e]-x[anderer]  ;
bbb:=ly[i,e]-y[anderer] ;

alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

lkurs[i,e]:=round(alpha)   ;

lkurs[i,e]:=lkurs[i,e]-9;

if lkurs[i,e]<0
then
lkurs[i,e]:=lkurs[i,e]+36;

if lkurs[i,e]>35
then
lkurs[i,e]:=lkurs[i,e]-36;



kk:=lkurs[i,e]-lakurs[i,e];


if (kk>18)
then
kk:=kk-36;

if (kk<-19)
then
kk:=kk+36;

if (kk<18) and (kk>0)
then
lkurs[i,e]:=lakurs[i,e]+1;

if (kk>-19) and (kk<0)
then
lkurs[i,e]:=lakurs[i,e]-1;



if lkurs[i,e]<0
then
lkurs[i,e]:=lkurs[i,e]+36;

if lkurs[i,e]>35
then
lkurs[i,e]:=lkurs[i,e]-36;

        end;



if vis[anderer]=false
then
lkurs[i,e]:=lakurs[i,e];

lx[i,e]:=(lx[i,e]+(sd[lkurs[i,e]]*10));
ly[i,e]:=(ly[i,e]+(cd[lkurs[i,e]]*-10));

wgx:=lx[i,e];
wgy:=ly[i,e];
waffgrav;
lx[i,e]:=lx[i,e]+wgx;
ly[i,e]:=ly[i,e]+wgy;

waffkolli(lx[i,e],ly[i,e]);
if wktreff=true
then
lexist[i,e]:=false;


if (sqr(lx[i,e]-x[anderer])+sqr(ly[i,e]-y[anderer])<sqr(treffdick[anderer]+3))
then
begin
lexist[i,e]:=false;
ltreff[i,e]:=1;
if sschil[anderer]=false
then
schild[anderer]:=schild[anderer]-30;

end;



if lzeit[i,e]>150
then
lexist[i,e]:=false;




{canvas.pixels[round(lx[i,e]),round(ly[i,e])]:=clred;    }

if lexist[i,e]=false
then
lzeit[i,e]:=149;
end;


if ltreff[i,e]>0
then
begin
inc(ltreff[i,e]);

if ltreff[i,e]=10
then
ltreff[i,e]:=0;


end;


END;

torpedo(i);
Beam(i);

end;
end;





                        {davor immer die waffenx und waffeny auf wgx und wgy setzern}
procedure TForm1.waffgrav;
var wgvx,wgvy:extended;
begin
wgvx:=0;
wgvy:=0;


if multi[1]=true
then
begin
wgvx:=wgvx+((-1500/(sqr(x[1]-wgx) + sqr(y[1]-wgy)))*(x[1]-wgx)/sqrt(sqr(x[1]-wgx)+sqr(y[1]-wgy)));
wgvy:=wgvy+((-1500/(sqr(x[1]-wgx) + sqr(y[1]-wgy)))*(y[1]-wgy)/sqrt(sqr(x[1]-wgx)+sqr(y[1]-wgy)));

end;

if multi[2]=true
then
begin
wgvx:=wgvx+((-1500/(sqr(x[2]-wgx) + sqr(y[2]-wgy)))*(x[2]-wgx)/sqrt(sqr(x[2]-wgx)+sqr(y[2]-wgy)));
wgvy:=wgvy+((-1500/(sqr(x[2]-wgx) + sqr(y[2]-wgy)))*(y[2]-wgy)/sqrt(sqr(x[2]-wgx)+sqr(y[2]-wgy)));

end;

  if sunon=true
  then
  begin
if (wgx<>sx) and (wgy<>sy)
then
begin
wgvx:=wgvx+((sgra/(sqr(sx-wgx) + sqr(sy-wgy)))*(sx-wgx)/sqrt(sqr(sx-wgx)+sqr(sy-wgy)));

wgvy:=wgvy+((sgra/(sqr(sx-wgx) + sqr(sy-wgy)))*(sy-wgy)/sqrt(sqr(sx-wgx)+sqr(sy-wgy)));
end;

   end;

  if lochon=true
    then
if ((sqr(wax-wgx) + sqr(way-wgy))>150)
then
begin
wgvx:=wgvx+((wag/(sqr(wax-wgx) + sqr(way-wgy)))*(wax-wgx)/sqrt(sqr(wax-wgx)+sqr(way-wgy)));
wgvy:=wgvy+((wag/(sqr(wax-wgx) + sqr(way-wgy)))*(way-wgy)/sqrt(sqr(wax-wgx)+sqr(way-wgy)));
 end;

   if anoon=true
    then
    begin
if (anox<>wgx) and (anoy<>wgy)
then
begin
if ((sqr(anox-wgx) + sqr(anoy-wgy))>100)
then
 begin
wgvx:=wgvx+((gga/(sqr(anox-wgx) + sqr(anoy-wgy)))*(anox-wgx)/sqrt(sqr(anox-wgx)+sqr(anoy-wgy)));
wgvy:=wgvy+((gga/(sqr(anox-wgx) + sqr(anoy-wgy)))*(anoy-wgy)/sqrt(sqr(anox-wgx)+sqr(anoy-wgy)));
end;
end;
   end;


 wgx:=wgvx;
 wgy:=wgvy;


end;




procedure Tform1.ssch12(spieler:byte);
begin
if espez[spieler]>25
then
begin
espez[spieler]:=espez[spieler]-25;

mexist[spieler,mpos[i]]:=true;
mtreff[spieler,mpos[i]]:=0;
mx[spieler,mpos[i]]:=round(x[Spieler]-(sd[kurs[Spieler]]*25));
my[spieler,mpos[i]]:=round(y[Spieler]-(cd[kurs[Spieler]]*-25));
 mvx[spieler,mpos[i]]:=0;
 mvy[spieler,mpos[i]]:=0;
mzeit[spieler,mpos[i]]:=0;

mpos[i]:=mpos[i]+1;
if mpos[i]>10
then
mpos[i]:=1;

end;
spez[spieler]:=false;

end;




procedure TForm1.ssch11(spieler:byte);
begin

espez[spieler]:=espez[spieler]-3;
sschil[spieler]:=true;

end;


procedure Tform1.ssch6(spieler:byte);

begin
if spieler=1
then
anderer:=2;
if spieler=2
then
anderer:=1;
if espez[spieler]>125
then
begin
espez[spieler]:=espez[spieler]-125;
pexist[spieler]:=true;
pzeit[spieler]:=0;
px[spieler]:= round(x[Spieler]+(sd[kurs[Spieler]]*15));
py[spieler]:=round(y[Spieler]+(cd[kurs[Spieler]]*-15));
pvx[spieler]:=(sd[kurs[Spieler]]*10);
pvy[spieler]:=(cd[kurs[Spieler]]*-10);
ptreff[spieler]:=0;
pkurs[spieler]:=kurs[spieler]
end;
spez[spieler]:=false;


end;


procedure TForm1.ssch8(spieler:byte);


begin
if spieler=1
then
anderer:=2;

if spieler=2
then
anderer:=1;


if espez[spieler]>100
then
begin
swexist[spieler]:=true;

aaa:=x[spieler]-x[anderer]  ;
bbb:=y[spieler]-y[anderer] ;
{ccc:=sqrt(sqr(aaa)+sqr(bbb));
if bbb=0
then
bbb:=1/100000000;
                     }
alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

swkurs[spieler]:=round(alpha)   ;

swkurs[spieler]:=swkurs[spieler]-9;

if swkurs[spieler]<0
then
swkurs[spieler]:=swkurs[spieler]+36;

if swkurs[spieler]>35
then
swkurs[spieler]:=swkurs[spieler]-36;

if vis[anderer]=false
then
swkurs[spieler]:=kurs[spieler];

{Label4.Caption:=inttostr(swkurs[spieler]);}
swx[spieler]:=x[spieler]+(sd[swkurs[Spieler]]*20);
swy[spieler]:=y[spieler]+(cd[swkurs[Spieler]]*-20);
swzeit[spieler]:=0;
espez[spieler]:=espez[spieler]-100;
end;
spez[spieler]:=false;

end;


procedure TForm1.ssch1(spieler:byte);

begin

if spieler=1
then
anderer:=2;

if spieler=2
then
anderer:=1;


if espez[spieler]>145
then
begin
shutx[spieler]:=x[spieler];
shuty[spieler]:=y[spieler];
shutzeit[spieler]:=0;
shutexist[spieler]:=true;
 shutline[spieler]:=0;


aaa:=x[spieler]-x[anderer]  ;
bbb:=y[spieler]-y[anderer] ;


alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

shutkurs[spieler]:=round(alpha)   ;

shutkurs[spieler]:=shutkurs[spieler]-9;

if shutkurs[spieler]<0
then
shutkurs[spieler]:=shutkurs[spieler]+36;

if shutkurs[spieler]>35
then
shutkurs[spieler]:=shutkurs[spieler]-36;










espez[spieler]:=0;
end;


spez[spieler]:=false;
end;




procedure TForm1.ssch4(spieler:byte);

begin
if spieler=1
then
anderer:=2 ;

if spieler=2
then
anderer:=1;

if espez[spieler]>76
then
begin

lx[spieler,lpos[spieler]]:=x[spieler]+(sd[kurs[Spieler]]*10);
ly[spieler,lpos[spieler]]:=y[spieler]+(cd[kurs[Spieler]]*-10);
lzeit[spieler,lpos[spieler]]:=0;
lexist[spieler,lpos[spieler]]:=true;
ltreff[spieler,lpos[spieler]]:=0;
lkurs[spieler,lpos[spieler]]:=kurs[spieler];




 inc(lpos[spieler]) ;
 if lpos[spieler]>3
 then
 lpos[spieler]:=1;

espez[spieler]:=espez[spieler]-75;

end;
spez[spieler]:=false;
end;






Procedure Tform1.Waffkolli(wkx,wky:extended);
var aander:integer;
begin
wktreff:=false;

if (nebon=true) and (noneb>0)
then
for u:=1 to 1000 do
if npe[u]=true
then
if sqr(nxs[u]+70-wkx)+sqr(nys[u]+70-wky)<1000
then
wktreff:=true;


if (eveon=true) and (fzeit<>0)
then
if sqr(fx-wkx)+sqr(fy-wky)<200
then
begin
fschild:=fschild-5;
wktreff:=true;
end;


if (eveon=true) and (novao=true)
 then
if (sqr(sx-wkx)+sqr(sy-wky))<sqr(novazeit)
then
wktreff:=true;


   if sunon=true
  then
 if (sqr(sx-wkx)+sqr(sy-wky)<600)
 then
wktreff:=true;


    if anoon=true
    then
 if (sqr(anox-wkx)+sqr(anoy-wky)<200)
 then
 begin
wktreff:=true;
 gga:=-5000;
end;

  if astroon=true
    then
 For u:=1 to 10 do
 if (sqr(astx[u]-wkx)+sqr(asty[u]-wky)<40)
 then
 wktreff:=true;

 if eveon=true
 then
 For u:=1 to 5 do
 if asthexist[u]=true
 then
 if (sqr(asthx[u]-wkx)+sqr(asthy[u]-wky)<50)
 then
 wktreff:=true;


 if wkx<5
then
 wktreff:=true;

if wkx>745
then
 wktreff:=true;

if wky<5
then
 wktreff:=true;

if wky>595
then
 wktreff:=true;

  if i=1
 then
 aander:=2;

 if i=2
 then
 aander:=1;



if (wkx<>swx[i]) and (wky<>swy[i])
then
for u:=1 to 10 do
begin

if bexist[aander,u]=true
then
if (bx[aander,u]<>wkx) and (by[aander,u]<>wky)
then
if sqr(wkx-bx[aander,u])+sqr(wky-by[aander,u])<50
then
wktreff:=true;


if texist[aander,u]=true
then
if (tx[aander,u]<>wkx) and (ty[aander,u]<>wky)
then
if sqr(wkx-tx[aander,u])+sqr(wky-ty[aander,u])<50
then
wktreff:=true;





end;



 For u:=1 to 2 do
 begin
 if u=1
 then
 aander:=2;

 if u=2
 then
 aander:=1;








 if subexist[u]=true
 then
if subzeit[u]>100
then
if (subx[i]<>wkx) and (suby[i]<>wky)
then
if (sqr(wkx-subx[u])+sqr(wky-suby[u]))<(sqr((subzeit[u]-100)*2))
then
wktreff:=true;
     {

if (wkx<>swx[u]) and (wky<>swy[u])
then    }
if swexist[u]=true
then
begin
if sqr(wkx-swx[u])+sqr(wky-swy[u])<200
then
wktreff:=true;
     {
if   (wky<>swy[u]-(sd[swkurs[u]]*20))  and  (wkx<>swx[u]-(cd[swkurs[u]]*20))
then     }
if sqr(wky-swy[u]-(sd[swkurs[u]]*20))+sqr(wkx-swx[u]-(cd[swkurs[u]]*20))<200
then
wktreff:=true;
                {
if  (wky<>swy[u]+(sd[swkurs[u]]*20)) and   (wkx<>swx[u]+(cd[swkurs[u]]*20))
then             }
if sqr(wky-swy[u]+(sd[swkurs[u]]*20))+sqr(wkx-swx[u]+(cd[swkurs[u]]*20))<200
then
wktreff:=true;



end;








 end;





end;
















procedure TForm1.Panel12Click(Sender: TObject);
begin
     mediaplayer1.play;
 if sunon=true
then
begin
sunon:=false;
Panel12.Caption:='sun off';
end
else
begin
sunon:=true;
Panel12.Caption:='sun on';
end;



end;


procedure TForm1.Panel5Click(Sender: TObject);
begin
     mediaplayer1.play;
if nebon=true
then
begin
nebon:=false;
Panel5.Caption:='nebula off';
end
else
begin
nebon:=true;
Panel5.Caption:='nebula on';
end;
end;

procedure TForm1.Panel9Click(Sender: TObject);
begin
     mediaplayer1.play;
if astroon=true
then
begin
astroon:=false;
Panel9.Caption:='astroids off';
end
else
begin
astroon:=true;
Panel9.Caption:='astroids on';
end;
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
     mediaplayer1.play;
if lochon=true
then
begin
lochon:=false;
Panel4.Caption:='black hole off';
end
else
begin
lochon:=true;
Panel4.Caption:='black hole on';
end;
end;

procedure TForm1.Panel8Click(Sender: TObject);
begin
     mediaplayer1.play;
if anoon=true
then
begin
anoon:=false;
Panel8.Caption:='anomalie off';
end
else
begin
anoon:=true;
Panel8.Caption:='anomalie on';
end;
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
     mediaplayer1.play;
if spezon=true
then
begin
spezon:=false;
Panel3.Caption:='spezials off';
end
else
begin
spezon:=true;
Panel3.Caption:='spezials on';
end;
end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
     mediaplayer1.play;
if wormon=true
then
begin
wormon:=false;
Panel6.Caption:='wormhole off';
end
else
begin
wormon:=true;
Panel6.Caption:='wormhole on';
end;
end;





procedure TForm1.Panel7Click(Sender: TObject);
begin
     mediaplayer1.play;
if eveon=true
then
begin
eveon:=false;
Panel7.Caption:='events off';
end
else
begin
eveon:=true;
Panel7.Caption:='events on';
end;
end;


Procedure Tform1.Waffkord;
begin
For i:=1 to 2 do
begin
Case schiff[i] of
1:begin
tv[i,1]:=4;
tv[i,2]:=4;
tv[i,3]:=4;
tv[i,4]:=4;
tv[i,5]:=4;
tv[i,6]:=4;
tv[i,7]:=0;
tv[i,8]:=0;
tv[i,9]:=0;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=15
else
tpower[i,e]:=0;

wpostx[i,1]:=0;
wposty[i,1]:=10;
wpostx[i,2]:=0;
wposty[i,2]:=10;
wpostx[i,3]:=0;
wposty[i,3]:=10;
wpostx[i,4]:=0;
wposty[i,4]:=10;
wpostx[i,5]:=0;
wposty[i,5]:=10;
wpostx[i,6]:=0;
wposty[i,6]:=10;
wpostx[i,7]:=100;
wposty[i,7]:=100;
wpostx[i,8]:=100;
wposty[i,8]:=100;
wpostx[i,9]:=100;
wposty[i,9]:=100;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;
2:begin
tv[i,1]:=6;
tv[i,2]:=6;
tv[i,3]:=6;
tv[i,4]:=6;
tv[i,5]:=6;
tv[i,6]:=6;
tv[i,7]:=6;
tv[i,8]:=6;
tv[i,9]:=-6;
tv[i,10]:=-6;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=20
else
tpower[i,e]:=0;

wpostx[i,1]:=-1;
wposty[i,1]:=13;
wpostx[i,2]:=1;
wposty[i,2]:=13;
wpostx[i,3]:=-1;
wposty[i,3]:=13;
wpostx[i,4]:=1;
wposty[i,4]:=13;
wpostx[i,5]:=6;
wposty[i,5]:=4;
wpostx[i,6]:=-6;
wposty[i,6]:=4;
wpostx[i,7]:=10;
wposty[i,7]:=-3;
wpostx[i,8]:=-10;
wposty[i,8]:=-3;
wpostx[i,9]:=-5;
wposty[i,9]:=-10;
wpostx[i,10]:=5;
wposty[i,10]:=-10;

end;
3:begin
tv[i,1]:=7;
tv[i,2]:=7;
tv[i,3]:=7;
tv[i,4]:=7;
tv[i,5]:=7;
tv[i,6]:=7;
tv[i,7]:=7;
tv[i,8]:=-7;
tv[i,9]:=-7;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=25
else
tpower[i,e]:=0;

wpostx[i,1]:=0;
wposty[i,1]:=14;
wpostx[i,2]:=7;
wposty[i,2]:=12;
wpostx[i,3]:=-7;
wposty[i,3]:=12;
wpostx[i,4]:=10;
wposty[i,4]:=7;
wpostx[i,5]:=-10;
wposty[i,5]:=7;
wpostx[i,6]:=-14;
wposty[i,6]:=5;
wpostx[i,7]:=14;
wposty[i,7]:=5;
wpostx[i,8]:=5;
wposty[i,8]:=-15;
wpostx[i,9]:=-5;
wposty[i,9]:=-15;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;
4:begin
tv[i,1]:=4;
tv[i,2]:=4;
tv[i,3]:=4;
tv[i,4]:=4;
tv[i,5]:=4;
tv[i,6]:=4;
tv[i,7]:=-4;
tv[i,8]:=-4;
tv[i,9]:=0;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=15
else
tpower[i,e]:=0;

wpostx[i,1]:=-4;
wposty[i,1]:=4;
wpostx[i,2]:=-4;
wposty[i,2]:=4;
wpostx[i,3]:=4;
wposty[i,3]:=4;
wpostx[i,4]:=4;
wposty[i,4]:=4;
wpostx[i,5]:=10;
wposty[i,5]:=10;
wpostx[i,6]:=-10;
wposty[i,6]:=10;
wpostx[i,7]:=-10;
wposty[i,7]:=-10;
wpostx[i,8]:=10;
wposty[i,8]:=-10;
wpostx[i,9]:=100;
wposty[i,9]:=100;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;
5:begin
tv[i,1]:=6;
tv[i,2]:=6;
tv[i,3]:=6;
tv[i,4]:=6;
tv[i,5]:=6;
tv[i,6]:=6;
tv[i,7]:=-6;
tv[i,8]:=-6;
tv[i,9]:=-6;
tv[i,10]:=-6;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=20
else
tpower[i,e]:=0;

wpostx[i,1]:=3;
wposty[i,1]:=3;
wpostx[i,2]:=-3;
wposty[i,2]:=3;
wpostx[i,3]:=3;
wposty[i,3]:=3;
wpostx[i,4]:=-3;
wposty[i,4]:=3;
wpostx[i,5]:=3;
wposty[i,5]:=3;
wpostx[i,6]:=-3;
wposty[i,6]:=3;
wpostx[i,7]:=8;
wposty[i,7]:=-4;
wpostx[i,8]:=-8;
wposty[i,8]:=-4;
wpostx[i,9]:=8;
wposty[i,9]:=-4;
wpostx[i,10]:=-8;
wposty[i,10]:=-4;

end;
6:begin
tv[i,1]:=7;
tv[i,2]:=7;
tv[i,3]:=7;
tv[i,4]:=7;
tv[i,5]:=-7;
tv[i,6]:=-7;
tv[i,7]:=-7;
tv[i,8]:=0;
tv[i,9]:=0;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=20
else
tpower[i,e]:=0;


wpostx[i,1]:=0;
wposty[i,1]:=12;
wpostx[i,2]:=0;
wposty[i,2]:=12;
wpostx[i,3]:=0;
wposty[i,3]:=12;
wpostx[i,4]:=0;
wposty[i,4]:=12;
wpostx[i,5]:=0;
wposty[i,5]:=-11;
wpostx[i,6]:=0;
wposty[i,6]:=-11;
wpostx[i,7]:=0;
wposty[i,7]:=-11;
wpostx[i,8]:=100;
wposty[i,8]:=100;
wpostx[i,9]:=100;
wposty[i,9]:=100;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;
7:begin
tv[i,1]:=8;
tv[i,2]:=8;
tv[i,3]:=8;
tv[i,4]:=8;
tv[i,5]:=8;
tv[i,6]:=8;
tv[i,7]:=8;
tv[i,8]:=8;
tv[i,9]:=-8;
tv[i,10]:=-8;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=25
else
tpower[i,e]:=0;

wpostx[i,1]:=-2;
wposty[i,1]:=13;
wpostx[i,2]:=2;
wposty[i,2]:=13;
wpostx[i,3]:=-2;
wposty[i,3]:=13;
wpostx[i,4]:=2;
wposty[i,4]:=13;
wpostx[i,5]:=-2;
wposty[i,5]:=13;
wpostx[i,6]:=2;
wposty[i,6]:=13;
wpostx[i,7]:=-2;
wposty[i,7]:=13;
wpostx[i,8]:=2;
wposty[i,8]:=13;
wpostx[i,9]:=5;
wposty[i,9]:=-20;
wpostx[i,10]:=-5;
wposty[i,10]:=-20;

end;
8:begin
tv[i,1]:=5;
tv[i,2]:=5;
tv[i,3]:=5;
tv[i,4]:=5;
tv[i,5]:=5;
tv[i,6]:=0;
tv[i,7]:=0;
tv[i,8]:=0;
tv[i,9]:=0;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=20
else
tpower[i,e]:=0;

wpostx[i,1]:=0;
wposty[i,1]:=21;
wpostx[i,2]:=0;
wposty[i,2]:=21;
wpostx[i,3]:=0;
wposty[i,3]:=21;
wpostx[i,4]:=0;
wposty[i,4]:=21;
wpostx[i,5]:=0;
wposty[i,5]:=21;
wpostx[i,6]:=100;
wposty[i,6]:=100;
wpostx[i,7]:=100;
wposty[i,7]:=100;
wpostx[i,8]:=100;
wposty[i,8]:=100;
wpostx[i,9]:=100;
wposty[i,9]:=100;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;
9:begin
tv[i,1]:=6;
tv[i,2]:=6;
tv[i,3]:=6;
tv[i,4]:=6;
tv[i,5]:=6;
tv[i,6]:=6;
tv[i,7]:=6;
tv[i,8]:=-6;
tv[i,9]:=-6;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=20
else
tpower[i,e]:=0;

wpostx[i,1]:=0;
wposty[i,1]:=15;
wpostx[i,2]:=0;
wposty[i,2]:=15;
wpostx[i,3]:=0;
wposty[i,3]:=15;
wpostx[i,4]:=0;
wposty[i,4]:=15;
wpostx[i,5]:=0;
wposty[i,5]:=15;
wpostx[i,6]:=0;
wposty[i,6]:=15;
wpostx[i,7]:=0;
wposty[i,7]:=15;
wpostx[i,8]:=-3;
wposty[i,8]:=-6;
wpostx[i,9]:=3;
wposty[i,9]:=-6;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;
10:begin
tv[i,1]:=4;
tv[i,2]:=4;
tv[i,3]:=4;
tv[i,4]:=4;
tv[i,5]:=0;
tv[i,6]:=0;
tv[i,7]:=0;
tv[i,8]:=0;
tv[i,9]:=0;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=15
else
tpower[i,e]:=0;

wpostx[i,1]:=3;
wposty[i,1]:=9;
wpostx[i,2]:=-3;
wposty[i,2]:=9;
wpostx[i,3]:=3;
wposty[i,3]:=9;
wpostx[i,4]:=-3;
wposty[i,4]:=9;
wpostx[i,5]:=100;
wposty[i,5]:=100;
wpostx[i,6]:=100;
wposty[i,6]:=100;
wpostx[i,7]:=100;
wposty[i,7]:=100;
wpostx[i,8]:=100;
wposty[i,8]:=100;
wpostx[i,9]:=100;
wposty[i,9]:=100;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;
11:begin
tv[i,1]:=6;
tv[i,2]:=6;
tv[i,3]:=6;
tv[i,4]:=6;
tv[i,5]:=6;
tv[i,6]:=6;
tv[i,7]:=6;
tv[i,8]:=6;
tv[i,9]:=-6;
tv[i,10]:=-6;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=20
else
tpower[i,e]:=0;

wpostx[i,1]:=3;
wposty[i,1]:=7;
wpostx[i,2]:=-3;
wposty[i,2]:=9;
wpostx[i,3]:=3;
wposty[i,3]:=9;
wpostx[i,4]:=-3;
wposty[i,4]:=9;
wpostx[i,5]:=4;
wposty[i,5]:=4;
wpostx[i,6]:=-4;
wposty[i,6]:=4;
wpostx[i,7]:=20;
wposty[i,7]:=3;
wpostx[i,8]:=-20;
wposty[i,8]:=3;
wpostx[i,9]:=15;
wposty[i,9]:=-7;
wpostx[i,10]:=-15;
wposty[i,10]:=-7;

end;
12:begin
tv[i,1]:=7;
tv[i,2]:=7;
tv[i,3]:=7;
tv[i,4]:=7;
tv[i,5]:=7;
tv[i,6]:=-7;
tv[i,7]:=-7;
tv[i,8]:=-7;
tv[i,9]:=0;
tv[i,10]:=0;

for e:=1 to 10 do
if tv[i,e]<>0
then
tpower[i,e]:=25
else
tpower[i,e]:=0;

wpostx[i,1]:=0;
wposty[i,1]:=14;
wpostx[i,2]:=0;
wposty[i,2]:=14;
wpostx[i,3]:=0;
wposty[i,3]:=14;
wpostx[i,4]:=0;
wposty[i,4]:=14;
wpostx[i,5]:=0;
wposty[i,5]:=14;
wpostx[i,6]:=0;
wposty[i,6]:=0;
wpostx[i,7]:=0;
wposty[i,7]:=0;
wpostx[i,8]:=0;
wposty[i,8]:=0;
wpostx[i,9]:=100;
wposty[i,9]:=100;
wpostx[i,10]:=100;
wposty[i,10]:=100;

end;

end;






Case schiff[i] of
1:begin

wposlx[i,1]:=-3;
wposly[i,1]:=5;
wposlx[i,2]:=3;
wposly[i,2]:=5;
wposlx[i,3]:=-3;
wposly[i,3]:=5;
wposlx[i,4]:=3;
wposly[i,4]:=5;
wposlx[i,5]:=-3;
wposly[i,5]:=5;
wposlx[i,6]:=3;
wposly[i,6]:=5;
wposlx[i,7]:=-3;
wposly[i,7]:=-7;
wposlx[i,8]:=3;
wposly[i,8]:=-7;
wposlx[i,9]:=100;
wposly[i,9]:=100;
wposlx[i,10]:=100;
wposly[i,10]:=100;
 bmax[i]:=8;

end;
2:begin
wposlx[i,1]:=0;
wposly[i,1]:=13;
wposlx[i,2]:=0;
wposly[i,2]:=13;
wposlx[i,3]:=0;
wposly[i,3]:=13;
wposlx[i,4]:=-4;
wposly[i,4]:=6;
wposlx[i,5]:=4;
wposly[i,5]:=6;
wposlx[i,6]:=-4;
wposly[i,6]:=6;
wposlx[i,7]:=4;
wposly[i,7]:=6;
wposlx[i,8]:=3;
wposly[i,8]:=-10;
wposlx[i,9]:=-3;
wposly[i,9]:=-10;
wposlx[i,10]:=100;
wposly[i,10]:=100;
  bmax[i]:=9;
end;
3:begin
wposlx[i,1]:=-10;
wposly[i,1]:=1;
wposlx[i,2]:=10;
wposly[i,2]:=1;
wposlx[i,3]:=-10;
wposly[i,3]:=1;
wposlx[i,4]:=10;
wposly[i,4]:=1;
wposlx[i,5]:=-10;
wposly[i,5]:=1;
wposlx[i,6]:=10;
wposly[i,6]:=1;
wposlx[i,7]:=-2;
wposly[i,7]:=15;
wposlx[i,8]:=2;
wposly[i,8]:=15;
wposlx[i,9]:=0;
wposly[i,9]:=-5;
wposlx[i,10]:=0;
wposly[i,10]:=-5;
   bmax[i]:=10;

end;
4:begin
wposlx[i,1]:=-4;
wposly[i,1]:=4;
wposlx[i,2]:=4;
wposly[i,2]:=4;
wposlx[i,3]:=-4;
wposly[i,3]:=4;
wposlx[i,4]:=4;
wposly[i,4]:=4;
wposlx[i,5]:=-4;
wposly[i,5]:=4;
wposlx[i,6]:=4;
wposly[i,6]:=4;
wposlx[i,7]:=0;
wposly[i,7]:=6;
wposlx[i,8]:=0;
wposly[i,8]:=-4;
wposlx[i,9]:=0;
wposly[i,9]:=-4;
wposlx[i,10]:=100;
wposly[i,10]:=100;

 bmax[i]:=9;
end;
5:begin
wposlx[i,1]:=-3;
wposly[i,1]:=3;
wposlx[i,2]:=3;
wposly[i,2]:=3;
wposlx[i,3]:=-3;
wposly[i,3]:=3;
wposlx[i,4]:=3;
wposly[i,4]:=3;
wposlx[i,5]:=-3;
wposly[i,5]:=3;
wposlx[i,6]:=3;
wposly[i,6]:=3;
wposlx[i,7]:=-8;
wposly[i,7]:=-7;
wposlx[i,8]:=8;
wposly[i,8]:=-7;
wposlx[i,9]:=-8;
wposly[i,9]:=-7;
wposlx[i,10]:=8;
wposly[i,10]:=-7;

  bmax[i]:=10;
end;
6:begin
wposlx[i,1]:=0;
wposly[i,1]:=12;
wposlx[i,2]:=0;
wposly[i,2]:=12;
wposlx[i,3]:=0;
wposly[i,3]:=12;
wposlx[i,4]:=0;
wposly[i,4]:=12;
wposlx[i,5]:=-9;
wposly[i,5]:=3;
wposlx[i,6]:=9;
wposly[i,6]:=3;
wposlx[i,7]:=-9;
wposly[i,7]:=3;
wposlx[i,8]:=9;
wposly[i,8]:=3;
wposlx[i,9]:=0;
wposly[i,9]:=-11;
wposlx[i,10]:=0;
wposly[i,10]:=-11;
  bmax[i]:=10;

end;
7:begin
wposlx[i,1]:=0;
wposly[i,1]:=15;
wposlx[i,2]:=0;
wposly[i,2]:=15;
wposlx[i,3]:=0;
wposly[i,3]:=15;
wposlx[i,4]:=0;
wposly[i,4]:=15;
wposlx[i,5]:=-6;
wposly[i,5]:=16;
wposlx[i,6]:=6;
wposly[i,6]:=16;
wposlx[i,7]:=-6;
wposly[i,7]:=16;
wposlx[i,8]:=6;
wposly[i,8]:=16;
wposlx[i,9]:=100;
wposly[i,9]:=100;
wposlx[i,10]:=100;
wposly[i,10]:=100;

    bmax[i]:=8;
end;
8:begin
wposlx[i,1]:=-2;
wposly[i,1]:=19;
wposlx[i,2]:=2;
wposly[i,2]:=19;
wposlx[i,3]:=-2;
wposly[i,3]:=19;
wposlx[i,4]:=2;
wposly[i,4]:=19;
wposlx[i,5]:=-16;
wposly[i,5]:=5;
wposlx[i,6]:=16;
wposly[i,6]:=5;
wposlx[i,7]:=-16;
wposly[i,7]:=5;
wposlx[i,8]:=16;
wposly[i,8]:=5;
wposlx[i,9]:=-1;
wposly[i,9]:=-22;
wposlx[i,10]:=1;
wposly[i,10]:=-22;

   bmax[i]:=10;
end;
9:begin
wposlx[i,1]:=0;
wposly[i,1]:=14;
wposlx[i,2]:=0;
wposly[i,2]:=14;
wposlx[i,3]:=0;
wposly[i,3]:=14;
wposlx[i,4]:=0;
wposly[i,4]:=14;
wposlx[i,5]:=0;
wposly[i,5]:=14;
wposlx[i,6]:=-8;
wposly[i,6]:=1;
wposlx[i,7]:=8;
wposly[i,7]:=1;
wposlx[i,8]:=-6;
wposly[i,8]:=-3;
wposlx[i,9]:=6;
wposly[i,9]:=-3;
wposlx[i,10]:=100;
wposly[i,10]:=100;
     bmax[i]:=9;

end;
10:begin
wposlx[i,1]:=-5;
wposly[i,1]:=10;
wposlx[i,2]:=5;
wposly[i,2]:=10;
wposlx[i,3]:=-5;
wposly[i,3]:=10;
wposlx[i,4]:=5;
wposly[i,4]:=10;
wposlx[i,5]:=-5;
wposly[i,5]:=10;
wposlx[i,6]:=5;
wposly[i,6]:=10;
wposlx[i,7]:=100;
wposly[i,7]:=100;
wposlx[i,8]:=100;
wposly[i,8]:=100;
wposlx[i,9]:=100;
wposly[i,9]:=100;
wposlx[i,10]:=100;
wposly[i,10]:=100;

         bmax[i]:=6;
end;
11:begin
wposlx[i,1]:=-3;
wposly[i,1]:=9;
wposlx[i,2]:=3;
wposly[i,2]:=9;
wposlx[i,3]:=-3;
wposly[i,3]:=9;
wposlx[i,4]:=3;
wposly[i,4]:=9;
wposlx[i,5]:=-20;
wposly[i,5]:=3;
wposlx[i,6]:=20;
wposly[i,6]:=3;
wposlx[i,7]:=15;
wposly[i,7]:=-7;
wposlx[i,8]:=15;
wposly[i,8]:=-7;
wposlx[i,9]:=-11;
wposly[i,9]:=1;
wposlx[i,10]:=11;
wposly[i,10]:=1;
       bmax[i]:=10;

end;
12:begin
wposlx[i,1]:=-3;
wposly[i,1]:=10;
wposlx[i,2]:=3;
wposly[i,2]:=10;
wposlx[i,3]:=-3;
wposly[i,3]:=10;
wposlx[i,4]:=3;
wposly[i,4]:=10;
wposlx[i,5]:=-3;
wposly[i,5]:=10;
wposlx[i,6]:=3;
wposly[i,6]:=10;
wposlx[i,7]:=-2;
wposly[i,7]:=3;
wposlx[i,8]:=2;
wposly[i,8]:=3;
wposlx[i,9]:=-1;
wposly[i,9]:=-7;
wposlx[i,10]:=1;
wposly[i,10]:=-7;
    bmax[i]:=10;
end;

end;

 for e:=1 to 10 do
 if wposlx[i,e]=100
 then
 bv[i,e]:=0
 else
 bv[i,e]:=10;


end;


end;



Procedure TForm1.Torpedo(spieler:byte);
var tf:byte;
hinten:boolean;
begin

if spieler=1
then
anderer:=2;

if spieler=2
then
anderer:=1;

if tarnzeit[spieler]<>0
then
tfeuer[spieler]:=false;


for e:=1 to 10 do
if tlade[spieler,e]<200
then
if tv[spieler,e]<>0
then
inc(tlade[spieler,e]);

if (tfeuer[spieler]=true)
then
begin
hinten:=false;


aaa:=x[spieler]-x[anderer];
bbb:=y[spieler]-y[anderer];
alpha:=arctan2(bbb,aaa);
alpha:=(alpha*18/PI);
alpha:=alpha-9;
if alpha<0
then
alpha:=alpha+36;
if alpha>35
then
alpha:=alpha-36;
alpha:=alpha-kurs[spieler];

if  ((alpha>-27) and (alpha<-9)) or ((alpha>9) and (alpha<27)) or (alpha>45)
then
begin
hinten:=true;
end;


  tf:=0;

  if (feuermode[spieler]=2) or (vis[anderer]=false)
  then
  hinten:=false;

if hinten=true
then
begin
repeat
inc(tf);
until ((tlade[spieler,tf]=200) and (texist[spieler,tf]=false) and (tv[spieler,tf]<0))or (tf=10);

if ((tlade[spieler,tf]<>200) or (texist[spieler,tf]<>false) or (tv[spieler,tf]>0))and (tf=10)
then
begin
hinten:=false;
tf:=0;
end;
end;




if hinten=false
then
repeat
inc(tf);
until ((tlade[spieler,tf]=200) and (texist[spieler,tf]=false))or (tf=10);



if (tlade[spieler,tf]=200) and (texist[spieler,tf]=false)
then
begin
mediaplayer1.play;
tx[spieler,tf]:=x[spieler]+(sd[kurs[spieler]]*wposty[spieler,tf])-(cd[kurs[spieler]]*wpostx[spieler,tf]);
ty[spieler,tf]:=y[spieler]-(cd[kurs[spieler]]*wposty[spieler,tf])-(sd[kurs[spieler]]*wpostx[spieler,tf]);


tkurs[spieler,tf]:=kurs[spieler];
tlade[spieler,tf]:=0;
texist[spieler,tf]:=true;
tzeit[spieler,tf]:=0;

tvx[spieler,tf]:=(sd[tkurs[spieler,tf]]*2*tv[spieler,tf]);
tvy[spieler,tf]:=(cd[tkurs[spieler,tf]]*2*-tv[spieler,tf]);


end;

end;
tfeuer[spieler]:=false;

for e:=1 to 10 do
begin
if texist[spieler,e]=true
then
begin
wgx:=tx[spieler,e];
wgy:=ty[spieler,e];
waffgrav;
tvx[spieler,e]:=tvx[spieler,e]+wgx;
tvy[spieler,e]:=tvy[spieler,e]+wgy;

tx[spieler,e]:=tx[spieler,e]+tvx[spieler,e];
ty[spieler,e]:=ty[spieler,e]+tvy[spieler,e];
{
tx[spieler,e]:=(tx[spieler,e]+(sd[tkurs[spieler,e]]*2*tv[spieler,e]));
ty[spieler,e]:=(ty[spieler,e]+(cd[tkurs[spieler,e]]*2*-tv[spieler,e]));   }
inc(tzeit[spieler,e]);
{canvas.pixels[round(tx[spieler,e]),round(ty[spieler,e])]:=clred;   }



waffkolli(tx[spieler,e],ty[spieler,e]);

if (sqr(tx[spieler,e]-x[anderer])+sqr(ty[spieler,e]-y[anderer]))<sqr(treffdick[anderer]+3)
then
begin
texist[spieler,e]:=false;
if
sschil[anderer]=false
then
schild[anderer]:=schild[anderer]-tpower[spieler,e];
end;


if ((sqr(tx[spieler,e]-x[spieler])+sqr(ty[spieler,e]-y[spieler]))<sqr(treffdick[spieler]+3) ) and (tzeit[spieler,e]>5)
then
begin
texist[spieler,e]:=false;
if
sschil[spieler]=false
then
schild[spieler]:=schild[spieler]-tpower[spieler,e];
end;


if wktreff=true
then
texist[spieler,e]:=false;

if tzeit[spieler,e]=100
then
texist[spieler,e]:=false;


if texist[spieler,e]=false
then
tzeit[spieler,e]:=99;
end;


end;



end;







 Procedure TForm1.beam(spieler:byte);
var bf:integer;

begin

if spieler=1
then
anderer:=2;

if spieler=2
then
anderer:=1;

if tarnzeit[spieler]<>0
then
lfeuer[spieler]:=false;


for e:=1 to 10 do
if (blade[spieler,e]<100) and (bv[spieler,e]<>0)
then
inc(blade[spieler,e]);




if (lfeuer[spieler]=true)
then
begin

  bf:=0;

  if feuermode[spieler]=1
  then
  begin
  zx:=x[anderer];
  zy:=y[anderer];
  end;

  if feuermode[spieler]=3
  then
  begin
  zx:=x[anderer];
  zy:=y[anderer];

for e:=1 to 3 do
if (lexist[anderer,e]=true)
then
begin
zx:=lx[anderer,e];
zy:=ly[anderer,e];
end;

for e:=1 to 10 do
if (mexist[anderer,e]=true)
then
begin
zx:=mx[anderer,e];
zy:=my[anderer,e];
end;

if (subexist[anderer]=true) and (subzeit[anderer]<100)
then
begin
zx:=subx[anderer];
zy:=suby[anderer];
end;



if (pexist[anderer]=true)
then
begin
zx:=px[anderer];
zy:=py[anderer];
end;

if (shutexist[anderer]=true)
then
begin
zx:=shutx[anderer];
zy:=shuty[anderer];
end;

if (fzeit<>0)
then
begin
zx:=fx;
zy:=fy;
end;



  end;




  {

if (blade[spieler,bpos[spieler]]=100)
then
 begin
 bf:=bpos[spieler];
inc(bpos[spieler]);
if bpos[spieler]=11
then
bpos[spieler]:=1;
if bmax[spieler]+1=bpos[spieler]
then
bpos[spieler]:=1;
end;            }

repeat
inc(bf);
until ((blade[spieler,bf]=100) and (bexist[spieler,bf]=false))or (bf=10);


if bf<>0
then
if (blade[spieler,bf]=100) and (bexist[spieler,bf]=false)
then
begin
mediaplayer3.play;
bx[spieler,bf]:=x[spieler]+(sd[kurs[spieler]]*wposly[spieler,bf])-(cd[kurs[spieler]]*wposlx[spieler,bf]);
by[spieler,bf]:=y[spieler]-(cd[kurs[spieler]]*wposly[spieler,bf])-(sd[kurs[spieler]]*wposlx[spieler,bf]);
bkurs[spieler,bf]:=kurs[spieler];


if  (feuermode[spieler]<>2)
then
begin
aaa:=x[spieler]-zx ;
bbb:=y[spieler]-zy ;
alpha:=arctan2(bbb,aaa);
alpha:=(alpha*18/PI)   ;
bkurs[spieler,bf]:=round(alpha)   ;
bkurs[spieler,bf]:=bkurs[spieler,bf]-9;
if bkurs[spieler,bf]<0
then
bkurs[spieler,bf]:=bkurs[spieler,bf]+36;
if bkurs[spieler,bf]>35
then
bkurs[spieler,bf]:=bkurs[spieler,bf]-36;
  end;
if  (vis[anderer]=false) and  (zx=x[anderer]) and (y[anderer]=zy)
then
bkurs[spieler,bf]:=kurs[spieler];


blade[spieler,bf]:=0;
bexist[spieler,bf]:=true;
bzeit[spieler,bf]:=0;

end;

end;
lfeuer[spieler]:=false;

for e:=1 to 10 do
begin
if bexist[spieler,e]=true
then
begin

bax[spieler,e]:=bx[spieler,e];
bay[spieler,e]:=by[spieler,e];
bx[spieler,e]:=(bx[spieler,e]+(sd[bkurs[spieler,e]]*20));
by[spieler,e]:=(by[spieler,e]+(cd[bkurs[spieler,e]]*-20));
inc(bzeit[spieler,e]);




         {canvas.pixels[round(bx[spieler,e]),round(by[spieler,e])]:=clred;     }
waffkolli(bx[spieler,e],by[spieler,e]);

if (sqr(bx[spieler,e]-x[anderer])+sqr(by[spieler,e]-y[anderer]))<sqr(treffdick[anderer]+3)
then
begin
bexist[spieler,e]:=false;
if
sschil[anderer]=false
then
schild[anderer]:=schild[anderer]-15;
end;


if wktreff=true
then
bexist[spieler,e]:=false;

if bzeit[spieler,e]=50
then
bexist[spieler,e]:=false;


if bexist[spieler,e]=false
then
bzeit[spieler,e]:=49;
end;


end;



end;



 Procedure TForm1.Musik;
begin
if musikstart=true
then
begin
    musikstart:=false;
    Mediaplayer2.play;
end;


if Mediaplayer2.Position>Mediaplayer2.length-10
then
begin
Mediaplayer2.Position:=0;
mediaplayer2.play;
end;



 end;





procedure TForm1.Panel10Click(Sender: TObject);
begin
 mediaplayer1.play;
if computer=false
then
begin
computer:=true;
Panel10.caption:='computerplayer on';
schiff[2]:=random(12)+1;
schwa:=true;
end
else
begin
computer:=false;
Panel10.caption:='computerplayer off';
schiff[2]:=0;
schwa:=true;
end;

end;




 Procedure Tform1.KI;
 var alt,klein:integer;
 ad:array[1..10] of extended;
 begin
     danger:=false;
  if vis[1]=false
 then
 begin
if random(5)=1
then
v[2]:=1;
 end;

 if vis[1]=true
 then
 if sqr(x[1]-x[2])+sqr(x[1]-x[2])>6000
 then
 v[2]:=1;


 if vis[1]=true
 then
  if (sqr(x[1]-x[2])+sqr(x[1]-x[2])>2500) and  (sqr(x[1]-x[2])+sqr(x[1]-x[2])<6000)
 then
 begin
vx[2]:=vx[2]/8*7;
vy[2]:=vy[2]/8*7;
end;


 if vis[1]=true
 then
  if (sqr(x[1]-x[2])+sqr(x[1]-x[2])<2500)
 then
 begin
v[2]:=random(2);
end;


 alt:=kurs[2];
 if vis[1]=true
 then
 begin

 aaa:=x[2]-x[1]  ;
bbb:=y[2]-y[1] ;

alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

kurs[2]:=round(alpha)   ;

kurs[2]:=kurs[2]-9;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

   end;


for e:=1 to 2 do
if (subexist[e]=true) and (subzeit[e]>100)
then
if sqr(x[2]-subx[e])+sqr(y[2]-suby[e])<10000
then
begin
v[2]:=1;
aaa:=x[2]-subx[e]  ;
bbb:=y[2]-suby[e] ;
      danger:=true;
alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

kurs[2]:=round(alpha)   ;

kurs[2]:=kurs[2]-9;
 if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

kurs[2]:=kurs[2]-18;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

end;


if astroon=true
then
begin
For e:=1 to 10 do
ad[e]:=sqr(x[2]-astx[e])+sqr(y[2]-asty[e]) ;
klein:=1;
for e:=2 to 10 do
if ad[e]<ad[klein]
then
klein:=e;

if sqr(x[2]-astx[klein])+sqr(y[2]-asty[klein])<sqr(treffdick[2]+25)
then
begin
v[2]:=random(2);
if v[e]<>0
then
v[2]:=random(2);

aaa:=x[2]-astx[klein]  ;
bbb:=y[2]-asty[klein] ;
      danger:=true;
alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

kurs[2]:=round(alpha)   ;

kurs[2]:=kurs[2]-9;
 if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

kurs[2]:=kurs[2]-18;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

   end;
   end;

   if anoon=true
   then
   if sqr(x[2]-anox)+sqr(y[2]-anoy)<6500
then
begin
    v[2]:=1;
aaa:=x[2]-anox  ;
bbb:=y[2]-anoy ;
         danger:=true;
alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

kurs[2]:=round(alpha)   ;

kurs[2]:=kurs[2]-9;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

kurs[2]:=kurs[2]-18;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;
   end;




if (sqr(x[2]-x[1])+sqr(y[2]-y[1])<5000)
then
begin
   v[2]:=1;
 aaa:=x[2]-x[1]  ;
bbb:=y[2]-y[1] ;
          danger:=true;
alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

kurs[2]:=round(alpha)   ;

kurs[2]:=kurs[2]-9;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

kurs[2]:=kurs[2]-18;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;
   end;





if ((sqr(x[2]-sx)+sqr(y[2]-sy)<15000) and (sunon=true)) or (novao=true)
then
begin
   v[2]:=1;
 aaa:=x[2]-sx  ;
bbb:=y[2]-sy ;
       danger:=true;
alpha:=arctan2(bbb,aaa);

alpha:=(alpha*18/PI)   ;

kurs[2]:=round(alpha)   ;

kurs[2]:=kurs[2]-9;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;

kurs[2]:=kurs[2]-18;

if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;
   end;



kk:=kurs[2]-alt;

if (kk>18)
then
kk:=kk-36;

if (kk<-19)
then
kk:=kk+36;

if (kk>18)
then
kk:=kk-36;

if (kk<-19)
then
kk:=kk+36;



if (kk<18) and (kk>0)
then
kurs[2]:=alt+1
else
if (kk>-19) and (kk<0)
then
kurs[2]:=alt-1
else
kurs[2]:=alt;



if kurs[2]<0
then
kurs[2]:=kurs[2]+36;

if kurs[2]>35
then
kurs[2]:=kurs[2]-36;





  if vis[1]=true
  then
 begin

aaa:=x[2]-x[1]  ;
bbb:=y[2]-y[1] ;

alpha:=arctan2(bbb,aaa);
alpha:=(alpha*18/PI)   ;
alpha:=alpha-9;
kk:=round(alpha-kurs[2]);
  end
  else
  kk:=0;


if ((kk>-3) and  (kk<3)) or ((kk<-15) and  (kk>-21) ) or ((kk>15) and  (kk<21) ) or ((kk>33) and  (kk<39) )  or ((kk<-33) and  (kk>-39) )
then
tfeuer[2]:=true;

if (vis[1]=true ) or (fzeit<>0)
then
lfeuer[2]:=true;



 case schiff[2] of
 1:  if (espez[2]>10) and (vis[1]=true) and ( random(25)=5)
  then
spez[2]:=true;

 2:  if (espez[2]>50) and (danger=true)
  then
spez[2]:=true;

 3: if (espez[2]>10) and (danger=true)
  then
spez[2]:=true;

 4:if (espez[2]>10) and (vis[1]=true)
  then
spez[2]:=true;

 5:if (espez[2]>10) and (danger=true)
  then
spez[2]:=true;

 6: if (vis[1]=true) and(espez[2]>10) and((kk>-3) and  (kk<3)) or ((kk<-15) and  (kk>-21) ) or ((kk>15) and  (kk<21) ) or ((kk>33) and  (kk<39) )  or ((kk<-33) and  (kk>-39) )
then
spez[2]:=true;
 7: if (espez[2]>10) and (danger=true)
  then
spez[2]:=true; 
 8: if (espez[2]>10) and (vis[1]=true)
  then
spez[2]:=true;
9: if (espez[2]>50) and (vis[1]=true) and (random(10)=1)
  then
spez[2]:=true;
 10: if (vis[1]=true) and (espez[2]>10) and((kk>-3) and  (kk<3)) or ((kk<-15) and  (kk>-21) ) or ((kk>15) and  (kk<21) ) or ((kk>33) and  (kk<39) )  or ((kk<-33) and  (kk>-39) )
then
spez[2]:=true;
 11: if ((espez[2]>25) and (danger=true)) or (random(100)=3)
  then
spez[2]:=true;
 12: if (espez[2]>10) and (random(10)=1)
  then
spez[2]:=true;
 end;
    


if random(50)=1
then
feuermode[2]:=1;

if random(50)=1
then
feuermode[2]:=3;

if vis[1]=false
then
feuermode[2]:=3;

 end;


  Procedure Tform1.Ende;

  begin
  if warten=-1
  then
  warten:=0;
  Label22.top:=280;
  label22.left:=300;
  label22.height:=40;
  label22.width:=150;
  if (schild[1]=0) and (schild[2]=0)
  then
  begin
   label22.caption:='No winner!';
   bumm[1]:=true;
       sperr[1]:=true;
   bumm[2]:=true;
           sperr[2]:=true;
   if bummzeit[1]=0
   then
  bummzeit[1]:=1;
     if bummzeit[2]=0
   then
  bummzeit[2]:=1;
  end
  else if (schild[1]=0)
  then
  begin
   label22.caption:='Player 2 won!';
     bumm[1]:=true;
           sperr[2]:=true;
      if bummzeit[1]=0
   then
  bummzeit[1]:=1;
  end
  else
  begin
   label22.caption:='Player 1 won!';
     bumm[2]:=true;
           sperr[1]:=true;
      if bummzeit[2]=0
   then
  bummzeit[2]:=1;
    end;


inc(warten);
if warten>20
then
begin
run:=false;
neuint:=true;{
Mediaplayer1.stop;
Mediaplayer2.stop;   }
Init;

end;

  end;



procedure TForm1.Ereignis;
begin
if sunon=true
then
if random(100000)=99
then
novao:=true;


if random(1000)=99
then
if (fzeit=0) and (fexplo=0)
then
begin
fzeit:=1;
fx:=random(750);
fy:=-50;
fschild:=50;
fvx:=0;
fvy:=10;
fkurs:=18;
end;

if fzeit<>0
then
begin


fe[1]:=round(sqr(x[1]-fx)+sqr(y[1]-fy));
fe[2]:=round(sqr(x[2]-fx)+sqr(y[2]-fy));

if fe[1]<fe[2]
then
begin
zx:=x[1];
zy:=y[1];
end
else
begin
zx:=x[2];
zy:=y[2];
end;

if sqr(fx-zx)+sqr(fy-zy)>1000
then
begin
aaa:=fx-zx ;
bbb:=fy-zy ;
alpha:=arctan2(bbb,aaa);
alpha:=(alpha*18/PI)   ;
fkurs:=round(alpha)   ;
fkurs:=fkurs-9;
end;

if fkurs<0
then
fkurs:=fkurs+36;

if fkurs>35
then
fkurs:=fkurs-36;

if fkurs<0
then
fkurs:=fkurs+36;

if fkurs>35
then
fkurs:=fkurs-36;


if (fzeit mod 10)=1
then
begin
eee:= (round(fzeit/10) mod 10 );

if (eee>0) and (eee<11)
then
if fsch[eee]=false
then
begin
Mediaplayer1.play;
fsch[eee]:=true;
fsx[eee]:=fx;
fsy[eee]:=fy;
fskurs[eee]:=fkurs;
fsvx[eee]:=(sd[fskurs[eee]]*25);
fsvy[eee]:=(cd[fskurs[eee]]*-25);
fszeit[eee]:=0;
end;
end;


for eee:=1 to 10 do
if fsch[eee]=true
then
begin
            {
fsx[eee]:=(fsx[eee]+(sd[fskurs[eee]]*25));
fsy[eee]:=(fsy[eee]+(cd[fskurs[eee]]*-25));        }
inc(fszeit[eee]);


wgx:=fsx[eee];
wgy:=fsy[eee];
waffgrav;
fsvx[eee]:=fsvx[eee]+wgx;
fsvy[eee]:=fsvy[eee]+wgy;
fsx[eee]:=fsx[eee]+fsvx[eee];
fsy[eee]:=fsy[eee]+fsvy[eee];

for e:=1 to 2 do
if sqr(x[e]-fsx[eee])+sqr(y[e]-fsy[eee])<sqr(treffdick[anderer]+3)
then
begin
fsch[eee]:=false;
fszeit[eee]:=74;
if sschil[e]=false
then
schild[e]:=schild[e]-15;
end;

i:=1;
Waffkolli(fsx[eee],fsy[eee]);
if wktreff=true
then
fsch[eee]:=false;


i:=2;
Waffkolli(fsx[eee],fsy[eee]);
if wktreff=true
then
fsch[eee]:=false;

                  {
canvas.draw(round(fsx[i]),round(fsy[i]),torp[13]);   }

if fszeit[eee]=75
then
fsch[eee]:=false;

if fsch[eee]=false
then
fszeit[eee]:=74;

end;

if   sqr(fx-zx)+sqr(fy-zy)>10000
then
begin
fvx:=(fvx+(sd[fkurs]*1));
fvy:=(fvy+(cd[fkurs]*-1));
end;

fvx:=fvx/8*7;
fvy:=fvy/8*7;

fx:=fx+fvx;
fy:=fy+fvy;              {
 canvas.draw(round(fax),round(fay),antifeind);
canvas.draw(round(fx),round(fy),feind);     }
inc(fzeit);



 

if (eveon=true) and (novao=true)
 then
if (sqr(sx-fx)+sqr(sy-fy))<sqr(novazeit)
then
fschild:=fschild-50;



{for e:=1 to 2 do
if sqr(fx-x[e])+sqr(fy-y[e])<500
then
begin
fvx:=fvx*-1;
fvy:=fvy*-1;
fx:=(fx+(sd[fkurs]*3));
fy:=(fy+(cd[fkurs]*-3));
end;    }

   if sunon=true
  then
 if (sqr(sx-fx)+sqr(sy-fy)<600)
 then
fschild:=fschild-15;
    for u:=1 to 2 do
    begin
    if (subexist[u]=true) and (subzeit[u]>100)
    then
 if (sqr(subx[u]-fx)+sqr(suby[u]-fy))<sqr(subzeit[u]-100)
 then
fschild:=fschild-5;
end;


if (nebon=true) and (noneb>0)
then
for u:=1 to 1000 do
if npe[u]=true
then
if sqr(nxs[u]+70-fx)+sqr(nys[u]+70-fy)<1000
then
fschild:=fschild-2;

    if anoon=true
    then
 if (sqr(anox-fx)+sqr(anoy-fy)<200)
 then
fschild:=fschild-10;

  if astroon=true
    then
 For u:=1 to 10 do
 if (sqr(astx[u]-fx)+sqr(asty[u]-fy)<40)
 then
 begin
fschild:=fschild-5;
fvx:=fvx*-1;
fvy:=fvy*-1;
fx:=(fx+(sd[fkurs]*3));
fy:=(fy+(cd[fkurs]*-3));
 end;

For u:=1 to 5 do
if asthexist[u]=true
then
if (sqr(asthx[u]-fx)+sqr(asthy[u]-fy)<50)
then
begin
fschild:=fschild-5;
fvx:=fvx*-1;
fvy:=fvy*-1;
fx:=(fx+(sd[fkurs]*3));
fy:=(fy+(cd[fkurs]*-3));
end;

if fschild<0
then
begin
fzeit:=1000;

end;

if fzeit=1000
then
begin
fzeit:=0;
for i:=1 to 10 do
begin
fszeit[i]:=74;
fsch[i]:=false;
end;
fexplo:=1;
end;


end;






//Astroiden




if random(1000)=99
then
if astlos=false
then
astlos:=true;

if astlos=true
then
for i:=1 to 5 do
begin
if asthexist[i]=false
then
begin
asthexist[i]:=true;
asthx[i]:=10;
asthy[i]:=random(500)+50;
asthvx[i]:=random(3)+1;
asthvy[i]:=random(3)-1;
astsd[i]:=false;
astlos:=false;
end;
end;

for i:=1 to 5 do
begin
if asthexist[i]=true
then
begin



wgx:=asthx[i];
wgy:=asthy[i];
waffgrav;
asthvx[i]:=asthvx[i]+wgx;
asthvy[i]:=asthvy[i]+wgy;

if asthvy[i]>100
then
asthvy[i]:=100;

if asthvx[i]>100
then
asthvx[i]:=100;

if asthvy[i]<-100
then
asthvy[i]:=-100;

if asthvx[i]<-100
then
asthvx[i]:=-100;


asthx[i]:=asthx[i]+asthvx[i];
asthy[i]:=asthy[i]+asthvy[i];


      {
canvas.draw(round(asthax[i]-7),round(asthay[i]-7),sch);
canvas.draw(round(asthx[i]-7),round(asthy[i]-7),astr4);

if sqr()+sqr()<
then
begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;                      }



for u:=1 to 2 do
    begin
    if (subexist[u]=true) and (subzeit[u]>100)
    then
 if (sqr(subx[u]-asthx[i])+sqr(suby[u]-asthy[i]))<sqr(subzeit[u]-100)
 then
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;


 if sunon=true
  then
 if (sqr(sx-asthx[i])+sqr(sy-asthy[i])<1200)
 then
 begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
  end;



   if anoon=true
    then
 if (sqr(anox-asthx[i])+sqr(anoy-asthy[i])<800)
 then
begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;

   if astroon=true
    then
 For e:=1 to 10 do
 begin
 if (sqr(astx[e]-asthx[i])+sqr(asty[e]-asthy[i])<250)
 then
 begin
sund:=true;
asthvx[i]:=asthvx[i]*(-1);
asthvy[i]:=asthvy[i]*(-1);
asthx[i]:=asthx[i]+3*asthvx[i];
asthy[i]:=asthy[i]+3*asthvy[i];
 end;
  end;



 if novao=true
then
if (sqr(sx-asthx[i])+sqr(sy-asthy[i]))<sqr(novazeit)
then
begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;

if asthx[i]<5
then
begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;

if asthy[i]<5
then
begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;

if asthx[i]>745
then
begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;

if asthy[i]>595
then
begin
asthexist[i]:=false;
astsd[i]:=true;
sund:=true;
end;


end;


end;



end;





Procedure Tform1.Init;
begin

for i:=1 to 2 do
for u:=0 to 35 do
begin
bild[i,u].destroy;
end;


   // Init

       sgra:=2500;
  MediaPlayer1.FileName :='sounds/beep.wav';
MediaPlayer1.DeviceType:=dtWaveAudio;
Mediaplayer1.Open;


  neb.canvas.Brush.color:=clblack;
neb.canvas.pen.color:=clblack;
neb.canvas.fillrect(rect(0,0,neb.width,neb.height));


canvas.brush.color:=clblack;
canvas.FillRect(Rect(0,0,750,600));

Playwert1.canvas.brush.color:=clblack;
Playwert1.canvas.FillRect(Rect(0,0,40,190));
Playwert2.canvas.brush.color:=clblack;
Playwert2.canvas.FillRect(Rect(0,0,40,190));

Paintbox1.canvas.brush.color:=clblack;
Paintbox1.canvas.FillRect(Rect(0,0,40,40));
Paintbox2.canvas.brush.color:=clblack;
Paintbox2.canvas.FillRect(Rect(0,0,40,40));

if schild[1]<=0
then
inc(punkte[2]);

if schild[2]<=0
then
inc(punkte[1]);

if (schild[1]<=0) and( schild[2]<=0 )
then
begin
dec(punkte[1]);
dec(punkte[2]);
end;



for i:=1 to 2 do
begin
vx[i]:=0;
vy[i]:=0;
end;

 Schiff[1]:=0;
 Schiff[2]:=0;

        ggaz:=0;


      two:=false;
      ntwo:=false;

 wag:=550;
for i:=0 to 255 do
if getasynckeystate(i)<>0
then
e:=0;

      akt:=0;


for i:=1 to 5 do
begin
astsd[i]:=false;
asthexist[i]:=false;
asthx[i]:=-10;
asthy[i]:=-10;
end;
fx:=0;
fy:=0;

fkurs:=0;
fakurs:=0;
fvx:=0;
fvy:=0;
fzeit:=0;
fexplo:=0;

for i:=1 to 10 do
begin
fsch[i]:=false;
fsx[i]:=0;
fsy[i]:=0;
fskurs[i]:=0;
fszeit[i]:=0;
end;




change:=false;

     novao:=false;
     novazeit:=0;
     nt:=1;
     noneb:=0;

      for i:=1 to 2 do
      begin
      tfeuer[i]:=false;
      bumm[i]:=false;
      lfeuer[i]:=false;
      feuermode[i]:=1;
      fmt[i]:=0;
      lpos[i]:=1;
      bpos[i]:=1;
      bummzeit[i]:=0;
      For e:=1 to 3 do
     begin
       lx[i,e]:=0;
       ly[i,e]:=0;
  lzeit[i,e]:=0;
  ltreff[i,e]:=0;
  lkurs[i,e]:=0;
    lexist[i,e]:=false;
       end;
       for e:=1 to 10 do
       begin
       tlade[i,e]:=200-(10*(e+5));
       texist[i,e]:=false;
       blade[i,e]:=e*5;
       bexist[i,e]:=false;
       bx[i,e]:=0;
       bax[i,e]:=0;

       by[i,e]:=0;
       bay[i,e]:=0;

       end;
           tpos[i]:=1;
      shutzeit[i]:=0;
      shutexist[i]:=false;
      shutx[i]:=0;
      shuty[i]:=0;
      shutkurs[i]:=0;
      swx[i]:=0;
      shutld[i]:=false;
      swy[i]:=0;
      swkurs[i]:=0;
      swzeit[i]:=0;
      swexist[i]:=false;
      subx[i]:=0;
      swtreff[i]:=false;
      suby[i]:=0;
      pkurs[i]:=0;
      subzeit[i]:=0;
      sperr[i]:=false;
      subkurs[i]:=0;
      subexist[i]:=false;
     ssch2check[i]:=false;
            tarn[i]:=false;
       sschaus[i]:=false;
       uberm[i]:=false;
             rauch[i]:=false;
             tarnzeit[i]:=0;
           espez[i]:=150;
           slipx[i]:=0;
           slipy[i]:=0;
           slipx2[i]:=0;
           slipy2[i]:=0;
           slipexist[i]:=false;
           slipzeit[i]:=0;
           mpos[i]:=1;
           aschil[i]:=0;
           sschil[i]:=false;
           px[i]:=0;
           py[i]:=0;
           pexist[i]:=false;
           pzeit[i]:=0;
           ptreff[i]:=0;
           For e:=1 to 10 do
           begin
           my[i,e]:=0;
           mx[i,e]:=0;
           mzeit[i,e]:=0;
           mexist[i,e]:=false;
           mtreff[i,e]:=0;
           end;

     end;

      two:=false;
      ntwo:=false;

 {wag:=550;   }
for i:=0 to 255 do
if getasynckeystate(i)<>0
then
e:=0;

akt:=0;




for i:=1 to 250 do
begin
starx[i]:=random(750);
stary[i]:=random(600);
end;
 x[1]:=100;
 y[1]:=300;
 kurs[1]:=9;
 v[1]:=0;
 x[2]:=650;
 y[2]:=300;
 kurs[2]:=27;
 v[2]:=0;


sund:=true;


for i:=1 to 2 do
begin
vx[i]:=0;
vy[i]:=0;
end;

{

 ggaz:=0;


  anox:=100;
  anoy:=100;

  wx1:=250;
  wy1:=100 ;
  wx2:=700  ;
  wy2:=500   ;


wax:=375;
way:=300;

  For i:=1 to 10 do
  begin
  astx[i]:=400+random(200);
  asty[i]:=400+random(200);
   end;     

 sx:=400+random(200);


 sy:=100+random(100);
                    }













for i:=1 to 2 do
begin
schild[i]:=500;
vis[i]:=true;

end;

  {nx:=100;
  ny:=450;    }


    warten:=-1;


    {
   For i:=1 to 1000 do

 begin
nx:=nx+random(5)-2;
ny:=ny+random(5)-2;
npx[i]:=nx+random(51)+sqr(random(10));
npy[i]:=ny+random(51)+sqr(random(10));
npc[i]:=100000000*Random(10);
npe[i]:=true;
nxs[i]:=nx;
nys[i]:=ny;
 end;          }
 spez[1]:=false;
 spez[2]:=false;

 
   schiff[1]:=0;
   schiff[2]:=0;
   schwa:=true;

   Scrollbar1.visible:=true;

with Label9 do
begin
caption:='Ship 1';
Top:=100;
Left:=40;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label24 do
begin
Top:=328;
Left:=16;
caption:='gamespeed';
visible:=true;
Font.color:=clFuchsia;
Height:=15;
Width:=59;
end;

with Label10 do
begin
caption:='Ship 2';
Top:=100;
Left:=140;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label11 do
begin
caption:='Ship 3';
Top:=100;
Left:=240;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label12 do
begin
caption:='Ship 4';
Top:=100;
Left:=340;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label13 do
begin
caption:='Ship 5';
Top:=100;
Left:=440;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label14 do
begin
caption:='Ship 6';
Top:=100;
Left:=540;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label15 do
begin
caption:='Ship 12';
Top:=250;
Left:=540;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=50;
end;

with Label16 do
begin
caption:='Ship 11';
Top:=250;
Left:=440;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=50;
end;

with Label17 do
begin
caption:='Ship 10';
Top:=250;
Left:=340;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=50;
end;

with Label18 do
begin
caption:='Ship 9';
Top:=250;
Left:=240;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label19 do
begin
caption:='Ship 8';
Top:=250;
Left:=140;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

with Label20 do
begin
caption:='Ship 7';
Top:=250;
Left:=40;
Visible:=true;
Height:=13;
Font.color:=clred;
Width:=43;
end;

Label23.caption:='STARFIGHT by';

with Label22 do
begin
caption:='';
Top:=0;
Left:=0;
Visible:=true;
Height:=29;
Width:=8;
end;

Panel3.Visible:=true;
Panel4.Visible:=true;
Panel5.Visible:=true;
Panel6.Visible:=true;
Panel7.Visible:=true;
Panel8.Visible:=true;
panel9.Visible:=true;
panel10.Visible:=true;
Panel11.Visible:=true;
Panel12.Visible:=true;
Panel13.Visible:=true;
Panel14.Visible:=true;
Panel15.Visible:=true;
Panel16.Visible:=true;
Panel17.Visible:=true;


  if computer=true
then
schiff[2]:=random(12)+1;
schwa:=true;

label8.caption:='';
label21.caption:='';
label8.caption:=inttostr(punkte[2]);
label21.caption:=inttostr(punkte[1]);

        neuint:=true;
      {
MediaPlayer2.FileName :='sounds/beep.wav';
MediaPlayer2.DeviceType:=dtWaveAudio;
Mediaplayer2.Open;     }


               {
        for i:=1 to 35 do   begin


j[i]:=Tbitmap.create;
j[i].height:=1;
j[i].width:=1;

a[i]:=Tbitmap.create;
a[i].height:=1;
a[i].width:=1;

g[i]:=Tbitmap.create;
g[i].height:=1;
g[i].width:=1;

t[i]:=Tbitmap.create;
t[i].height:=1;
t[i].width:=1;

h[i]:=Tbitmap.create;
h[i].height:=1;
h[i].width:=1;

b[i]:=Tbitmap.create;
b[i].height:=1;
b[i].width:=1;

es[i]:=Tbitmap.create;
es[i].height:=1;
es[i].width:=1;

ww[i]:=Tbitmap.create;
ww[i].height:=1;
ww[i].width:=1;

vv[i]:=Tbitmap.create;
vv[i].height:=1;
vv[i].width:=1;

m[i]:=Tbitmap.create;
m[i].height:=1;
m[i].width:=1;

ss[i]:=Tbitmap.create;
ss[i].height:=1;
ss[i].width:=1;

f[i]:=Tbitmap.create;
f[i].height:=1;
f[i].width:=1;



 end;        }




end;















procedure TForm1.Panel11Click(Sender: TObject);
begin

     mediaplayer1.play;
          changedisplaySettings(Tdevmode(zz),0);
close;

end;

procedure TForm1.Panel13Click(Sender: TObject);
begin
     mediaplayer1.play;
punkte[1]:=0;
punkte[2]:=0;
label8.caption:='';
Label21.caption:='';
label8.caption:=inttostr(punkte[2]);
Label21.caption:=inttostr(punkte[1]);
end;

procedure TForm1.Panel14Click(Sender: TObject);
begin
     mediaplayer1.play;
schwa:=true;
fenster:=TForm.create(self);
Fenster.parent:=Form1;
fenster.visible:=true;
fenster.top:=50;
fenster.left:=50;
fenster.height:=400;
fenster.width:=300;
Fenster.color:=clgray;
fenster.borderStyle:=bsdialog;
fenster.Caption:='Help';
fenster.cursor:=crArrow;
fenster.Formstyle:=fsStayOnTop;

hilf:=TMemo.create(self);
Hilf.parent:=fenster;
Hilf.visible:=true;
Hilf.top:=5;
Hilf.left:=5;
Hilf.height:=310;
hilf.width:=280;
hilf.readonly:=true;
hilf.maxlength:=100;
hilf.ScrollBars:=ssvertical;
Hilf.lines.loadfromfile('help/help.txt');



beend:=TPanel.create(self);
beend.parent:=fenster;
beend.top:=320;
beend.left:=5;
beend.width:=280;
beend.height:=50;
beend.caption:='CLOSE';
beend.color:=ClSilver;
beend.Font.color:=clred;
beend.onclick:=beendClick;
beend.cursor:=crHandpoint;
beend.visible:=true;

Form1.visible:=false;
Form1.enabled:=false;
end;

    procedure TForm1.beendClick(Sender: TObject);
    begin
      mediaplayer1.play;
    fenster.visible:=false;
    schwa:=true;
    Form1.visible:=true;
    Form1.enabled:=true;
    end;


procedure TForm1.Panel15Click(Sender: TObject);
begin
pressstart:=true;
      mediaplayer1.play;
Scrollbar1.visible:=false;
end;

procedure TForm1.Panel17Click(Sender: TObject);
begin
     mediaplayer1.play;
schwa:=true;
form2.visible:=true;



       {
        tastdatei:file of Ttasta;
  tastlese:Ttasta;
  Ttasta = record
  ende,gpause:char;
  gas,halt,links,rechts,laserf,torpf,spezein,spezaus,fmodus:array[1..2] of char;
  end;
assignfile(tastdatei,'key.cfg');   }
                           {
tastwert:=Tlistbox.create(self);
tastwert.parent:=keyhelp;
tastwert.visible:=true;
tastwert.top:=5;
tastwert.left:=5;
tastwert.height:=310;
tastwert.width:=280;



tastwert.items.add(char(tastlese.ende));
tastwert.items.add(char(tastlese.gpause));

tastwert.items.add(char(tastlese.gas[1]));
tastwert.items.add(char(tastlese.halt[1]));
tastwert.items.add(char(tastlese.links[1]));
tastwert.items.add(char(tastlese.rechts[1]));
tastwert.items.add(char(tastlese.laserf[1]));
tastwert.items.add(char(tastlese.torpf[1]));
tastwert.items.add(char(tastlese.spezein[1]));
tastwert.items.add(char(tastlese.spezaus[1]));
tastwert.items.add(char(tastlese.fmodus[1]));

tastwert.items.add(char(tastlese.gas[2]));
tastwert.items.add(char(tastlese.halt[2]));
tastwert.items.add(char(tastlese.links[2]));
tastwert.items.add(char(tastlese.rechts[2]));
tastwert.items.add(char(tastlese.laserf[2]));
tastwert.items.add(char(tastlese.torpf[2]));
tastwert.items.add(char(tastlese.spezein[2]));
tastwert.items.add(char(tastlese.spezaus[2]));
tastwert.items.add(char(tastlese.fmodus[2]));     }


          {
newtast,keysave,orginal  }







keyeingab:=-10;
  zwischtast:=tastlese;    
Form1.visible:=false;
Form1.enabled:=false;
end;

    procedure TForm1.kendeClick;
    begin
      mediaplayer1.play;
        schwa:=true;
    Form1.visible:=true;
    Form1.enabled:=true;
    end;

        procedure TForm1.mendeClick(sender:TObject);
    begin
      mediaplayer1.play;
    mapedit.visible:=false;
    schwa:=true;
    Form1.visible:=true;
    Form1.enabled:=true;
    mapneb.destroy;
    mpuffer.destroy;
    mapship.destroy;
    end;



procedure TForm1.Panel16Click(Sender: TObject);
begin
     mediaplayer1.play;
schwa:=true;
mapedit:=TForm.create(self);
mapedit.parent:=Form1;
mapedit.visible:=true;
mapedit.top:=50;
mapedit.left:=50;
mapedit.height:=500;
mapedit.width:=700;
mapedit.color:=clBlack;
mapedit.borderStyle:=bsdialog;
mapedit.Caption:='map editor';
mapedit.cursor:=crArrow;
mapedit.Formstyle:=fsStayOnTop;

mende:=TPanel.create(self);
mende.parent:=mapedit;
mende.top:=420;
mende.left:=5;
mende.width:=75;
mende.height:=50;
mende.caption:='CLOSE';
mende.color:=ClSilver;
mende.Font.color:=clred;
mende.onclick:=mendeClick;
mende.cursor:=crHandpoint;
mende.visible:=true;

karte:=TPaintbox.create(self);
karte.parent:=mapedit;
karte.top:=5;
karte.left:=5 ;
karte.height:=300;
karte.width:=375;
karte.color:=clBlack;
karte.cursor:=crCross;
karte.onMousedown:=setposition;
karte.onmousemove:=mpnow;
karte.visible:=true;  {
Canvas.brush.color:=clblack;
canvas.pen.color:=clred;
canvas.rectangle(4,4,351,426);
newmap,savemap,loadmap             }

newmap:=TPanel.create(self);
newmap.parent:=mapedit;
newmap.top:=420;
newmap.left:=105;
newmap.width:=75;
newmap.height:=50;
newmap.caption:='NEW MAP';
newmap.color:=ClSilver;
newmap.Font.color:=clred;
newmap.onclick:=newmapClick;
newmap.cursor:=crHandpoint;
newmap.visible:=true;

savemap:=TPanel.create(self);
savemap.parent:=mapedit;
savemap.top:=420;
savemap.left:=205;
savemap.width:=75;
savemap.height:=50;
savemap.caption:='SAVE MAP';
savemap.color:=ClSilver;
savemap.Font.color:=clred;
savemap.onclick:=savemapClick;
savemap.cursor:=crHandpoint;
savemap.visible:=true;

loadmap:=TPanel.create(self);
loadmap.parent:=mapedit;
loadmap.top:=420;
loadmap.left:=305;
loadmap.width:=75;
loadmap.height:=50;
loadmap.caption:='LOAD MAP';
loadmap.color:=ClSilver;
loadmap.Font.color:=clred;
loadmap.onclick:=loadmapClick;
loadmap.cursor:=crHandpoint;
loadmap.visible:=true;


mapfgame:=TPanel.create(self);
mapfgame.parent:=mapedit;
mapfgame.top:=420;
mapfgame.left:=405;
mapfgame.width:=175;
mapfgame.height:=50;
mapfgame.caption:='TAKE THIS MAP FOR GAME';
mapfgame.color:=ClSilver;
mapfgame.Font.color:=clred;
mapfgame.onclick:=mapfgameClick;
mapfgame.cursor:=crHandpoint;
mapfgame.visible:=true;

korrdinat:=TLabel.create(self);
korrdinat.parent:=mapedit;
korrdinat.top:=200;
korrdinat.left:=450;
korrdinat.width:=75;
korrdinat.height:=25;
korrdinat.caption:='';
korrdinat.color:=CLblack;
korrdinat.font.color:=ClRed;
korrdinat.visible:=true;




sonne:=TPanel.create(self);
sonne.parent:=mapedit;
sonne.top:=25;
sonne.left:=600;
sonne.width:=75;
sonne.height:=50;
sonne.caption:='put sun';
sonne.color:=clgray;
sonne.Font.color:=cllime;
sonne.onclick:=sonneClick;
sonne.cursor:=crHandpoint;
sonne.visible:=true;
sonne.enabled:=false;

astroiden:=TPanel.create(self);
astroiden.parent:=mapedit;
astroiden.top:=100;
astroiden.left:=600;
astroiden.width:=75;
astroiden.height:=50;
astroiden.caption:='put astroid 1';
astroiden.color:=clgray;
astroiden.Font.color:=cllime;
astroiden.onclick:=astroidenClick;
astroiden.cursor:=crHandpoint;
astroiden.visible:=true;
astroiden.enabled:=false;

anomalie:=TPanel.create(self);
anomalie.parent:=mapedit;
anomalie.top:=175;
anomalie.left:=600;
anomalie.width:=75;
anomalie.height:=50;
anomalie.caption:='put anomalie';
anomalie.color:=clgray;
anomalie.Font.color:=cllime;
anomalie.onclick:=anomalieClick;
anomalie.cursor:=crHandpoint;
anomalie.visible:=true;
anomalie.enabled:=false;

loch:=TPanel.create(self);
loch.parent:=mapedit;
loch.top:=250;
loch.left:=600;
loch.width:=75;
loch.height:=50;
loch.caption:='put black hole';
loch.color:=clgray;
loch.Font.color:=cllime;
loch.onclick:=lochClick;
loch.cursor:=crHandpoint;
loch.visible:=true;
loch.enabled:=false;

nebel:=TPanel.create(self);
nebel.parent:=mapedit;
nebel.top:=325;
nebel.left:=600;
nebel.width:=75;
nebel.height:=50;
nebel.caption:='put nebula';
nebel.color:=clgray;
nebel.Font.color:=cllime;
nebel.onclick:=nebelClick;
nebel.cursor:=crHandpoint;
nebel.visible:=true;
nebel.enabled:=false;

raumschiff:=TPanel.create(self);
raumschiff.parent:=mapedit;
raumschiff.top:=400;
raumschiff.left:=600;
raumschiff.width:=75;
raumschiff.height:=50;
raumschiff.caption:='put ship 1';
raumschiff.color:=clgray;
raumschiff.Font.color:=cllime;
raumschiff.onclick:=raumschiffClick;
raumschiff.cursor:=crHandpoint;
raumschiff.visible:=true;
raumschiff.enabled:=false;

     setzen:=0;

mapneb:=tbitmap.create;
mapneb.loadfromfile('objects/nebula.bmp');
mapneb.Transparent:=true;
mapneb.TransParentColor:=clblack;
mapneb.TransparentMode := tmAuto;

     astronum:=0;
   msx:=-100;
   msy:=-100;
   manox:=-100;
   manoy:=-100;
   mwax:=-100;
   mway:=-100;
   mnx:=-100;
   mny:=-100;
   for i:=1 to 2 do
   begin
  mschiffsx[i]:=-100;
  mschiffsy[i]:=-100;
  end;
for i:=1 to 10 do
begin
mastx[i]:=-100;
masty[i]:=-100;
end;

mapship:=tbitmap.create;
mapship.loadfromfile('objects/ship.bmp');
mapship.Transparent:=true;
mapship.TransParentColor:=clblack;
mapship.TransparentMode := tmAuto;

mpuffer:=TBitmap.create;
mpuffer.height:=karte.height;
mpuffer.width:=karte.width;
mpuffer.Canvas.brush.color:=clblack;
mpuffer.canvas.pen.color:=clred;
mpuffer.canvas.rectangle(0,0,375,300);

Form1.visible:=false;
Form1.enabled:=false;
end;


 procedure TForm1.newmapClick(Sender: TObject);
 begin
      mediaplayer1.play;
mpuffer:=TBitmap.create;
mpuffer.height:=karte.height;
mpuffer.width:=karte.width;
mpuffer.Canvas.brush.color:=clblack;
mpuffer.canvas.pen.color:=clred;
mpuffer.canvas.rectangle(0,0,375,300);

sonne.enabled:=true;
astroiden.enabled:=true;
anomalie.enabled:=true;
loch.enabled:=true;
nebel.enabled:=true;
raumschiff.enabled:=true;


     astronum:=0;
   msx:=-100;
   msy:=-100;
   manox:=-100;
   manoy:=-100;
   mwax:=-100;
   mway:=-100;
   mnx:=-100;
   mny:=-100;
   for i:=1 to 2 do
   begin
  mschiffsx[i]:=-100;
  mschiffsy[i]:=-100;
  end;
for i:=1 to 10 do
begin
mastx[i]:=-100;
masty[i]:=-100;
end;

karte.Canvas.brush.color:=clblack;
karte.canvas.pen.color:=clred;
karte.canvas.rectangle(0,0,375,300);

 end;

  procedure TForm1.loadmapClick(Sender: TObject);
 var lang:integer;
 helpi,verz:string;
 begin
      mediaplayer1.play;
  getDir(0,verz);
if OpenDialog1.Execute
then
begin
auswahldat:=OpenDialog1.FileName;
lang:=length(auswahldat);
helpi:=auswahldat;
auswahldat:='';
for i:=1 to lang-4 do
auswahldat:=auswahldat+helpi[i];
   {
mpuffer.loadfromfile(auswahldat+'b.bmp'); }
AssignFile(datei, auswahldat+'.smp');

Reset(datei);
While EOF(datei)=false do
begin
Read(datei,lese);
end;
CloseFile(datei);
 msx:=lese.msx;
   msy:=lese.msy;
   manox:=lese.manox;
   manoy:=lese.manoy;
   mwax:=lese.mwax;
   mway:=lese.mway;
   mnx:=lese.mnx;
   mny:=lese.mny;                 
   for i:=1 to 2 do
   begin
  mschiffsx[i]:=lese.mschiffsx[i];
  mschiffsy[i]:=lese.mschiffsy[i];
  end;
for i:=1 to 10 do
begin
mastx[i]:=lese.mastx[i];
masty[i]:=lese.masty[i];
end;

mpuffer:=TBitmap.create;
mpuffer.height:=karte.height;
mpuffer.width:=karte.width;
mpuffer.Canvas.brush.color:=clblack;
mpuffer.canvas.pen.color:=clred;
mpuffer.canvas.rectangle(0,0,375,300);

mpuffer.canvas.StretchDraw(rect((msx div 2)-12,(msy div 2)-12,(msx div 2)+12,(msy div 2)+12 ),sun)  ;

for i:=1 to 5 do
mpuffer.canvas.StretchDraw(rect((mastx[i] div 2)-2,(masty[i] div 2)-2,(mastx[i] div 2)+2,(masty[i] div 2)+2),astr1);
for i:=5 to 8 do
mpuffer.canvas.StretchDraw(rect((mastx[i] div 2)-2,(masty[i] div 2)-2,(mastx[i] div 2)+2,(masty[i] div 2)+2),astr2);
For i:=9 to 10 do
mpuffer.canvas.StretchDraw(rect((mastx[i] div 2)-2,(masty[i] div 2)-2,(mastx[i] div 2)+2,(masty[i] div 2)+2),astr3);

mpuffer.canvas.StretchDraw(rect((manox div 2)-7,(manoy div 2)-7,(manox div 2)+7,(manoy div 2)+7),ano);

mpuffer.canvas.pixels[mwax div 2,mway div 2]:=cllime;


mpuffer.canvas.StretchDraw(rect((mnx div 2)-40,(mny div 2)-40,(mnx div 2)+40,(mny div 2)+40),mapneb);

for i:=1 to 2 do
mpuffer.canvas.draw((mschiffsx[i] div 2)-13,(mschiffsy[i] div 2)-13,mapship);




  karte.canvas.Draw(0,0,mpuffer);
end;
 ChDir(verz);
 end;

 

  procedure TForm1.savemapClick(Sender: TObject);
  var verz:string;
 begin
       mediaplayer1.play;
 GetDir(0,verz);
if SaveDialog1.Execute
then
begin
 lese.msx:=msx;
   lese.msy:=msy;
   lese.manox:=manox;
   lese.manoy:=manoy;
   lese.mwax:=mwax;
   lese.mway:=mway;
   lese.mnx:=mnx;
   lese.mny:=mny;
   for i:=1 to 2 do
   begin
  lese.mschiffsx[i]:=mschiffsx[i];
  lese.mschiffsy[i]:=mschiffsy[i];
  end;
for i:=1 to 10 do
begin
lese.mastx[i]:=mastx[i];
lese.masty[i]:=masty[i];
end;
auswahldat:=SaveDialog1.FileName;



AssignFile(datei, auswahldat+'.smp');
Rewrite(datei);
write(datei,lese);
CloseFile(datei);
                {
SaveDialog1.DefaultExt := GraphicExtension(TBitmap);
SaveDialog1.Filter := GraphicFilter(TBitmap); 

mpuffer.savetofile(auswahldat+'b.bmp');      }

end;
  ChDir(verz);
 end;


   procedure TForm1.mapfgameClick(Sender: TObject);
 begin
       mediaplayer1.play;
 if msx>0
 then
 sx:=msx
 else
 sunon:=false;

  if msy>0
 then
 sy:=msy
 else
 sunon:=false;

   if manox>0
   then
   anox:=manox
   else
   anoon:=false;

     if manoy>0
   then
   anoy:=manoy
   else
   anoon:=false;

if mwax>0
then
wax:=mwax
else
lochon:=false;

if mway>0
then
way:=mway
else
lochon:=false;

if mnx>0
then
nx:=mnx
else
nebon:=false;

if mny>0
then
ny:=mny
else
nebon:=false;

  
for i:=1 to 2 do
begin
if mschiffsx[i]>0
then
begin
x[i]:=mschiffsx[i];
mmschiffsx[i]:=mschiffsx[i];
end;

if mschiffsy[i]>0
then
begin
y[i]:=mschiffsy[i];
mmschiffsy[i]:=mschiffsy[i];
end;

kurs[i]:=random(36);

end;

for i:=1 to 10 do
begin
if astx[i]>0
then
astx[i]:=mastx[i];

if asty[i]>0
then
asty[i]:=masty[i];
end;



 end;



 procedure Tform1.sonneClick(Sender: TObject);
 begin
setzen:=1;
sonne.enabled:=false;
      mediaplayer1.play;
 end;


   procedure Tform1.astroidenClick(Sender: TObject);
    begin
          mediaplayer1.play;
setzen:=2;
inc(astronum);
if astronum=10
then
astroiden.enabled:=false
else
astroiden.caption:='put astroid '+inttostr(astronum+1);


 end;

    procedure Tform1.anomalieClick(Sender: TObject);
     begin
           mediaplayer1.play;
setzen:=3;
anomalie.enabled:=false;
 end;

    procedure Tform1.lochClick(Sender: TObject);
     begin
           mediaplayer1.play;
setzen:=4;
loch.enabled:=false;
 end;

    procedure Tform1.nebelClick(Sender: TObject);
     begin
           mediaplayer1.play;
setzen:=5;
nebel.enabled:=false;
 end;

    procedure Tform1.raumschiffClick(Sender: TObject);
     begin
           mediaplayer1.play;
if raumschiff.caption='put ship 1'
then
begin
setzen:=6;
raumschiff.caption:='put ship 2';
end
else
begin
raumschiff.enabled:=false;
setzen:=7;
end;

 end;


     procedure Tform1.setposition(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      begin
case setzen of
1:begin
msx:=x*2;
msy:=y*2;
mpuffer.canvas.StretchDraw(rect(x-12,y-12,x+12,y+12),sun)  ;
end;
2:begin
mastx[astronum]:=x*2;
masty[astronum]:=y*2;
if astronum>8
then
mpuffer.canvas.StretchDraw(rect(x-3,y-3,x+3,y+3),astr3)
else
if astronum>5
then
mpuffer.canvas.StretchDraw(rect(x-2,y-2,x+2,y+2),astr2)
else
mpuffer.canvas.StretchDraw(rect(x-2,y-2,x+2,y+2),astr1);
end;
3:begin
manox:=x*2;
manoy:=y*2;
mpuffer.canvas.StretchDraw(rect(x-7,y-7,x+7,y+7),ano);
end;
4:begin
mwax:=x*2;
mway:=y*2;
mpuffer.canvas.pixels[x,y]:=cllime;
end;
5:begin
mnx:=x*2;
mny:=y*2;
mpuffer.canvas.StretchDraw(rect(x-40,y-40,x+40,y+40),mapneb);
end;
6:begin
mschiffsx[1]:=x*2;
mschiffsy[1]:=y*2;
mpuffer.canvas.draw(x-13,y-13,mapship);
end;
7:begin
mschiffsx[2]:=x*2;
mschiffsy[2]:=y*2;
mpuffer.canvas.draw(x-13,y-13,mapship);
end;


end;
karte.canvas.draw(0,0,mpuffer);
        setzen:=0;
      end;


procedure TForm1.mpnow(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 korrdinat.caption:=inttostr(x*2)+'/'+inttostr(y*2);
 karte.canvas.draw(0,0,mpuffer);
end;



    procedure TForm1.newtastClick;
    begin
          mediaplayer1.play;
        zwischtast:=tastlese;
        keyeingab:=0;
        form2.tastwert.caption:='quit game';
    end;

    procedure TForm1.keysaveClick;
      begin
      
  form2.tastwert.caption:='';
  tastlese:=zwischtast;
  assignfile(tastdatei,'key.cfg');
  rewrite(tastdatei);
  write(tastdatei,tastlese);
  closefile(tastdatei);
         mediaplayer1.play;
    end;

    procedure TForm1.orginalClick;
      begin
            mediaplayer1.play;
zwischtast.ende:=27;
zwischtast.gpause:=19;

zwischtast.gas[1]:=87;
zwischtast.halt[1]:=83;
zwischtast.links[1]:=65;
zwischtast.rechts[1]:=68;
zwischtast.laserf[1]:=69;
zwischtast.torpf[1]:=81;
zwischtast.spezein[1]:=67;
zwischtast.spezaus[1]:=88;
zwischtast.fmodus[1]:=70;

zwischtast.gas[2]:=38;
zwischtast.halt[2]:=40;
zwischtast.links[2]:=37;
zwischtast.rechts[2]:=39;
zwischtast.laserf[2]:=17;
zwischtast.torpf[2]:=16;
zwischtast.spezein[2]:=96;
zwischtast.spezaus[2]:=97;
zwischtast.fmodus[2]:=98;

 form2.tastwert.caption:='ready to save';

    end;


   procedure TFORM1.FKeyDown(Key: Word);
begin


if  keyeingab<>-10
then
begin



case keyeingab of
0:begin
 zwischtast.ende:=key;
 form2.tastwert.caption:='quit game';
end;
1:begin
form2.tastwert.caption:='pause game';
zwischtast.gpause:=key;
end;
2:begin
form2.tastwert.caption:='Player1 ahead';
zwischtast.gas[1]:=key;
end;
3:begin
form2.tastwert.caption:='Player1 break';
zwischtast.halt[1]:=key;
end;
4:begin
form2.tastwert.caption:='Player1 turn left';
zwischtast.links[1]:=key;
end;
5:begin
form2.tastwert.caption:='Player1 turn right';
zwischtast.rechts[1]:=key;
end;
6:begin
form2.tastwert.caption:='Player1 fire torpedos';
zwischtast.torpf[1]:=key;
end;
7:begin
form2.tastwert.caption:='Player1 fire lasers';
zwischtast.laserf[1]:=key;
end;
8:begin
form2.tastwert.caption:='Player1 change firemode';
zwischtast.fmodus[1]:=key;
end;
9:begin
form2.tastwert.caption:='Player1 engage spezials';
zwischtast.spezein[1]:=key;
end;
10:begin
form2.tastwert.caption:='Player1 disengage spezials';
zwischtast.spezaus[1]:=key;
end;
11:begin
form2.tastwert.caption:='Player2 ahead';
zwischtast.gas[2]:=key;
end;
12:begin
form2.tastwert.caption:='Player2 break';
zwischtast.halt[2]:=key;
end;
13:begin
form2.tastwert.caption:='Player2 turn left';
zwischtast.links[2]:=key;
end;
14:begin
form2.tastwert.caption:='Player2 turn right';
zwischtast.rechts[2]:=key;
end;
15:begin
form2.tastwert.caption:='Player2 fire torpedos';
zwischtast.torpf[2]:=key;
end;
16:begin
form2.tastwert.caption:='Player2 fire lasers';
zwischtast.laserf[2]:=key;
end;
17:begin
form2.tastwert.caption:='Player2 change firemode';
zwischtast.fmodus[2]:=key;
end;
18:begin
form2.tastwert.caption:='Player2 engage spezials';
zwischtast.spezein[2]:=key;
end;
19:begin
form2.tastwert.caption:='Player2 disengage spezials';
zwischtast.spezaus[2]:=key;
end;
20:begin
keyeingab:=-10;
form2.tastwert.caption:='ready to save';
end;

end;



end;
end;


procedure TForm1.pokClick;
begin
          mediaplayer1.play;
if  keyeingab<>-10
then
inc(keyeingab);

case keyeingab of
0:begin

 form2.tastwert.caption:='quit game';
end;
1:begin
form2.tastwert.caption:='pause game';

end;
2:begin
form2.tastwert.caption:='Player1 ahead';

end;
3:begin
form2.tastwert.caption:='Player1 break';

end;
4:begin
form2.tastwert.caption:='Player1 turn left';

end;
5:begin
form2.tastwert.caption:='Player1 turn right';

end;
6:begin
form2.tastwert.caption:='Player1 fire torpedos';

end;
7:begin
form2.tastwert.caption:='Player1 fire lasers';

end;
8:begin
form2.tastwert.caption:='Player1 change firemode';

end;
9:begin
form2.tastwert.caption:='Player1 engage spezials';

end;
10:begin
form2.tastwert.caption:='Player1 disengage spezials';

end;
11:begin
form2.tastwert.caption:='Player2 ahead';

end;
12:begin
form2.tastwert.caption:='Player2 break';

end;
13:begin
form2.tastwert.caption:='Player2 turn left';

end;
14:begin
form2.tastwert.caption:='Player2 turn right';

end;
15:begin
form2.tastwert.caption:='Player2 fire torpedos';

end;
16:begin
form2.tastwert.caption:='Player2 fire lasers';

end;
17:begin
form2.tastwert.caption:='Player2 change firemode';

end;
18:begin
form2.tastwert.caption:='Player2 engage spezials';

end;
19:begin
form2.tastwert.caption:='Player2 disengage spezials';

end;
20:begin
keyeingab:=-10;
form2.tastwert.caption:='ready to save';
end;

end;



end;



procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
Timer1.interval:=ScrollBar1.Position;
end;

end.









