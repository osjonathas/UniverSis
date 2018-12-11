unit classe.aluno;

interface

Uses  TEntity,  AttributeEntity, SysUtils;

type
  [TableName('ALUNO')]
  TAluno = class(TGenericEntity)
  private
    FIdAluno:integer;
    FNome:string;

    procedure setIdAluno(const Value: integer);
    procedure setNome(value:string);

  public

    [KeyField('IDALUNO')]
    [FieldName('IDALUNO')]
    property Codigo: integer read FIdAluno write setIdAluno;

    [FieldName('NOME')]
    property Nome:string read FNome write setNome;

    function ToString:string; override;
end;

implementation



procedure TAluno.setIdAluno(const Value: integer);
begin
  FIdAluno := Value;
end;

procedure TAluno.setNome(value: string);
begin
  FNome := Value;
end;

function TAluno.toString;
begin
  result := ' Matricula: '+ IntToStr(Codigo) + ' Nome: '+ Nome;
end;


end.
