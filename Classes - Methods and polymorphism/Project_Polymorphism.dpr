program Project_Polymorphism;

uses
  Vcl.Forms,
  FormHide in 'FormHide.pas' {frmReinstroduce},
  FormOverload in 'FormOverload.pas' {frmOverride};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmReinstroduce, frmReinstroduce);
  Application.CreateForm(TfrmOverride, frmOverride);
  frmOverride.Show;
  Application.Run;
end.
