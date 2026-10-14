program ProjectTestDeploy;

uses
  {$IF Defined(MSWINDOWS)}
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  {$ENDIF }
  System.StartUpCopy,
  FMX.Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Fmx in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Fmx.pas',{$ENDIF}{Optional}
  FormDeploy in 'FormDeploy.pas' {Form1},
  LightCore.AppData,
  LightFmx.Common.AppData.Form,
  LightFmx.Common.AppData;

{$R *.res}

begin
  AppData:= TAppData.Create('Light Deployment Demo');
  AppData.CreateMainForm(TForm1, Form1, asFull); // Change AutoState from asFull to asNone if you don't want to save form's state to disk.

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, press "Show paths" & check the paths in Memo.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Fmx.StartBridge;
  {$ENDIF}
  AppData.Run;
end.
