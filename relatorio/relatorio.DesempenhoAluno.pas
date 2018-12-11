unit relatorio.DesempenhoAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unRelModelo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLPDFFilter, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLFilters, RLXLSFilter, RLReport;

type
  TfrmRelDesempAluno = class(TfrmRelModelo)
    RLGroup1: TRLGroup;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    lbAluno: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    lbresultado: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTipoRel : integer;
  end;

var
  frmRelDesempAluno: TfrmRelDesempAluno;

implementation

{$R *.dfm}

procedure TfrmRelDesempAluno.FormCreate(Sender: TObject);
begin
  inherited;
  FTipoRel := 0;
end;

procedure TfrmRelDesempAluno.RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  Contraste(RLBand6);
//  RLBand6.Height := 18;
  if dsLocal.DataSet.FieldByName('media').AsFloat < 7 then
  begin
    lbresultado.Caption := 'Reprovado';
    lbresultado.Font.Color := clRed;

//    if FTipoRel = 1 then
//      RLGroup1.Height := 0;
  end
  else
  begin
    lbresultado.Caption := 'Aprovado';
    lbresultado.Font.Color := clGreen;

//    if FTipoRel = 2 then
//      RLGroup1.Height := 0;
  end;
end;

procedure TfrmRelDesempAluno.RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  lbAluno.Caption := IntToStr(dsLocal.DataSet.FieldByName('IDALUNO').AsInteger) +' - '+Trim(dsLocal.DataSet.FieldByName('NOME').AsString);
end;

end.
