program DemoFormInher;

uses
  Vcl.Forms,
  ParentForm in 'ParentForm.pas' {frmParent},
  ChildForm in 'ChildForm.pas' {frmChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmParent, frmParent);
  Application.CreateForm(TfrmChild, frmChild);
  Application.Run;
end.
