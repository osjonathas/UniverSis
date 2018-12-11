unit Cadastro.Aluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadastro.modelo,  Vcl.DBCtrls, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask, J2REdit, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Imaging.pngimage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  classe.aluno, Datasnap.DBClient, Generics.Collections, JvExControls, JvGradientHeaderPanel;

type
  TfrmCadastroAlunos = class(TfrmCadModelo)
    Label18: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    dsAlunoObs: TDataSource;
    edtCodigo: TEdit;
    edtNome: TEdit;
    cdsPesquisa: TClientDataSet;
    cdsPesquisaIdAluno: TIntegerField;
    cdsPesquisaNome: TStringField;
    gridDisciplinas: TDBGrid;
    Label1: TLabel;
    btAdd: TButton;
    btRem: TButton;
    pnAddDisciplinas: TPanel;
    pnTitulo: TJvGradientHeaderPanel;
    Label40: TLabel;
    btOk: TSpeedButton;
    btCanc: TSpeedButton;
    DBGrid1: TDBGrid;
    dsListaDisciplinas: TDataSource;
    cdsListaDisciplinas: TClientDataSet;
    cdsListaDisciplinasIdDisciplina: TIntegerField;
    cdsListaDisciplinasDescricao: TStringField;
    cdsAlunoDisc: TClientDataSet;
    dsAlunoDisc: TDataSource;
    cdsAlunoDiscIdAluno: TIntegerField;
    cdsAlunoDiscIdDisciplina: TIntegerField;
    cdsAlunoDiscDescricao: TStringField;

    procedure btPesquisaInicialClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridPesquisaDblClick(Sender: TObject);
    procedure btRemClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);

  private
    { Private declarations }
    FAluno : TAluno;
  public
    { Public declarations }
    FEntrarEditando : boolean;
    FCodigoAluno : integer;
    procedure ColocarEmEstadoInclusao; Override;
    procedure ColocarEmEstadoEdicao; Override;
    procedure CancelarEdicao; Override;
    procedure Excluir; Override;
    procedure Persistir; Override;
    procedure ExecutarPesquisa; Override;
    function valida(AOpcao: integer):boolean;
    procedure CarregarRegistroPesquisa(AValor: String = '');
    procedure RefreshListagem;
    procedure CarregarDisciplinas(aIdAluno : integer);
    procedure ListarDisciplinas;
    procedure OcultarPainelDisciplinas;

  end;

var
  frmCadastroAlunos: TfrmCadastroAlunos;

implementation

{$R *.dfm}

uses Dados.Firebird, UnFuncoesAuxiliares, unConstantes, UnVariaveisGlobais, UnitPergunta, UnTipos, UnMensagem, GenericDao, classe.disciplina, classe.aluno_disciplina;

procedure TfrmCadastroAlunos.btAddClick(Sender: TObject);
begin
  inherited;
  if FInclusao or FEdicao then
  begin
    ListarDisciplinas;
    pnCentralCadastro.Enabled    := False;
    pnAddDisciplinas.Visible   := True;
    pnAddDisciplinas.Top       := 8;
    pnAddDisciplinas.Left      := 139;
  end
  else TFrmMensagem.ExibirMensagem(mSelecioneParaEdicao, tmAlerta);
end;

procedure TfrmCadastroAlunos.btAlterarClick(Sender: TObject);
begin
  inherited;
  ColocarEmEstadoEdicao;
end;

procedure TfrmCadastroAlunos.btCancClick(Sender: TObject);
begin
  inherited;
  OcultarPainelDisciplinas;
end;

procedure TfrmCadastroAlunos.btOkClick(Sender: TObject);
begin
  inherited;
  if not cdsAlunoDisc.Locate('IdDisciplina', cdsListaDisciplinasIdDisciplina.AsInteger, []) then
  begin
    cdsAlunoDisc.AppendRecord([StrToInt(edtCodigo.Text),
                               cdsListaDisciplinasIdDisciplina.AsInteger,
                               cdsListaDisciplinasDescricao.AsString]);
    OcultarPainelDisciplinas;
  end
  else
    TFrmMensagem.ExibirMensagem('Disciplina já inserida!', tmInformacao);
end;

procedure TfrmCadastroAlunos.btPesquisaInicialClick(Sender: TObject);
begin
  inherited;
  ExecutarPesquisa;
end;

procedure TfrmCadastroAlunos.btRemClick(Sender: TObject);
begin
  inherited;
  if not cdsPesquisa.IsEmpty then
  begin
    if TfrmPergunta.Pergunta('Deseja realmente excluir a disciplina?', tmPergunta) then
    begin
      cdsAlunoDisc.Delete;
    end;
  end;
end;

procedure TfrmCadastroAlunos.CancelarEdicao;
begin
  if tfrmPergunta.Pergunta(mPerguntaCancela, tmPergunta) then
  begin
    edtCodigo.Clear;
    FInclusao := False;
    FEdicao := False;
    inherited;
  end;
end;

procedure TfrmCadastroAlunos.CarregarDisciplinas(aIdAluno: integer);
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
        cdsAlunoDiscIdAluno.AsInteger  := aDadosDisc.FieldByName('IDAluno').AsInteger;
        cdsAlunoDiscIdDisciplina.AsInteger := aDadosDisc.FieldByName('IdDisciplina').AsInteger;
        cdsAlunoDiscDescricao.AsString     := TGenericDAO.GetDescricao(aDisc, aValorPK);
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

procedure TfrmCadastroAlunos.CarregarRegistroPesquisa(AValor: String = '');
begin
  if not cdsPesquisa.IsEmpty then
  begin
    edtCodigo.Text := IntToStr(cdsPesquisaIdAluno.AsInteger);
    edtNome.Text   := trim(cdsPesquisaNome.AsString);
    pgCadastro.ActivePage := tsDadosCad;

    CarregarDisciplinas(cdsPesquisaIdAluno.AsInteger);
  end;
end;

procedure TfrmCadastroAlunos.ColocarEmEstadoEdicao;
begin
  inherited;
  FEdicao := True;
  edtCodigo.Enabled := False;
  pgCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadastroAlunos.ColocarEmEstadoInclusao;
begin
  inherited;
  if not Assigned(FAluno) then
    FAluno := TAluno.Create();

  FInclusao := True;
  tsDadosCad.Enabled := True;
  edtCodigo.Text     := IntToStr(TGenericDAO.getID(FAluno, 'IDALUNO') + 1);
  edtCodigo.Enabled  := False;
  pgCadastro.ActivePage := tsDadosCad;
  SetarFoco(edtNome);
end;

procedure TfrmCadastroAlunos.Excluir;
begin
  inherited;
  if Trim(edtCodigo.Text) <> EmptyStr then
  begin
    if TfrmPergunta.Pergunta(mPerguntaExclusao, tmPergunta) then
    begin
      {

      verificar condições para a exclusão



      }
    end
  end
  else TFrmMensagem.ExibirMensagem(mSelecioneParaExclusao, tmInformacao);
end;

procedure TfrmCadastroAlunos.ExecutarPesquisa;
begin
  inherited;

end;

procedure TfrmCadastroAlunos.FormShow(Sender: TObject);
begin
  inherited;
  RefreshListagem;
end;

procedure TfrmCadastroAlunos.gridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroPesquisa();
end;

procedure TfrmCadastroAlunos.ListarDisciplinas;
var aLstDisciplina : TDataSet;
    aDisc : TDisciplina;
begin
  inherited;
  aLstDisciplina := TDataSet.Create(self);

  aDisc := TDisciplina.Create;

  try
    cdsListaDisciplinas.EmptyDataSet;
    aLstDisciplina :=  TGenericDAO.GetAll(aDisc);
    aLstDisciplina.First;
    while not aLstDisciplina.Eof do
    begin
      cdsListaDisciplinas.AppendRecord([aLstDisciplina.FieldByName('IDDisciplina').AsInteger,
                                        aLstDisciplina.FieldByName('Descricao').AsString]);
      aLstDisciplina.next;
    end;
  except on E: Exception do
    begin
      raise
    end;
  end;
end;

procedure TfrmCadastroAlunos.OcultarPainelDisciplinas;
begin
  pnCentralCadastro.Enabled  := True;
  pnAddDisciplinas.Visible   := False;
  pgCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadastroAlunos.Persistir;
var aDiscip : TAluno_disciplina;
begin
  aDiscip := TAluno_disciplina.Create;

  try
    if not assigned(FAluno) then
      FAluno := TAluno.Create;

    FAluno.Codigo := StrToInt(edtCodigo.Text);
    FAluno.Nome   := edtNome.Text;

    if FInclusao then
    begin
      TGenericDAO.Insert(FAluno);
    end
    else if FEdicao then
    begin
      TGenericDAO.DeleteSlaveTable(aDiscip, FAluno.Codigo );
      TGenericDAO.Update(FAluno);
    end;

    if not cdsAlunoDisc.IsEmpty then
    begin
      cdsAlunoDisc.first;
      while not cdsAlunoDisc.Eof do
      begin
        aDiscip.CodigoAluno      := cdsAlunoDiscIdAluno.AsInteger;
        aDiscip.CodigoDisciplina := cdsAlunoDiscIdDisciplina.AsInteger;
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
      TFrmMensagem.ExibirMensagem('Problemas ao persitir aluno! '+E.Message, tmAlerta);
    end;
  end;
end;

procedure TfrmCadastroAlunos.RefreshListagem;
var aDadosAluno : TDataSet;
begin
  inherited;
  cdsPesquisa.EmptyDataSet;
  aDadosAluno := TDataSet.Create(self);

  if not Assigned(FAluno) then
    FAluno := TAluno.Create;

  try
    aDadosAluno :=  TGenericDAO.GetAll(FAluno);
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

function TfrmCadastroAlunos.valida(AOpcao: integer): boolean;
begin
  result := True;

end;

end.
