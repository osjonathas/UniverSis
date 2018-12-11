unit UnMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Vcl.Imaging.pngimage, unConstantes, UnTipos, Vcl.ComCtrls;

type
  TFrmMensagem = class(TForm)
    tSaida: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    imgAlerta: TImage;
    imgAviso: TImage;
    imgErro: TImage;
    imgInfo: TImage;
    imgPare: TImage;
    LbMensagem: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure tSaidaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    FTipoMensagem : TipoMensagem;

    class function ExibirMensagem(aMsg: string; aTipoMensagem: TipoMensagem):boolean;

  end;

var
  FrmMensagem: TFrmMensagem;
implementation

{$R *.dfm}

procedure TFrmMensagem.BitBtn1Click(Sender: TObject);
begin
  close;
end;

class function TFrmMensagem.ExibirMensagem(aMsg: string; aTipoMensagem: TipoMensagem): boolean;
var aFormMsg : TFrmMensagem;
begin
  Result := False;
  aFormMsg := TFrmMensagem.Create(nil);
  try
    with aFormMsg do
    begin
      FormStyle := fsStayOnTop;
      FTipoMensagem := aTipoMensagem;
      LbMensagem.Caption := aMsg;
      imgAlerta.Visible  := False;
      imgPare.Visible    := False;
      imgInfo.Visible    := False;
      imgAviso.Visible   := False;

      if FTipoMensagem = tmAviso then
        imgAviso.Visible := True
      else if FTipoMensagem = tmErro then
        imgErro.Visible := True
      else if FTipoMensagem = tmAlerta then
        imgAlerta.Visible := True
      else if FTipoMensagem = tmPare then
        imgPare.Visible := True
      else imgInfo.Visible := True;
      Application.ProcessMessages;
      ShowModal;
    end;
  finally
    FreeAndNil(aFormMsg);
  end;
end;

procedure TFrmMensagem.FormShow(Sender: TObject);
begin
  imgAlerta.Visible  := False;
  imgPare.Visible    := False;
  imgInfo.Visible    := False;
  imgAviso.Visible   := False;

  if FTipoMensagem = tmAviso then
    imgAviso.Visible := True
  else if FTipoMensagem = tmErro then
    imgErro.Visible := True
  else if FTipoMensagem = tmAlerta then
    imgAlerta.Visible := True
  else if FTipoMensagem = tmPare then
    imgPare.Visible := True
  else imgInfo.Visible := True;

  Application.ProcessMessages;
end;

procedure TFrmMensagem.tSaidaTimer(Sender: TObject);
begin
  close;
end;

end.
