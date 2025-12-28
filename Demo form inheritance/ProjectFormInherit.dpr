program ProjectFormInherit;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form3},
  Unit2 in 'Unit2.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
