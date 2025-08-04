program FormCreationOrder_Vcl_Test;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
