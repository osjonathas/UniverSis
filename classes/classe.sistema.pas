unit classe.sistema;

interface
uses StrUtils,SysUtils, DateUtils, System.Variants, System.Classes, Winapi.Windows;

type

  TSistema = class
  private
    FDiretorioPadrao,
    pVersao            : string;
    FDataBase: TDate;
    FPathArqIni,
    FServidorBanco,
    FIPServidor,
    FNomeBanco,
    FLoginBanco,
    FSenhaBAnco          : String;
    FAno: word;
    FAnoAnterior: word;
    FDataAtual: TDateTime;
    FMes: word;

    procedure CarregarArqIni;

  public
    Constructor Create;
    function CapturarVersaoExe: string;
    procedure AtualizarParametrosData;

    property DiretorioPadrao : string read FDiretorioPadrao;
    property PathArquivoIni : string read FPathArqIni;
    property Versao  : String read pVersao;

    property AnoAtual : word read FAno;
    property AnoAnterior : word read FAnoAnterior;
    property MesAtual : word read FMes;
    property DataAtual : TDateTime read FDataAtual;
  end;



implementation

{ TSistema }

uses Dados.Firebird, UnVariaveisGlobais, UnFuncoesAuxiliares;


procedure TSistema.AtualizarParametrosData;
begin
  FAno               := YearOf(Date);
  FMes               := MonthOf(Date);
  FAnoAnterior       := YearOf(Date) - 1;
  FDataAtual         := Date;
end;

function TSistema.CapturarVersaoExe: string;
var VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    aVersao : string;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),VerValueSize);

  with VerValue^ do
  begin
    aVersao := IntToStr(dwFileVersionMS shr 16);
    aVersao := aVersao + '.' + IntToStr(dwFileVersionMS and $FFFF);
    aVersao := aVersao + '.' + IntToStr(dwFileVersionLS shr 16);
//    aVersao := aVersao + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  Result   := aVersao;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TSistema.CarregarArqIni;
begin
  FPathArqIni      := FDiretorioPadrao+'\Config.ini';
  pPathArquivoIni  := FPathArqIni;
  FServidorBanco   := LerArquivoIni('CONEXAO','Servidor');
  FIPServidor      := LerArquivoIni('CONEXAO','IP Servidor');
  FNomeBanco       := LerArquivoIni('CONEXAO','Banco');
  FLoginBanco      := LerArquivoIni('CONEXAO','Usuario');
  FSenhaBAnco      := LerArquivoIni('CONEXAO','Senha');
end;


constructor TSistema.Create;
begin
  FDiretorioPadrao := GetCurrentDir;
  CarregarArqIni;
  pVersao := CapturarVersaoExe;
  AtualizarParametrosData;
  try
    DadosFirebird.Conectar(FServidorBanco, FNomeBanco,FLoginBanco, FSenhaBAnco);
  except on E: Exception do
    begin
      raise Exception.Create('Problemas na conexão com o banco! '+E.Message);
    end;
  end;
end;


end.
