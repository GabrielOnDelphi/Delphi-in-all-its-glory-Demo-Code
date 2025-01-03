unit uTest1;

interface

uses
   System.SysUtils, vcl.Dialogs;

var Global: Integer;


implementation


initialization
begin
  Global:= 111;
  ShowMessage('Initialization Pkg1.  '+ #13+ IntToStr(Global));
end;

finalization
begin
end;

end.
