program Project_FieldAlignment;

uses
  Vcl.Forms,
  FormDemo in 'FormDemo.pas' {frmFieldAlign};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFieldAlign, frmFieldAlign);
  Application.Run;
end.
