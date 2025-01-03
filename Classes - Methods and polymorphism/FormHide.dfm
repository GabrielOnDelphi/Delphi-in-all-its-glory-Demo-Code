object frmReinstroduce: TfrmReinstroduce
  Left = 277
  Top = 549
  Caption = 'Polymorphism demo - Hiding a method'
  ClientHeight = 222
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  DesignSize = (
    479
    222)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 264
    Top = 74
    Width = 156
    Height = 33
    Anchors = []
    Caption = 'Declared as THide1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 114
    Width = 156
    Height = 33
    Anchors = []
    Caption = 'Declared as THide2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 59
    Top = 114
    Width = 156
    Height = 33
    Anchors = []
    Caption = 'Declared as TOvr2'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 59
    Top = 74
    Width = 156
    Height = 33
    Anchors = []
    Caption = 'Declared as TOvr1'
    TabOrder = 3
    OnClick = Button4Click
  end
end
