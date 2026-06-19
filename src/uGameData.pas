(* C2PP
  ***************************************************************************

  Boite à Meuh !
  Copyright (c) 2021-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://boiteameuh.gamolf.fr

  Project site :
  https://github.com/DeveloppeurPascal/BoiteAMeuh

  ***************************************************************************
  File last update : 2026-06-19T18:18:59.388+02:00
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
