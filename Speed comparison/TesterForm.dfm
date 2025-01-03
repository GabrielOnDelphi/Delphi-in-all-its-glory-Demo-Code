object frmTester: TfrmTester
  Left = 450
  Top = 311
  ActiveControl = btnFindShortStr
  Anchors = []
  Caption = 'Delphi speed test'
  ClientHeight = 462
  ClientWidth = 622
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object pnlRight: TPanel
    Left = 452
    Top = 0
    Width = 170
    Height = 462
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnForLoop: TButton
      AlignWithMargins = True
      Left = 3
      Top = 195
      Width = 164
      Height = 48
      Align = alBottom
      Caption = 'Do For Loop'
      TabOrder = 0
      OnClick = btnForLoopClick
    end
    object bntMemAlloc: TButton
      AlignWithMargins = True
      Left = 3
      Top = 249
      Width = 164
      Height = 48
      Align = alBottom
      Caption = 'Memory allocation'
      TabOrder = 1
      OnClick = bntMemAllocClick
    end
    object btnFillString: TButton
      AlignWithMargins = True
      Left = 3
      Top = 303
      Width = 164
      Height = 48
      Align = alBottom
      Caption = 'Fill each char'
      TabOrder = 2
      OnClick = btnFillStringClick
    end
    object btnFindShortStr: TButton
      AlignWithMargins = True
      Left = 3
      Top = 411
      Width = 164
      Height = 48
      Align = alBottom
      Caption = 'Find shortest string'
      Default = True
      TabOrder = 3
      OnClick = btnFindShortStrClick
    end
    object btnFillMem: TButton
      AlignWithMargins = True
      Left = 3
      Top = 357
      Width = 164
      Height = 48
      Align = alBottom
      Caption = 'Fill memory'
      TabOrder = 4
      OnClick = btnFillMemClick
    end
  end
  object mmo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 446
    Height = 456
    Align = alClient
    TabOrder = 1
  end
end
