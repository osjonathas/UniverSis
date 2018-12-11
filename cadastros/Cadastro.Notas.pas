unit Cadastro.Notas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadastro.modelo, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Datasnap.DBClient;

type
  TfrmCadLancNotas = class(TfrmCadModelo)
    cdsPesquisa: TClientDataSet;
    cdsPesquisaIdAluno: TIntegerField;
    cdsPesquisaNome: TStringField;
    gridDisciplinas: TDBGrid;
    Label1: TLabel;
    lbNomeAluno: TLabel;
    dsAlunoDisc: TDataSource;
    cdsAlunoDisc: TClientDataSet;
    cdsAlunoDiscIdDisciplina: TIntegerField;
    cdsAlunoDiscNotaPriPer: TCurrencyField;
    cdsAlunoDiscNotaTerPer: TCurrencyField;
    cdsAlunoDiscNotaQuaPer: TCurrencyField;
    cdsAlunoDiscNotaTrabPriPer: TCurrencyField;
    cdsAlunoDiscNotaTrabTerPer: TCurrencyField;
    cdsAlunoDiscNotaTrabQuaPer: TCurrencyField;
    cdsAlunoDiscDescricao: TStringField;
    cdsAlunoDiscIdAluno: TIntegerField;
    cdsAlunoDiscNotaSegPer: TCurrencyField;
    cdsAlunoDiscNotaTrabSegPer: TCurrencyField;
    cdsAlunoDiscMedia: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure gridPesquisaDblClick(Sender: TObject);
    procedure cdsAlunoDiscCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarRegistroPesquisa(AValor: String = '');
    procedure CarregarDisciplinas(aIdAluno : integer);
    procedure RefreshListagem;

    procedure ColocarEmEstadoEdicao; Override;
    procedure CancelarEdicao; Override;
    procedure Persistir; Override;

  end;

var
  frmCadLancNotas: TfrmCadLancNotas;

implementation

{$R *.dfm}

uses classe.aluno, GenericDao, classe.aluno_disciplina, classe.disciplina, UnitPergunta, UnTipos, unConstantes, UnFuncoesAuxiliares, UnMensagem;

procedure TfrmCadLancNotas.CancelarEdicao;
begin
  inherited;
  if tfrmPergunta.Pergunta(mPerguntaCancela, tmPergunta) then
  begin
    FInclusao := False;
    FEdicao := False;
    inherited;
  end;
end;

procedure TfrmCadLancNotas.CarregarDisciplinas(aIdAluno: integer);
var aDadosDisc : TDataSet;
    aAlnDisc : TAluno_Disciplina;
    aDisc : TDisciplina;
    aValorPK : integer;
begin
  inherited;
  aDadosDisc := TDataSet.Create(self);
  aAlnDisc   := TAluno_Disciplina.Create;
  aDisc      := TDisciplina.Create;

  cdsAlunoDisc.EmptyDataSet;

  try
    aDadosDisc :=  TGenericDAO.GetPesquisa(aAlnDisc, aIdAluno);
    if assigned(aDadosDisc) then
    begin
      aDadosDisc.First;
      while not aDadosDisc.Eof do
      begin
        aValorPK := aDadosDisc.FieldByName('IdDisciplina').AsInteger;

        cdsAlunoDisc.Append;
        cdsAlunoDiscIdAluno.AsInteger      := aDadosDisc.FieldByName('IDAluno').AsInteger;
        cdsAlunoDiscIdDisciplina.AsInteger := aDadosDisc.FieldByName('IdDisciplina').AsInteger;
        cdsAlunoDiscDescricao.AsString     := TGenericDAO.GetDescricao(aDisc, aValorPK);

        cdsAlunoDiscNotaPriPer.AsFloat      := aDadosDisc.FieldByName('NotaPriPer').AsFloat;
        cdsAlunoDiscNotaSegPer.AsFloat      := aDadosDisc.FieldByName('NotaSegPer').AsFloat;
        cdsAlunoDiscNotaTerPer.AsFloat      := aDadosDisc.FieldByName('NotaTerPer').AsFloat;
        cdsAlunoDiscNotaQuaPer.AsFloat      := aDadosDisc.FieldByName('NotaQuaPer').AsFloat;
        cdsAlunoDiscNotaTrabPriPer.AsFloat  := aDadosDisc.FieldByName('NotaTrabPriPer').AsFloat;
        cdsAlunoDiscNotaTrabSegPer.AsFloat  := aDadosDisc.FieldByName('NotaTrabSegPer').AsFloat;
        cdsAlunoDiscNotaTrabTerPer.AsFloat  := aDadosDisc.FieldByName('NotaTrabTerPer').AsFloat;
        cdsAlunoDiscNotaTrabQuaPer.AsFloat  := aDadosDisc.FieldByName('NotaTrabQuaPer').AsFloat;

        cdsAlunoDisc.Post;
        aDadosDisc.next;
      end;
    end;
  except on E: Exception do
    begin
      raise
    end;
  end;
end;

procedure TfrmCadLancNotas.CarregarRegistroPesquisa(AValor: String);
begin
  if not cdsPesquisa.IsEmpty then
  begin
    lbNomeAluno.Caption := IntToStr(cdsPesquisaIdAluno.AsInteger)+' - '+trim(cdsPesquisaNome.AsString);
    pgCadastro.ActivePage := tsDadosCad;
    CarregarDisciplinas(cdsPesquisaIdAluno.AsInteger);
  end;
end;

procedure TfrmCadLancNotas.cdsAlunoDiscCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsAlunoDiscMedia.AsFloat := getDivisao((cdsAlunoDiscNotaPriPer.AsFloat +
                               cdsAlunoDiscNotaTrabPriPer.AsFloat +
                               cdsAlunoDiscNotaSegPer.AsFloat +
                               cdsAlunoDiscNotaTrabSegPer.AsFloat +
                               cdsAlunoDiscNotaTerPer.AsFloat +
                               cdsAlunoDiscNotaTrabTerPer.AsFloat +
                               cdsAlunoDiscNotaQuaPer.AsFloat +
                               cdsAlunoDiscNotaTrabQuaPer.AsFloat), 8);
end;

procedure TfrmCadLancNotas.ColocarEmEstadoEdicao;
begin
  inherited;
  FEdicao := True;
//  cdsAlunoDisc.Edit;
  pgCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadLancNotas.FormShow(Sender: TObject);
begin
  inherited;
  RefreshListagem;
  lbNomeAluno.Caption := '';
end;

procedure TfrmCadLancNotas.gridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroPesquisa();
end;

procedure TfrmCadLancNotas.Persistir;
var aDiscip : TAluno_disciplina;
begin
  aDiscip := TAluno_disciplina.Create;
  try
    if not cdsAlunoDisc.IsEmpty then
    begin
      TGenericDAO.DeleteSlaveTable(aDiscip, cdsAlunoDiscIdAluno.AsInteger);
      cdsAlunoDisc.first;
      while not cdsAlunoDisc.Eof do
      begin
        aDiscip.CodigoAluno      := cdsAlunoDiscIdAluno.AsInteger;
        aDiscip.CodigoDisciplina := cdsAlunoDiscIdDisciplina.AsInteger;
        aDiscip.CodigoDisciplina := cdsAlunoDiscIdDisciplina.AsInteger;

        aDiscip.NotaPriPer     := cdsAlunoDiscNotaPriPer.AsFloat;
        aDiscip.NotaTrabPriPer := cdsAlunoDiscNotaTrabPriPer.AsFloat;
        aDiscip.NotaSegPer     := cdsAlunoDiscNotaSegPer.AsFloat;
        aDiscip.NotaTrabSegPer := cdsAlunoDiscNotaTrabSegPer.AsFloat;
        aDiscip.NotaTerPer     := cdsAlunoDiscNotaTerPer.AsFloat;
        aDiscip.NotaTrabTerPer := cdsAlunoDiscNotaTrabTerPer.AsFloat;
        aDiscip.NotaQuaPer     := cdsAlunoDiscNotaQuaPer.AsFloat;
        aDiscip.NotaTrabQuaPer := cdsAlunoDiscNotaTrabQuaPer.AsFloat;
        TGenericDAO.Insert(aDiscip);
        cdsAlunoDisc.next;
      end;
    end;

    TFrmMensagem.ExibirMensagem('Registro realizado com sucesso!',tmInformacao);
    FInclusao := False;
    FEdicao := False;
    RefreshListagem;
    inherited;
  except on E: Exception do
    begin
      TFrmMensagem.ExibirMensagem('Problemas ao lançar as notas! '+E.Message, tmAlerta);
    end;
  end;
end;

procedure TfrmCadLancNotas.RefreshListagem;
var aDadosAluno : TDataSet;
    aAluno : TAluno;
begin
  inherited;
  cdsPesquisa.EmptyDataSet;
  aDadosAluno := TDataSet.Create(self);
  aAluno := TAluno.Create;

  try
    aDadosAluno :=  TGenericDAO.GetAll(aAluno);
    aDadosAluno.First;
    while not aDadosAluno.Eof do
    begin
      cdsPesquisa.AppendRecord([aDadosAluno.FieldByName('IDAluno').AsInteger,
                                aDadosAluno.FieldByName('Nome').AsString]);
      aDadosAluno.next;
    end;
  except on E: Exception do
    begin
      raise
    end;
  end;
end;

end.
