program FormCreationOrder_FMXTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Fmx in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Fmx.pas',{$ENDIF}{Optional}
  FormMain in 'FormMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, set the Width of Form1 while the breakpoints on EmptyDummy show the order of the events.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Fmx.StartBridge;
  {$ENDIF}
  Application.Run;
end.
