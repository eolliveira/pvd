unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.TitleBarCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Phys;

type
  Tfrm_cargos = class(TForm)
    tabContatos: TPageControl;
    tabSearch: TTabSheet;
    tabForm: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btn_novo: TButton;
    tb_cargo: TFDTable;
    tb_cargoid: TFDAutoIncField;
    tb_cargocargo: TStringField;
    ds_cargos: TDataSource;
    query_cargos: TFDQuery;
    query_cargosid: TFDAutoIncField;
    query_cargoscargo: TStringField;
    btn_editar: TButton;
    lb_cargo: TLabel;
    btn_cancelar: TButton;
    btn_remover: TButton;
    btn_salvar: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    gd_cargos: TDBGrid;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    procedure btn_novoClick(Sender: TObject);
    procedure listarCargos;
    procedure FormShow(Sender: TObject);
    procedure gd_cargosDblClick(Sender: TObject);
    procedure tabContatosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    SQL : String;
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

procedure Tfrm_cargos.FormCreate(Sender: TObject);
begin
  tabContatos.ActivePage := tabSearch;
end;

procedure Tfrm_cargos.FormShow(Sender: TObject);
  begin
    //listarCargos;

  var
    i:Integer;
  begin
    for i := 0 to Pred(ds_cargos.DataSet.FieldCount) do
    begin
      if ds_cargos.DataSet.Fields[i].Tag = 1 then
        ComboBox1.Items.Add(ds_cargos.DataSet.Fields[i].DisplayLabel);
    end;
  end;
    SQL := (ds_cargos.DataSet as TFDQuery).SQL.Text;


  end;

procedure Tfrm_cargos.gd_cargosDblClick(Sender: TObject);
  begin
    id_cargo := query_cargos.FieldByName('id').Value;
    nome_cargo := query_cargos.FieldByName('cargo').Value;

    frm_cargos.modoInsercao := false;

    //frm_cargos_edit := Tfrm_cargos_edit.Create(Self);
    //frm_cargos_edit.ShowModal;
    tabContatos.ActivePage := tabForm;
  end;

procedure Tfrm_cargos.listarCargos;
  begin
    query_cargos.Close;
    //query_cargos.SQL.Clear;
    //query_cargos.SQL.Add('SELECT * FROM tb_cargo Order by cargo');
    query_cargos.Open();
  end;

procedure Tfrm_cargos.tabContatosChange(Sender: TObject);
begin
  //if True then




end;

end.
