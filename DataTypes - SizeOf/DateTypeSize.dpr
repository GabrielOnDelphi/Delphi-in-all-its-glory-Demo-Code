program DateTypeSize;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form20};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm20, Form20);
  Application.Run;
end.
