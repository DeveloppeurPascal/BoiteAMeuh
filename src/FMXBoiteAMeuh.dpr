program FMXBoiteAMeuh;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  fGame in 'fGame.pas' {frmGame},
  fGameOver in 'fGameOver.pas' {frmGameOver},
  uGameData in 'uGameData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGame, frmGame);
  Application.CreateForm(TfrmGameOver, frmGameOver);
  Application.Run;
end.
