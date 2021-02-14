unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects;

type
  TfrmMain = class(TForm)
    Text1: TText;
    Layout1: TLayout;
    zonePlay: TLayout;
    btnPlay: TButton;
    zoneQuit: TLayout;
    btnQuit: TButton;
    zoneContinue: TLayout;
    btnContinue: TButton;
    procedure btnQuitClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ShowGameScreen;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses fGame, uGameData;

procedure TfrmMain.btnContinueClick(Sender: TObject);
begin
  ShowGameScreen;
end;

procedure TfrmMain.btnPlayClick(Sender: TObject);
begin
  gameinit;
  ShowGameScreen;
end;

procedure TfrmMain.ShowGameScreen;
begin
  frmgame.Show;
  hide;
end;

procedure TfrmMain.btnQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin                           // TODO : s'assurer que CONTINUE est bien au dessus de QUIT
  zoneContinue.Visible := GameStarted;
end;

end.
