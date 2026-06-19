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
  Signature : 6f26acc01f9960194c93c51ba0d47472866c289f
  ***************************************************************************
*)

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
