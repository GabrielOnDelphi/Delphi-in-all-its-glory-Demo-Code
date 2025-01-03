object FormKeyb: TFormKeyb
  Left = 0
  Top = 0
  Caption = 'Virtual keyboard'
  ClientHeight = 203
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FlowPanel: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 302
    Height = 174
    Align = alClient
    TabOrder = 0
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 96
      Height = 42
      Caption = '1'
      TabOrder = 0
      OnClick = ClickedButton
    end
    object Button2: TButton
      Left = 97
      Top = 1
      Width = 96
      Height = 42
      Caption = '2'
      TabOrder = 1
      OnClick = ClickedButton
    end
    object Button3: TButton
      Left = 193
      Top = 1
      Width = 96
      Height = 42
      Caption = '3'
      TabOrder = 2
      OnClick = ClickedButton
    end
    object Button4: TButton
      Left = 1
      Top = 43
      Width = 96
      Height = 42
      Caption = '4'
      TabOrder = 3
      OnClick = ClickedButton
    end
    object Button5: TButton
      Left = 97
      Top = 43
      Width = 96
      Height = 42
      Caption = '5'
      TabOrder = 4
      OnClick = ClickedButton
    end
    object Button6: TButton
      Left = 193
      Top = 43
      Width = 96
      Height = 42
      Caption = '6'
      TabOrder = 5
      OnClick = ClickedButton
    end
    object Button7: TButton
      Left = 1
      Top = 85
      Width = 96
      Height = 42
      Caption = '7'
      TabOrder = 6
      OnClick = ClickedButton
    end
    object Button8: TButton
      Left = 97
      Top = 85
      Width = 96
      Height = 42
      Caption = '8'
      TabOrder = 7
      OnClick = ClickedButton
    end
    object Button9: TButton
      Left = 193
      Top = 85
      Width = 96
      Height = 42
      Caption = '9'
      TabOrder = 8
      OnClick = ClickedButton
    end
    object Button0: TButton
      Left = 1
      Top = 127
      Width = 96
      Height = 42
      Caption = '0'
      TabOrder = 9
      OnClick = ClickedButton
    end
  end
  object CheckBox1: TCheckBox
    AlignWithMargins = True
    Left = 3
    Top = 183
    Width = 302
    Height = 17
    Align = alBottom
    Caption = 'Check box'
    TabOrder = 1
    OnClick = ClickedButton
  end
end
