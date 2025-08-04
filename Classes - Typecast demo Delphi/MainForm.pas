UNIT MainForm;

INTERFACE

USES
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  uMachines;

TYPE
  TfrmMain = class(TForm)
    Memo            : TMemo;
    Panel           : TPanel;
    btnAsCast       : TButton;
    btnIs           : TButton;
    btnHardTypecast : TButton;
    btnBadTypecast  : TButton;
    btnBadTypecast2 : TButton;
    btnBadTypecast3 : TButton;
    procedure FormCreate          (Sender: TObject);
    procedure FormDestroy         (Sender: TObject);
    procedure btnIsClick          (Sender: TObject);
    procedure btnAsCastClick      (Sender: TObject);
    procedure btnBadTypecastClick (Sender: TObject);
    procedure btnHardTypecastClick(Sender: TObject);
    procedure btnBadTypecast2Click(Sender: TObject);
    procedure btnBadTypecast3Click(Sender: TObject);
  private
  public
  end;

VAR
  frmMain: TfrmMain;

IMPLEMENTATION {$R *.dfm}

VAR
  Car: TCar;
  Airplane: TAirplane;
  Machinery: TMachinery;


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Car      := TCar.Create;
  Machinery:= TMachinery.Create;
  Airplane := TAirplane.Create;
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Airplane);
  FreeAndNil(Car);
  FreeAndNil(Machinery);
end;









procedure TfrmMain.btnAsCastClick(Sender: TObject);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('');
  Memo.Lines.Add('[ AS ]');
  Memo.Lines.Add('');

  // OK
  // Pointless typecast. We typecast Machinery to Machinery. Pointles but valid.
  Memo.Lines.Add('Machinery as TMachinery: ');
  Memo.Lines.Add('  Name: '      + (Machinery as TMachinery).Name);       // This will show the name of the object
  Memo.Lines.Add('  WhatAreYou: '+ (Machinery as TMachinery).WhatAreYou); // This will call the WhatAreYou method
  Memo.Lines.Add('');

  // OK
  Memo.Lines.Add('Car as TMachinery: ');
  Memo.Lines.Add('  Name: '      + (Car as TMachinery).Name);        // Shows Car (but it is a pointless typecast since fields cannot be overridden)
  Memo.Lines.Add('  WhatAreYou: '+ (Car as TMachinery).WhatAreYou);  // Shows Machinery
end;



procedure TfrmMain.btnIsClick(Sender: TObject);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('');
  Memo.Lines.Add('[ IS ]');
  Memo.Lines.Add('');

  if Car is TMachinery
  then Memo.Lines.Add(' The car is a machine')
  else Memo.Lines.Add(' Nope. The car is not a machine. Maybe it is a bird?');

  // Impossible btnTypeCast. This line won't compile
  // The compiler already knows that this is not ok, so it won't even try to compile it.
  // Compiler error message: E2010 Incompatible types: 'TCar' and 'TAirplane'
  // if Car is TAirplane then Memo.Lines.Add('The car is an airplane');
end;


procedure TfrmMain.btnHardTypecastClick(Sender: TObject);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('');
  Memo.Lines.Add('[ UNSAFE ]');
  Memo.Lines.Add('');

  // This is unsafe but valid
  Memo.Lines.Add('TMachinery(Car).Name: ');
  Memo.Lines.Add(TMachinery(Car).Name); // This will show 'TCar'
end;


procedure TfrmMain.btnBadTypecastClick(Sender: TObject);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('');
  Memo.Lines.Add('[ BAD1 ]');
  Memo.Lines.Add('');
  Memo.Lines.Add('This will raise an exception!');
  Memo.Lines.Add('');

  // This code will do a typecast similar to 'as' but the cast will be forced (hard typecast).
  // No validation will be done at compile or runtime!
  // The code seems to work. But if we look deep under the hood at what happens, it corrupts some data into the object's memory. But because we are unlucky no access violation is shown.
  // So, always avoid hard typecasts
  Memo.Lines.Add(TCar(Machinery).WhatAreYou);

  //The code above will not raise an exception.
  // Here is the appropriate code, that will give an error at runtime:
  // EInvalidCast error at run time.
  // 'As' is the only the proper way to do it!
  Memo.Lines.Add((Machinery as TCar).WhatAreYou);
end;


procedure TfrmMain.btnBadTypecast2Click(Sender: TObject);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('');
  Memo.Lines.Add('[ BAD2 ]');
  Memo.Lines.Add('');
  // Invalid TypeCast
  // With this you can force compiler's hand to compile it even if it is unsafe (typecast Child to Child)
  // Under Lazarus the compiler will warn you: Class types "TCar" and "TAirplane" are not related.
  // Under Delphi, you will get no warnings. Lazarus gets an extra point!
  Memo.Lines.Add('Invalid typecast: '+ TAirplane(Car).Name);  // This will show 'a car'
end;




procedure TfrmMain.btnBadTypecast3Click(Sender: TObject);
begin
  // Impossible Typecasts.
  // These lines won't compile:

  // The compiler knows this is not ok and will show
  // an error at compile time: Operator not applicable to this operand type
  //Memo.Lines.Add((TMachinery as Airplane).Name);

  // The compiler knows this is not ok and will show
  // an error at compile time: Class or Object types "TAirplane" and "TCar" are not related
  //Memo.Lines.Add((Airplane as TCar).Name);
end;




end.
