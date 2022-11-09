program Project_VirtualKeyb;

uses
  Vcl.Forms,
  Unit19 in 'Unit19.pas' {FormKeyb};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormKeyb, FormKeyb);
  Application.Run;
end.
