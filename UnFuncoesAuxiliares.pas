unit UnFuncoesAuxiliares;

interface

uses Windows,SysUtils, DB, Vcl.StdCtrls, StrUtils, Vcl.Forms, Vcl.Controls,  FireDAC.Comp.Client,Classes,FireDAC.Comp.DataSet,
     IniFiles, System.Math;

  procedure CriarForm(aClasseForm:TComponentClass; aForm: TForm);overload;
  procedure SetarFoco(Objeto: TWinControl);


  {Retira todos os espaços e converte para extended}
  function StrToExt(S:string):Extended;

  {Converte string para inteiro, caso haja algum exceção retorn a zero}
  function CSI(ValorTexto:string):Integer;

  {Retira todos os espaços e converte para currency}
  function CSV(S:string):Currency;

  function AlinharEsquerda(aTexto: string; aTamanho: Integer; aCaracter : String = ' '): string;
  function AlinharCentralizado(aTexto: string; aTamanho: Integer; aCaracter : String = ' '): string;
  function AlinharDireita(aTexto: string; aTamanho: Integer; aCaracter : String = ' '): string;

  {converte hexadecimal para inteiro}
  function HexToInt(HexStr: String): Integer;

  {Remove todos os espeços da string}
  function AllTrim(ptexto:string):string;

  {retira todos os acentos da string}
  function TiraAcento(Texto:string): string;

  {preenche uma string com zeros a esquerda ou a direita dependendo do terceiro parametro}
  function StrZero(Texto : string; Tamanho : Integer; AEsquerda: Boolean=true) : string;

  function FormataNumero(S:string):string;

  {valida cnpj}
  function CnpjValido(ParCnpj : string) : boolean;

  {valida cpf}
  function CpfValido(ParCpf : string) : boolean;

  {retorna a descrição do estado quando passado a sigla}
  function GetDescricaoUF(ASigla: string): String;

  {retorna o MacAddress da maquina}
  function MacAddress: string;

  {recebe um codigo de tamanho 7 e retorna o codigo com seu digito, complementando o ean8 }
  function getReferenciaDV(aCodigo: String):string;

  function getDivisao(aValor1, aValor2 :Extended):Extended;
  function getPercentual(aValor1, aValor2 :Extended):Extended;

  function iff(aCondicao : boolean; aResultTrue, aResultFalse : string):string;

  function FormataCpfCnpj(aTexto: string): string;

  procedure EscreverIni(aSecao, aChave, aValor: String);
  function LerArquivoIni(aSecao, aChave: String):String;

  function validaC1(aCmc7: string):boolean;
  function validaC2(frase:String; C:integer):boolean;
  function validaC3(frase:String; C:integer):boolean;
  function Modulo10(Valor: String): string;
  function Valida_CMC7(Entrada:String) : Boolean;
  Function SoNumero(S:String):String;
  function isNumber(S: string): Boolean;

  function ValorExtenso(Valor :Currency) :String;
  function mcx_Ajusta(Valor :String) :String;
  function mcx_Centenas(Valor :Integer) :String;
  function mcx_Dezenas(Valor :Integer) :String;
  function mcx_Unidades(Valor :Integer) :String;

  function CalcularIdade(aDataNasc: Tdate): integer;

  function ano_bisexto(aInt_ano: Integer): Boolean;
  function ultimo_dia_mes(aInt_ano, aInt_mes: Integer): Integer;

implementation

uses UnVariaveisGlobais;


procedure SetarFoco(Objeto: TWinControl);
begin
  TWinControl(Objeto).SetFocus;
  if Objeto.InheritsFrom(TCustomEdit) then TCustomEdit(Objeto).SelectAll;
end;

function StrToExt(S:string):Extended;
var v : string;
    i,t : Integer;
begin
  try
    v := S;
    t := length(v);
    for i:=1 to t do if v[i]= FormatSettings.ThousandSeparator then v[i]:=' ';
    Result:= StrToFloat(AllTrim(v));
  except
    Result:=0;
  end;
end;

function AllTrim(ptexto:string):string;
var temp : string;
begin
  temp := ptexto;
  while Pos(' ', temp) > 0 do begin
    Delete(temp,Pos(' ', temp),1);
  end;
  result:=temp;
end;

function CSI(ValorTexto:string):Integer;
begin
  try
    Result:= StrToInt(AllTrim(ValorTexto));
  except
    Result:=0;
  end;
end;

function CSV(S:string):Currency;
var v : string;
    i,t : Integer;
begin
  try
    if Trim(S) <> EmptyStr then
    begin
      v := S;
      t := length(v);
      for i:=1 to t do if v[i]= FormatSettings.ThousandSeparator then v[i]:=' ';
      Result:= StrToCurr(AllTrim(v));
    end
    else Result:= 0;
  except
    Result:=0;
  end;
end;

function AlinharEsquerda(aTexto: string; aTamanho: Integer; aCaracter : String = ' '): string;
var aStrTemp : String;
begin
  aStrTemp := Trim(aTexto);
  while Length(aStrTemp) < aTamanho do begin
    aStrTemp := aStrTemp + aCaracter;
  end;
  Result := aStrTemp;
end;


// para texto centralizado
function AlinharCentralizado(aTexto: string; aTamanho: Integer; aCaracter : String = ' '): string;
var aStrTemp : String;
    aPosicao1, aPosicao2 : integer;
begin
  aStrTemp := Trim(aTexto);
  aPosicao2:= (aTamanho - Length(aStrTemp)) div 2;
  for aPosicao1 := 1 to aPosicao2 do aStrTemp := aCaracter + aStrTemp;
  while Length(aStrTemp) < aTamanho do aStrTemp := aStrTemp + aCaracter;
  Result := aStrTemp;
end;

// para texto a direita
function AlinharDireita(aTexto: string; aTamanho: Integer; aCaracter : String = ' '): string;
var aStrTemp : String;
begin
  aStrTemp := Trim(aTexto);
  while Length(aStrTemp) < aTamanho do begin
    aStrTemp := aCaracter + aStrTemp;
  end;
  Result := copy(aStrTemp,1,aTamanho);
end;

function CnpjValido(ParCnpj : string) : boolean;
var
  Digito1,Digito2 : integer;
  Soma : LongInt;
  cnpj : string;
begin
  Result := False;
  cnpj    := ParCnpj;
  if (StrToExt(cnpj) > 99999999999999) or (StrToExt(cnpj)=0) then exit;
  cnpj := FormatFloat('00000000000000',StrToExt(cnpj));
  { calcula o 1o. dígito }
  Soma := (CSI(cnpj[01]) * 5) +
          (CSI(cnpj[02]) * 4) +
          (CSI(cnpj[03]) * 3) +
          (CSI(cnpj[04]) * 2) +
          (CSI(cnpj[05]) * 9) +
          (CSI(cnpj[06]) * 8) +
          (CSI(cnpj[07]) * 7) +
          (CSI(cnpj[08]) * 6) +
          (CSI(cnpj[09]) * 5) +
          (CSI(cnpj[10]) * 4) +
          (CSI(cnpj[11]) * 3) +
          (CSI(cnpj[12]) * 2);
  Soma := Soma * 10;
  Digito1 := Soma mod 11;
  if Digito1 = 10 then
    Digito1 := 0;
  { compara o resultado com o 1o. digito informado }
  if Digito1 = CSI(cnpj[13]) then
  begin
    { se correto ... }
    { calcula o 2o. dígito }
    Soma := (CSI(cnpj[01]) * 6) +
            (CSI(cnpj[02]) * 5) +
            (CSI(cnpj[03]) * 4) +
            (CSI(cnpj[04]) * 3) +
            (CSI(cnpj[05]) * 2) +
            (CSI(cnpj[06]) * 9) +
            (CSI(cnpj[07]) * 8) +
            (CSI(cnpj[08]) * 7) +
            (CSI(cnpj[09]) * 6) +
            (CSI(cnpj[10]) * 5) +
            (CSI(cnpj[11]) * 4) +
            (CSI(cnpj[12]) * 3) +
            (CSI(cnpj[13]) * 2);
    Soma := Soma * 10;
    Digito2 := Soma mod 11;
    if Digito2 = 10 then
      Digito2 := 0;
    { compara o resultado com o 2o. digito informado }
    if Digito2 = CSI(cnpj[14]) then
    begin
      { se correto ... }
      { retorna cnpj válido }
      cnpjValido := true;
    end;
  end;
end;

function CpfValido(ParCpf : string) : boolean;
var
  Digito1,Digito2 : integer;
  Soma : LongInt;
  Cpf : string;
begin
  Result := False;
  Cpf := ParCpf;
  if (StrToExt(Cpf) > 99999999999) or (StrToExt(Cpf)=0) then exit;
  Cpf := FormatFloat('00000000000',StrToExt(Cpf));
  { calcula o 1o. dígito }
  Soma := (CSI(Cpf[01]) * 10) +
          (CSI(Cpf[02]) * 09) +
          (CSI(Cpf[03]) * 08) +
          (CSI(Cpf[04]) * 07) +
          (CSI(Cpf[05]) * 06) +
          (CSI(Cpf[06]) * 05) +
          (CSI(Cpf[07]) * 04) +
          (CSI(Cpf[08]) * 03) +
          (CSI(Cpf[09]) * 02);
  Soma := Soma * 10;
  Digito1 := Soma mod 11;
  if Digito1 = 10 then
    Digito1 := 0;
  { compara o resultado com o 1o. digito informado }
  if Digito1 = CSI(Cpf[10]) then
  begin
    { se correto ... }
    { calcula o 2o. dígito }
    Soma := (CSI(Cpf[01]) * 11) +
            (CSI(Cpf[02]) * 10) +
            (CSI(Cpf[03]) * 09) +
            (CSI(Cpf[04]) * 08) +
            (CSI(Cpf[05]) * 07) +
            (CSI(Cpf[06]) * 06) +
            (CSI(Cpf[07]) * 05) +
            (CSI(Cpf[08]) * 04) +
            (CSI(Cpf[09]) * 03) +
            (CSI(Cpf[10]) * 02);
    Soma := Soma * 10;
    Digito2 := Soma mod 11;
    if Digito2 = 10 then
      Digito2 := 0;
    { compara o resultado com o 2o. digito informado }
    if Digito2 = CSI(Cpf[11]) then
    begin
      { se correto ... }
      { retorna Cpf válido }
      Result := true;
    end;
  end;
end;

function GetDescricaoUF(ASigla: string): String;
begin
  if ASigla = 'AC' then Result := 'AC - Acre'
  else if Asigla = 'AL' then Result := 'AL - Alagoas'
  else if Asigla = 'AP' then Result := 'AP - Amapá'
  else if Asigla = 'AM' then Result := 'AM - Amazonas'
  else if Asigla = 'BA' then Result := 'BA - Bahia'
  else if Asigla = 'CE' then Result := 'CE - Ceará'
  else if Asigla = 'DF' then Result := 'DF - Distrito Federal'
  else if Asigla = 'GO' then Result := 'GO - Goiás'
  else if Asigla = 'ES' then Result := 'ES - Espírito Santo'
  else if Asigla = 'MA' then Result := 'MA - Maranhão'
  else if Asigla = 'MT' then Result := 'MT - Mato Grosso'
  else if Asigla = 'MS' then Result := 'MS - Mato Grosso do Sul'
  else if Asigla = 'MG' then Result := 'MG - Minas Gerais'
  else if Asigla = 'PA' then Result := 'PA - Pará'
  else if Asigla = 'PB' then Result := 'PB - Paraiba'
  else if Asigla = 'PR' then Result := 'PR - Paraná'
  else if Asigla = 'PE' then Result := 'PE - Pernambuco'
  else if Asigla = 'PI' then Result := 'PI - Piauí'
  else if Asigla = 'RJ' then Result := 'RJ - Rio de Janeiro'
  else if Asigla = 'RN' then Result := 'RN - Rio Grande do Norte'
  else if Asigla = 'RS' then Result := 'RS - Rio Grande do Sul'
  else if Asigla = 'RO' then Result := 'RO - Rondônia'
  else if Asigla = 'RR' then Result := 'RR - Rorâima'
  else if Asigla = 'SP' then Result := 'SP - São Paulo'
  else if Asigla = 'SC' then Result := 'SC - Santa Catarina'
  else if Asigla = 'SE' then Result := 'SE - Sergipe'
  else if Asigla = 'TO' then Result := 'TO - Tocantins';
end;

procedure CriarForm(aClasseForm:TComponentClass; aForm: TForm);overload;
begin
  try
    Application.CreateForm(aClasseForm,aForm);
    aForm.ShowModal;
  finally
    FreeAndNil(aForm);
  end;
end;


function MacAddress: string;
var
Lib: Cardinal;
Func: function(GUID: PGUID): Longint; stdcall;
GUID1, GUID2: TGUID;

begin
  Result := '';
  Lib := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then
  begin
    @Func := GetProcAddress(Lib, 'UuidCreateSequential');
    if Assigned(Func) then
    begin
      if (Func(@GUID1) = 0) and
         (Func(@GUID2) = 0) and
         (GUID1.D4[2] = GUID2.D4[2]) and
         (GUID1.D4[3] = GUID2.D4[3]) and
         (GUID1.D4[4] = GUID2.D4[4]) and
         (GUID1.D4[5] = GUID2.D4[5]) and
         (GUID1.D4[6] = GUID2.D4[6]) and
         (GUID1.D4[7] = GUID2.D4[7]) then
      begin
        Result :=
          IntToHex(GUID1.D4[2], 2) + '-' +
          IntToHex(GUID1.D4[3], 2) + '-' +
          IntToHex(GUID1.D4[4], 2) + '-' +
          IntToHex(GUID1.D4[5], 2) + '-' +
          IntToHex(GUID1.D4[6], 2) + '-' +
          IntToHex(GUID1.D4[7], 2);
      end;
    end;
  end;
end;

function HexToInt(HexStr: String): Integer;
 var i: Integer;
     b: Byte;
begin
  i := 0;
  Result := 0;
  HexStr := UpperCase(HexStr);
  while (Length(HexStr) > 0) do
  begin
    b := 0;
    case HexStr[Length(HexStr)] of
      '1'..'9': b := Ord(HexStr[Length(HexStr)]) - $30;
      'A'..'F': b := Ord(HexStr[Length(HexStr)]) - $37;
    end;
    Result := Result + b shl i;
    Inc(i, 4);
    Delete(HexStr, Length(HexStr), 1);
  end;
end;

function getReferenciaDV(aCodigo: String):string;
var ean_xx : integer;
    ean_Co, aCod, DV : string;
begin
  DV := '';
  aCod := RightStr(aCodigo,7);

  try
    Ean_Co := FormatFloat('0000000000000',StrToInt64(Trim(aCod)));
  except
    Result := '';
    exit;
  end;
  ean_xx := StrToInt(Ean_Co[01]) * 3 +
            StrToInt(Ean_Co[02])     +
            StrToInt(Ean_Co[03]) * 3 +
            StrToInt(Ean_Co[04])     +
            StrToInt(Ean_Co[05]) * 3 +
            StrToInt(Ean_Co[06])     +
            StrToInt(Ean_Co[07]) * 3 +
            StrToInt(Ean_Co[08])     +
            StrToInt(Ean_Co[09]) * 3 +
            StrToInt(Ean_Co[10])     +
            StrToInt(Ean_Co[11]) * 3 +
            StrToInt(Ean_Co[12])     +
            StrToInt(Ean_Co[13]) * 3 ;

  DV := IntToStr((ean_xx div 10 + 1)*10 - ean_xx);
  if StrToInt(DV) > 9 then
    DV := '0';

  Result := DV;
end;


function CalcularDigitoEAN13(aCodigo : string) : string;
var ean_xx : integer;
    ean_Co : string;
begin
  try
    Ean_Co := FormatFloat('0000000000000',StrToInt64(Trim(aCodigo)));
  except
    Result := '';
    exit;
  end;
  ean_xx := StrToInt(Ean_Co[01]) * 3 +
            StrToInt(Ean_Co[02])     +
            StrToInt(Ean_Co[03]) * 3 +
            StrToInt(Ean_Co[04])     +
            StrToInt(Ean_Co[05]) * 3 +
            StrToInt(Ean_Co[06])     +

            StrToInt(Ean_Co[07]) * 3 +
            StrToInt(Ean_Co[08])     +
            StrToInt(Ean_Co[09]) * 3 +
            StrToInt(Ean_Co[10])     +
            StrToInt(Ean_Co[11]) * 3 +
            StrToInt(Ean_Co[12])     +
            StrToInt(Ean_Co[13]) * 3 ;
  Result := IntToStr((ean_xx div 10 + 1)*10 - ean_xx);
  if StrToInt(Result) > 9 then
    Result := '0';
end;

function TiraAcento(Texto:string): string;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  IntTmp : Integer;
begin
  For IntTmp := 1 to Length(Texto) do begin
    if Pos(Texto[IntTmp],ComAcento) > 0 then begin
      Texto[IntTmp] := SemAcento[Pos(Texto[IntTmp],ComAcento)];
    end;
  end;
  Result := Texto;
end;

function StrZero( Texto : string; Tamanho : Integer; AEsquerda : Boolean=true ) : string;
var FStrTmp : string;
begin
  FStrTmp := AllTrim(Texto);
  while Length(FStrTmp) < Tamanho do
  begin
    if AEsquerda then
      FStrTmp := '0' + FStrTmp
    Else
      FStrTmp := FStrTmp + '0';
  end;
  Result := FStrTmp;
end;

function FormataNumero(S:string):string;
  procedure RetiraCaracteres(var Str:string);
  var i:Integer;
      Aux:string;
  begin
    i:=1;
    Aux:='';
  while i<=length(str) do begin
     if str[i] in ['-','0'..'9']  then  Aux:=Aux+str[i];
     i:=i+1;
  end;
   Str:=Aux;
  end;
var A,B:Char;
begin
 if Trim(S) = '' then exit;
 A:=Copy(S,Length(S)-2,1)[1];
 B:=Copy(S,Length(S)-1,1)[1];
 if (not(A in ['0'..'9'])) or (not(B in ['0'..'9'])) then begin
   RetiraCaracteres(S);
   if not(A in ['0'..'9']) then
     Insert(FormatSettings.DecimalSeparator,S,Length(S)-1)
   else
     Insert(FormatSettings.DecimalSeparator,S,Length(S));
 end;
 Result:=S;
end;




function getDivisao(aValor1, aValor2 :Extended):Extended;
begin
  Result := 0;
  if (aValor1 > 0) and (aValor2 > 0) then Result := aValor1 / aValor2;
end;

function getPercentual(aValor1, aValor2 :Extended):Extended;
begin
  Result := getDivisao(aValor1, aValor2) * 100;
end;

function iff(aCondicao: boolean; aResultTrue, aResultFalse : string):string;
begin
  Result := '';
  if aCondicao then
    Result := aResultTrue
  else
    Result := aResultFalse;
end;

function FormataCpfCnpj(aTexto: string): string;
var aTextoFormatado : string;
begin
  Result := '';
  aTextoFormatado := '';
  if Trim(aTexto) <> EmptyStr then
  begin
    if length(trim(aTexto)) = 14 then
    begin
      aTextoFormatado := copy(aTexto,1,3)+'.'+copy(aTexto,4,3)+'.'+copy(aTexto,7,3)+'/'+copy(aTexto,10,3)+'-'+copy(aTexto,13,2);
    end
    else if length(trim(aTexto)) <= 11 then
    begin
      if length(trim(aTexto)) < 11 then
      begin
        aTextoFormatado := FormatFloat('00000000000', StrToInt64(aTextoFormatado));
      end;
      aTextoFormatado := copy(aTexto,1,3)+'.'+copy(aTexto,4,3)+'.'+copy(aTexto,7,3)+'-'+copy(aTexto,10,2);
    end;
    Result := aTextoFormatado;
  end;
end;

procedure EscreverIni(aSecao, aChave, aValor: String);
var aArqIni : TIniFile;
begin
  aArqIni := TIniFile.Create(pPathArquivoIni);
  aArqIni.WriteString(aSecao, aChave, aValor);
  aArqIni.Free;
end;

function LerArquivoIni(aSecao, aChave: String):String;
var aArqIni : TIniFile;
begin
  Result  := '';
  aArqIni := TIniFile.Create(pPathArquivoIni);
  Result  := aArqIni.ReadString(aSecao, aChave, '');
  aArqIni.Free;
end;

{passar os campos compensação, banco e agencia concatenados}
function validaC1(aCmc7: string):boolean;
var i,soma,num:integer;
  frase: String;
  C: Integer;
begin
  frase := Copy(Trim(aCmc7), 9,3) + Copy(Trim(aCmc7), 1,7);
  C     := StrToInt(Copy(Trim(aCmc7), 19,1));
  if length(aCmc7) < 30 then
    validaC1 := False
  else
  begin
    Soma := 0;
    num  := 8;
    for i:= 1 to length(frase) do
    begin
      Soma := Soma + (StrToInt(frase[i]) * num);
      Inc(num);
      if num = 10 then
        num := 2;
    end;
    Soma := Soma mod 11;
    validaC1 := False;
    if C = Soma then
      validaC1 := true;
  end;
end;

{ passar o campo conta corrente com uma string de 10 posicoes }
function validaC2(frase:String; C:integer):boolean;
var i,soma,num:integer;
begin
  if length(frase)=0 then
   validaC2:=false
  else
   begin
     soma:=0;
     num:=11;
     for I:=1 to Length(frase) do
      begin
        soma:=soma+(strtoint(frase[i])*num);
        dec(num);
      end;
      soma:=soma mod 11;
      if (soma=0) or (soma=1) then
       soma:=0
      else
       soma:=11-soma;
      validaC2:=false;
      if C=soma then
       validaC2:=true;
   end;
end;

{passar o campo Numero do Chequecom uma string de 6 posicoes}
function validaC3(frase:String; C:integer):boolean;
var i,soma,num:integer;
begin
  if length(frase)=0 then
   validaC3:=false
  else
   begin
     soma:=0;
     num:=7;
     for I:=1 to Length(frase) do
      begin
        soma:=soma+(strtoint(frase[i])*num);
        dec(num);
      end;
      soma:=soma mod 11;
      if (soma=0) or (soma=1) then
       soma:=0
      else
       soma:=11-soma;
      validaC3:=false;
      if C=soma then
       validaC3:=true;
   end;
end;

function Modulo10(Valor: String): string;
{
   Rotina usada para cálculo de alguns dígitos verificadores
   Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a
   esquerda e multiplica-se por 2121212...
   Soma-se cada um dos subprodutos. Caso algum dos subprodutos tenha mais de um
   dígito, deve-se somar cada um dos dígitos. (Exemplo: 7*2 = 14 >> 1+4 = 5)
   Divide-se a soma por 10.
   Faz-se a operação 10-Resto da divisão e devolve-se o resultado dessa operação
   como resultado da função Modulo10.
   Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0 (ZERO).
}
var
   Auxiliar : string;
   Contador, Peso : integer;
   Digito : integer;
begin
   Auxiliar := '';
   Peso := 2;
   for Contador := Length(Valor) downto 1 do
   begin
      Auxiliar := IntToStr(StrToInt(Valor[Contador]) * Peso) + Auxiliar;
      if Peso = 1 then
         Peso := 2
      else
         Peso := 1;
   end;

   Digito := 0;
   for Contador := 1 to Length(Auxiliar) do
   begin
      Digito := Digito + StrToInt(Auxiliar[Contador]);
   end;
   Digito := 10 - (Digito mod 10);
   if (Digito > 9) then
      Digito := 0;
   Result := IntToStr(Digito);
end;

function Valida_CMC7(Entrada:String) : Boolean;
var
  campo1, campo2, campo3 : String;
begin
  Entrada := SoNumero(Entrada);
  campo1 := Copy(entrada,1,7);
  campo2 := Copy(entrada,9,10);
  campo3 := Copy(entrada,20,10);
  Result := True;
  if Modulo10(campo1) <> Copy(Entrada,19,1) then
     Result := False
  Else if Modulo10(campo2) <> Copy(Entrada,8,1) then
     Result := False
  Else if Modulo10(campo3) <> Copy(Entrada,30,1) then
     Result := False;
end;

function SoNumero(S: String): String;
var StrAux : String;
    i,intAux : Integer;
begin
  Try
    StrAux := S;
    intAux := length(StrAux);
    for i:=1 to intAux do begin
      if Pos(StrAux[i],'0123456789') = 0 then begin
        StrAux[i]:=' ';
      end;
    end;
    Result:= AllTrim(StrAux);
  except
    Result:='';
  end;
end;

function isNumber(S: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 1 to Length(S) do
  begin
    if not (S[I] in ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
  end;
end;


function ValorExtenso(Valor :Currency) :String;
var
  StrValores, StrPart, StrValor, PartDec :String;
  i, Parcela, Posicao :Integer;
begin
  StrValores := 'trilhão  '+'trilhões '+'bilhão   '+'bilhões  '+
                'milhão   '+'milhões  '+'mil      '+'mil      ';

  //Formata o valor corretamente...
  StrValor := CurrToStr(Valor);
  Posicao  := Pos(',',StrValor);

  if Posicao > 0 then
  begin
    PartDec := Copy(StrValor,Posicao+1,2);
    if Length(PartDec) < 2 then
    begin
      StrValor := StrValor+'0';
      PartDec  := PartDec +'0';
    end;
    StrValor := StringReplace(StrValor,',','',[rfReplaceAll]);
  end
  else
  begin
    PartDec  := '00';
    StrValor := StrValor+PartDec;
  end;

  while Length(StrValor) < 17 do StrValor := '0'+StrValor;

  //Fim da formatação...
  for i := 1 to 5 do begin
    StrPart := Copy(StrValor,((i-1)*3)+1,3);
    Parcela := StrToInt(StrPart);
    if Parcela = 1 then Posicao := 1 else Posicao := 10;
    if Parcela > 0 then
    begin
      if Length(Result) > 0 then Result := Result+' e ';
      Result := Result+mcx_Centenas(Parcela);
      Result := Result+TrimRight(Copy(StrValores,((i-1)*18)+Posicao,9));
      if not i = 5 then Result := Result+' ';
    end;
  end;

  if Length(Result) > 0 then
    if Int(Valor) = 1 then
      Result := Result+'real '
    else
      Result := Result+' reais ';

  Parcela := StrToInt(PartDec);

  if Parcela > 0 then
  begin
    if Length(Result) > 0 then Result := Result+' e ';
    if Parcela = 1 then
      Result := Result+'um centavo'
    else
      Result := Result+mcx_Dezenas(Parcela)+'centavos';
    end;

  Result := mcx_Ajusta(Result);
end;

function mcx_Ajusta(Valor :String) :String;
begin
  Valor := Trim(StringReplace(Valor,'  ',' ',[rfReplaceAll]));

  if Pos('um mil ',Valor) = 1 then
    Valor := StringReplace(Valor,'um mil','mil',[rfReplaceAll]);

  if (Copy(Valor,Length(Valor)-8,9) = 'tos reais') or
     (Copy(Valor,Length(Valor)-8,9) = 'mil reais') then
  begin
    Result := Valor;
    Exit;
  end;

  //Ajusta milhares
  Valor  := StringReplace(Valor,'mil e cento'       ,'mil cento'       ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e duzentos'    ,'mil duzentos'    ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e trezentos'   ,'mil trezentos'   ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e quatrocentos','mil quatrocentos',[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e quinhentos'  ,'mil quinhentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e seiscentos'  ,'mil seiscentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e setecentos'  ,'mil setecentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e oitocentos'  ,'mil oitocentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e novecentos'  ,'mil novecentos'  ,[rfReplaceAll]);

  //Ajusta trilhões, bilhões e milhões
  Valor  := StringReplace(Valor,'ão reais' ,'ão de reais' ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'ões reais','ões de reais',[rfReplaceAll]);

  //Retorna valor
  Result := Valor;
end;

function mcx_Centenas(Valor :Integer) :String;
var
  StrValor, StrDig :String;
begin
  if Valor = 100 then
    Result := 'cem '
  else
  begin
    Result   := '';
    StrDig   := '00'+IntToStr(Valor);
    StrDig   := Copy(StrDig,Length(StrDig)-2,3);
    StrValor := 'cento       '+'duzentos    '+'trezentos   '+
                'quatrocentos'+'quinhentos  '+'seiscentos  '+
                'setecentos  '+'oitocentos  '+'novecentos  ';
    if StrToInt(StrDig[1]) > 0 then
      Result := TrimRight(Copy(StrValor,((StrToInt(StrDig[1])-1)*12)+1,12))+' ';
    if StrToInt(Copy(StrDig,2,2)) > 0 then
    begin
      if Length(Result) > 0 then Result := Result+'e ';
        Result := Result+mcx_Dezenas(StrToInt(Copy(StrDig,2,2)))
    end;
  end;
end;

function mcx_Dezenas(Valor :Integer) :String;
var
  StrValor, StrDig :String;
begin
   if Valor < 20 then
     Result := mcx_Unidades(Valor)
   else
   begin
     Result   := '';
     StrDig   := '00'+IntToStr(Valor);
     StrDig   := Copy(StrDig,Length(StrDig)-1,2);
     StrValor := 'vinte    '+'trinta   '+'quarenta '+'cinquenta'+
                 'sessenta '+'setenta  '+'oitenta  '+'noventa  ';
     Result   := TrimRight(Copy(StrValor,((StrToInt(StrDig[1])-2)*9)+1,9))+' ';
     if StrToInt(StrDig[2]) > 0 then
       Result := Result+'e '+mcx_Unidades(StrToInt(StrDig[2]));
   end;
end;

function mcx_Unidades(Valor :Integer) :String;
const
  StrValor :Array[0..18] of pChar = ('um','dois','três','quatro','cinco','seis',
                                     'sete','oito','nove','dez','onze','doze',
                                     'treze','quatorze','quinze','dezesseis',
                                     'dezessete','dezoito','dezenove');
begin
  Result := StrValor[Valor-1]+' ';

end;

function CalcularIdade(aDataNasc: Tdate): integer;
var  anoN, mes, dia : word;
     anoA, mesA, diaA : word;
begin
  Decodedate(aDataNasc,anoN,mes,dia );
  Decodedate(Date,anoA,mesA,diaA );
  if (mesA > mes)  or ((mesA = mes) and (dia >= dia)) then
    Result := anoA - anoN
  else
    Result := anoA - anoN - 1;
end;

function ano_bisexto(aInt_ano: Integer): Boolean;
begin
  //Verifica se o ano é bissexto
  Result := (aInt_ano mod 4 = 0) and ((aInt_ano mod 100 <> 0) or
            (aInt_ano mod 400 = 0));
  //Também pode-se usar a função “IsLeapYear(Year: Word): Boolean”,
  //existente em SysUtils
end;

function ultimo_dia_mes(aInt_ano, aInt_mes: Integer): Integer;
const dia_mes: array[1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);

begin
  Result := dia_mes[aInt_mes];
  if (aInt_mes = 2) and ano_bisexto(aInt_ano) then
    Inc(Result);
end;

end.
