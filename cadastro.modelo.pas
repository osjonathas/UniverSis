unit cadastro.modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Mask,  Vcl.Grids,
  Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient, Data.DB, UnFuncoesAuxiliares, UnTipos, JvExComCtrls, JvComCtrls, Vcl.ImgList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadModelo = class(TForm)
    Image2: TImage;
    pnCentralCadastro: TPanel;
    StatusBar1: TStatusBar;
    dsPesquisa: TDataSource;
    BalloonHint1: TBalloonHint;
    pgCadastro: TPageControl;
    tsPesquisa: TTabSheet;
    gridPesquisa: TDBGrid;
    pnResultado: TPanel;
    tsDadosCad: TTabSheet;
    pnBotoes: TPanel;
    Image3: TImage;
    btIncluir: TSpeedButton;
    btAlterar: TSpeedButton;
    btCancelar: TSpeedButton;
    btExcluir: TSpeedButton;
    btGravar: TSpeedButton;
    btPesquisar: TSpeedButton;
    lbTitulo: TLabel;
    btSair: TSpeedButton;
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPesquisaInicialClick(Sender: TObject);
    function TudoNove(S:String):Boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btExcluirClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
    FNomeTabela: String;
    FCondicaoSQL: String;
    FSQLCompleto: String;
    FValorCampoControle: String;
    FCampoControle: String;

  public
    { Public declarations }
    FComponenteControle : TCustomEdit;
    FModoPesquisaAtivo, FExibeResultadoPesquisaNoPanel  : boolean;
    FPesquisaInicial : string;


    procedure MudarEstadoBotoes(opcao: TStatusBotoes);
    procedure ColocarEmEstadoInclusao; Virtual;
    procedure ColocarEmEstadoEdicao; Virtual;
    procedure CancelarEdicao; virtual;
    procedure Excluir; Virtual;
    procedure Persistir; virtual;
    procedure ExecutarPesquisa; virtual;
    procedure CarregarRegistroPesquisa(AValor: String); virtual;

    property NomeTabela: String read FNomeTabela write FNomeTabela;
    property CampoControle: String read FCampoControle write FCampoControle;
  end;

var
  frmCadModelo: TfrmCadModelo;
  FInclusao, FEdicao : boolean;
  FUpperCaseAtivo : boolean;

implementation

{$R *.dfm}

uses unConstantes, Dados.Firebird, UnMensagem;

{ TfrmModelo }

procedure TfrmCadModelo.btAlterarClick(Sender: TObject);
begin
  ColocarEmEstadoEdicao;
end;

procedure TfrmCadModelo.btCancelarClick(Sender: TObject);
begin
  CancelarEdicao;
end;

procedure TfrmCadModelo.btExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmCadModelo.btGravarClick(Sender: TObject);
begin
  Persistir;
end;

procedure TfrmCadModelo.btIncluirClick(Sender: TObject);
begin
  ColocarEmEstadoInclusao;
end;

procedure TfrmCadModelo.btPesquisaInicialClick(Sender: TObject);
begin
  ExecutarPesquisa;
end;

procedure TfrmCadModelo.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadModelo.CancelarEdicao;
begin
  tsPesquisa.Enabled := True;
  tsDadosCad.Enabled := False;
  MudarEstadoBotoes(sbInicialSemDados);
  FInclusao := False;
  FEdicao   := false;
end;

procedure TfrmCadModelo.CarregarRegistroPesquisa(AValor: String);
begin

end;

procedure TfrmCadModelo.ColocarEmEstadoEdicao;
begin
  tsPesquisa.Enabled := False;
  tsDadosCad.Enabled := True;
  MudarEstadoBotoes(sbInsercaoEdicao);
  FEdicao   := True;
end;

procedure TfrmCadModelo.ColocarEmEstadoInclusao;
begin
  tsPesquisa.Enabled := False;
  tsDadosCad.Enabled := True;
  MudarEstadoBotoes(sbInsercaoEdicao);
  FInclusao := True;
end;

procedure TfrmCadModelo.Excluir;
begin

end;

procedure TfrmCadModelo.ExecutarPesquisa;
begin

end;

procedure TfrmCadModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FInclusao or FEdicao then
  begin
    TFrmMensagem.ExibirMensagem(mCanceleOuGrave,tmAlerta);
    Action := caNone;
  end
  else
  begin
    FreeAndNil(FComponenteControle);
    Action := caFree;
  end;
end;

procedure TfrmCadModelo.FormCreate(Sender: TObject);
begin
  FExibeResultadoPesquisaNoPanel := False;
  FModoPesquisaAtivo   := False;
  FComponenteControle  := TCustomEdit.Create(self);
  FUpperCaseAtivo      := True;
  FPesquisaInicial := '';
end;

procedure TfrmCadModelo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (Sender is TMaskEdit) then
    begin
      Key := #0;
      SelectNext(ActiveControl, true, true);
    end;

    if (Sender is TEdit) then
    begin
      Key := #0;
      SelectNext(ActiveControl, true, true);
    end;
  end;

  if FUpperCaseAtivo then
    key := AnsiUpperCase(key)[1];
end;

procedure TfrmCadModelo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ActiveControl is TComboBox) or
     (ActiveControl is TCheckBox) or
     (ActiveControl is TRadioGroup) then
  begin
    StatusBar1.Panels[0].Text :=  ActiveControl.Hint;
  end;
end;

procedure TfrmCadModelo.FormShow(Sender: TObject);
var TextoSQL : String;
    Campo : String;
begin
  inherited;
  MudarEstadoBotoes(sbInicialSemDados);
  pgCadastro.ActivePageIndex := 0;
  FInclusao := False;
  FEdicao   := false;
end;

procedure TfrmCadModelo.gridPesquisaDblClick(Sender: TObject);
begin
  CarregarRegistroPesquisa('');
end;

procedure TfrmCadModelo.MudarEstadoBotoes(opcao: TStatusBotoes);
begin
  if opcao = sbInicialSemDados then
  begin
    {* Estado inicial da tela *}
    btIncluir.Visible   := True;
    btAlterar.Visible   := True;
    btCancelar.Visible  := False;
    btGravar.Visible    := False;
    btExcluir.Visible   := True;
//    btPesquisar.Visible := False;
    btSair.Visible      := True;
  end;

  if opcao = sbInsercaoEdicao then
  begin
    {* Estado de edição *}
    btIncluir.Visible   := False;
    btAlterar.Visible   := False;
    btCancelar.Visible  := True;
    btGravar.Visible    := True;
    btExcluir.Visible   := False;
  //  btPesquisar.Visible := False;
    btSair.Visible      := False;
  end;
end;

procedure TfrmCadModelo.Persistir;
begin
  tsPesquisa.Enabled := True;
  tsDadosCad.Enabled := False;
  pgCadastro.ActivePageIndex := 0;
  MudarEstadoBotoes(sbInicialSemDados);
  FInclusao := False;
  FEdicao   := false;
end;

function TfrmCadModelo.TudoNove(S: String): Boolean;
var i:Integer;
begin
  Result:=True;
  For i:=1 to Length(S) do
   if S[i]<>'9' then
   begin
     Result:=False;
     Break;
   end;
end;

end.
