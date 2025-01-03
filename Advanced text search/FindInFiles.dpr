program FindInFiles;

uses
  FastMM4,
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {frmMain},
  cFindInFile in 'cFindInFile.pas',
  cbAppData in '..\..\Packages\LightSaber\cbAppData.pas',
  FormLog in '..\..\Packages\LightSaber\FormLog.pas';

{$R *.res}

begin
  Application.Initialize;
  AppData:= TAppDataEx.Create('MyCollApp');
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
