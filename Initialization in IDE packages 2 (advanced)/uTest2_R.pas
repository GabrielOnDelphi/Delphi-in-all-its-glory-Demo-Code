unit uTest2_R;

interface

USES
   System.SysUtils, System.Classes, System.TypInfo,
   Vcl.Forms, vcl.Dialogs, Vcl.Controls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
   uTest1;

TYPE
  TMyPanel = class(TPanel)
    procedure Print(const Msg: string);
    constructor Create(aOwner: TComponent); override;
  end;

procedure PrintMsg_Pkg2R(const Msg: string);



implementation


constructor TMyPanel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Print('TMyPanel.Create');
  //TSingleton.Instance.Print('TMyPanel.Create. ');
end;


procedure TMyPanel.Print(const Msg: string);
begin
  ShowMessage(
    #10+ Msg
  + #10
  + #10+ 'TMyPanel: '
  + #10+ ' Module ID: '      + IntToHex(UIntPtr(HInstance), 8) // Retrieve the module handle and convert to hex
  + #10+ ' @TMyPanel: '      + IntToHex(IntPtr(TMyPanel), 8)
  + #10+ ' @Self : '         + IntToHex(NativeInt(Pointer(Self)), 8)
  + #10
  + #10+ 'TSingleton : '
  + #10+ ' @TSingleton.Instance: '  + IntToHex(NativeInt(Pointer(TSingleton.Instance)), 8)
  + #10+ ' @Singleton.ClassVar : '  + IntToHex(IntPtr(@TSingleton.ClassVar), 8)
  + #10+ ' Instance.GetInstanceVar : '    + IntToStr(TSingleton.Instance.GetInstanceVar)
  + #10+ ' Global : '               + IntToStr(Global)
  );

  PrintMsg_Pkg2R('PrintMsg_Pkg2R');
end;


 
procedure PrintMsg_Pkg2R(const Msg: string);
begin
  ShowMessage(
    #10+                     Msg
  + #10
  + #10+ 'PrintMsg_Pkg2R: '
  + #10+ ' Module: '         + IntToHex(UIntPtr(HInstance), 8) // Retrieve the module handle and convert to hex
  + #10
  + #10+ 'TSingleton : '
  + #10+ ' @TSingleton.Instance: '  + IntToHex(NativeInt(Pointer(TSingleton.Instance)), 8)
  + #10+ ' @Singleton.ClassVar : '  + IntToHex(IntPtr(@TSingleton.ClassVar), 8)
  + #10+ ' Instance.GetInstanceVar : '    + IntToHex(IntPtr(TSingleton.Instance.GetInstanceVar), 8)
  + #10+ ' Global : '               + IntToStr(Global)
  );
end;





{-----------------------------------------------------------------------}
initialization
begin
  //TSingleton.Instance.Print('uTest2_R.Initialization. '); // This should print 7, but it may create a new instance and print nothing (0)
end;

finalization
begin
end;
{-----------------------------------------------------------------------}

end.


