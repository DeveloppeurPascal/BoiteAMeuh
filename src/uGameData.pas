(* C2PP
  ***************************************************************************

  Boite à Meuh !

  Copyright 2021-2025 Patrick PREMARTIN under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://boiteameuh.gamolf.fr

  Project site :
  https://github.com/DeveloppeurPascal/BoiteAMeuh

  ***************************************************************************
  File last update : 2025-10-28T20:18:22.726+01:00
  Signature : 5667c6b9a3c434631d868f001f44c9e974873874
  ***************************************************************************
*)

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
      '..\..\..\_PRIVATE\sound\') + result;
{$ELSE}
    // TODO : gérer chemin selon platform (Win, iOS, macOS, Linux, Android)
{$ENDIF}
end;

initialization

GameInit;

end.
