object frmTester: TfrmTester
  Left = 450
  Top = 311
  Anchors = []
  Caption = 'Tester'
  ClientHeight = 364
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
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 0
    Top = 166
    Width = 474
    Height = 17
    Align = alTop
    Caption = 'Total beeps:'
  end
  object btnSmall: TButton
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 468
    Height = 48
    Align = alTop
    Caption = 'START - Small leak'
    TabOrder = 0
    OnClick = btnSmallClick
  end
  object btnMultiple: TButton
    AlignWithMargins = True
    Left = 3
    Top = 57
    Width = 468
    Height = 48
    Align = alTop
    Caption = 'START - Multiple leaks'
    TabOrder = 1
    OnClick = btnMultipleClick
  end
  object btnDang: TButton
    AlignWithMargins = True
    Left = 3
    Top = 111
    Width = 468
    Height = 48
    Align = alTop
    Caption = 'Dangling pointer'
    TabOrder = 2
    OnClick = btnDangClick
  end
  object btnBeeper: TButton
    AlignWithMargins = True
    Left = 3
    Top = 186
    Width = 468
    Height = 48
    Align = alTop
    Caption = 'Beeper create'
    TabOrder = 3
    OnClick = btnBeeperClick
  end
  object btnBeepFree: TButton
    AlignWithMargins = True
    Left = 3
    Top = 240
    Width = 468
    Height = 48
    Align = alTop
    Caption = 'Beeper destroy'
    TabOrder = 4
    OnClick = btnBeepFreeClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 162
    Width = 474
    Height = 4
    Align = alTop
    TabOrder = 5
  end
  object btnManualBeep: TButton
    AlignWithMargins = True
    Left = 3
    Top = 294
    Width = 468
    Height = 48
    Align = alTop
    Caption = 'Manual beep (after free)'
    TabOrder = 6
    OnClick = btnManualBeepClick
  end
end
