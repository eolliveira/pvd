object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 661
  Width = 886
  object fd_cenecction: TFDConnection
    Params.Strings = (
      'Database=pvd'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 192
    Top = 112
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\lib\libmysql.dll'
    Left = 752
    Top = 48
  end
  object query_cargos: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_cargo')
    Left = 72
    Top = 368
    object query_cargosid: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_cargoscargo: TStringField
      DisplayLabel = 'CARGO'
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
  end
  object tb_cargo: TFDTable
    IndexFieldNames = 'id'
    Connection = fd_cenecction
    TableName = 'pvd.tb_cargo'
    Left = 80
    Top = 208
    object tb_cargoid: TFDAutoIncField
      DisplayWidth = 3
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tb_cargocargo: TStringField
      DisplayWidth = 36
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
  end
  object ds_cargos: TDataSource
    DataSet = query_cargos
    Left = 72
    Top = 288
  end
  object tb_funcionario: TFDTable
    IndexFieldNames = 'id'
    Connection = fd_cenecction
    TableName = 'pvd.tb_funcionario'
    Left = 216
    Top = 208
    object tb_funcionarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
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
      FieldName = 'cargo_id'
      Origin = 'cargo_id'
      Required = True
    end
  end
  object query_funcionario: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_funcionario')
    Left = 224
    Top = 368
  end
  object ds_funcionario: TDataSource
    DataSet = query_funcionario
    Left = 216
    Top = 288
  end
  object tb_usuario: TFDTable
    IndexFieldNames = 'id'
    Connection = fd_cenecction
    TableName = 'pvd.tb_usuario'
    Left = 352
    Top = 208
    object tb_usuarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tb_usuariologin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 8
    end
    object tb_usuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 100
    end
    object tb_usuarioperfil: TStringField
      FieldName = 'perfil'
      Origin = 'perfil'
      Required = True
      Size = 50
    end
    object tb_usuariofuncionario_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
    end
  end
  object ds_usuarios: TDataSource
    DataSet = query_usuarios
    Left = 352
    Top = 296
  end
  object query_usuarios: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_usuario')
    Left = 352
    Top = 368
    object query_usuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_usuarioslogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 8
    end
    object query_usuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 100
    end
    object query_usuariosperfil: TStringField
      FieldName = 'perfil'
      Origin = 'perfil'
      Required = True
      Size = 50
    end
    object query_usuariosfuncionario_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
    end
  end
end
