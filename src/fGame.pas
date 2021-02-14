unit fGame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Ani, FMX.Objects,
  FMX.Media;

type
  TfrmGame = class(TForm)
    lblScore: TLabel;
    btnPause: TButton;
    GridPanelLayout1: TGridPanelLayout;
    btnHorse: TButton;
    Rectangle1: TRectangle;
    BitmapListAnimation1: TBitmapListAnimation;
    btnChicken: TButton;
    Rectangle2: TRectangle;
    BitmapListAnimation2: TBitmapListAnimation;
    btnBull: TButton;
    Rectangle3: TRectangle;
    BitmapListAnimation3: TBitmapListAnimation;
    btnCow: TButton;
    Rectangle4: TRectangle;
    BitmapListAnimation4: TBitmapListAnimation;
    btnCrow: TButton;
    Rectangle5: TRectangle;
    BitmapListAnimation5: TBitmapListAnimation;
    btnDog: TButton;
    Rectangle6: TRectangle;
    BitmapListAnimation6: TBitmapListAnimation;
    btnSheep: TButton;
    Rectangle7: TRectangle;
    BitmapListAnimation7: TBitmapListAnimation;
    mpSound: TMediaPlayer;
    chkSound: TTimer;
    procedure FormShow(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure chkSoundTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btnPetClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure ScoreOK;
    procedure GameOver;
    procedure DisplayScore;
    procedure ChooseAndPlayPet(AForceChange: boolean = false);
  public
    { Déclarations publiques }
  end;

var
  frmGame: TfrmGame;

implementation

{$R *.fmx}

uses uGameData, fMain, System.IOUtils, fGameOver;

procedure TfrmGame.btnPetClick(Sender: TObject);
var
  btn: TButton;
  pet: tpet;
begin
  if (Sender is TButton) then
  begin
    btn := Sender as TButton;
    if btn = btnHorse then
      pet := tpet.Horse
    else if btn = btnChicken then
      pet := tpet.Chicken
    else if btn = btnBull then
      pet := tpet.bull
    else if btn = btnCow then
      pet := tpet.Cow
    else if btn = btnCrow then
      pet := tpet.Crow
    else if btn = btnDog then
      pet := tpet.dog
    else if btn = btnSheep then
      pet := tpet.Sheep
    else
      pet := tpet.none;
    if pet = currentpet then
      ScoreOK
    else
      GameOver;
  end;
end;

procedure TfrmGame.btnPauseClick(Sender: TObject);
begin
  frmMain.show;
  hide;
end;

procedure TfrmGame.FormHide(Sender: TObject);
begin
  chkSound.Enabled := false;
  mpSound.Stop;
end;

procedure TfrmGame.FormShow(Sender: TObject);
begin
  GameStarted := true;
  DisplayScore;
  ChooseAndPlayPet;
end;

procedure TfrmGame.GameOver;
begin
  GameStarted := false;
  frmgameover.show;
  hide;
end;

procedure TfrmGame.DisplayScore;
begin
  lblScore.text := 'Score : ' + score.tostring;
end;

procedure TfrmGame.ChooseAndPlayPet(AForceChange: boolean = false);
var
  pfn: string;
  pet: tpet;
begin
  chkSound.Enabled := false;
  if (currentpet = tpet.none) or AForceChange then
  begin
    pet := currentpet;
    while (pet = currentpet) do
      currentpet := choosePet;
  end;
  pfn := getPetSoundFilename(currentpet);
  if tfile.Exists(pfn) then
  begin
    if mpSound.State = tmediastate.Playing then
      mpSound.Stop;
    mpSound.CurrentTime := 0;
    mpSound.FileName := pfn;
    mpSound.Play;
    chkSound.Enabled := true;
  end;
end;

procedure TfrmGame.ScoreOK;
begin
  inc(score);
  DisplayScore;
  ChooseAndPlayPet(true);
end;

procedure TfrmGame.chkSoundTimer(Sender: TObject);
begin
  if (mpSound.State in [tmediastate.Stopped, tmediastate.Playing]) and
    (mpSound.CurrentTime >= mpSound.Duration) then
  begin
    mpSound.CurrentTime := 0;
    mpSound.Play;
  end
  else if (mpSound.State = tmediastate.Stopped) and (mpSound.CurrentTime = 0)
  then
    mpSound.Play;
end;

end.
