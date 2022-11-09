program Project_CopyRecords;

uses
  Vcl.Forms,
  FormDemo in 'FormDemo.pas' {frmCopyRecords};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCopyRecords, frmCopyRecords);
  Application.Run;
end.
