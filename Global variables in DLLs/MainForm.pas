unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm10 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form10: TForm10;

implementation
{$R *.dfm}


procedure CallDLL(const DLLName: string; const FuncName: string);
type
  TTestSingleton = procedure; stdcall;
var
  DLLHandle: THandle;
  Proc: TTestSingleton;
begin
  DLLHandle := LoadLibrary(PChar(DLLName));
  try
    if DLLHandle <> 0 then
    begin
      @Proc := GetProcAddress(DLLHandle, PChar(FuncName));
      if Assigned(Proc) then
        Proc;
    end;
  finally
    FreeLibrary(DLLHandle);
  end;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  CallDLL('DLL1.dll', 'TestSingleton');  // Initializes singleton in uTest1 DLL
  CallDLL('DLL2.dll', 'TestSingleton');  // Should initialize a new instance of the singleton in uTest2 DLL
end;




end.
