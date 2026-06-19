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
  Signature : c1b0f36ad706fab534df6827f8ab2816b58901dc
  ***************************************************************************
*)

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
