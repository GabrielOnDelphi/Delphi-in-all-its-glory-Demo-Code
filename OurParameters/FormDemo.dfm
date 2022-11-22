object frmTest: TfrmTest
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Test'
  ClientHeight = 211
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 170
    Width = 621
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnTest: TButton
      AlignWithMargins = True
      Left = 543
      Top = 3
      Width = 75
      Height = 35
      Align = alRight
      Caption = 'Test'
      TabOrder = 0
      OnClick = btnTestClick
    end
  end
end
