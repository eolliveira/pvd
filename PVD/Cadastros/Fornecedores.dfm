object frm_fornecedores: Tfrm_fornecedores
  Left = 0
  Top = 0
  Caption = 'Fornecedores'
  ClientHeight = 463
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grid_fornecedores: TDBGrid
    Left = 32
    Top = 56
    Width = 817
    Height = 305
    DataSource = dm.ds_fornecedor
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grid_fornecedoresDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Width = 200
        Visible = True
      end>
  end
  object btn_novo: TButton
    Left = 32
    Top = 367
    Width = 105
    Height = 57
    Caption = 'Novo'
    TabOrder = 1
    OnClick = btn_novoClick
  end
end
