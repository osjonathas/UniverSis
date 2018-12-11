unit filtroRel.DesempenhoAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFiltroRelModelo, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TfrmFiltroRelDesempAluno = class(TfrmFiltroRelModelo)
    FDRelatorio: TFDQuery;
    FDRelatorioIDALUNO: TIntegerField;
    FDRelatorioNOME: TStringField;
    FDRelatorioIDALUNO_1: TIntegerField;
    FDRelatorioIDDISCIPLINA: TIntegerField;
    FDRelatorioNOTAPRIPER: TBCDField;
    FDRelatorioNOTASEGPER: TBCDField;
    FDRelatorioNOTATERPER: TBCDField;
    FDRelatorioNOTAQUAPER: TBCDField;
    FDRelatorioNOTATRABPRIPER: TBCDField;
    FDRelatorioNOTATRABSEGPER: TBCDField;
    FDRelatorioNOTATRABTERPER: TBCDField;
    FDRelatorioNOTATRABQUAPER: TBCDField;
    FDRelatorioDESCRICAO: TStringField;
    rgResultado: TRadioGroup;
    FDRelatorioMedia: TCurrencyField;
    procedure FDRelatorioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Relatorio(aImpresso:boolean = False); override;
  public
    { Public declarations }
  end;

var
  frmFiltroRelDesempAluno: TfrmFiltroRelDesempAluno;

implementation

{$R *.dfm}

uses Dados.Firebird, UnFuncoesAuxiliares, UnMensagem, unConstantes, UnTipos, relatorio.DesempenhoAluno;

{ TfrmFiltroRelDesempAluno }

procedure TfrmFiltroRelDesempAluno.FDRelatorioCalcFields(DataSet: TDataSet);
begin
  inherited;
  FdRelatorioMedia.AsFloat := getDivisao((FDRelatorioNotaPriPer.AsFloat +
                               FDRelatorioNotaTrabPriPer.AsFloat +
                               FDRelatorioNotaSegPer.AsFloat +
                               FDRelatorioNotaTrabSegPer.AsFloat +
                               FDRelatorioNotaTerPer.AsFloat +
                               FDRelatorioNotaTrabTerPer.AsFloat +
                               FDRelatorioNotaQuaPer.AsFloat +
                               FDRelatorioNotaTrabQuaPer.AsFloat), 8);
end;

procedure TfrmFiltroRelDesempAluno.Relatorio(aImpresso: boolean);
begin
  inherited;
  FDRelatorio.Close;
  FDRelatorio.SQL.Clear;
  FDRelatorio.SQL.Add(' select a.*, ad.*, d.descricao ');
  FDRelatorio.SQL.Add(' from aluno a');
  FDRelatorio.SQL.Add(' left outer join aluno_disciplina ad on (ad.idaluno = a.idaluno)');
  FDRelatorio.SQL.Add(' left outer join disciplina d on (d.iddisciplina = ad.iddisciplina)');
  FDRelatorio.SQL.Add(' where 1=1 ');
  FDRelatorio.SQL.Add(' order by a.nome');
  FDRelatorio.Open;

  FDRelatorio.Filtered := False;
  if rgResultado.ItemIndex = 1 then
  begin
    FDRelatorio.Filter := '((NotaPriPer +'+
                          ' NotaTrabPriPer+'+
                          ' NotaSegPer+'     +
                          ' NotaTrabSegPer+'  +
                          ' NotaTerPer+'       +
                          ' NotaTrabTerPer+'    +
                          ' NotaQuaPer+'         +
                          ' NotaTrabQuaPer)/ 8) >= 7';
    FDRelatorio.Filtered := True;
  end
  else if rgResultado.ItemIndex = 2 then
  begin
    FDRelatorio.Filter := '((NotaPriPer +'+
                          ' NotaTrabPriPer+'+
                          ' NotaSegPer+'     +
                          ' NotaTrabSegPer+'  +
                          ' NotaTerPer+'       +
                          ' NotaTrabTerPer+'    +
                          ' NotaQuaPer+'         +
                          ' NotaTrabQuaPer)/ 8) < 7';
    FDRelatorio.Filtered := True;
  end;

  if not FDRelatorio.IsEmpty then
  begin
    Application.CreateForm(TfrmRelDesempAluno,frmRelDesempAluno);
    try
      frmRelDesempAluno.lbTitulo.Caption := 'Desempenho de Alunos';
      frmRelDesempAluno.dsLocal.DataSet := FDRelatorio;
      frmRelDesempAluno.FTipoRel := rgResultado.ItemIndex;


      if aImpresso then
        frmRelDesempAluno.RLReport1.Print
      else
        frmRelDesempAluno.RLReport1.Preview;
    finally
      FreeAndNil(frmRelDesempAluno);
    end;
  end
  else
    TFrmMensagem.ExibirMensagem('Relatório gerado vazio!' ,tmInformacao);

end;

end.
