object frmTester: TfrmTester
  Left = 373
  Top = 170
  Anchors = []
  Caption = 'Search for text in files'
  ClientHeight = 571
  ClientWidth = 777
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
  PixelsPerInch = 96
  TextHeight = 13
  object lblInfo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 771
    Height = 13
    Align = alTop
    Caption = 'Find the specified text in all files in folder.'
  end
  object Log: TRichLog
    Left = 0
    Top = 132
    Width = 777
    Height = 439
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    Lines.Strings = (
      'Log')
    MaxLength = 2147483632
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 0
    WordWrap = False
    Zoom = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 19
    Width = 777
    Height = 113
    Align = alTop
    TabOrder = 1
    DesignSize = (
      777
      113)
    object edtSearchWord: TCubicLabelEdit
      Left = 26
      Top = 38
      Width = 189
      Height = 21
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Search for:'
      TabOrder = 0
      Text = '  8.1 Text: '
    end
    object chkNonEmpty: TCubicCheckBox
      Left = 26
      Top = 72
      Width = 168
      Height = 17
      Hint = 
        'Do not log the file if the text was found but there was no addit' +
        'ional text after it'
      Caption = 'Ignore if the line is incomplete'
      Checked = True
      State = cbChecked
      TabOrder = 1
      AutoSize = True
    end
    object Path: TCubicPathEdit
      Left = 332
      Top = 22
      Width = 427
      Height = 41
      Hint = 'You can drag and drop folders here'
      Caption = 'Folder'
      TabOrder = 2
    end
    object edtFileType: TCubicLabelEdit
      Left = 230
      Top = 38
      Width = 73
      Height = 21
      Hint = 'Only search these files'
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'File type'
      TabOrder = 3
      Text = '*.*'
    end
    object btnStart: TButton
      Left = 624
      Top = 76
      Width = 150
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'START Search'
      TabOrder = 4
      OnClick = btnStartClick
    end
  end
end
