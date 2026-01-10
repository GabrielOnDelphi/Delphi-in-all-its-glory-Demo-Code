inherited frmChild: TfrmChild
  Caption = 'Child form'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  object Button2: TButton [0]
    Left = 144
    Top = 56
    Width = 121
    Height = 57
    Caption = 'Button on child'
    TabOrder = 0
  end
  inherited Button1: TButton
    Left = 379
    Width = 52
    Height = 233
    Align = alRight
    TabOrder = 1
    ExplicitWidth = 52
    ExplicitHeight = 428
  end
end
