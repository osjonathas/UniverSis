unit Dados.Firebird;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.Client, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet;

type
  TDadosFirebird = class(TDataModule)
    FDQuery: TFDQuery;
    FDTransServidor: TFDTransaction;
    FDGeral: TFDQuery;
    FDComandoSQL: TFDQuery;
    FDConsulta: TFDQuery;
    FDDados: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDCmd: TFDCommand;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDAluno: TFDQuery;
    FDAlunoIDALUNO: TIntegerField;
    FDAlunoNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function Conectar(aServidor, aBanco, aUsuario, aSenha : string):boolean;
    function Desconectar: boolean;
    function getDataSet(aSql:string): TFDQuery;
    function OpenDataSet(aSql:string): boolean; overload;
    function OpenDataSet(aSql:string; aQuery: TFDQuery): boolean; overload;
    function ExecuteSql(aSql: string):boolean;
    function getMax(aNomeTabela, aNomeCampo:string): integer;



  end;

var
  DadosFirebird: TDadosFirebird;

implementation

{$R *.dfm}


function TDadosFirebird.Conectar(aServidor, aBanco, aUsuario, aSenha : string): boolean;
var
  StrConnection: string;
begin
  Result := False;
  try
    FDDados.Connected   := False;
    FDDados.Params.Clear;

    FDDados.LoginPrompt := False;
    FDDados.DriverName  := 'IB';

    FDDados.Params.Add('DriverID='        + 'IB');
    FDDados.Params.Add('DataBase='        + aBanco);
    FDDados.Params.Add('User_Name='       + aUsuario);
    FDDados.Params.Add('Password='        + aSenha);
    FDDados.Params.Add('Protocol='        +'TCPIP');
    FDDados.Params.Add('LoginTimeout='    + '30');
    FDDados.Params.Add('Server='          + aServidor);

    FDDados.Connected := True;

    Result := True;
  except
    on E: Exception do
    begin
      raise Exception.Create('Problemas ao conectar ao banco! '+E.message);
    end;
  end;
end;

function TDadosFirebird.Desconectar: boolean;
begin
  Result:= False;
  try
    FDDados.Connected := False;
    Result:= True;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

function TDadosFirebird.ExecuteSql(aSql: string): boolean;
Var
  msgErro:string;
begin
  result := false;
  FDQuery.Close;
  FDQuery.Params.Clear;
  FDQuery.Sql.Text := aSql;
  try
    FDQuery.ExecSQL;
    result := true;
  except
   on e: Exception do begin
     raise Exception.Create('Não foi possível executar o comando sql! '+e.Message)
   end;
  end;
end;

function TDadosFirebird.getDataSet(aSql: string): TFDQuery;
begin
  FDQuery.Close;
  FDQuery.Params.Clear;
  FDQuery.SQL.Text := aSql;
  FDQuery.Open;
  result := FDQuery;
end;

function TDadosFirebird.getMax(aNomeTabela, aNomeCampo: string): integer;
begin
  Result := 0;
  FDQuery.Close;
  FDQuery.Params.Clear;
  FDQuery.SQL.Text := 'Select Max('+trim(aNomeCampo)+') as Ultimo from '+trim(aNomeTabela);
  FDQuery.Open;
  if not FDQuery.IsEmpty then
    result := FDQuery.FieldByName('Ultimo').asInteger;
end;

function TDadosFirebird.OpenDataSet(aSql: string; aQuery: TFDQuery): boolean;
begin
  Result := False;
  aQuery.Close;
  aQuery.Params.Clear;
  aQuery.SQL.Text := aSql;
  aQuery.Open;
  result := not aQuery.IsEmpty;
end;

function TDadosFirebird.OpenDataSet(aSql: string): boolean;
begin
  Result := False;
  FDQuery.Close;
  FDQuery.Params.Clear;
  FDQuery.SQL.Text := aSql;
  FDQuery.Open;
  result := not FDQuery.IsEmpty;
end;

end.
