unit uGameData;

interface

type
{$SCOPEDENUMS ON}
  TPet = (none, Bull, Chicken, Cow, Crow, Dog, Horse, Sheep);
{$SCOPEDENUMS OFF}

var
  Score: integer;
  GameStarted: boolean;
  CurrentPet: TPet;

procedure GameInit;
function choosePet: TPet;
function getPetSoundFilename(APet: TPet): string;

implementation

uses
  system.SysUtils, system.IOUtils;

procedure GameInit;
begin
  Score := 0;
  GameStarted := false;
  CurrentPet := TPet.none;
end;

function choosePet: TPet;
begin
  result := TPet(1 + Random(ord(high(TPet))));
end;

function getPetSoundFilename(APet: TPet): string;
begin
  case APet of
    TPet.none:
      result := '';
    TPet.Bull:
      result := 'BULL.WAV';
    TPet.Chicken:
      result := 'CHICKEN.WAV';
    TPet.Cow:
      result := 'COW.WAV';
    TPet.Crow:
      result := 'CROW.WAV';
    TPet.Dog:
      result := 'DOG_BARK.WAV';
    TPet.Horse:
      result := 'HORSE.WAV';
    TPet.Sheep:
      result := 'GOAT.WAV';
  end;
  if not result.isempty then
{$IFDEF DEBUG}
    result := tpath.combine(tpath.getdirectoryname(paramstr(0)),
      '..\..\..\sound\') + result;
{$ELSE}
    // TODO : gérer chemin selon platform (Win, iOs, macOS, Linux, Android)
{$ENDIF}
end;

initialization

GameInit;

end.
