UNIT FormOverload;

{-------------------------------------------------------------------------------------------------------------
   OVERRIDING A METHOD
   Polymorphism works properly
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls;

TYPE
  TfrmOverride = class(TForm)
    btnT3: TButton;
    btnT6: TButton;
    procedure btnT3Click(Sender: TObject);
    procedure btnT6Click(Sender: TObject);
  private
  public
  end;

VAR
  frmOverride: TfrmOverride;

IMPLEMENTATION {$R *.dfm}




{-------------------------------------------------------------------------------------------------------------
   OVERLOADING METHODS WITH DIFFERENT PARAMETERS
-------------------------------------------------------------------------------------------------------------}

TYPE
   T3 = class(TObject)
     function Print(S: string): string; virtual;
   end;

   T4 = class(T3)
     // Same method name but different parameter
     // We cannot use override here. Override can be used only if this method signature (name/parameters) is identical with parent's method signature
     function Print(I: Integer): string; reintroduce; overload;
   end;



function T3.Print(S: string): string;
begin
 Result:= S;
end;


function T4.Print(I: Integer): string;
begin
 Result:= IntToStr(i)+ ' (child)';
end;






procedure TfrmOverride.btnT3Click(Sender: TObject);
VAR SomeObject: T4;
begin
 SomeObject:= T4.Create;
 Caption:= SomeObject.Print('The answer to life is ')         // calls T3.Print(s)
         + SomeObject.Print(42);                              // calls T4.Print(i)
end;










{-------------------------------------------------------------------------------------------------------------
   ABSTRACT METHODS
-------------------------------------------------------------------------------------------------------------}

TYPE
  T5 = class(TObject)
     //This method is abstract (not implemented in T5). All abstract methods must be virtual
     function Print: string; virtual; abstract;

     //This will generate an warning because it is abstract and we don't implement it in the
     // inherited class (T6): Constructing instance of 'T6' containing abstract method 'T5.PrintMe'.
     //We have 3 choises:
     //   1) hide the warning (if you know what you are doing).
     //   2) implement the method in T5 (as an empty method).
     //   3) implement the method in T6 (as an empty method)
     function PrintMe: string; virtual; abstract;
  end;

  T6 = class(T5)
     // This implements the missing/abstract method of T5
     function Print: string; override;
  end;




function T6.Print: string;
begin
 Result:= 'Class T6 (child)';
end;


procedure TfrmOverride.btnT6Click(Sender: TObject);
var
   SomeObject: T6;
begin
   SomeObject := T6.Create;
   Caption:= SomeObject.Print;     // calls T6.Print
end;



end.
