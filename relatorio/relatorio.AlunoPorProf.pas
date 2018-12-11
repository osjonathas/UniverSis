unit relatorio.AlunoPorProf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unRelModelo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLPDFFilter, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLFilters, RLXLSFilter, RLReport;

type
  TfrmRelAlunoPorProf = class(TfrmRelModelo)
    RLGroup1: TRLGroup;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand8: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAlunoPorProf: TfrmRelAlunoPorProf;

implementation

{$R *.dfm}

end.
