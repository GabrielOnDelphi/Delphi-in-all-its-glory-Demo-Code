unit TestRegister;

interface

procedure Register;

implementation

uses
  System.SysUtils, System.Classes, System.IOUtils, Vcl.Controls, Vcl.Forms;

procedure LogMessage(const Msg: string);
var
  LogFile: TextFile;
  TempPath: string;
  LogFileName: string;
begin
  TempPath := TPath.GetTempPath;
  LogFileName := TempPath + 'RegisterLog.txt';

  AssignFile(LogFile, LogFileName);
  if FileExists(LogFileName) then
    Append(LogFile)
  else
    Rewrite(LogFile);
  try
    Writeln(LogFile, Msg);
  finally
    CloseFile(LogFile);
  end;
end;

procedure Register;
begin
  LogMessage('Register procedure called.');
end;

initialization
  LogMessage('Initialization section called.');

end.
