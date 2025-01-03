object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 440
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object mmo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 291
    Height = 434
    Align = alLeft
    Lines.Strings = (
      'mmo')
    TabOrder = 0
  end
  object MyPanel1: TMyPanel
    Left = 350
    Top = 190
    Width = 185
    Height = 41
    Caption = 'MyPanel1'
    TabOrder = 1
    OnClick = MyPanel1Click
  end
end
