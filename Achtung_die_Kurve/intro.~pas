unit intro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, menu;

type
  TForm3 = class(TForm)
    Timer1: TTimer;
    PaintBox1: TPaintBox;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  zeit,x,y,zx,zy:integer;
  pic,scr:Tbitmap;

implementation


{$R *.dfm}

procedure TForm3.Timer1Timer(Sender: TObject);
begin
inc(zeit);





if  (zeit<paintbox1.Width/2)
then
begin
scr.Canvas.FillRect(rect(0,0,paintbox1.Width,paintbox1.Height));
scr.Canvas.Draw((paintbox1.Width div 2)-100,(paintbox1.Height div 2)-100,pic);
x:=zeit-50;
y:=round(zeit/paintbox1.height*100);
scr.canvas.TextOut(x,y,'Achtung, die Kurve!');
zx:=round(paintbox1.Width*3/4);
zy:=round(paintbox1.height/2);
end
else
begin
scr.canvas.TextOut(x,y,'Achtung, die Kurve!');
scr.Canvas.MoveTo(zx,zy);

zx:=round(paintbox1.width/2*(1+cos((zeit-paintbox1.Width/2)*2*PI/(1500-paintbox1.width/2))/2));
zy:=Round(paintbox1.height/2*(1+sin((zeit-paintbox1.Width/2)*2*PI/(1500-paintbox1.width/2))/2));

scr.Canvas.LineTo(zx,zy);

end;


if (getasynckeystate(27)<>0) or (zeit>1500)
then
begin
timer1.Enabled:=false;
form3.Visible:=false;
form1.checksprache;
form1.visible:=true;

end;
paintbox1.canvas.draw(0,0,scr);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
zeit:=0;
form3.Width:=screen.width;
form3.Height:=screen.height;
paintbox1.Width:=screen.Width;
paintbox1.Height:=screen.height;
pic:=TBitmap.Create;       //Intro initialisieren
pic.LoadFromFile('images/equinoxomega.bmp');

scr:=Tbitmap.create;
scr.Width:=paintbox1.width;
scr.Height:=paintbox1.height;
scr.Canvas.brush.color:=clblack;
scr.Canvas.FillRect(rect(0,0,paintbox1.width,paintbox1.height));
scr.canvas.Font.Color:=clblue;
scr.canvas.Font.Size:=30;
scr.Canvas.Pen.Color:=cllime;
scr.canvas.Pen.Width:=3;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.Bildschirmnormal;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form1.Bildschirmnormal;
end;

end.
