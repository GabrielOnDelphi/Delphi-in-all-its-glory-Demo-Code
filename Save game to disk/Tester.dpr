program Tester;

uses
  {$IFDEF DEBUG}FastMM4,{$ENDIF}
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl,{$ENDIF}
  Vcl.Forms,
  LightCore.AppData,
  LightVcl.Visual.AppData,
  TesterForm in 'TesterForm.pas' {frmTester},
  Soldier in 'Soldier.pas',
  GameCore in 'GameCore.pas';

{$R *.res}

begin
  CONST MultiThreaded = FALSE;
  CONST AppName       = 'Save game to disk';

  AppData:= TAppData.Create(AppName, '', MultiThreaded);
  AppData.CreateMainForm(TfrmTester, frmTester, TRUE, TRUE, asPosOnly);

  {$IFDEF AUTOPILOT}StartBridge;{$ENDIF}

  AppData.Run;
end.
