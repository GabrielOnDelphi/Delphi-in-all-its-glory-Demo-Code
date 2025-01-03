program Project_OutParameters;

uses
  Vcl.Forms,
  FormDemo in 'FormDemo.pas' {frmTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTest, frmTest);
  Application.Run;
end.
