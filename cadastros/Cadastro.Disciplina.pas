unit Cadastro.Disciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadastro.modelo, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Datasnap.DBClient, classe.disciplina;

type
  TfrmCadDisciplina = class(TfrmCadModelo)
    cdsPesquisa: TClientDataSet;
    cdsPesquisaIdDisciplina: TIntegerField;
    cdsPesquisaDescricao: TStringField;
    Label18: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    procedure FormShow(Sender: TObject);
    procedure gridPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
    FDisciplina : TDisciplina;

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

  end;

var
  frmCadDisciplina: TfrmCadDisciplina;

implementation
uses Dados.Firebird, UnFuncoesAuxiliares, unConstantes, UnVariaveisGlobais, UnitPergunta, UnTipos, UnMensagem, GenericDao;

{$R *.dfm}

procedure TfrmCadDisciplina.CancelarEdicao;
begin
  if tfrmPergunta.Pergunta(mPerguntaCancela, tmPergunta) then
  begin
    edtCodigo.Clear;
    FInclusao := False;
    FEdicao := False;
    inherited;
  end;
end;

procedure TfrmCadDisciplina.CarregarRegistroPesquisa(AValor: String);
begin
  if not cdsPesquisa.IsEmpty then
  begin
    edtCodigo.Text := IntToStr(cdsPesquisaIdDisciplina.AsInteger);
    edtDescricao.Text := trim(cdsPesquisaDescricao.AsString);
    pgCadastro.ActivePage := tsDadosCad;
  end;
end;

procedure TfrmCadDisciplina.ColocarEmEstadoEdicao;
begin
  inherited;
  FEdicao := True;
  edtCodigo.Enabled := False;
  pgCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadDisciplina.ColocarEmEstadoInclusao;
begin
  inherited;
  if not Assigned(FDisciplina) then
    FDisciplina := TDisciplina.Create();

  FInclusao := True;
  tsDadosCad.Enabled := True;
  edtCodigo.Text     := IntToStr(TGenericDAO.getID(FDisciplina, 'IDDISCIPLINA') + 1);
  edtCodigo.Enabled  := False;
  pgCadastro.ActivePage := tsDadosCad;
  SetarFoco(edtDescricao);
end;

procedure TfrmCadDisciplina.Excluir;
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

procedure TfrmCadDisciplina.ExecutarPesquisa;
begin
  inherited;

end;

procedure TfrmCadDisciplina.FormShow(Sender: TObject);
begin
  inherited;
  RefreshListagem;
end;

procedure TfrmCadDisciplina.gridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroPesquisa();
end;

procedure TfrmCadDisciplina.Persistir;
begin


  try
    FDisciplina.Codigo := StrToInt(edtCodigo.Text);
    FDisciplina.Descricao := edtDescricao.Text;

    if FInclusao then
      TGenericDAO.Insert(FDisciplina)
    else if FEdicao then
      TGenericDAO.Update(FDisciplina);

    TFrmMensagem.ExibirMensagem('Registro realizado com sucesso!',tmInformacao);
    FInclusao := False;
    FEdicao := False;
    RefreshListagem;
    inherited;
  except on E: Exception do
    begin
      TFrmMensagem.ExibirMensagem('Problemas ao persitir a disciplina! '+E.Message, tmAlerta);
    end;
  end;
end;

procedure TfrmCadDisciplina.RefreshListagem;
var aDadosDisciplina : TDataSet;
begin
  inherited;
  cdsPesquisa.EmptyDataSet;
  aDadosDisciplina := TDataSet.Create(self);

  if not Assigned(FDisciplina) then
    FDisciplina := TDisciplina.Create;

  try
    aDadosDisciplina :=  TGenericDAO.GetAll(FDisciplina);
    aDadosDisciplina.First;
    while not aDadosDisciplina.Eof do
    begin
      cdsPesquisa.AppendRecord([aDadosDisciplina.FieldByName('IDDisciplina').AsInteger,
                                aDadosDisciplina.FieldByName('Descricao').AsString]);
      aDadosDisciplina.next;
    end;
  except on E: Exception do
    begin
      raise
    end;
  end;
end;

function TfrmCadDisciplina.valida(AOpcao: integer): boolean;
begin
  result := True;
end;

end.
