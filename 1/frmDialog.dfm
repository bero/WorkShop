object FormDlg: TFormDlg
  Left = 0
  Top = 0
  Caption = 'FormDlg'
  ClientHeight = 140
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 88
    Top = 107
    Width = 49
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 153
    Top = 106
    Width = 49
    Height = 26
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object btnHi: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Hi'
    TabOrder = 2
    OnClick = btnHiClick
  end
end
