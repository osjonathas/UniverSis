program UniverSis;

uses
  Vcl.Forms,
  unConstantes in 'unConstantes.pas',
  UnFuncoesAuxiliares in 'UnFuncoesAuxiliares.pas',
  UnitPergunta in 'UnitPergunta.pas' {frmPergunta},
  UnMensagem in 'UnMensagem.pas' {FrmMensagem},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  UnTipos in 'UnTipos.pas',
  UnVariaveisGlobais in 'UnVariaveisGlobais.pas',
  classe.sistema in 'classes\classe.sistema.pas',
  Dados.Firebird in 'conexao\Dados.Firebird.pas' {DadosFirebird: TDataModule},
  GenericDao in 'framework\GenericDao.pas',
  TEntity in 'framework\TEntity.pas',
  AttributeEntity in 'framework\AttributeEntity.pas',
  classe.aluno in 'classes\classe.aluno.pas',
  cadastro.modelo in 'cadastro.modelo.pas' {frmCadModelo},
  Cadastro.Aluno in 'cadastros\Cadastro.Aluno.pas' {frmCadastroAlunos},
  Cadastro.Disciplina in 'cadastros\Cadastro.Disciplina.pas' {frmCadDisciplina},
  classe.disciplina in 'classes\classe.disciplina.pas',
  Cadastro.Professor in 'cadastros\Cadastro.Professor.pas' {frmCadProfessor},
  classe.professor in 'classes\classe.professor.pas',
  classe.professor_disciplina in 'classes\classe.professor_disciplina.pas',
  classe.aluno_disciplina in 'classes\classe.aluno_disciplina.pas',
  Cadastro.Notas in 'cadastros\Cadastro.Notas.pas' {frmCadLancNotas},
  unFiltroRelModelo in 'relatorio\unFiltroRelModelo.pas' {frmFiltroRelModelo},
  unRelModelo in 'relatorio\unRelModelo.pas' {frmRelModelo},
  filtroRel.DesempenhoAluno in 'relatorio\filtroRel.DesempenhoAluno.pas' {frmFiltroRelDesempAluno},
  relatorio.DesempenhoAluno in 'relatorio\relatorio.DesempenhoAluno.pas' {frmRelDesempAluno},
  filtroRel.AlunoPorProf in 'relatorio\filtroRel.AlunoPorProf.pas' {frmFiltroRelAlunPorProf},
  relatorio.AlunoPorProf in 'relatorio\relatorio.AlunoPorProf.pas' {frmRelAlunoPorProf};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDadosFirebird, DadosFirebird);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelAlunoPorProf, frmRelAlunoPorProf);
  Application.Run;
end.
