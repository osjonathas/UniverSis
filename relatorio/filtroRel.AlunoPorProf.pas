unit filtroRel.AlunoPorProf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unFiltroRelModelo, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TfrmFiltroRelAlunPorProf = class(TfrmFiltroRelModelo)
    cdsRelatorio: TClientDataSet;
    cdsRelatorioIdProfessor: TIntegerField;
    cdsRelatorioNomeProfessor: TStringField;
    cdsRelatorioIdAluno: TIntegerField;
    cdsRelatorioNomeAluno: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Relatorio(aImpresso:boolean = False); override;
  end;

var
  frmFiltroRelAlunPorProf: TfrmFiltroRelAlunPorProf;

implementation

{$R *.dfm}

uses UnMensagem, unConstantes, UnTipos, Dados.Firebird, relatorio.AlunoPorProf;

{ TfrmFiltroRelAlunPorProf }

procedure TfrmFiltroRelAlunPorProf.Relatorio(aImpresso: boolean);
begin
  inherited;
  DadosFirebird.FDQuery.Close;
  DadosFirebird.FDQuery.SQL.Clear;
  DadosFirebird.FDQuery.SQL.Add(' select ad.idaluno,  pd.iddisciplina, p.idprofessor, p.nome as nomeprofessor, a.nome as nomealuno');
  DadosFirebird.FDQuery.SQL.Add(' from aluno_disciplina  ad');
  DadosFirebird.FDQuery.SQL.Add(' inner join professor_disciplina pd on(pd.iddisciplina = ad.iddisciplina)');
  DadosFirebird.FDQuery.SQL.Add(' inner join professor p on(p.idprofessor = pd.idprofessor)');
  DadosFirebird.FDQuery.SQL.Add(' inner join aluno a on(a.idaluno = ad.idaluno)');
  DadosFirebird.FDQuery.SQL.Add(' group by ad.idaluno,  pd.iddisciplina, p.idprofessor, nomeprofessor, nomealuno');
  DadosFirebird.FDQuery.SQL.Add(' order by nomeprofessor');

  DadosFirebird.FDQuery.Open;

  if not DadosFirebird.FDQuery.IsEmpty then
  begin
    cdsRelatorio.EmptyDataSet;
    cdsRelatorio.Open;

    DadosFirebird.FDQuery.First;
    while not DadosFirebird.FDQuery.Eof do
    begin
      cdsRelatorio.First;
      if not cdsRelatorio.Locate('IDPROFESSOR;IDALUNO',
                                VarArrayOf([DadosFirebird.FDQuery.FieldByName('IdProfessor').AsInteger,
                                DadosFirebird.FDQuery.FieldByName('IdAluno').AsInteger
                                ]), []) then
      begin
        cdsRelatorio.Append;
        cdsRelatorioIdProfessor.AsInteger  := DadosFirebird.FDQuery.FieldByName('IdProfessor').AsInteger;
        cdsRelatorioIdAluno.AsInteger      := DadosFirebird.FDQuery.FieldByName('IdAluno').AsInteger;
        cdsRelatorioNomeProfessor.AsString := DadosFirebird.FDQuery.FieldByName('NomeProfessor').AsString;
        cdsRelatorioNomeAluno.AsString     := DadosFirebird.FDQuery.FieldByName('NomeaLUNO').AsString;
        cdsRelatorio.Post;
      end;

      DadosFirebird.FDQuery.Next;
    end;
  end;

  if not cdsRelatorio.IsEmpty then
  begin
    Application.CreateForm(TfrmRelAlunoPorProf,frmRelAlunoPorProf);
    try
      frmRelAlunoPorProf.lbTitulo.Caption := 'Alunos Por Professor';
      frmRelAlunoPorProf.dsLocal.DataSet := cdsRelatorio;

      if aImpresso then
        frmRelAlunoPorProf.RLReport1.Print
      else
        frmRelAlunoPorProf.RLReport1.Preview;
    finally
      FreeAndNil(frmRelAlunoPorProf);
    end;
  end
  else
    TFrmMensagem.ExibirMensagem('Relatório gerado vazio!' ,tmInformacao);

end;

end.
