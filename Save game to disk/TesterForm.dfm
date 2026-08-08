object frmTester: TfrmTester
  Left = 352
  Top = 260
  Anchors = []
  Caption = 'Tester'
  ClientHeight = 462
  ClientWidth = 678
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 690
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 4
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    678
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSave: TButton
    Left = 489
    Top = 140
    Width = 157
    Height = 48
    Anchors = [akRight, akBottom]
    Caption = 'Save'
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object Log: TRichLog
    Left = 0
    Top = 0
    Width = 462
    Height = 462
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    MaxLength = 2147483632
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 1
    WordWrap = False
    Zoom = 100
  end
  object btnLoad: TButton
    Left = 489
    Top = 194
    Width = 157
    Height = 48
    Anchors = [akRight, akBottom]
    Caption = 'Load'
    TabOrder = 2
    OnClick = btnLoadClick
  end
end
