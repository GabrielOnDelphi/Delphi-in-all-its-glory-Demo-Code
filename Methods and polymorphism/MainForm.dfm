object frmTest: TfrmTest
  Left = 0
  Top = 0
  Caption = 'Tester'
  ClientHeight = 222
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 20
    Top = 22
    Width = 132
    Height = 33
    Caption = 'Class T1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 20
    Top = 62
    Width = 132
    Height = 33
    Caption = 'Class T2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 20
    Top = 102
    Width = 132
    Height = 33
    Caption = 'Class T4'
    TabOrder = 2
    OnClick = Button3Click
  end
  object btnT5: TButton
    Left = 20
    Top = 140
    Width = 132
    Height = 33
    Caption = 'Class T5 (Override)'
    TabOrder = 3
    WordWrap = True
    OnClick = btnT5Click
  end
end
