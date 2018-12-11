unit classe.disciplina;

interface

Uses  TEntity,  AttributeEntity, SysUtils;

type
  [TableName('DISCIPLINA')]
  TDisciplina = class(TGenericEntity)
  private
    FIdDisciplina:integer;
    FDescricao:string;

    procedure setIdDisciplina(const Value: integer);
    procedure setDescricao(value:string);

  public

    [KeyField('IDDISCIPLINA')]
    [FieldName('IDDISCIPLINA')]
    property Codigo: integer read FIdDisciplina write setIdDisciplina;

    [FieldName('DESCRICAO')]
    property Descricao :string read FDescricao write setDescricao;

    function ToString:string; override;
end;

implementation


procedure TDisciplina.setIdDisciplina(const Value: integer);
begin
  FIdDisciplina := Value;
end;

procedure TDisciplina.setDescricao(value: string);
begin
  FDescricao := Value;
end;

function TDisciplina.toString;
begin
  result := ' Código : '+ IntToStr(Codigo) + ' Descrição: '+ Descricao;
end;


end.
