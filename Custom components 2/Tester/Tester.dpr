program Tester;

uses
  Vcl.Forms,
  Unit7 in 'Unit7.pas' {frmTester},
  uDrawingControl in '..\uDrawingControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTester, frmTester);
  Application.Run;
end.
