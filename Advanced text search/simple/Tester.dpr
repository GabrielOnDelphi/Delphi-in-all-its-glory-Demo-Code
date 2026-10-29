program Tester;

uses
  fastmm4,
  Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Vcl.pas',{$ENDIF}{Optional}
  TesterForm in 'TesterForm.pas' {frmTester},
  LightVcl.Visual.AppData;

{$R *.res}

begin
  Application.Initialize;
  AppData:= TAppData.Create('Cubic Advanced Text Search');
  Application.MainFormOnTaskbar := True;    { If true, a taskbar button represents the application's main form and displays its caption. All child forms will stay on top of the MainForm (bad)! If False, a taskbar button represents the application's (hidden) main window and bears the application's Title. Must be True to use Windows (Vista) Aero effects (ive taskbar thumbnails, Dynamic Windows, Windows Flip, Windows Flip 3D). https://stackoverflow.com/questions/66720721/ } 
  Application.CreateForm(TfrmTester, frmTester);
  frmTester.Show;

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, type a folder into Path, press "START Search" & read the results in Log.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Vcl.StartBridge;
  {$ENDIF}
  Application.Run;
end.
