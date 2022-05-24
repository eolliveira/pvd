unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  Tfrm_cargos = class(TForm)
    gd_cargos: TDBGrid;
    btn_novo: TButton;
    procedure btn_novoClick(Sender: TObject);
    procedure listarCargos;
    procedure FormShow(Sender: TObject);
    procedure gd_cargosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_cargo : String;
    nome_cargo : string;
    modoInsercao : Boolean;
  end;

var
  frm_cargos: Tfrm_cargos;


implementation

{$R *.dfm}

uses Modulo, CargosEdit;

procedure Tfrm_cargos.btn_novoClick(Sender: TObject);
  begin
    modoInsercao := true;
    frm_cargos_edit := Tfrm_cargos_edit.Create(Self);
    frm_cargos_edit.ShowModal;
  end;

procedure Tfrm_cargos.FormShow(Sender: TObject);
  begin
    listarCargos;
  end;

procedure Tfrm_cargos.gd_cargosDblClick(Sender: TObject);
  begin
    id_cargo := dm.query_cargos.FieldByName('id').Value;
    nome_cargo := dm.query_cargos.FieldByName('cargo').Value;

    frm_cargos.modoInsercao := false;

    frm_cargos_edit := Tfrm_cargos_edit.Create(Self);
    frm_cargos_edit.ShowModal;
  end;

procedure Tfrm_cargos.listarCargos;
  begin
    dm.query_cargos.Close;
    dm.query_cargos.SQL.Clear;
    dm.query_cargos.SQL.Add('SELECT * FROM tb_cargo Order by cargo');
    dm.query_cargos.Open();
  end;

end.
