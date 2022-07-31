unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus;

type
  Tfrm_usuarios = class(TForm)
    btn_novo: TButton;
    grid_usuarios: TDBGrid;
    FD_query_user_func: TFDQuery;
    DSFunc_user: TDataSource;
    procedure atualizaGrid;
    procedure btn_novoClick(Sender: TObject);
    procedure grid_usuariosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    id_usuario : string;
    login : string;
    senha : string;
    perfil : string;
    func_id : string;
  end;

var
  frm_usuarios: Tfrm_usuarios;

implementation

{$R *.dfm}

uses Modulo, UsuarioEdit;

procedure Tfrm_usuarios.btn_novoClick(Sender: TObject);
begin
  dm.modoInsercao := true;
  frm_usuario_edit := Tfrm_usuario_edit.Create(Self);
  frm_usuario_edit.ShowModal;
end;

procedure Tfrm_usuarios.FormShow(Sender: TObject);
begin
  atualizaGrid;
end;

procedure Tfrm_usuarios.grid_usuariosDblClick(Sender: TObject);
begin
  id_usuario := dm.query_usuarios.FieldByName('id').Value;
  login := dm.query_usuarios.FieldByName('login').Value;
  senha := dm.query_usuarios.FieldByName('senha').Value;
  perfil := dm.query_usuarios.FieldByName('perfil').Value;

  if dm.query_usuarios.FieldByName('funcionario_id').Value <> null then
  func_id := dm.query_usuarios.FieldByName('funcionario_id').Value;

  dm.modoInsercao := false;

  frm_usuario_edit := Tfrm_usuario_edit.Create(Self);
  frm_usuario_edit.ShowModal;
end;

procedure Tfrm_usuarios.atualizaGrid;
begin
  dm.query_usuarios.Close;
  dm.query_usuarios.SQL.Clear;
  dm.query_usuarios.SQL.Add('SELECT u.id, u.login, u.senha, u.perfil, u.funcionario_id, f.nome FROM tb_usuario u JOIN tb_funcionario f ON u.funcionario_id = f.id');
  dm.query_usuarios.Open();
end;

end.
