unit Cadastro.Professor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadastro.modelo, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  classe.professor, Datasnap.DBClient, classe.Professor_disciplina, classe.disciplina, Generics.Collections, JvExControls, JvGradientHeaderPanel;

type
  TfrmCadProfessor = class(TfrmCadModelo)
    Label18: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    cdsPesquisa: TClientDataSet;
    cdsPesquisaIdProfessor: TIntegerField;
    cdsPesquisaNome: TStringField;
    gridDisciplinas: TDBGrid;
    Label1: TLabel;
    dsProfessorDisc: TDataSource;
    cdsProfessorDisc: TClientDataSet;
    btAdd: TButton;
    btRem: TButton;
    cdsProfessorDiscIdProfessor: TIntegerField;
    cdsProfessorDiscIdDisciplina: TIntegerField;
    cdsProfessorDiscDescricao: TStringField;
    pnAddDisciplinas: TPanel;
    pnTitulo: TJvGradientHeaderPanel;
    Label40: TLabel;
    btOk: TSpeedButton;
    btCanc: TSpeedButton;
    cdsListaDisciplinas: TClientDataSet;
    dsListaDisciplinas: TDataSource;
    cdsListaDisciplinasIdDisciplina: TIntegerField;
    cdsListaDisciplinasDescricao: TStringField;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure gridPesquisaDblClick(Sender: TObject);
    procedure btRemClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btCancClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
    FProfessor : TProfessor;
  public
    { Public declarations }
    procedure ColocarEmEstadoInclusao; Override;
    procedure ColocarEmEstadoEdicao; Override;
    procedure CancelarEdicao; Override;
    procedure Excluir; Override;
    procedure Persistir; Override;
    procedure ExecutarPesquisa; Override;
    function valida(AOpcao: integer):boolean;
    procedure CarregarRegistroPesquisa(AValor: String = '');
    procedure RefreshListagem;
    procedure CarregarDisciplinas(aIdProfessor : integer);
    procedure ListarDisciplinas;
    procedure OcultarPainelDisciplinas;
  end;

var
  frmCadProfessor: TfrmCadProfessor;

implementation
uses Dados.Firebird, UnFuncoesAuxiliares, unConstantes, UnVariaveisGlobais, UnitPergunta, UnTipos, UnMensagem, GenericDao;

{$R *.dfm}

procedure TfrmCadProfessor.btAddClick(Sender: TObject);
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

procedure TfrmCadProfessor.btCancClick(Sender: TObject);
begin
  inherited;
  OcultarPainelDisciplinas;
end;

procedure TfrmCadProfessor.btOkClick(Sender: TObject);
begin
  inherited;
  if not cdsProfessorDisc.Locate('IdDisciplina', cdsListaDisciplinasIdDisciplina.AsInteger, []) then
  begin
    cdsProfessorDisc.AppendRecord([StrToInt(edtCodigo.Text),
                                   cdsListaDisciplinasIdDisciplina.AsInteger,
                                   cdsListaDisciplinasDescricao.AsString]);
    OcultarPainelDisciplinas;
  end
  else
    TFrmMensagem.ExibirMensagem('Disciplina já inserida!', tmInformacao);
end;

procedure TfrmCadProfessor.btRemClick(Sender: TObject);
begin
  inherited;
  if not cdsPesquisa.IsEmpty then
  begin
    if TfrmPergunta.Pergunta('Deseja realmente excluir a disciplina?', tmPergunta) then
    begin
      cdsProfessorDisc.Delete;
    end;
  end;
end;

procedure TfrmCadProfessor.CancelarEdicao;
begin
  if tfrmPergunta.Pergunta(mPerguntaCancela, tmPergunta) then
  begin
    edtCodigo.Clear;
    edtNome.Clear;
    cdsProfessorDisc.EmptyDataSet;
    FInclusao := False;
    FEdicao := False;
    inherited;
  end;
end;

procedure TfrmCadProfessor.CarregarDisciplinas(aIdProfessor : integer);
var aDadosDisc : TDataSet;
    aProfDisc : TProfessor_Disciplina;
    aDisc : TDisciplina;
    aValorPK : integer;
begin
  inherited;
  aDadosDisc := TDataSet.Create(self);
  aProfDisc  := TProfessor_Disciplina.Create;
  aDisc      := TDisciplina.Create;

  cdsProfessorDisc.EmptyDataSet;

  try
    aDadosDisc :=  TGenericDAO.GetPesquisa(aProfDisc, aIdProfessor);
    if assigned(aDadosDisc) then
    begin
      aDadosDisc.First;
      while not aDadosDisc.Eof do
      begin
        aValorPK := aDadosDisc.FieldByName('IdDisciplina').AsInteger;

        cdsProfessorDisc.Append;
        cdsProfessorDiscIdProfessor.AsInteger  := aDadosDisc.FieldByName('IDProfessor').AsInteger;
        cdsProfessorDiscIdDisciplina.AsInteger := aDadosDisc.FieldByName('IdDisciplina').AsInteger;
        cdsProfessorDiscDescricao.AsString     := TGenericDAO.GetDescricao(aDisc, aValorPK);
        cdsProfessorDisc.Post;
        aDadosDisc.next;
      end;
    end;
  except on E: Exception do
    begin
      raise
    end;
  end;
end;

procedure TfrmCadProfessor.CarregarRegistroPesquisa(AValor: String);
begin
  if not cdsPesquisa.IsEmpty then
  begin
    edtCodigo.Text := IntToStr(cdsPesquisaIdProfessor.AsInteger);
    edtNome.Text := trim(cdsPesquisaNome.AsString);
    pgCadastro.ActivePage := tsDadosCad;

    CarregarDisciplinas(cdsPesquisaIdProfessor.AsInteger);
  end;
end;

procedure TfrmCadProfessor.ColocarEmEstadoEdicao;
begin
  inherited;
  FEdicao := True;
  edtCodigo.Enabled := False;
  pgCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadProfessor.ColocarEmEstadoInclusao;
begin
  inherited;
  if not Assigned(FProfessor) then
    FProfessor := TProfessor.Create();

  FInclusao := True;
  tsDadosCad.Enabled := True;
  edtCodigo.Text     := IntToStr(TGenericDAO.getID(FProfessor, 'IDPROFESSOR') + 1);
  edtCodigo.Enabled  := False;

  edtNome.Clear;
  cdsProfessorDisc.EmptyDataSet;

  pgCadastro.ActivePage := tsDadosCad;
  SetarFoco(edtNome);
end;

procedure TfrmCadProfessor.Excluir;
begin
  if Trim(edtCodigo.Text) <> EmptyStr then
  begin
    if TfrmPergunta.Pergunta(mPerguntaExclusao, tmPergunta) then
    begin
      {

      verificar condições para a exclusão



      }
      inherited;
    end
  end
  else TFrmMensagem.ExibirMensagem(mSelecioneParaExclusao, tmInformacao);
end;

procedure TfrmCadProfessor.ExecutarPesquisa;
begin
  inherited;

end;

procedure TfrmCadProfessor.OcultarPainelDisciplinas;
begin
  pnCentralCadastro.Enabled  := True;
  pnAddDisciplinas.Visible   := False;
  pgCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadProfessor.FormShow(Sender: TObject);
begin
  inherited;
  RefreshListagem;
end;

procedure TfrmCadProfessor.gridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroPesquisa();
end;

procedure TfrmCadProfessor.ListarDisciplinas;
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

procedure TfrmCadProfessor.Persistir;
var aDiscip : TProfessor_disciplina;
begin
  aDiscip := TProfessor_disciplina.Create;

  try
    if not assigned(FProfessor) then
      FProfessor := TProfessor.Create;

    FProfessor.Codigo := StrToInt(edtCodigo.Text);
    FProfessor.Nome := edtNome.Text;

    if FInclusao then
    begin
      TGenericDAO.Insert(FProfessor);
    end
    else if FEdicao then
    begin
      TGenericDAO.DeleteSlaveTable(aDiscip, FProfessor.Codigo );
      TGenericDAO.Update(FProfessor);
    end;

    if not cdsProfessorDisc.IsEmpty then
    begin
      cdsProfessorDisc.first;
      while not cdsProfessorDisc.Eof do
      begin
        aDiscip.CodigoProfessor  := cdsProfessorDiscIdProfessor.AsInteger;
        aDiscip.CodigoDisciplina := cdsProfessorDiscIdDisciplina.AsInteger;
        TGenericDAO.Insert(aDiscip);
        cdsProfessorDisc.next;
      end;
    end;

    TFrmMensagem.ExibirMensagem('Registro realizado com sucesso!',tmInformacao);
    FInclusao := False;
    FEdicao := False;
    RefreshListagem;
    inherited;
  except on E: Exception do
    begin
      TFrmMensagem.ExibirMensagem('Problemas ao persitir o Professor! '+E.Message, tmAlerta);
    end;
  end;
end;

procedure TfrmCadProfessor.RefreshListagem;
var aDadosProfessor : TDataSet;
begin
  inherited;
  cdsPesquisa.EmptyDataSet;
  aDadosProfessor := TDataSet.Create(self);

  if not Assigned(FProfessor) then
    FProfessor := TProfessor.Create;

  try
    aDadosProfessor :=  TGenericDAO.GetAll(FProfessor);
    aDadosProfessor.First;
    while not aDadosProfessor.Eof do
    begin
      cdsPesquisa.AppendRecord([aDadosProfessor.FieldByName('IDProfessor').AsInteger,
                                aDadosProfessor.FieldByName('Nome').AsString]);
      aDadosProfessor.next;
    end;
  except on E: Exception do
    begin
      raise
    end;
  end;
end;

function TfrmCadProfessor.valida(AOpcao: integer): boolean;
begin
  result := True;
end;

end.
