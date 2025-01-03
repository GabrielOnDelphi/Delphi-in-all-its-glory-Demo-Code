object Form1: TForm1
  Left = 754
  Top = 525
  Caption = 'Form1'
  ClientHeight = 272
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  DesignSize = (
    277
    272)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 52
    Top = 36
    Width = 173
    Height = 57
    Anchors = []
    Caption = 'Create Form2'
    TabOrder = 0
    OnClick = Button1Click
  end
  object btnCreateNoVar: TButton
    Left = 52
    Top = 101
    Width = 173
    Height = 57
    Anchors = []
    Caption = 'Create Form2 (no global variable)'
    TabOrder = 1
    WordWrap = True
    OnClick = btnCreateNoVarClick
  end
  object chkShowModal: TCheckBox
    Left = 92
    Top = 247
    Width = 97
    Height = 17
    Caption = 'Show modal'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 52
    Top = 164
    Width = 173
    Height = 57
    Anchors = []
    Caption = 'Create Form2 (fsStayOnTop)'
    TabOrder = 3
    WordWrap = True
    OnClick = Button2Click
  end
end
