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
  File last update : 2025-10-28T19:59:22.076+01:00
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
