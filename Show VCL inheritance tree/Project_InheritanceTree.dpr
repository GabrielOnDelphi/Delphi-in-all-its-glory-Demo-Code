program Project_InheritanceTree;

uses
  fastmm4,
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  TesterForm in 'TesterForm.pas' {frmTester},
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Vcl.pas',{$ENDIF}{Optional}
  LightVcl.Common.VclUtils in '..\..\LightSaber\FrameVCL\LightVcl.Common.VclUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;    { If true, a taskbar button represents the application's main form and displays its caption. All child forms will stay on top of the MainForm (bad)! If False, a taskbar button represents the application's (hidden) main window and bears the application's Title. Must be True to use Windows (Vista) Aero effects (ive taskbar thumbnails, Dynamic Windows, Windows Flip, Windows Flip 3D). https://stackoverflow.com/questions/66720721/ } 
  Application.CreateForm(TfrmTester, frmTester);
  frmTester.Show;

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, move the mouse over btnStart & read its inheritance tree in lboxMain.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Vcl.StartBridge;
  {$ENDIF}
  Application.Run;
end.
