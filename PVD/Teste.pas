unit Teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StandartTemplateForm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask, Data.DB;

type
  TFTeste = class(TFStandartTemplateForm)
    DBEdit1: TDBEdit;
    lb_cargo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTeste: TFTeste;

implementation

{$R *.dfm}

end.
