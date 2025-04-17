program kurve;

uses
  Forms,
  menu in 'menu.pas' {Form1},
  game in 'game.pas' {Form2},
  intro in 'intro.pas' {Form3},
  mapedit in 'mapedit.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
