unit classe.professor;

interface

Uses  TEntity,  AttributeEntity, SysUtils, classe.disciplina, Generics.Collections;

type
  [TableName('PROFESSOR')]
  TProfessor = class(TGenericEntity)
  private
    FIdProfessor:integer;
    FNome:string;

    FDisciplinas : TList<TDisciplina>;

    procedure setIdProfessor(const Value: integer);
    procedure setNome(value:string);

  public

    [KeyField('IDPROFESSOR')]
    [FieldName('IDPROFESSOR')]
    property Codigo: integer read FIdProfessor write setIdProfessor;

    [FieldName('NOME')]
    property Nome :string read FNome write setNome;

    [ManyValuedAssociation(ftEager, orRequired, ctCascadeAll)]
    [ForeignJoinColumn('IDDISCIPLINA', [cpRequired])]
    property Itens: TList<TDisciplina> read FDisciplinas write FDisciplinas;

    function ToString:string; override;
end;

implementation


procedure TProfessor.setIdProfessor(const Value: integer);
begin
  FIdProfessor := Value;
end;

procedure TProfessor.setNome(value: string);
begin
  FNome := Value;
end;

function TProfessor.toString;
begin
  result := ' Código : '+ IntToStr(Codigo) + ' Nome: '+ Nome;
end;


end.
