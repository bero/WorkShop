object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 291
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    520
    291)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 11
    Width = 26
    Height = 13
    Caption = 'Value'
  end
  object Label1: TLabel
    Left = 16
    Top = 51
    Width = 24
    Height = 13
    Caption = 'Hash'
  end
  object Label3: TLabel
    Left = 16
    Top = 91
    Width = 53
    Height = 13
    Caption = 'BobJenkins'
  end
  object Label4: TLabel
    Left = 16
    Top = 131
    Width = 21
    Height = 13
    Caption = 'MD5'
  end
  object Label5: TLabel
    Left = 16
    Top = 171
    Width = 26
    Height = 13
    Caption = 'SHA1'
  end
  object Label6: TLabel
    Left = 16
    Top = 211
    Width = 26
    Height = 13
    Caption = 'SHA2'
  end
  object txtValue: TEdit
    Left = 88
    Top = 8
    Width = 417
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = txtValueChange
  end
  object txtHash: TEdit
    Left = 88
    Top = 48
    Width = 417
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object txtJenkins: TEdit
    Left = 88
    Top = 88
    Width = 417
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object txtMD5: TEdit
    Left = 88
    Top = 128
    Width = 417
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object txtSHA1: TEdit
    Left = 88
    Top = 168
    Width = 417
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object txtSHA2: TEdit
    Left = 88
    Top = 208
    Width = 417
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
  end
end
