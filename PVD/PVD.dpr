program PVD;

uses
  Vcl.Forms,
  Login in 'Login.pas' {frm_login},
  Menu in 'Menu.pas' {frm_menu},
  Usuarios in 'Usuarios.pas' {frm_usuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(Tfrm_usuarios, frm_usuarios);
  Application.Run;
end.
