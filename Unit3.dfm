object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 288
    Top = 160
    Width = 75
    Height = 25
    Caption = #21457#24067#28040#24687
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 242
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 408
    Top = 40
    Width = 201
    Height = 233
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 288
    Top = 216
    Width = 75
    Height = 25
    Caption = #21462#28040#35746#38405
    TabOrder = 3
    OnClick = Button2Click
  end
end
