program Project_CopyRecords;

uses
  Vcl.Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Vcl.pas',{$ENDIF}{Optional}
  FormDemo in 'FormDemo.pas' {frmCopyRecords};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCopyRecords, frmCopyRecords);

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, press "Init R1", "R2:= R1" and "Change R2" & read the form's caption.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Vcl.StartBridge;
  {$ENDIF}
  Application.Run;
end.
