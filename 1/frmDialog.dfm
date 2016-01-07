object DialogForm: TDialogForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 145
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpenA: TButton
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Open A'
    TabOrder = 0
    OnClick = btnOpenAClick
  end
  object btnOpenB: TButton
    Left = 40
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Open B'
    TabOrder = 1
    OnClick = btnOpenBClick
  end
end
