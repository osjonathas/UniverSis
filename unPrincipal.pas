unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, StrUtils, Vcl.Controls, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Forms,Vcl.Menus, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    pnCentro: TPanel;
    Image2: TImage;
    pnBotoes: TPanel;
    btAlterar: TSpeedButton;
    btCancelar: TSpeedButton;
    btExcluir: TSpeedButton;
    btGravar: TSpeedButton;
    btSair: TSpeedButton;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    SpeedButton2: TSpeedButton;
    Cadastro1: TMenuItem;
    Disciplinas1: TMenuItem;
    Alunos1: TMenuItem;
    SpeedButton3: TSpeedButton;
    btnReferencia: TSpeedButton;
    Professores1: TMenuItem;
    Relatrios1: TMenuItem;
    DesempenhodeAluno1: TMenuItem;
    AlunosPorProfessor1: TMenuItem;
    procedure btSairClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Alunos1Click(Sender: TObject);
    procedure Disciplinas1Click(Sender: TObject);
    procedure Professores1Click(Sender: TObject);
    procedure btnReferenciaClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DesempenhodeAluno1Click(Sender: TObject);
    procedure AlunosPorProfessor1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UnVariaveisGlobais, classe.sistema, UnFuncoesAuxiliares, Dados.Firebird, unTipos, Cadastro.Aluno, Cadastro.Disciplina, Cadastro.Professor, Cadastro.Notas,
  filtroRel.DesempenhoAluno, filtroRel.AlunoPorProf;

{ TForm1 }

procedure TfrmPrincipal.Alunos1Click(Sender: TObject);
begin
  CriarForm(TfrmCadastroAlunos, frmCadastroAlunos);
end;

procedure TfrmPrincipal.AlunosPorProfessor1Click(Sender: TObject);
begin
  CriarForm(TfrmFiltroRelAlunPorProf, frmFiltroRelAlunPorProf);
end;

procedure TfrmPrincipal.btnReferenciaClick(Sender: TObject);
begin
  Alunos1.Click;
end;

procedure TfrmPrincipal.btSairClick(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TfrmPrincipal.DesempenhodeAluno1Click(Sender: TObject);
begin
  CriarForm(TfrmFiltroRelDesempAluno, frmFiltroRelDesempAluno);
end;

procedure TfrmPrincipal.Disciplinas1Click(Sender: TObject);
begin
  CriarForm(TfrmCadDisciplina, frmCadDisciplina);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Sistema := TSistema.Create;
  Caption := 'Sistema de Controle de Universidades v.'+Sistema.Versao;
end;

procedure TfrmPrincipal.Professores1Click(Sender: TObject);
begin
  CriarForm(TfrmCadProfessor, frmCadProfessor);
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  CriarForm(TfrmCadLancNotas, frmCadLancNotas);
end;

end.
