program PVD;

uses
  Vcl.Forms,
  Login in 'Login.pas' {frm_login},
  Menu in 'Menu.pas' {frm_menu},
  Funcionarios in 'Cadastros\Funcionarios.pas' {frm_funcionarios},
  Usuarios in 'Cadastros\Usuarios.pas' {frm_usuarios},
  Cargos in 'Cadastros\Cargos.pas' {frm_cargos},
  Modulo in 'Modulo.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(Tfrm_cargos, frm_cargos);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
