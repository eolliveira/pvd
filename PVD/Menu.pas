unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls;

type
  Tfrm_menu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cadastro2: TMenuItem;
    Sair1: TMenuItem;
    PRODUTOS1: TMenuItem;
    Fornecedores1: TMenuItem;
    btn_fornecedores: TMenuItem;
    Cargos1: TMenuItem;
    Relatrios1: TMenuItem;
    Estoque1: TMenuItem;
    Funcionarios1: TMenuItem;
    procedure btn_fornecedoresClick(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_menu: Tfrm_menu;

implementation

{$R *.dfm}

uses Funcionarios, Teste, Usuarios, Cargos, Fornecedores, Modulo, Login;


procedure Tfrm_menu.Cargos1Click(Sender: TObject);
begin
  FTeste := TFTeste.Create(Self);
  FTeste.ShowModal;
end;

procedure Tfrm_menu.FormCreate(Sender: TObject);
begin
  //permi��o para usu�rio admin (users)
  if frm_login.perfil_user_logado = 'ADMIN' then
  btn_fornecedores.Enabled := true;
end;

procedure Tfrm_menu.Fornecedores1Click(Sender: TObject);
begin
  frm_fornecedores := Tfrm_fornecedores.Create(Self);
  frm_fornecedores.ShowModal;
end;

procedure Tfrm_menu.btn_fornecedoresClick(Sender: TObject);
begin
  frm_usuarios := Tfrm_usuarios.Create(Self);
  frm_usuarios.ShowModal;
end;

procedure Tfrm_menu.Funcionarios1Click(Sender: TObject);
begin
   frm_funcionarios := Tfrm_funcionarios.Create(Self);
   frm_funcionarios.ShowModal;
end;

procedure Tfrm_menu.Sair1Click(Sender: TObject);
begin
  /////
  if MessageDlg('Deseja sair do Sistema?', mtInformation,[mbYes, mbNo], 0) = mrYes then
  begin
    Close;
  end;
end;

end.
