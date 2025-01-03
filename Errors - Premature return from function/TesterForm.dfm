object frmTester: TfrmTester
  Left = 450
  Top = 311
  Anchors = []
  Caption = 'Tester'
  ClientHeight = 261
  ClientWidth = 474
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 490
  DoubleBuffered = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 4
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object mmo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 468
    Height = 201
    Align = alClient
    TabOrder = 0
  end
  object btnStart: TButton
    AlignWithMargins = True
    Left = 3
    Top = 210
    Width = 468
    Height = 48
    Align = alBottom
    Caption = 'START'
    TabOrder = 1
    OnClick = btnStartClick
  end
end
