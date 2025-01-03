unit uTest1;

interface

uses
   System.SysUtils, vcl.Dialogs;

type
  ISingleton = interface
    ['{E1459FC2-E55A-40DB-889D-8FE18A7762C5}']
    procedure Print(const s: string);
    procedure SetInstanceVar(Value: Integer);
    function  GetInstanceVar: Integer;
  end;

  TSingleton = class(TInterfacedObject, ISingleton)
  private
    class var FInstance: ISingleton;
    class var Lock: TObject;
    class function GetInstance: ISingleton; static;
  public
    var InstVar: Integer;  //"Private" field
    class var ClassVar: Integer;
    class property Instance: ISingleton read GetInstance;
    procedure Print(const Msg: string);
    procedure SetInstanceVar(Value: Integer);
    function  GetInstanceVar: Integer;

    class constructor ClassCreate;       //   static;
    class destructor ClassDestroy;       //   static;
  end;

var Global: Integer;

procedure PrintMsg_Pkg1;


implementation

procedure PrintMsg_Pkg1;
begin
  ShowMessage('Hello! This is package 1.');
end;



// Call automatically when the unit is loaded!
// Delphi restricts a single class constructor and a single class destructor per class
class constructor TSingleton.ClassCreate;
begin
  Lock := TObject.Create;  // This is a class variable
  ShowMessage('TSingleton.ClassCreate');
end;


class destructor TSingleton.ClassDestroy;
begin
  FreeAndNil(Lock);
end;


{------------------------------------------------------------------------
   SINGLETON
------------------------------------------------------------------------}
class function TSingleton.GetInstance: ISingleton;
begin
  if FInstance = nil then
  begin
    FInstance := TSingleton.Create;  // Create the singleton only once
    var sModule := IntToHex(UIntPtr(HInstance), 8); // Retrieve the module handle and convert to hex
    //ShowMessage('Singleton created in uTest1'+ #13+ 'Module: ' + sModule);
  end;
  Result := FInstance;
end;


function TSingleton.GetInstanceVar: Integer;
begin
  if Lock = nil
  then ShowMessage('Panic! Lock is nil!');

  Result:= InstVar;
end;


procedure TSingleton.SetInstanceVar(Value: Integer);
begin
  InstVar:= Value;
end;



procedure TSingleton.Print(const Msg: string);
begin
  ShowMessage(
    #10+ Msg
  + #10
  + #10+ 'TSingleton: '
  + #10+ ' Module ID: '                 + IntToHex(UIntPtr(HInstance), 8)        // Retrieve the module handle and convert to hex
  + #10+ ' @Class address: '            + IntToHex(IntPtr(TSingleton), 8)        // the class TSingleton itself. converts the class type to an integer pointer to get its address.
  + #10+ ' @Self: '                     + IntToHex(NativeInt(Pointer(Self)), 8)  // The address of the current instance (i.e., Self), which is retrieved by
  + #10+ ' @TSingleton.Instance: '      + IntToHex(NativeInt(Pointer(TSingleton.Instance)), 8)
  + #10+ ' @TSingleton.ClassVar : '     + IntToHex(IntPtr(@ClassVar), 8)   // Address of var
  + #10+ '             ClassVar : '     + IntToStr(ClassVar)
  + #10+ ' @TSingleton.InstVar : '      + IntToHex(IntPtr(@InstVar), 8)    // Address of var
  + #10+ '  TSingleton.InstVar : '      + IntToHex(IntPtr(InstVar), 8)     // Address of object

  + #10+ ' Instance.GetInstanceVar : '  + IntToStr(TSingleton.Instance.GetInstanceVar)
  + #10
  + #10+ 'Global : '                    + IntToStr(Global)
  );
end;





initialization
begin
  Global:= 1;
  //TSingleton.ClassVar:= 2;                // Class var
  //TSingleton.Instance.SetInstanceVar(3);  // Instance var
  //TSingleton.Instance.Print('uTest1.Initialization. Singleton usage.');
end;

finalization
begin
end;

end.
