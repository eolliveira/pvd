object frm_funcionarios: Tfrm_funcionarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Funcionarios'
  ClientHeight = 621
  ClientWidth = 994
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PGFuncionario: TPageControl
    Left = 32
    Top = 40
    Width = 930
    Height = 541
    ActivePage = PCadastro
    TabOrder = 0
    object PConsulta: TTabSheet
      Caption = 'Consulta'
      object Label1: TLabel
        Left = 48
        Top = 43
        Width = 36
        Height = 13
        Caption = 'Buscar:'
      end
      object DBGrid1: TDBGrid
        Left = 35
        Top = 91
        Width = 862
        Height = 377
        DataSource = DSFuncionario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endere'#231'o'
            Width = 205
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cargo'
            Width = 120
            Visible = True
          end>
      end
      object txt_busca_nome: TEdit
        Left = 204
        Top = 40
        Width = 120
        Height = 21
        TabOrder = 1
        OnChange = txt_busca_nomeChange
      end
      object txt_busca_cpf: TMaskEdit
        Left = 204
        Top = 40
        Width = 120
        Height = 21
        EditMask = '000.000.000-00;1;_'
        MaxLength = 14
        TabOrder = 2
        Text = '   .   .   -  '
        Visible = False
        OnChange = txt_busca_cpfChange
      end
      object rb_nome: TRadioButton
        Left = 103
        Top = 42
        Width = 48
        Height = 17
        Caption = 'Nome'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rb_nomeClick
      end
      object rb_cpf: TRadioButton
        Left = 157
        Top = 42
        Width = 41
        Height = 17
        Caption = 'CPF'
        TabOrder = 4
        OnClick = rb_cpfClick
      end
    end
    object PCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object lb_nome: TLabel
        Left = 24
        Top = 149
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object lb_cpf: TLabel
        Left = 296
        Top = 149
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object lb_telefone: TLabel
        Left = 473
        Top = 149
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lb_endereco: TLabel
        Left = 24
        Top = 205
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label2: TLabel
        Left = 448
        Top = 205
        Width = 29
        Height = 13
        Caption = 'Cargo'
      end
      object btn_novo: TButton
        Left = 16
        Top = 32
        Width = 105
        Height = 57
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btn_novoClick
      end
      object txt_nome: TEdit
        Left = 24
        Top = 168
        Width = 243
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object txt_endereco: TEdit
        Left = 24
        Top = 224
        Width = 299
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object cb_cargo: TComboBox
        Left = 454
        Top = 224
        Width = 139
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object txt_cpf: TMaskEdit
        Left = 296
        Top = 168
        Width = 124
        Height = 21
        Enabled = False
        EditMask = '000.000.000-00;1;_'
        MaxLength = 14
        TabOrder = 4
        Text = '   .   .   -  '
      end
      object txt_telefone: TMaskEdit
        Left = 472
        Top = 168
        Width = 121
        Height = 21
        Enabled = False
        EditMask = '!\(99\)00000-0000;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
      end
      object btn_salvar: TButton
        Left = 136
        Top = 32
        Width = 91
        Height = 57
        Caption = 'Salvar'
        Enabled = False
        TabOrder = 6
        OnClick = btn_salvarClick
      end
      object btn_editar: TButton
        Left = 253
        Top = 32
        Width = 91
        Height = 57
        Caption = 'Editar'
        TabOrder = 7
        OnClick = btn_editarClick
      end
      object btn_remover: TButton
        Left = 366
        Top = 32
        Width = 99
        Height = 57
        Caption = 'Remover'
        TabOrder = 8
      end
      object btn_cancelar: TButton
        Left = 498
        Top = 32
        Width = 91
        Height = 57
        Caption = 'Cancelar'
        TabOrder = 9
      end
      object txt_cargo_id: TEdit
        Left = 414
        Top = 224
        Width = 34
        Height = 21
        Enabled = False
        TabOrder = 10
      end
    end
  end
  object FDQuery_func_cargo: TFDQuery
    Active = True
    Connection = dm.fd_cenecction
    SQL.Strings = (
      
        'SELECT f.id, f.nome, f.cpf, f.telefone, f.endereco, c.id as carg' +
        'o_id, c.cargo '
      'FROM tb_funcionario f '
      'JOIN tb_cargo c '
      'ON f.cargo_id = c.id')
    Left = 892
    Top = 368
  end
  object DSFuncionario: TDataSource
    DataSet = FDQuery_func_cargo
    Left = 884
    Top = 288
  end
  object FDQuery_cargo: TFDQuery
    Connection = dm.fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_cargo WHERE id = :id')
    Left = 892
    Top = 448
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object tb_funcionario: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dm.fd_cenecction
    TableName = 'tb_funcionario'
    Left = 896
    Top = 520
    object tb_funcionarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tb_funcionarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object tb_funcionariocpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
      Size = 30
    end
    object tb_funcionariotelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 30
    end
    object tb_funcionarioendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 100
    end
    object tb_funcionariocargo_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cargo_id'
      Origin = 'cargo_id'
    end
  end
end
