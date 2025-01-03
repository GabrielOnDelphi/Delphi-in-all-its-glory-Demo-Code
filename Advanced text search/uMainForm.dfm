object frmMain: TfrmMain
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 250
  Caption = 'Find in files'
  ClientHeight = 465
  ClientWidth = 691
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 3
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 197
    Width = 691
    Height = 3
    Cursor = crVSplit
    Align = alTop
    MinSize = 10
    ResizeStyle = rsUpdate
  end
  object pnlFiles: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 197
    Align = alTop
    Caption = 'pnlFiles'
    ShowCaption = False
    TabOrder = 0
    object lblRewind: TLabel
      AlignWithMargins = True
      Left = 286
      Top = 159
      Width = 100
      Height = 34
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Rewinded'
      Color = 8454143
      ParentBiDiMode = False
      ParentColor = False
      Transparent = False
      Layout = tlCenter
      Visible = False
    end
    object btnStart: TButton
      AlignWithMargins = True
      Left = 4
      Top = 159
      Width = 102
      Height = 34
      Align = alLeft
      Anchors = [akLeft, akBottom]
      Caption = 'Search'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object lbxResults: TListBox
      Left = 1
      Top = 46
      Width = 689
      Height = 110
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      PopupMenu = PopupMenu
      TabOrder = 1
      OnDblClick = lbxResultsDblClick
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 689
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        689
        45)
      object edtFilter: TLabeledEdit
        Left = 468
        Top = 18
        Width = 210
        Height = 21
        Anchors = [akTop, akRight]
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'File filter'
        TabOrder = 0
        Text = '*.pas'
      end
      object edtPath: TLabeledEdit
        Left = 8
        Top = 18
        Width = 443
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditLabel.Width = 169
        EditLabel.Height = 13
        EditLabel.Caption = 'Find text in all files in this folder:'
        TabOrder = 1
        Text = 'c:\'
      end
    end
    object btnNext: TButton
      AlignWithMargins = True
      Left = 199
      Top = 160
      Width = 81
      Height = 32
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Next >'
      TabOrder = 3
      Visible = False
      OnClick = btnNextClick
    end
    object btnPrev: TButton
      AlignWithMargins = True
      Left = 112
      Top = 160
      Width = 81
      Height = 32
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alLeft
      Caption = '< Prev'
      TabOrder = 4
      Visible = False
      OnClick = btnPrevClick
    end
    object btnReset: TButton
      AlignWithMargins = True
      Left = 612
      Top = 159
      Width = 75
      Height = 34
      Align = alRight
      Caption = 'Reset'
      TabOrder = 5
      OnClick = btnResetClick
    end
  end
  object pnlView: TPanel
    Left = 0
    Top = 200
    Width = 691
    Height = 265
    Align = alClient
    TabOrder = 1
    Visible = False
    object lblCurFile: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 3
      Height = 13
      Align = alTop
    end
    object mmoView: TMemo
      Left = 1
      Top = 20
      Width = 689
      Height = 206
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 226
      Width = 689
      Height = 38
      Align = alBottom
      TabOrder = 1
      Visible = False
    end
  end
  object PopupMenu: TPopupMenu
    Left = 496
    Top = 92
    object Copyfilename1: TMenuItem
      Caption = 'Copy filename'
      OnClick = Copyfilename1Click
    end
    object open1: TMenuItem
      Caption = 'Open'
    end
  end
  object TimerRew: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = TimerRewTimer
    Left = 544
    Top = 92
  end
end
