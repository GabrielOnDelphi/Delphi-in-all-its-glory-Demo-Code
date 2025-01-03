object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 438
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Memo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 173
    Height = 432
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 179
    Top = 0
    Width = 128
    Height = 438
    Align = alRight
    TabOrder = 1
    object btnNormalFree: TButton
      AlignWithMargins = True
      Left = 4
      Top = 143
      Width = 120
      Height = 37
      Align = alTop
      Caption = 'NormalFree'
      TabOrder = 0
      OnClick = btnNormalFreeClick
    end
    object btnNormalClose: TButton
      AlignWithMargins = True
      Left = 4
      Top = 186
      Width = 120
      Height = 37
      Align = alTop
      Caption = 'NormalClose'
      TabOrder = 1
      OnClick = btnNormalCloseClick
    end
    object btnNormalRelease: TButton
      AlignWithMargins = True
      Left = 4
      Top = 229
      Width = 120
      Height = 37
      Align = alTop
      Caption = 'NormalRelease'
      TabOrder = 2
      OnClick = btnNormalReleaseClick
    end
    object btnModalRelease: TButton
      AlignWithMargins = True
      Left = 4
      Top = 90
      Width = 120
      Height = 37
      Align = alTop
      Caption = 'ModalRelease'
      TabOrder = 3
      OnClick = btnModalReleaseClick
    end
    object btnModalClose: TButton
      AlignWithMargins = True
      Left = 4
      Top = 47
      Width = 120
      Height = 37
      Align = alTop
      Caption = 'ModalClose'
      TabOrder = 4
      OnClick = btnModalCloseClick
    end
    object btnModalFree: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 120
      Height = 37
      Align = alTop
      Caption = 'Modal Free'
      TabOrder = 5
      OnClick = btnModalFreeClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 130
      Width = 126
      Height = 10
      Align = alTop
      TabOrder = 6
    end
    object tgl: TToggleSwitch
      AlignWithMargins = True
      Left = 4
      Top = 414
      Width = 120
      Height = 20
      Hint = 'Action'
      Align = alBottom
      StateCaptions.CaptionOn = 'caFree'
      StateCaptions.CaptionOff = 'caHide'
      TabOrder = 7
      OnClick = tglClick
    end
  end
end
