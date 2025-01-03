library DLL2;

uses
  System.SysUtils,
  vcl.Dialogs,
  uTest1 in 'c:\Projects\Carte\Demo projects\Initialization in IDE packages\uTest1.pas';

procedure TestSingleton; stdcall;
begin
  TSingleton.Instance.PrintValue('uTest2 - DLL');
end;

exports
  TestSingleton;

begin
end.

