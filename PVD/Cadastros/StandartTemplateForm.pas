unit StandartTemplateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.ControlList;

type
  TFStandartTemplateForm = class(TForm)
    qryGeral: TFDQuery;
    dsGeral: TDataSource;
    pgcPrincipal: TPageControl;
    tabSearch: TTabSheet;
    tabForm: TTabSheet;
    qryGeralid: TFDAutoIncField;
    qryGeralcargo: TStringField;
    pnlDados: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    pnlConsulta: TPanel;
    cbbColunas: TComboBox;
    edtConsulta: TEdit;
    btnConsultar: TButton;
    lb_filtra: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dsGeralStateChange(Sender: TObject);
    procedure qryGeralBeforeDelete(DataSet: TDataSet);
  private
    SQL : String;
  public
    { Public declarations }
  end;

var
  FStandartTemplateForm: TFStandartTemplateForm;

implementation

uses Modulo;

{$R *.dfm}

procedure TFStandartTemplateForm.btnConsultarClick(Sender: TObject);
var
  coluna:string;
  i : Integer;
begin
  coluna := EmptyStr;
  for i := 0 to Pred(dsGeral.DataSet.FieldCount) do
  begin
    if dsGeral.DataSet.Fields[i].DisplayLabel = cbbColunas.Text then
       coluna := dsGeral.DataSet.Fields[i].FieldName;
  end;

  if cbbColunas.Text = 'Preenchido' then
  begin
    (dsGeral.DataSet as TFDQuery).SQL.Text := SQL;
     dsGeral.DataSet.Open();
  end
  else
  begin
    dsGeral.DataSet.Close();
    (dsGeral.DataSet as TFDQuery).SQL.Text := SQL + ' WHERE ' + coluna + ' = :valor ';
    (dsGeral.DataSet as TFDQuery).Params.ParamByName('valor').Value := edtConsulta.Text;
    dsGeral.DataSet.Open();
  end;
end;

procedure TFStandartTemplateForm.DBGrid1DblClick(Sender: TObject);
begin
  //Ao clicar duas vezes sobre o grid, selecionar a aba de cadastro
  pgcPrincipal.ActivePageIndex := 1;
end;

procedure TFStandartTemplateForm.dsGeralStateChange(Sender: TObject);
begin
  pnlDados.Enabled := dsGeral.DataSet.State in [dsEdit, dsInsert];
  //O painel com os campos para edi��o e inser��o s� fica habilitado
  //se o DataSet estiver em edi��o ou inser��o}
end;

procedure TFStandartTemplateForm.FormShow(Sender: TObject);
var
    i:Integer;
begin
  for i := 0 to Pred(dsGeral.DataSet.FieldCount) do
  begin
    if dsGeral.DataSet.Fields[i].Tag = 1 then
    cbbColunas.Items.Add(dsGeral.DataSet.Fields[i].DisplayLabel);
  end;
  SQL := (dsGeral.DataSet as TFDQuery).SQL.Text;
end;

procedure TFStandartTemplateForm.qryGeralBeforeDelete(DataSet: TDataSet);
begin
   if not MessageDlg('Deseja excluir o Registro?', mtInformation,[mbYes, mbNo], 0) = mrYes then
   begin
     DataSet.Cancel;
     DataSet.Destroying;
     DataSet.Close;
   end;
end;

end.

