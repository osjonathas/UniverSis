unit classe.professor_disciplina;

interface

Uses  TEntity,  AttributeEntity, SysUtils, classe.disciplina;

type
  [TableName('Professor_Disciplina')]
  TProfessor_Disciplina = class(TGenericEntity)
  private
//    FDisciplina : TDisciplina;
    FIdProfessor:integer;
    FIdDisciplina:integer;

    procedure setIdProfessor(const Value: integer);
    procedure setIdDisciplina(const Value: integer);

  public

    [KeyField('IDPROFESSOR')]
    [FieldName('IDPROFESSOR')]
    property CodigoProfessor: integer read FIdProfessor write setIdProfessor;

    [FieldName('IDDISCIPLINA')]
    property CodigoDisciplina: integer read FIdDisciplina write setIdDisciplina;

//    [Association(ftEager, orRequired, ctCascadeAll)]
//    [JoinColumn('IDDISCIPLINA')]
//    property Disciplina: TDisciplina read FDisciplina write FDisciplina;

    function ToString:string; override;
end;

implementation


procedure TProfessor_Disciplina.setIdDisciplina(const Value: integer);
begin
  FIdDisciplina := Value;
end;

procedure TProfessor_Disciplina.setIdProfessor(const Value: integer);
begin
  FIdProfessor := Value;
end;

function TProfessor_Disciplina.toString;
begin
  result := ' Código Prof. : '+ IntToStr(CodigoProfessor) +'  Código Deisc. : '+IntToStr(CodigoDisciplina);
end;


end.
