unit uTest2_D;

interface

USES
   System.SysUtils, System.Classes,
   Vcl.Forms, vcl.Dialogs, Vcl.Controls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
   uTest1, uTest2_R;

 
procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('LightSaber', [TMyPanel]);
end;

 

 
{-----------------------------------------------------------------------}
initialization
begin
  //TSingleton.Instance.Print('uTest2_D.Initialization. '); // This should print 7, but it may create a new instance and print nothing (0)
end;

finalization
begin
end;
{-----------------------------------------------------------------------}

end.


