UNIT FormHide;

INTERFACE

USES
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

TYPE
  TfrmReinstroduce = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  end;

VAR
  frmReinstroduce: TfrmReinstroduce;

IMPLEMENTATION {$R *.dfm}





{-------------------------------------------------------------------------------------------------------------
   OVERRIDING A METHOD
   Polymorphism works properly
-------------------------------------------------------------------------------------------------------------}

TYPE
  TOvr1 = class(TObject)
     function Print: string; virtual;
  end;

  TOvr2 = class(TOvr1)
     function Print: string; override; // Print is redeclared and overridden. It doesn't hide parent's Print method.
  end;


function TOvr1.Print: string;
begin
 Result:= 'Class TOvr1 (parent)';
end;


function TOvr2.Print: string;
begin
 Result:= 'Class TOvr2';
end;




{-------------------
   Using the class
--------------------}

procedure TfrmReinstroduce.Button3Click(Sender: TObject);
var
   SomeObject: TOvr1;           // Declared as TOvr1 but constructed as TOvr2
begin
   SomeObject := TOvr2.Create;
   Caption:= SomeObject.Print;  // Calls TOvr2.Print because of the polymorphism
end;


procedure TfrmReinstroduce.Button4Click(Sender: TObject);
var
   SomeObject: TOvr2;           // Declared as TOvr2, constructed as TOvr2
begin
   SomeObject := TOvr2.Create;
   Caption:= SomeObject.Print;  // Calls T2.Print
end;

















{-------------------------------------------------------------------------------------------------------------
   HIDING A METHOD
   This will break the polymorphism chain!
-------------------------------------------------------------------------------------------------------------}

TYPE
  THide1 = class(TObject)
     function Print: string; virtual;
  end;

  THide2 = class(THide1)
     // Print is redeclared, but not overridden, therefore it hides parent's Print method.
     // We need to use reintroduce to make the warning "Method Print hides virtual method of base type T1" go away.
     function Print: string; reintroduce;
  end;

function THide1.Print: string;
begin
 Result:= 'Class THide1 (parent)';
end;


function THide2.Print: string;
begin
 Result:= 'Class THide2';
end;


{-------------------
   Using the class
--------------------}

procedure TfrmReinstroduce.Button1Click(Sender: TObject);
var
   SomeObject: THide1;           // Declared as THide1 but constructed as THide2
begin
   SomeObject := THide2.Create;
   Caption:= SomeObject.Print;   // Calls THide1.Print instead of THide2.Print because THide2.Prin was hidden. We can say that the behavior in this case is pretty much the same as in the case of a 'static' method.
end;


procedure TfrmReinstroduce.Button2Click(Sender: TObject);
var
   SomeObject: THide2;           // Declared as THide2, constructed as THide2
begin
   SomeObject := THide2.Create;
   Caption:= SomeObject.Print;   // Calls T2.Print
end;


end.
