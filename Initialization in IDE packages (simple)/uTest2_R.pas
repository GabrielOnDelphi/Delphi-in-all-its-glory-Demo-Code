unit uTest2_R;

interface

USES
   System.SysUtils, System.Classes, System.TypInfo,
   Vcl.Forms, vcl.Dialogs, Vcl.Controls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
   uTest1;

TYPE
  TMyPanel = class(TPanel)
    class procedure Print(const Msg: string);
    constructor Create(aOwner: TComponent); override;
  end;


implementation


constructor TMyPanel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Print('TMyPanel.Create');
end;


class procedure TMyPanel.Print(const Msg: string);
begin
  ShowMessage(
    #10+ Msg
  + #10
  + #10+ 'TMyPanel: '
  + #10+ ' Module ID: '      + IntToHex(UIntPtr(HInstance), 8) // Retrieve the module handle and convert to hex
  + #10+ ' @TMyPanel: '      + IntToHex(IntPtr(TMyPanel), 8)
  + #10+ ' @Self : '         + IntToHex(NativeInt(Pointer(Self)), 8)
  + #10+ ' Global : '        + IntToStr(Global)
  );
end;


initialization
begin
  Global:= 333;
  ShowMessage('Initialization Pkg2_R.  '+ #13+ IntToStr(Global));
end;

finalization
begin
end;

end.


