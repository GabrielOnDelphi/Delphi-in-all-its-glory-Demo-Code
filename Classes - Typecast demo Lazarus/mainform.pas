unit MainForm;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uMachines;

type
  TForm1 = class(TForm)
    btnPolymorphims: TButton;
    Memo: TMemo;
    btnTypeCast: TButton;
    procedure btnPolymorphimsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTypeCastClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;
  Car: TCar;
  Airplane: TAirplane;
  Machinery: TMachinery;

implementation {$R *.lfm}






procedure TForm1.FormCreate(Sender: TObject);
begin
  Machinery:= TMachinery.Create;
  Car:= TCar.Create;
  Airplane:= TAirplane.Create;

  //typecastClick(Sender);   //del
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Airplane);
  FreeAndNil(Car);
  FreeAndNil(Machinery);
end;









procedure TForm1.btnTypeCastClick(Sender: TObject);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('[Valid typecasts]');

  // Pointless btnTypeCast. This will show 'some kind of machine'
  Memo.Lines.Add((Machinery as TMachinery).Name);

  // This will show 'a car'
  Memo.Lines.Add((Car as TMachinery).Name);

  // This will show 'an airplane'
  Memo.Lines.Add((Airplane as TMachinery).Name);

  // Impossible btnTypeCast. This line won't compile
  //Memo.Lines.Add((TMachinery as Airplane).Name);

  Memo.Lines.Add('');
  Memo.Lines.Add('[Testing object type]');

  if Car is TMachinery
  then Memo.Lines.Add(' The car is a machine')
  else Memo.Lines.Add(' Nope. The car is not a machine. Maybe it is a bird?');

  // Impossible btnTypeCast. This line won't compile
  // The compiler already knows that this cannot be so it won't even try to compile this code. Compiler error message: Class or Object types "TCar" and "TAirplane" are not related
  {if Car is TAirplane
  then Memo.Lines.Add('The car is an airplane')
  else Memo.Lines.Add('Nope. The car is not an airplane');}



  Memo.Lines.Add('');
  Memo.Lines.Add('[Valid but unsafe typecasts. Use ''as'' instead.]');

  // This will show 'a car'
  Memo.Lines.Add(TMachinery(Car).Name);

  // This will show 'some kind of machine'
  Memo.Lines.Add(TCar(Machinery).Name);

  // This will show 'an airplane'
  Memo.Lines.Add(TMachinery(Airplane).Name);

  // This will show 'some kind of machine'
  Memo.Lines.Add(TAirplane(Machinery).Name);

  // Invalid btnTypeCast
  // With this btnTypeCast you can force compiler's had to compile it even if it is unsafe.
  // But the compiler will warn you anyway: Warning: Class types "TCar" and "TAirplane" are not related
  ////// Memo.Lines.Add('Invalid typecast: '+ TAirplane(Car).Name);  // This will show 'a car'

  // Impossible btnTypeCast. This line won't compile
  // The compiler will refuse to compile this buggy code
  // and will show an error: Class or Object types "TAirplane" and "TCar" are not related
  //Memo.Lines.Add((anAirplane as TCar).Name);
end;



procedure TForm1.btnPolymorphimsClick(Sender: TObject);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('[Polymorphism: Hardcast]');

  // This will show 'I'm a bird'
  Memo.Lines.Add(TAirplane(Machinery).WhatAreYou);

  // This will show 'I'm a car'
  Memo.Lines.Add(TCar(Machinery).WhatAreYou);

  // This will show 'I'm a machine' however it is a lie because the typecast is invalid!
  Memo.Lines.Add(TMachinery(Airplane).WhatAreYou);

  // This will show 'I'm a machine' however it is a lie!
  Memo.Lines.Add(TMachinery(Car).WhatAreYou);



  Memo.Lines.Add('');
  Memo.Lines.Add('[Polymorphism (Safecast)]');

  // This will show 'I'm a machine'
  Memo.Lines.Add((Airplane as TMachinery).WhatAreYou);

  // This will show 'I'm a machine'
  Memo.Lines.Add((Car as TMachinery).WhatAreYou);

  // This will raise an EInvalidCast error at run time
  //Memo.Lines.Add((Machinery as TAirplane).WhatAreYou);

  // This will raise an EInvalidCast error at run time
  //Memo.Lines.Add((Machinery as TCar).WhatAreYou);
end;



end.

