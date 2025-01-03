program Project_DebuggerTest;

uses
  FastMM4,
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form21};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm21, Form21);
  Application.Run;
end.
