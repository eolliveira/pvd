object frm_usuarios: Tfrm_usuarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Usuarios'
  ClientHeight = 621
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn_novo: TButton
    Left = 40
    Top = 360
    Width = 105
    Height = 57
    Caption = 'Novo'
    TabOrder = 0
    OnClick = btn_novoClick
  end
  object grid_usuarios: TDBGrid
    Left = 40
    Top = 35
    Width = 617
    Height = 281
    DataSource = dm.ds_usuarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grid_usuariosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'login'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'senha'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'perfil'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'funcionario_id'
        Width = 76
        Visible = True
      end>
  end
end
