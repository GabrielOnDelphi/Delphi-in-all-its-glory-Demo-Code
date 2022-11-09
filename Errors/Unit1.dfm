object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 337
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnError1: TButton
    Left = 234
    Top = 76
    Width = 131
    Height = 63
    Caption = 'Generate error'
    TabOrder = 0
    OnClick = btnError1Click
  end
  object btnError2: TButton
    Left = 234
    Top = 147
    Width = 131
    Height = 63
    Caption = 'Generate error 2'
    TabOrder = 1
    OnClick = btnError2Click
  end
  object btnError3: TButton
    Left = 234
    Top = 218
    Width = 131
    Height = 63
    Caption = 'Generate error (fixed)'
    TabOrder = 2
    OnClick = btnError3Click
  end
end
