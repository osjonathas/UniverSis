unit UnitPergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Vcl.Imaging.pngimage, Vcl.ImgList, System.ImageList, unConstantes, UnTipos;

type
  TfrmPergunta = class(TForm)
    lbMensagem: TLabel;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    ImageList1: TImageList;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTipoMensagem : TipoMensagem;
    FOpcaoPergunta: String;
    class function Pergunta(aTexto : String; aTipoMensagem: TipoMensagem): boolean;
  end;

var
  frmPergunta: TfrmPergunta;


implementation

{$R *.dfm}


procedure TfrmPergunta.Button1Click(Sender: TObject);
begin
  FOpcaoPergunta := '1';
  ModalResult := mrOk;
end;

procedure TfrmPergunta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

class function TfrmPergunta.Pergunta(aTexto: String; aTipoMensagem: TipoMensagem): boolean;
begin
  Application.CreateForm(TFrmPergunta, frmPergunta);
  frmPergunta.LbMensagem.Caption := aTexto;
  frmPergunta.FTipoMensagem      := aTipoMensagem;
  frmPergunta.ShowModal;

  if Trim(frmPergunta.FOpcaoPergunta) = '1' then
  begin
    Result := True;
  end
  else Result := False;
  frmPergunta.Free;
end;

end.
