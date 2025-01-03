unit uTest2_D;

interface

USES
   System.SysUtils, System.Classes,
   Vcl.Forms, vcl.Dialogs, Vcl.Controls,
   uTest1, uTest2_R;

 
procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('LightSaber', [TMyPanel]);
  TMyPanel.Print('Register in Pkg2_D');
end;


initialization
begin
  Global:= 555;
  ShowMessage('Initialization Pkg2_D.  '+ #13+ IntToStr(Global));
end;

finalization
begin
end;

end.


