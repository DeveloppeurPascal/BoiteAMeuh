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
  File last update : 2025-10-28T19:59:22.079+01:00
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
