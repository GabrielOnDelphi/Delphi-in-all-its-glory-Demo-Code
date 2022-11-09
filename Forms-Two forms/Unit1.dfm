object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 213
  ClientWidth = 277
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
    Left = 72
    Top = 44
    Width = 129
    Height = 38
    Caption = 'Create Form2'
    TabOrder = 0
    OnClick = Button1Click
  end
  object btnCreateNoVar: TButton
    Left = 72
    Top = 85
    Width = 129
    Height = 38
    Caption = 'Create Form2 NoGlobalVar'
    TabOrder = 1
    WordWrap = True
    OnClick = btnCreateNoVarClick
  end
  object Button2: TButton
    Left = 72
    Top = 127
    Width = 129
    Height = 38
    Caption = 'Create Form2 LocalVar'
    TabOrder = 2
    WordWrap = True
    OnClick = btnCreateNoVarClick
  end
end
