unit FormDeploy;

{-------------------------------------------------------------------------------------------------------------
   This program tries to open a file called "TestDeployFile.txt".
   On Windows, the file is located next to the exe file.
   However, this location is not possible on Andoid. The file has to be deployed with the APK file.
   If the "Remote Path" field is set to "assets\internal" in the Deployment Manager,
     System.StartUpCopy will copy the file to "/data/user/0/com.embarcadero.ProjectTestDeploy/files/TestFile.res".
   The AppDataCore.AppFolder funtion will return the correct path to that file, no matter where it is located.
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  System.SysUtils, System.Types, System.Classes,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Controls.Presentation, FMX.Memo, FMX.StdCtrls, FMX.Layouts,
  LightFmx.Common.AppData.Form, FMX.Memo.Types, FMX.ScrollBox;

TYPE
  TForm1 = class(TLightForm)
    Memo: TMemo;
    Layout1: TLayout;
    btnShowPaths: TButton;
    btnOpenFile: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnShowPathsClick(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
  end;

var
  Form1: TForm1;

IMPLEMENTATION  {$R *.fmx}
USES
   LightCore.AppData, LightCore.Platform, LightCore.Reports;



procedure TForm1.FormCreate(Sender: TObject);
begin
  //
end;


procedure TForm1.btnShowPathsClick(Sender: TObject);
begin
  Memo.Lines.Clear;
  Memo.Lines.Add(GenerateAppRep);  // Also see: c:\Projects\LightSaber\Demo\VCL\Demo SystemReport\VCL_Demo_SystemReport.dpr
end;


procedure TForm1.btnOpenFileClick(Sender: TObject);
begin
  Memo.Lines.Clear;
  VAR s:= AppDataCore.AppFolder+'TestDeployFile.txt'; // This returns totally different paths on Win/Android
  Memo.Lines.Add('Path: '+ s);
  Memo.Lines.LoadFromFile(s);
end;


end.
