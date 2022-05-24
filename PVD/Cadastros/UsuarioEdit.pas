unit UsuarioEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrm_usuario_edit = class(TForm)
    btn_salvar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    btn_cancelar: TButton;
    txt_usuario: TEdit;
    txt_senha: TEdit;
    txt_func_nome: TEdit;
    cb_perfil: TComboBox;
    txt_func_id: TEdit;
    lb_usuario: TLabel;
    lb_senha: TLabel;
    lb_funcionario: TLabel;
    lb_perfil: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure habilitaCampos;
    procedure desabilitaCampos;
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure carregaComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure txt_func_idChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    id_usuario : string;
    login : string;
    senha : string;
    perfil : string;
    func_id : string;
  public
    { Public declarations }
  end;

var
  frm_usuario_edit: Tfrm_usuario_edit;

implementation

{$R *.dfm}

uses Modulo, Usuarios, Funcionarios;

procedure Tfrm_usuario_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_usuarios.atualizaGrid;
end;

procedure Tfrm_usuario_edit.FormCreate(Sender: TObject);
begin
  carregaComboBox;
end;

procedure Tfrm_usuario_edit.FormShow(Sender: TObject);
begin
  dm.tb_usuario.Active := true;

  if frm_usuarios.modoInsercao = true then
  begin
    btn_salvar.Enabled := true;
    btn_editar.Enabled := false;
    btn_remover.Enabled := false;
    habilitaCampos;
    dm.tb_usuario.Insert;
  end
  else
  begin
    id_usuario := frm_usuarios.id_usuario;
    login := frm_usuarios.login;
    senha := frm_usuarios.senha;
    func_id := frm_usuarios.func_id;
    perfil := frm_usuarios.perfil;

    desabilitaCampos;

    txt_usuario.Text := login;
    txt_senha.Text := senha;
    txt_func_id.Text := func_id;
    cb_perfil.Text := perfil;

    btn_salvar.Enabled := false;
  end;
end;

procedure Tfrm_usuario_edit.habilitaCampos;
begin
  txt_usuario.Enabled := true;
  txt_senha.Enabled := true;
  txt_func_id.Enabled := true;
  txt_func_nome.Enabled := true;
  cb_perfil.Enabled := true;
end;

procedure Tfrm_usuario_edit.SpeedButton1Click(Sender: TObject);
begin
  frm_funcionarios := Tfrm_funcionarios.Create(Self);
   frm_funcionarios.ShowModal;
end;

procedure Tfrm_usuario_edit.txt_func_idChange(Sender: TObject);
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario WHERE id = :id');
  dm.query_funcionario.ParamByName('id').Value := txt_func_id.Text;
  dm.query_funcionario.Open;

  //pega o nome do func selecionado
  txt_func_nome.Text := dm.query_funcionario.FieldByName('nome').AsString;
end;

procedure Tfrm_usuario_edit.btn_cancelarClick(Sender: TObject);
begin
  //dm.query_funcionario.Close;
  dm.tb_funcionario.Close;
  Close;
end;

procedure Tfrm_usuario_edit.btn_editarClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  btn_editar.Enabled := false;
  btn_remover.Enabled := false;
  btn_cancelar.Enabled := true;
  habilitaCampos;

  dm.tb_usuario.Edit;

  frm_usuarios.modoInsercao := false;
end;

procedure Tfrm_usuario_edit.btn_salvarClick(Sender: TObject);
begin
  //modo inser��o
  if frm_usuarios.modoInsercao = true then
  begin

     if txt_usuario.text = '' then
     begin
      messageDlg('Insira um login para o Usu�rio!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_usuario.SetFocus;
      Exit
     end;

    //verificaCargoExistente;

    {
    if not dm.query_cargos.IsEmpty then
    begin
      messageDlg('Cargo ja existente! Por favor insira outro nome', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cargo.SetFocus;
      Exit
    end;
    }

    //associa campo do BD, ao campo do formulario
    dm.tb_usuario.FieldByName('login').Value := txt_usuario.Text;
    dm.tb_usuario.FieldByName('senha').Value := txt_senha.Text;
    dm.tb_usuario.FieldByName('perfil').Value := cb_perfil.Text;

    if txt_func_id.Text <> Trim('') then
    dm.tb_usuario.FieldByName('funcionario_id').Value := txt_func_id.Text;

    dm.tb_usuario.Post;
    messageDlg('Usu�rio foi cadastrado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;

  //modo edi��o
  if frm_usuarios.modoInsercao = false then
  begin

    if txt_usuario.text = '' then
    begin
      messageDlg('Insira um login para o Usu�rio!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_usuario.SetFocus;
      Exit
    end;

    //verificaCargoExistente;

    {
    if not dm.query_cargos.IsEmpty then
    begin
      messageDlg('Cargo ja existente! Por favor insira outro nome', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cargo.SetFocus;
      Exit
    end;
    }

    //associa campo do BD, ao campo do formulario
    dm.tb_usuario.FieldByName('login').Value := txt_usuario.Text;
    dm.tb_usuario.FieldByName('senha').Value := txt_senha.Text;
    dm.tb_usuario.FieldByName('perfil').Value := cb_perfil.Text;

    if txt_func_id.Text <> Trim('') then
    dm.tb_usuario.FieldByName('funcionario_id').Value := txt_func_id.Text;

    dm.query_usuarios.Close;
    dm.query_usuarios.SQL.Clear;
    dm.query_usuarios.SQL.Add('UPDATE tb_usuario SET login = :login, senha = :senha, perfil = :perfil, funcionario_id = :funcionario_id WHERE id = :id');
    dm.query_usuarios.ParamByName('login').Value := txt_usuario.Text;
    dm.query_usuarios.ParamByName('senha').Value := txt_senha.Text;
    dm.query_usuarios.ParamByName('perfil').Value := cb_perfil.Text;

    if txt_func_id.Text <> Trim('') then
    begin
      dm.query_usuarios.ParamByName('funcionario_id').Value := txt_func_id.Text;
    end
    else
    begin
      dm.query_usuarios.ParamByName('funcionario_id').Value := null;
    end;

    dm.query_usuarios.ParamByName('id').Value := id_usuario;
    dm.query_usuarios.ExecSQL();

    messageDlg('Usu�rio foi alterado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;

end;

procedure Tfrm_usuario_edit.carregaComboBox;
begin
  cb_perfil.Items.Add('ADMIN');
  cb_perfil.Items.Add('GERENTE');
  cb_perfil.Items.Add(('CAIXA'));
end;

procedure Tfrm_usuario_edit.desabilitaCampos;
begin
  txt_usuario.Enabled := false;
  txt_senha.Enabled := false;
  txt_func_id.Enabled := false;
  txt_func_nome.Enabled := false;
  cb_perfil.Enabled := false;
end;

end.
