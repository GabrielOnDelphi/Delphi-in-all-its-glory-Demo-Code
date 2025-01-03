object frmOverride: TfrmOverride
  Left = 823
  Top = 525
  Caption = 'Polymorphism demo - Overriding a method'
  ClientHeight = 222
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  DesignSize = (
    367
    222)
  PixelsPerInch = 96
  TextHeight = 13
  object btnT3: TButton
    Left = 117
    Top = 41
    Width = 132
    Height = 33
    Anchors = []
    Caption = 'Class T3'
    TabOrder = 0
    OnClick = btnT3Click
  end
  object btnT6: TButton
    Left = 117
    Top = 167
    Width = 132
    Height = 33
    Anchors = []
    Caption = 'Abstract method'
    TabOrder = 1
    WordWrap = True
    OnClick = btnT6Click
  end
end
