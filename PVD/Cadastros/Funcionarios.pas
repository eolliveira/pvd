unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_funcionarios = class(TForm)
    txt_busca_nome: TEdit;
    txt_busca_cpf: TMaskEdit;
    Label1: TLabel;
    rb_nome: TRadioButton;
    rb_cpf: TRadioButton;
    btn_novo: TButton;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure atualizaGrid;
    procedure btn_novoClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_func : string;
    nome_func : string;
    cpf_func : string;
    telefone_func : string;
    endereco_func : string;
    cargo_func : string;
  end;

var
  frm_funcionarios: Tfrm_funcionarios;

implementation

{$R *.dfm}

uses Modulo, FuncionariosEdit;

{ Tfrm_funcionarios }

procedure Tfrm_funcionarios.btn_novoClick(Sender: TObject);
begin
  nome_func := 'novo';

  frm_funcionarios_edit := Tfrm_funcionarios_edit.Create(Self);
  frm_funcionarios_edit.ShowModal;
end;

procedure Tfrm_funcionarios.DBGrid1DblClick(Sender: TObject);
begin

  id_func := dm.query_funcionario.FieldByName('id').Value;
  nome_func := dm.query_funcionario.FieldByName('nome').Value;
  cpf_func := dm.query_funcionario.FieldByName('cpf').Value;
  telefone_func := dm.query_funcionario.FieldByName('telefone').Value;
  endereco_func := dm.query_funcionario.FieldByName('endereco').Value;
  cargo_func := dm.query_funcionario.FieldByName('cargo').Value;

  frm_funcionarios_edit := Tfrm_funcionarios_edit.Create(Self);
  frm_funcionarios_edit.ShowModal;
end;

procedure Tfrm_funcionarios.FormShow(Sender: TObject);
begin
    atualizaGrid;
end;

procedure Tfrm_funcionarios.atualizaGrid;
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario Order by nome');
  dm.query_funcionario.Open();
end;

end.
