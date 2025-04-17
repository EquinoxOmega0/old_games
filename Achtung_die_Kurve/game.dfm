object Form2: TForm2
  Left = 3
  Top = 3
  Cursor = crCross
  BorderStyle = bsNone
  ClientHeight = 768
  ClientWidth = 1024
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 900
    Top = 0
    Width = 124
    Height = 768
    Cursor = crCross
    Align = alRight
    Color = clGray
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Spieler 1'
    end
    object PaintBox1: TPaintBox
      Left = 8
      Top = 40
      Width = 110
      Height = 80
    end
    object Label2: TLabel
      Left = 8
      Top = 128
      Width = 41
      Height = 13
      Caption = 'Spieler 2'
    end
    object PaintBox2: TPaintBox
      Left = 6
      Top = 160
      Width = 110
      Height = 80
    end
    object Label3: TLabel
      Left = 8
      Top = 248
      Width = 41
      Height = 13
      Caption = 'Spieler 3'
    end
    object PaintBox3: TPaintBox
      Left = 6
      Top = 280
      Width = 110
      Height = 80
    end
    object Label4: TLabel
      Left = 8
      Top = 376
      Width = 41
      Height = 13
      Caption = 'Spieler 4'
    end
    object PaintBox4: TPaintBox
      Left = 6
      Top = 408
      Width = 110
      Height = 80
    end
    object Label5: TLabel
      Left = 8
      Top = 496
      Width = 41
      Height = 13
      Caption = 'Spieler 5'
    end
    object PaintBox5: TPaintBox
      Left = 6
      Top = 528
      Width = 110
      Height = 80
    end
    object Label6: TLabel
      Left = 8
      Top = 616
      Width = 41
      Height = 13
      Caption = 'Spieler 6'
    end
    object PaintBox6: TPaintBox
      Left = 6
      Top = 648
      Width = 110
      Height = 80
    end
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 64
      Height = 16
      Caption = 'Punkte: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 144
      Width = 64
      Height = 16
      Caption = 'Punkte: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 264
      Width = 64
      Height = 16
      Caption = 'Punkte: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 392
      Width = 64
      Height = 16
      Caption = 'Punkte: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 512
      Width = 64
      Height = 16
      Caption = 'Punkte: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 632
      Width = 64
      Height = 16
      Caption = 'Punkte: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 8
      Top = 736
      Width = 70
      Height = 20
      Caption = 'Spiel l'#228'uft'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 136
    Top = 104
  end
end
