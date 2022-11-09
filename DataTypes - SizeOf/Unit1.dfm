object Form20: TForm20
  Left = 549
  Top = 225
  Caption = 'Data types Test'
  ClientHeight = 561
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 360
    Height = 561
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 360
    Top = 0
    Width = 118
    Height = 561
    Align = alRight
    TabOrder = 1
    object btnMemAddress: TButton
      AlignWithMargins = True
      Left = 4
      Top = 88
      Width = 110
      Height = 36
      Align = alTop
      Caption = 'Show address'
      TabOrder = 0
      OnClick = btnMemAddressClick
    end
    object btnLength: TButton
      AlignWithMargins = True
      Left = 4
      Top = 46
      Width = 110
      Height = 36
      Align = alTop
      Caption = 'Length'
      TabOrder = 1
      OnClick = btnLengthClick
    end
    object btnSizeOf: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 110
      Height = 36
      Align = alTop
      Caption = 'SizeOf'
      TabOrder = 2
      OnClick = btnSizeOfClick
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 4
      Top = 519
      Width = 110
      Height = 38
      Align = alBottom
      Caption = 'Clear'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
end
