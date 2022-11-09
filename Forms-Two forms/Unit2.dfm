object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 142
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 60
    Top = 28
    Width = 114
    Height = 33
    Caption = 'Show MainForm (a)'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 60
    Top = 71
    Width = 114
    Height = 33
    Caption = 'Show MainForm (b)'
    TabOrder = 1
    OnClick = Button2Click
  end
end
