object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Typecasting demo'
  ClientHeight = 337
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 426
    Height = 337
    Align = alClient
    TabOrder = 0
  end
  object Panel: TPanel
    Left = 426
    Top = 0
    Width = 132
    Height = 337
    Align = alRight
    TabOrder = 1
    object btnAsCast: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 124
      Height = 44
      Align = alTop
      Caption = '"As" typecast'
      TabOrder = 0
      OnClick = btnAsCastClick
    end
    object btnIs: TButton
      AlignWithMargins = True
      Left = 4
      Top = 54
      Width = 124
      Height = 44
      Align = alTop
      Caption = 'Is'
      TabOrder = 1
      OnClick = btnIsClick
    end
    object btnHardTypecast: TButton
      AlignWithMargins = True
      Left = 4
      Top = 104
      Width = 124
      Height = 44
      Align = alTop
      Caption = 'Hard typecast'
      TabOrder = 2
      OnClick = btnHardTypecastClick
    end
    object btnBadTypecast: TButton
      AlignWithMargins = True
      Left = 4
      Top = 154
      Width = 124
      Height = 44
      Align = alTop
      Caption = 'Bad typecast 1'
      TabOrder = 3
      OnClick = btnBadTypecastClick
    end
    object btnBadTypecast2: TButton
      AlignWithMargins = True
      Left = 4
      Top = 204
      Width = 124
      Height = 44
      Align = alTop
      Caption = 'Bad typecast 2'
      TabOrder = 4
      OnClick = btnBadTypecast2Click
    end
    object btnBadTypecast3: TButton
      AlignWithMargins = True
      Left = 4
      Top = 254
      Width = 124
      Height = 44
      Align = alTop
      Caption = 'Bad typecast 3'
      TabOrder = 5
      OnClick = btnBadTypecast3Click
    end
  end
end
