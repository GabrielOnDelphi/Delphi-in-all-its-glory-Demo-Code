program SpeedTest;

{ The speed test shown in Book 2, "Reaching for the gods", chapter "Speed up your program".
  Build it in Release (Optimization on) and run it outside the debugger, or the numbers mean nothing. }

uses
  {$IFDEF DEBUG}FastMM4,{$ENDIF}
  Vcl.Forms,
  TesterForm in 'TesterForm.pas' {frmTester},
  LightVcl.Visual.AppData in '..\..\LightSaber\FrameVCL\LightVcl.Visual.AppData.pas',
  LightVcl.Visual.AppDataForm in '..\..\LightSaber\FrameVCL\LightVcl.Visual.AppDataForm.pas',
  LightCore.AppData in '..\..\LightSaber\LightCore.AppData.pas';

{$R *.res}

begin
  CONST
     MultiThreaded= FALSE;
  CONST
     AppName= 'Delphi Speed Test';           // Used as the name of the INI file (SaveForm/LoadForm)

  AppData:= TAppData.Create(AppName, '', MultiThreaded);
  Application.MainFormOnTaskbar:= TRUE;
  AppData.CreateMainForm(TfrmTester, asFull);

  AppData.Run;
end.
