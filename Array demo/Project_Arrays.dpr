program Project_Arrays;

uses
  FastMM4,
  Vcl.Forms,
  UnitArrays in 'UnitArrays.pas' {Form21};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm21, Form21);
  Application.Run;
end.
