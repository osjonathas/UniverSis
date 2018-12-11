unit classe.aluno_disciplina;

interface

Uses  TEntity,  AttributeEntity, SysUtils;

type
  [TableName('Aluno_Disciplina')]
  TAluno_Disciplina = class(TGenericEntity)
  private
    FIdAluno:integer;
    FIdDisciplina:integer;
    FNotaTrabSegPer: Extended;
    FNotaTrabPriPer: Extended;
    FNotaQuaPer: Extended;
    FNotaTrabQuaPer: Extended;
    FNotaTrabTerPer: Extended;
    FNotaPriPer: Extended;
    FNotaSegPer: Extended;
    FNotaTerPer: Extended;

    procedure setIdAluno(const Value: integer);
    procedure setIdDisciplina(const Value: integer);
    procedure setNotaPriPer(const Value: Extended);
    procedure setNotaQuaPer(const Value: Extended);
    procedure setNotaTerPer(const Value: Extended);
    procedure setNotaTrabPriPer(const Value: Extended);
    procedure setNotaTrabQuaPer(const Value: Extended);
    procedure setNotaTrabSegPer(const Value: Extended);
    procedure setNotaTrabTerPer(const Value: Extended);
    procedure setNotaSegPer(const Value: Extended);

  public

    [KeyField('IDALUNO')]
    [FieldName('IDALUNO')]
    property CodigoAluno: integer read FIdAluno write setIdAluno;

    [FieldName('IDDISCIPLINA')]
    property CodigoDisciplina: integer read FIdDisciplina write setIdDisciplina;

    [FieldName('NOTAPRIPER')]
    property NotaPriPer: Extended read FNotaPriPer write setNotaPriPer;

    [FieldName('NOTATRABPRIPER')]
    property NotaTrabPriPer: Extended read FNotaTrabPriPer write setNotaTrabPriPer;

    [FieldName('NOTASEGPER')]
    property NotaSegPer: Extended read FNotaSegPer write setNotaSegPer;

    [FieldName('NOTATRABSEGPER')]
    property NotaTrabSegPer: Extended read FNotaTrabSegPer write setNotaTrabSegPer;

    [FieldName('NOTATERPER')]
    property NotaTerPer: Extended read FNotaTerPer write setNotaTerPer;

    [FieldName('NOTATRABTERPER')]
    property NotaTrabTerPer: Extended read FNotaTrabTerPer write setNotaTrabTerPer;

    [FieldName('NOTAQUAPER')]
    property NotaQuaPer: Extended read FNotaQuaPer write setNotaQuaPer;

    [FieldName('NOTATRABQUAPER')]
    property NotaTrabQuaPer: Extended read FNotaTrabQuaPer write setNotaTrabQuaPer;




    function ToString:string; override;
end;

implementation


procedure TAluno_Disciplina.setIdDisciplina(const Value: integer);
begin
  FIdDisciplina := Value;
end;

procedure TAluno_Disciplina.setNotaPriPer(const Value: Extended);
begin
  FNotaPriPer := Value;
end;

procedure TAluno_Disciplina.setNotaQuaPer(const Value: Extended);
begin
  FNotaQuaPer := Value;
end;

procedure TAluno_Disciplina.setNotaSegPer(const Value: Extended);
begin
  FNotaSegPer := Value;
end;

procedure TAluno_Disciplina.setNotaTerPer(const Value: Extended);
begin
  FNotaTerPer := Value;
end;

procedure TAluno_Disciplina.setNotaTrabPriPer(const Value: Extended);
begin
  FNotaTrabPriPer := Value;
end;

procedure TAluno_Disciplina.setNotaTrabQuaPer(const Value: Extended);
begin
  FNotaTrabQuaPer := Value;
end;

procedure TAluno_Disciplina.setNotaTrabSegPer(const Value: Extended);
begin
  FNotaTrabSegPer := Value;
end;

procedure TAluno_Disciplina.setNotaTrabTerPer(const Value: Extended);
begin
  FNotaTrabTerPer := Value;
end;

procedure TAluno_Disciplina.setIdAluno(const Value: integer);
begin
  FIdAluno := Value;
end;

function TAluno_Disciplina.toString;
begin
  result := ' Código Prof. : '+ IntToStr(CodigoAluno) +'  Código Deisc. : '+IntToStr(CodigoDisciplina);
end;


end.
