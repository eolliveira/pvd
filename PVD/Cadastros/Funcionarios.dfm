object frm_funcionarios: Tfrm_funcionarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Funcionarios'
  ClientHeight = 621
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 632
    Top = 27
    Width = 32
    Height = 13
    Caption = 'Buscar'
  end
  object lb_nome: TLabel
    Left = 64
    Top = 69
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lb_cpf: TLabel
    Left = 336
    Top = 69
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lb_telefone: TLabel
    Left = 513
    Top = 69
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lb_endereco: TLabel
    Left = 64
    Top = 125
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label2: TLabel
    Left = 488
    Top = 125
    Width = 29
    Height = 13
    Caption = 'Cargo'
  end
  object txt_busca_nome: TEdit
    Left = 799
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object txt_busca_cpf: TMaskEdit
    Left = 799
    Top = 51
    Width = 120
    Height = 21
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 1
    Text = '   .   .   -  '
  end
  object RadioButton1: TRadioButton
    Left = 689
    Top = 26
    Width = 48
    Height = 17
    Caption = 'Nome'
    TabOrder = 2
  end
  object RadioButton2: TRadioButton
    Left = 752
    Top = 26
    Width = 41
    Height = 17
    Caption = 'CPF'
    TabOrder = 3
  end
  object txt_nome: TEdit
    Left = 64
    Top = 88
    Width = 249
    Height = 21
    TabOrder = 4
  end
  object txt_endereco: TEdit
    Left = 64
    Top = 144
    Width = 305
    Height = 21
    TabOrder = 5
  end
  object cb_cargo: TComboBox
    Left = 488
    Top = 144
    Width = 145
    Height = 21
    TabOrder = 6
  end
  object btn_salvar: TButton
    Left = 222
    Top = 208
    Width = 91
    Height = 57
    Caption = 'Salvar'
    TabOrder = 7
  end
  object btn_editar: TButton
    Left = 381
    Top = 208
    Width = 91
    Height = 57
    Caption = 'Editar'
    TabOrder = 8
  end
  object btn_remover: TButton
    Left = 534
    Top = 208
    Width = 99
    Height = 57
    Caption = 'Remover'
    TabOrder = 9
  end
  object btn_novo: TButton
    Left = 64
    Top = 208
    Width = 105
    Height = 57
    Caption = 'Novo'
    TabOrder = 10
  end
  object txt_cpf: TMaskEdit
    Left = 336
    Top = 88
    Width = 128
    Height = 21
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 11
    Text = '   .   .   -  '
  end
  object txt_telefone: TMaskEdit
    Left = 512
    Top = 88
    Width = 121
    Height = 21
    EditMask = '!\(99\)00000-0000;1;_'
    MaxLength = 14
    TabOrder = 12
    Text = '(  )     -    '
  end
  object DBGrid1: TDBGrid
    Left = 64
    Top = 320
    Width = 569
    Height = 225
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
