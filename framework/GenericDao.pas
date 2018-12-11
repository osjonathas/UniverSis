unit GenericDao;

interface

Uses Db, StrUtils, Rtti, AttributeEntity, TypInfo, SysUtils, Dados.Firebird, Generics.Collections,FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TGenericDAO = class
    private
      class function GetTableName<T: class>(Obj: T): String;
    public
      class function Insert<T: class>(Obj: T):boolean;
      class function Update<T: class>(Obj: T):boolean;
      class function GetAll<T: class>(Obj: T): TDataSet;
      class function GetPesquisa<T: class>(Obj: T; aValorPk: integer): TDataSet;
      class function GetID<T: class>(Obj: T; aCAmpo : String): integer;
      class function GetDescricao<T: class>(Obj: T; aValorPk: integer): String;

      class function DeleteSlaveTable<T: class>(Obj: T; aValorFk : integer): boolean;
  end;


implementation

class function TGenericDAO.GetDescricao<T>(Obj: T; aValorPk: integer): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strInsert, strFields, strValues: String;
  Atributo: TCustomAttribute;
  aDataSet : TFDQuery;
  aSql, aVlrRet : string;
begin
  result := '';
  aSql   := '';
  aDataSet := TFDQuery.Create(nil);
  aDataSet.ConnectioN := DadosFirebird.FDdaDOS;

  strInsert := GetTableName(Obj);
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  aSql := 'SELECT T1.* ' +' FROM ' + GetTableName(Obj) + ' T1 ';

  for Prop in TypObj.GetProperties do
  begin
     for Atributo in Prop.GetAttributes do
     begin
        if Atributo is KeyField then
          aSql := aSql +' WHERE T1.'+FieldName(Atributo).Name+' = ';

        if FieldName(Atributo).Name = 'DESCRICAO' then
          aSql := aSql +IntToStr(aValorPK);
     end;
  end;
  DadosFirebird.OpenDataSet(aSql, aDataSet);
  if not aDataSet.IsEmpty then
    aVlrRet := aDataSet.FieldByName(FieldName(Atributo).Name).AsString;

  result := aVlrRet;
end;

class function TGenericDAO.GetID<T>(Obj: T; aCAmpo: String): integer;
begin
  result := DadosFirebird.getMax(GetTableName(Obj),aCampo);
end;

class function TGenericDAO.GetPesquisa<T>(Obj: T; aValorPk: integer): TDataSet;
var
  aContexto: TRttiContext;
  aTypObj: TRttiType;
  aProp: TRttiProperty;
  aNomeTabela, aSql: String;
  aAtributo: TCustomAttribute;
  aDataSet : TDataset;
begin
  result := nil;
  aSql   := '';
  aDataSet := TDataset.Create(nil);

  aContexto := TRttiContext.Create;
  aTypObj := aContexto.GetType(TObject(Obj).ClassInfo);

  aSql := 'SELECT T1.* ' +' FROM ' + GetTableName(Obj) + ' T1 ';

  for aProp in aTypObj.GetProperties do
  begin
     for aAtributo in aProp.GetAttributes do
     begin
        if aAtributo is KeyField then
          aSql := aSql +' WHERE T1.'+FieldName(aAtributo).Name+' = ';
     end;
  end;
  aSql := aSql + IntToStr(aValorPk);
  aDataSet := DadosFirebird.getDataSet(aSql);
  if not aDataSet.IsEmpty then
    result := aDataSet;
end;

class function TGenericDAO.GetTableName<T>(Obj: T): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Atributo: TCustomAttribute;
  strTable: String;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Atributo in TypObj.GetAttributes do
  begin
    if Atributo is TableName then
      Exit(TableName(Atributo).Name);
  end;
end;

class function TGenericDAO.Insert<T>(Obj: T):boolean;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strInsert, strFields, strValues: String;
  Atributo: TCustomAttribute;

begin
  strInsert := '';
  strFields := '';
  strValues := '';

  strInsert := 'INSERT INTO ' + GetTableName(Obj);

  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
     for Atributo in Prop.GetAttributes do
     begin
        if Atributo is FieldName then
        begin
           strFields := strFields + FieldName(Atributo).Name  + ',';
           case Prop.GetValue(TObject(Obj)).Kind of

             tkWChar, tkLString, tkWString, tkString,
             tkChar, tkUString:

               strValues := strValues +
               QuotedStr(Prop.GetValue(TObject(Obj)).AsString) + ',';

             tkInteger, tkInt64:

               strValues := strValues +
               IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';

             tkFloat:

               strValues := strValues +
               FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended) + ',';

             else
               raise Exception.Create('Type not Supported');
           end;
       end;
     end;
  end;
  strFields := Copy(strFields, 1, Length(strFields) - 1);
  strValues := Copy(strValues, 1, Length(strValues) - 1);
  strInsert := strInsert + ' ( ' + strFields + ' )  VALUES ( ' + strValues + ' )';

  result := DadosFirebird.ExecuteSql(strInsert);
end;


class function TGenericDAO.Update<T>(Obj: T): boolean;
var
  aContexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  aPKey, strUpdate, strFields, strWhere: String;
  aAtributo: TCustomAttribute;
begin
  aPKey     := '';
  strUpdate := '';
  strFields := '';
  strUpdate := 'UPDATE ' + GetTableName(Obj)+' SET ';
  strWhere  := ' WHERE 1=1 ';

  aContexto := TRttiContext.Create;
  TypObj := aContexto.GetType(TObject(Obj).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
     for aAtributo in Prop.GetAttributes do
     begin
        if aAtributo is KeyField then
        begin
          aPKey := aPKey + FieldName(aAtributo).Name;

          strWhere := strWhere + ' AND '+FieldName(aAtributo).Name + ' = ';

          case Prop.GetValue(TObject(Obj)).Kind of

           tkWChar, tkLString, tkWString, tkString,
           tkChar, tkUString:

             strWhere := strWhere + QuotedStr(Prop.GetValue(TObject(Obj)).AsString) + ',';

           tkInteger, tkInt64:

             strWhere := strWhere + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';

           tkFloat:

             strWhere := strWhere + FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended) + ',';

           else
             raise Exception.Create('Type not Supported');
          end;
        end
        else
        begin
          if Pos(FieldName(aAtributo).Name, aPkey) = 0 then
          begin
            strFields := strFields + FieldName(aAtributo).Name + ' = ';

            case Prop.GetValue(TObject(Obj)).Kind of

             tkWChar, tkLString, tkWString, tkString,
             tkChar, tkUString:

               strFields := strFields + QuotedStr(Prop.GetValue(TObject(Obj)).AsString) + ',';

             tkInteger, tkInt64:

               strFields := strFields + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';

             tkFloat:

               strFields := strFields + FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended) + ',';

             else
               raise Exception.Create('Type not Supported');

            end;
          end;
        end;
     end;
  end;

  strFields := Copy(strFields, 1, Length(strFields) - 1);
  strWhere := Copy(strWhere, 1, Length(strWhere) - 1);
  strUpdate := strUpdate + strFields + strWhere;
  result := DadosFirebird.ExecuteSql(strUpdate);
end;

class function TGenericDAO.DeleteSlaveTable<T>(Obj: T; aValorFk: integer): boolean;
var
  aContexto: TRttiContext;
  aTypObj: TRttiType;
  aProp: TRttiProperty;
  aNomeTabela, aSql: String;
  aAtributo: TCustomAttribute;
  aDataSet : TFDQuery;
begin
  result := false;
  aSql   := '';
  aDataSet := TFDQuery.Create(nil);

  aContexto := TRttiContext.Create;
  aTypObj := aContexto.GetType(TObject(Obj).ClassInfo);

  aSql := 'DELETE FROM ' + GetTableName(Obj);

  for aProp in aTypObj.GetProperties do
  begin
     for aAtributo in aProp.GetAttributes do
     begin
        if aAtributo is KeyField then
          aSql := aSql +' WHERE '+FieldName(aAtributo).Name+' = ';
     end;
  end;
  aSql := aSql + IntToStr(aValorFk);
  result := DadosFirebird.ExecuteSql(aSql);
end;

class function TGenericDAO.GetAll<T>(Obj: T): TDataSet;
begin
  result := DadosFirebird.getDataSet('SELECT T1.* ' +
                                     ' FROM ' + GetTableName(Obj) + ' T1 ' );
end;

end.
