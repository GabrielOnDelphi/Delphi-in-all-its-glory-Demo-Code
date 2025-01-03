object frmTester: TfrmTester
  Left = 0
  Top = 0
  Caption = 'Tester'
  ClientHeight = 310
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DrawingControl: TDrawingControl
    Left = 5
    Top = 5
    Width = 376
    Height = 266
  end
  object radCirc: TRadioButton
    Left = 0
    Top = 276
    Width = 387
    Height = 17
    Align = alBottom
    Caption = 'Circle'
    Checked = True
    TabOrder = 1
    TabStop = True
    OnClick = radCircClick
    ExplicitTop = 275
    ExplicitWidth = 383
  end
  object radRect: TRadioButton
    Left = 0
    Top = 293
    Width = 387
    Height = 17
    Align = alBottom
    Caption = 'Rectangle'
    TabOrder = 2
    OnClick = radRectClick
    ExplicitTop = 292
    ExplicitWidth = 383
  end
end
