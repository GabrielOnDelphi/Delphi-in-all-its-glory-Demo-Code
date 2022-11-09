object frmCopyRecords: TfrmCopyRecords
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
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 621
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = 
      'This is Record1 (initialized with small no)                     ' +
      '         This is Record2 (initialized with big no)'
  end
  object mmoRec1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 16
    Width = 305
    Height = 151
    Align = alLeft
    TabOrder = 0
  end
  object mmoRec2: TMemo
    AlignWithMargins = True
    Left = 314
    Top = 16
    Width = 305
    Height = 151
    Align = alLeft
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 170
    Width = 621
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnChange: TButton
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 35
      Align = alLeft
      Caption = 'Change R2'
      Enabled = False
      TabOrder = 0
      OnClick = btnChangeClick
    end
    object btnCopy: TButton
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 35
      Align = alLeft
      Caption = 'R2:= R1'
      TabOrder = 1
      OnClick = btnCopyClick
    end
    object chkDeepCopy: TCheckBox
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 126
      Height = 35
      Hint = 'Make all fields of R2 unique'
      Align = alLeft
      Caption = 'Make unique fields'
      Enabled = False
      TabOrder = 2
      OnClick = chkDeepCopyClick
    end
    object btnInitR1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 35
      Align = alLeft
      Caption = 'Init R1'
      TabOrder = 3
      OnClick = btnInitR1Click
    end
    object btnPointers: TButton
      AlignWithMargins = True
      Left = 543
      Top = 3
      Width = 75
      Height = 35
      Align = alRight
      Caption = 'Pointers'
      TabOrder = 4
      OnClick = btnPointersClick
    end
  end
end
