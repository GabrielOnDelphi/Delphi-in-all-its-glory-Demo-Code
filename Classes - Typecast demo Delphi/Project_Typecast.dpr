program Project_Typecast;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  uMachines in 'uMachines.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
