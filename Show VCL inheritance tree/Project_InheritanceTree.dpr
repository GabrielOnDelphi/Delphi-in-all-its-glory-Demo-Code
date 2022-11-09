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
  cShortcutConflictLister in '..\..\Packages\CubicCommonControls\cShortcutConflictLister.pas',
  cVclUtils in '..\..\Packages\CubicCommonControls\cVclUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;    { If true, a taskbar button represents the application's main form and displays its caption. All child forms will stay on top of the MainForm (bad)! If False, a taskbar button represents the application's (hidden) main window and bears the application's Title. Must be True to use Windows (Vista) Aero effects (ive taskbar thumbnails, Dynamic Windows, Windows Flip, Windows Flip 3D). https://stackoverflow.com/questions/66720721/ } 
  Application.CreateForm(TfrmTester, frmTester);
  frmTester.Show;
  Application.Run;
end.
