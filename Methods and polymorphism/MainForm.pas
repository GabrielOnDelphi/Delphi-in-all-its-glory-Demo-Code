unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTest = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btnT5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnT5Click(Sender: TObject);
  private
  public
  end;

VAR
  frmTest: TfrmTest;

IMPLEMENTATION {$R *.dfm}



{-------------------------------------------------------------------------------------------------------------
   HIDING METHODS
-------------------------------------------------------------------------------------------------------------}

TYPE
  T1 = class(TObject)
     function Print: string; virtual;
  end;

  T2 = class(T1)
     // Print is redeclared, but not overridden, therefore it hides parent's Print method.
     // We need to use reintroduce to make the warning "Method Print hides virtual method of base type T1" go away.
     function Print: string; reintroduce;
  end;


function T1.Print: string;
begin
 Result:= 'Class T1 (parent)';
end;


function T2.Print: string;
begin
 Result:= 'Class T2';
end;







procedure TfrmTest.Button1Click(Sender: TObject);
var
   SomeObject: T1;
begin
   SomeObject := T2.Create;
   // Calls T1.Print. We can say that the behavior in this case
   // is pretty much the same as in the case of a 'static' method.
   Caption:= SomeObject.Print;
end;


procedure TfrmTest.Button2Click(Sender: TObject);
var
   SomeObject: T2;
begin
   SomeObject := T2.Create;
   Caption:= SomeObject.Print;    // calls T2.Print
end;





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
     function Print(I: Integer): string; reintroduce; overload; {override;}
   end;



function T3.Print(S: string): string;
begin
 Result:= S;
end;


function T4.Print(I: Integer): string;
begin
 Result:= IntToStr(i)+ ' (child)';
end;



procedure TfrmTest.Button3Click(Sender: TObject);
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
     function Print:   string; virtual; abstract;

     //This will generate an warning because it is abstract and we don't implement it in the
     // inherited class (T6): Constructing instance of 'T6' containing abstract method 'T5.PrintMe'.
     //We have 3 choises: 1) hide the warning (if you know what you are doing). 2) implement the method in T5 (as an empty method). 3) implement the method in T6 (as an empty method)
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



procedure TfrmTest.btnT5Click(Sender: TObject);
var
   SomeObject: T5;
begin
   SomeObject := T6.Create;
   Caption:= SomeObject.Print;     // calls T6.Print
end;





end.
