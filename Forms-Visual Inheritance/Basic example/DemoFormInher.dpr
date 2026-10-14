program DemoFormInher;

uses
  Vcl.Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Vcl.pas',{$ENDIF}{Optional}
  ParentForm in 'ParentForm.pas' {frmParent},
  ChildForm in 'ChildForm.pas' {frmChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmParent, frmParent);
  Application.CreateForm(TfrmChild, frmChild);

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, read the Caption of Button1 ("OK") in frmParent & in frmChild, which inherits it.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Vcl.StartBridge;
  {$ENDIF}
  Application.Run;
end.
