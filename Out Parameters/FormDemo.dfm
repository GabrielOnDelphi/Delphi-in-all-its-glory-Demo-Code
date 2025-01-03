object frmTest: TfrmTest
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Test OUT parameter'
  ClientHeight = 301
  ClientWidth = 381
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
    Top = 260
    Width = 381
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnTestRec: TButton
      AlignWithMargins = True
      Left = 274
      Top = 3
      Width = 104
      Height = 35
      Align = alRight
      Caption = 'Test record'
      TabOrder = 0
      OnClick = btnTestRecClick
    end
    object btnTestStr: TButton
      AlignWithMargins = True
      Left = 164
      Top = 3
      Width = 104
      Height = 35
      Align = alRight
      Caption = 'Test string'
      TabOrder = 1
      OnClick = btnTestStrClick
    end
    object btnTestInt: TButton
      AlignWithMargins = True
      Left = 54
      Top = 3
      Width = 104
      Height = 35
      Align = alRight
      Caption = 'Test integer'
      TabOrder = 2
      OnClick = btnTestIntClick
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 381
    Height = 260
    Align = alClient
    Lines.Strings = (
      'Memo')
    TabOrder = 1
  end
end
