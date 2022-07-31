unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfrm_funcionarios = class(TForm)
    PGFuncionario: TPageControl;
    PConsulta: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    txt_busca_nome: TEdit;
    txt_busca_cpf: TMaskEdit;
    rb_nome: TRadioButton;
    rb_cpf: TRadioButton;
    PCadastro: TTabSheet;
    btn_novo: TButton;
    lb_nome: TLabel;
    lb_cpf: TLabel;
    lb_telefone: TLabel;
    lb_endereco: TLabel;
    Label2: TLabel;
    txt_nome: TEdit;
    txt_endereco: TEdit;
    cb_cargo: TComboBox;
    txt_cpf: TMaskEdit;
    txt_telefone: TMaskEdit;
    btn_salvar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    btn_cancelar: TButton;
    txt_cargo_id: TEdit;
    FDQuery_func_cargo: TFDQuery;
    DSFuncionario: TDataSource;
    FDQuery_cargo: TFDQuery;
    tb_funcionario: TFDTable;
    tb_funcionarioid: TFDAutoIncField;
    tb_funcionarionome: TStringField;
    tb_funcionariocpf: TStringField;
    tb_funcionariotelefone: TStringField;
    tb_funcionarioendereco: TStringField;
    tb_funcionariocargo_id: TIntegerField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure atualizaGrid;
    procedure btn_novoClick(Sender: TObject);
    procedure txt_busca_nomeChange(Sender: TObject);
    procedure buscaPorNome;
    procedure buscaPorCpf;
    procedure rb_nomeClick(Sender: TObject);
    procedure rb_cpfClick(Sender: TObject);
    procedure txt_busca_cpfChange(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure carregaComboBox();
  private
    id_func : string;
    nome_func : string;
    cpf_func : string;
    telefone_func : string;
    endereco_func : string;
    id_cargo_func : string;
    cargo_func : string;

    cpf_antigo : string;
  public

  end;

var
  frm_funcionarios: Tfrm_funcionarios;

implementation

{$R *.dfm}

uses Modulo, FuncionariosEdit, Cargos;

{ Tfrm_funcionarios }

procedure Tfrm_funcionarios.btn_editarClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  btn_editar.Enabled := false;
  btn_remover.Enabled := false;
  btn_cancelar.Enabled := true;

  txt_nome.Enabled := true;
  txt_cpf.Enabled := true;
  txt_telefone.Enabled := true;
  txt_endereco.Enabled := true;
  cb_cargo.Enabled := true;


  tb_funcionario.Edit;
  cpf_antigo := txt_cpf.Text;
end;

procedure Tfrm_funcionarios.btn_novoClick(Sender: TObject);
begin
  //nome_func := 'novo';

    btn_salvar.Enabled := true;
    btn_editar.Enabled := false;
    btn_remover.Enabled := false;

    txt_nome.Enabled := true;
    txt_endereco.Enabled := true;
    txt_cpf.Enabled := true;
    txt_telefone.Enabled := true;
    cb_cargo.Enabled := true;
    //carregaComboBox;

    txt_nome.Text := '';
    //dm.tb_funcionario.Insert;

    tb_funcionario.Insert;


  //frm_funcionarios_edit := Tfrm_funcionarios_edit.Create(Self);
  //frm_funcionarios_edit.ShowModal;
end;

procedure Tfrm_funcionarios.btn_salvarClick(Sender: TObject);
begin
   //modo inserção
  //rm_funcionarios.nome_func = 'novo'
  if tb_funcionario.State in [dsInsert] then
  begin

    if Trim(txt_nome.text) = '' then
    begin
      messageDlg('Informe um nome para o Funcionário!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_nome.SetFocus;
      Exit
    end;

    //CPF
    //verificaFuncionarioExistente;

    //associa campos do BD, ao campo do formulario
    dm.tb_funcionario.FieldByName('nome').Value := txt_nome.Text;
    dm.tb_funcionario.FieldByName('cpf').Value := txt_cpf.Text;
    dm.tb_funcionario.FieldByName('telefone').Value := txt_telefone.Text;
    dm.tb_funcionario.FieldByName('endereco').Value := txt_endereco.Text;
    dm.tb_funcionario.FieldByName('cargo_id').Value := StrToInt(txt_cargo_id.Text);


    dm.tb_funcionario.Post;
    messageDlg('Funcionário foi cadastrado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end
  else
  //modo de edição
  begin

    if Trim(txt_nome.text) = '' then
    begin
      messageDlg('Informe um nome para o Funcionário!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_nome.SetFocus;
      Exit
    end;

    if cpf_antigo <> txt_cpf.Text then
    begin
      dm.query_funcionario.Close;
      dm.query_funcionario.SQL.Clear;
      dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario WHERE cpf = :cpf');
      dm.query_funcionario.ParamByName('cpf').Value := txt_cpf.Text;
      dm.query_funcionario.Open;

      if not dm.query_funcionario.IsEmpty then
      begin
        messageDlg('CPF informado ja pertence a outra pessoa!', TMsgDlgType.mtInformation, mbOKCancel, 0);
        txt_cpf.SetFocus;
        exit
      end;
    end;

    //associaCampos;

    frm_cargos.query_cargos.Close;
    frm_cargos.query_cargos.SQL.Clear;
    frm_cargos.query_cargos.SQL.Add('UPDATE tb_funcionario SET nome = :nome, cpf = :cpf, telefone = :telefone, endereco = :endereco, cargo_id = :cargo_id WHERE id = :id');
    frm_cargos.query_cargos.ParamByName('id').Value := id_func;
    frm_cargos.query_cargos.ParamByName('nome').Value := txt_nome.Text;
    frm_cargos.query_cargos.ParamByName('cpf').Value := txt_cpf.Text;
    frm_cargos.query_cargos.ParamByName('telefone').Value := txt_telefone.Text;
    frm_cargos.query_cargos.ParamByName('endereco').Value := txt_endereco.Text;
    frm_cargos.query_cargos.ParamByName('cargo_id').Value := txt_cargo_id.Text;
    frm_cargos.query_cargos.ExecSQL();

    messageDlg('Dados do Funcionário alterados com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;

  end;
end;

procedure Tfrm_funcionarios.DBGrid1DblClick(Sender: TObject);
begin

  id_func := FDQuery_func_cargo.FieldByName('id').Value;
  nome_func := FDQuery_func_cargo.FieldByName('nome').Value;
  cpf_func := FDQuery_func_cargo.FieldByName('cpf').Value;
  telefone_func := FDQuery_func_cargo.FieldByName('telefone').Value;
  endereco_func := FDQuery_func_cargo.FieldByName('endereco').Value;
  id_cargo_func := FDQuery_func_cargo.FieldByName('cargo_id').Value;
  cargo_func := FDQuery_func_cargo.FieldByName('cargo').Value;

   PGFuncionario.ActivePage := PCadastro;
  //frm_funcionarios_edit := Tfrm_funcionarios_edit.Create(Self);
  //frm_funcionarios_edit.ShowModal;


  txt_nome.Text := nome_func;
  txt_endereco.Text := endereco_func;
  txt_cpf.Text := cpf_func;
  txt_telefone.Text := telefone_func;
  txt_cargo_id.Text := id_cargo_func;

   //buscando pelo id do cargo
  FDQuery_cargo.Close;
  FDQuery_cargo.SQL.Clear;
  FDQuery_cargo.SQL.Add('SELECT * FROM tb_cargo WHERE id = :id');

  FDQuery_cargo.ParamByName('id').Value := id_cargo_func;
  FDQuery_cargo.Open();

  //txt_cargo_id.Text := IntToStr(FDQuery_cargo.FieldByName('id').Value);
  cb_cargo.Text := FDQuery_cargo.FieldByName('cargo').Value;
end;

procedure Tfrm_funcionarios.buscaPorCpf;
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario WHERE cpf = :cpf');
  dm.query_funcionario.ParamByName('cpf').Value := txt_busca_cpf.Text;
  dm.query_funcionario.Open();
end;


procedure Tfrm_funcionarios.buscaPorNome;
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario WHERE nome LIKE :nome');
  dm.query_funcionario.ParamByName('nome').Value := txt_busca_nome.Text + '%';
  dm.query_funcionario.Open();
end;

procedure Tfrm_funcionarios.carregaComboBox;
begin
  frm_cargos.query_cargos.Close;
  frm_cargos.query_cargos.SQL.Clear;
  frm_cargos.query_cargos.SQL.Add('SELECT * FROM tb_cargo ORDER BY cargo');
  frm_cargos.query_cargos.Open;

  //se houver registros em tb_cargos
  if not frm_cargos.query_cargos.IsEmpty then
  begin

    //eof aponta para o ultimo registro da query
    while not frm_cargos.query_cargos.Eof do
    begin
      cb_cargo.Items.Add(frm_cargos.query_cargos.FieldByName('cargo').AsString);
      frm_cargos.query_cargos.Next;
    end;

  end;
end;

procedure Tfrm_funcionarios.FormShow(Sender: TObject);
begin
    atualizaGrid;
end;

procedure Tfrm_funcionarios.rb_cpfClick(Sender: TObject);
begin
  txt_busca_nome.Visible := false;
  txt_busca_cpf.Visible := true;
  txt_busca_cpf.SetFocus;
  buscaPorCpf;
end;

procedure Tfrm_funcionarios.rb_nomeClick(Sender: TObject);
begin
  txt_busca_cpf.Visible := false;
  txt_busca_nome.Visible := true;
  atualizaGrid;
end;

procedure Tfrm_funcionarios.txt_busca_cpfChange(Sender: TObject);
begin
  if txt_busca_cpf.Text <> '___.___.___-__' then
  begin
    buscaPorCpf;
  end
  else
    begin
      atualizaGrid;
    end;
end;

procedure Tfrm_funcionarios.txt_busca_nomeChange(Sender: TObject);
begin
  buscaPorNome
end;

procedure Tfrm_funcionarios.atualizaGrid;
begin
  //dm.query_funcionario.Close;
  //dm.query_funcionario.SQL.Clear;
  ///dm.query_funcionario.SQL.Add('SELECT f.id, f.nome, f.cpf, f.telefone, f.endereco, f.cargo_id, c.cargo FROM tb_funcionario f JOIN tb_cargo c ON c.id = f.cargo_id');
  //FDQuery_func_cargo.Open();
end;

end.
