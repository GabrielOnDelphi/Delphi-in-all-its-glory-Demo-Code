library DLL1;

uses
  System.SysUtils,
  vcl.Dialogs,
  uTest1 in 'c:\Projects\Carte\Demo projects\Initialization in IDE packages\uTest1.pas';

procedure TestSingleton; stdcall;
begin
  TSingleton.Instance.SetValue(7);
  TSingleton.Instance.PrintValue('uTest1 - DLL');
end;

exports
  TestSingleton;

begin
end.

