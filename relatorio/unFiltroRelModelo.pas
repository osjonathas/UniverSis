unit unFiltroRelModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons;
type
  TfrmFiltroRelModelo = class(TForm)
    StatusBar1: TStatusBar;
    pnBarra: TPanel;
    Image1: TImage;
    pnCentro: TPanel;
    btSair: TSpeedButton;
    btExibir: TSpeedButton;
    btImprimir: TSpeedButton;
    Panel1: TPanel;
    procedure btSairClick(Sender: TObject);
    procedure btExibirClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Relatorio(aImpresso:boolean = False); virtual; abstract;
  end;

var
  frmFiltroRelModelo: TfrmFiltroRelModelo;

implementation

{$R *.dfm}

procedure TfrmFiltroRelModelo.btExibirClick(Sender: TObject);
begin
  Relatorio;
end;

procedure TfrmFiltroRelModelo.btImprimirClick(Sender: TObject);
begin
  Relatorio(True);
end;

procedure TfrmFiltroRelModelo.btSairClick(Sender: TObject);
begin
 close;
end;

end.
