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
  File last update : 2025-10-28T20:17:10.000+01:00
  Signature : c2a140e53efa7e0a0f4e444dfab6e6ece46d9c3f
  ***************************************************************************
*)

program BoiteAMeuh;

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
