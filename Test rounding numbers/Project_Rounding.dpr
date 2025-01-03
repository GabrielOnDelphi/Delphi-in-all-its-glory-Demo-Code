program Project_Rounding;

uses
  Vcl.Forms,
  FormRounding in 'FormRounding.pas' {frmMine2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMine2, frmMine2);
  Application.Run;
end.
