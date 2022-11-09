program Project_Polymorphism;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTest, frmTest);
  Application.Run;
end.
