unit unRelModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Data.Win.ADODB, RLPDFFilter, RLFilters, RLXLSFilter, RLDraftFilter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type

  TfrmRelModelo = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    lbFiltro: TRLLabel;
    lbSubTitulo: TRLLabel;
    lbTitulo: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    dsLocal: TDataSource;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    lbRelCod: TRLLabel;
    RLXLSFilter1: TRLXLSFilter;
    qLocal: TFDQuery;
    imgLogo: TRLImage;
    RLPDFFilter1: TRLPDFFilter;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Contraste(var Band : TRLBand);
  end;

var
  frmRelModelo: TfrmRelModelo;

implementation

{$R *.dfm}

uses UnVariaveisGlobais;


{ TfrmRelModelo }

procedure TfrmRelModelo.Contraste(var Band: TRLBand);
begin
  if Band.Color = clWhite then Band.Color := $00FFFFCC
    else Band.Color := clWhite;
end;

procedure TfrmRelModelo.RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
var aPathImg : string;
begin
  if FileExists(Sistema.DiretorioPadrao+'\Imagens\LogoRel.fw.png') then
    aPathImg := Sistema.DiretorioPadrao+'\Imagens\LogoRel.fw.png'
  else if FileExists(Sistema.DiretorioPadrao+'\Imagens\LogoRel.png') then
    aPathImg := Sistema.DiretorioPadrao+'\Imagens\LogoRel.png'
  else if FileExists(Sistema.DiretorioPadrao+'\Imagens\LogoRel.jpg') then
    aPathImg := Sistema.DiretorioPadrao+'\Imagens\LogoRel.jpg'
  else if FileExists(Sistema.DiretorioPadrao+'\Imagens\LogoRel.bmp') then
    aPathImg := Sistema.DiretorioPadrao+'\Imagens\LogoRel.bmp';

  if Trim(aPathImg) <> EmptyStr then
    imgLogo.Picture.LoadFromFile(aPathImg);
end;

end.
