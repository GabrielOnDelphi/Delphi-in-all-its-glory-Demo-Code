program Project_Rounding;

uses
  Vcl.Forms,
  Unit19 in 'Unit19.pas' {frmMine2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMine2, frmMine2);
  Application.Run;
end.
