unit ked;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    newtast: TPanel;
    pok: TPanel;
    keysave: TPanel;
    orginal: TPanel;
    kende: TPanel;
    tastwert: TLabel;
    procedure kendeClick(Sender: TObject);
    procedure newtastClick(Sender: TObject);
    procedure keysaveClick(Sender: TObject);
    procedure orginalClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pokClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}
uses game;

procedure TForm2.kendeClick(Sender: TObject);
begin
form2.visible:=false;
form1.kendeclick;

end;

procedure TForm2.newtastClick(Sender: TObject);
begin
form1.newtastclick;
end;

procedure TForm2.keysaveClick(Sender: TObject);
begin
Form1.keysaveClick;
end;

procedure TForm2.orginalClick(Sender: TObject);
begin
Form1.orginalClick;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
form1.fKeydown(key);
end;

procedure TForm2.pokClick(Sender: TObject);
begin
Form1.pokClick;
end;

end.
