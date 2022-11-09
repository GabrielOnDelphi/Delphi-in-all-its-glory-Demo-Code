object frmFieldAlign: TfrmFieldAlign
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Test records'
  ClientHeight = 211
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmoRec1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 615
    Height = 164
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 170
    Width = 621
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnSizeOf: TButton
      AlignWithMargins = True
      Left = 512
      Top = 3
      Width = 106
      Height = 35
      Align = alRight
      Caption = 'Test record size'
      TabOrder = 0
      WordWrap = True
      OnClick = btnSizeOfClick
    end
  end
end
