program FindInFiles;

uses
  FastMM4,
  Vcl.Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Vcl.pas',{$ENDIF}{Optional}
  uMainForm in 'uMainForm.pas' {frmMain},
  cFindInFile in 'cFindInFile.pas',
  LightVcl.Visual.AppData;

{$R *.res}

begin
  Application.Initialize;
  AppData:= TAppData.Create('MyCollApp');
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, type a folder into edtPath, press "Search" & read the files listed in lbxResults.
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Vcl.StartBridge;
  {$ENDIF}
  Application.Run;
end.
