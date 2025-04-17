object Form1: TForm1
  Left = 2
  Top = 2
  Cursor = crCross
  BorderStyle = bsNone
  Caption = 'Asteroids'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object MediaPlayer1: TMediaPlayer
    Left = 8
    Top = 8
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 0
  end
  object MediaPlayer2: TMediaPlayer
    Left = 8
    Top = 40
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 1
  end
  object MediaPlayer3: TMediaPlayer
    Left = 8
    Top = 72
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 2
  end
  object MediaPlayer4: TMediaPlayer
    Left = 8
    Top = 104
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 3
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 136
  end
end
