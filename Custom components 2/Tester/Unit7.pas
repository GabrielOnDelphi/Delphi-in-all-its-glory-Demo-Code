unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDrawingControl, Vcl.StdCtrls;

type
  TfrmTester = class(TForm)
    DrawingControl: TDrawingControl;
    radCirc: TRadioButton;
    radRect: TRadioButton;
    procedure radCircClick(Sender: TObject);
    procedure radRectClick(Sender: TObject);
  private
  public
  end;

var
  frmTester: TfrmTester;

implementation
{$R *.dfm}

procedure TfrmTester.radCircClick(Sender: TObject);
begin
  DrawingControl.ShapeType:= stCircle;
end;

procedure TfrmTester.radRectClick(Sender: TObject);
begin
  DrawingControl.ShapeType:= stRectangle;
end;

end.
