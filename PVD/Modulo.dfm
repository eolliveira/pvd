object dm: Tdm
  OldCreateOrder = False
  Height = 661
  Width = 886
  object fd_cenecction: TFDConnection
    Params.Strings = (
      'Database=pvd'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    Left = 432
    Top = 40
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\lib\libmySQL.dll'
    Left = 784
    Top = 24
  end
  object tb_cargo: TFDTable
    Connection = fd_cenecction
    Left = 432
    Top = 136
  end
  object query_cargos: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_cargo')
    Left = 432
    Top = 216
    object query_cargosid: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object query_cargoscargo: TStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 200
    end
  end
end
