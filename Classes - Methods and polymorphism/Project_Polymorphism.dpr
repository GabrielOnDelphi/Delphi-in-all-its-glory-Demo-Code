program Project_Polymorphism;

uses
  Vcl.Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Vcl.pas',{$ENDIF}{Optional}
  FormHide in 'FormHide.pas' {frmReinstroduce},
  FormOverload in 'FormOverload.pas' {frmOverride};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmReinstroduce, frmReinstroduce);
  Application.CreateForm(TfrmOverride, frmOverride);
  frmOverride.Show;

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, press "Declared as THide1" & read the Caption of frmReinstroduce.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Vcl.StartBridge;
  {$ENDIF}
  Application.Run;
end.
