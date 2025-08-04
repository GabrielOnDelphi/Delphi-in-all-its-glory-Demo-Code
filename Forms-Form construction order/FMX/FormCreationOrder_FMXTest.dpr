program FormCreationOrder_FMXTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormMain in 'FormMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
