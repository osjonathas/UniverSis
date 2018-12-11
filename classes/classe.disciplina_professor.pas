unit classe.disciplina_professor;

interface

Uses  TEntity,  AttributeEntity, SysUtils, classe.disciplina;

type
  [TableName('Disciplina_Professor')]
  TDisciplina_Professor = class(TGenericEntity)
  private
    FDisciplina : TDisciplina;
    FIdProfessor:integer;
    FIdDisciplina:integer;
    FDescricao:string;

    procedure setIdProfessor(const Value: integer);
    procedure setIdDisciplina(const Value: integer);
    procedure setDescricao(value:string);

  public

    [KeyField('IDPROFESSOR')]
    [FieldName('IDPROFESSOR')]
    property CodigoProfessor: integer read FIdProfessor write setIdProfessor;

    [FieldName('IDDISCIPLINA')]
    property CodigoDisciplina: integer read FIdDisciplina write setIdDisciplina;

    [Association(ftEager, orRequired, ctCascadeAll)]
    [JoinColumn('IDDISCIPLINA')]
    property Disciplina: TDisciplina read FDisciplina write FDisciplina;


    function ToString:string; override;
end;

implementation


procedure TDisciplina_Professor.setIdDisciplina(const Value: integer);
begin
  FIdDisciplina := Value;
end;

procedure TDisciplina_Professor.setIdProfessor(const Value: integer);
begin
  FIdProfessor := Value;
end;

procedure TDisciplina_Professor.setDescricao(value: string);
begin
  FDescricao := Value;
end;

function TDisciplina_Professor.toString;
begin
  result := ' Código Prof. : '+ IntToStr(CodigoProfessor) +'  Código Deisc. : '+IntToStr(CodigoDisciplina);
end;


end.
