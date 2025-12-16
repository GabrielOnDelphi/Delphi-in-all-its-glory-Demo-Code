program ProjectTestDeploy;

uses
  {$IF Defined(MSWINDOWS)}
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  {$ENDIF }
  System.StartUpCopy,
  FMX.Forms,
  FormDeploy in 'FormDeploy.pas' {Form1},
  LightCore.AppData,
  LightFmx.Common.AppData.Form,
  LightFmx.Common.AppData;

{$R *.res}

begin
  AppData:= TAppData.Create('Light Deployment Demo');
  AppData.CreateMainForm(TForm1, Form1, asFull); // Change AutoState from asFull to asNone if you don't want to save form's state to disk.
  AppData.Run;
end.
