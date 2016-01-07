object Main: TMain
  Left = 0
  Top = 0
  ClientHeight = 147
  ClientWidth = 193
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpenGeneral: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Open dialog'
    TabOrder = 0
    OnClick = btnOpenGeneralClick
  end
  object btnOpenA: TButton
    Left = 24
    Top = 66
    Width = 75
    Height = 25
    Caption = 'Open dialog A'
    TabOrder = 1
    OnClick = btnOpenAClick
  end
  object btnOpenB: TButton
    Left = 24
    Top = 114
    Width = 75
    Height = 25
    Caption = 'Open dialog B'
    TabOrder = 2
    OnClick = btnOpenBClick
  end
end
