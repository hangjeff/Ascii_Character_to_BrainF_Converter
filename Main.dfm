object BFForm: TBFForm
  Left = 0
  Top = 0
  Caption = 'BrainF Converter'
  ClientHeight = 710
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Memo1: TMemo
    Left = 168
    Top = 64
    Width = 729
    Height = 409
    TabOrder = 0
  end
  object btnCopy: TButton
    Left = 424
    Top = 528
    Width = 201
    Height = 57
    Caption = 'Copy the result'
    TabOrder = 1
    OnClick = btnCopyClick
  end
  object btnMd: TButton
    Left = 424
    Top = 632
    Width = 201
    Height = 57
    Caption = 'Copy with Markdown code block'
    TabOrder = 2
    OnClick = btnMdClick
  end
end
