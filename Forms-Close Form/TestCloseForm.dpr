program TestCloseForm;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  formSecond in 'formSecond.pas' {frmSecond};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
