unit fGameOver;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TfrmGameOver = class(TForm)
    Layout1: TLayout;
    Text1: TText;
    txtScore: TText;
    Layout2: TLayout;
    btnHome: TButton;
    procedure btnHomeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmGameOver: TfrmGameOver;

implementation

{$R *.fmx}

uses fMain, uGameData;

procedure TfrmGameOver.btnHomeClick(Sender: TObject);
begin
  frmmain.Show;
  hide;
end;

procedure TfrmGameOver.FormShow(Sender: TObject);
begin
  txtScore.Text := 'Score : ' + score.ToString;
end;

end.
