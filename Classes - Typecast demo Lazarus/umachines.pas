unit uMachines;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

  

type
   TMachinery = class(TObject)
     public
      Name: string;
      constructor Create; overload;
      function WhatAreYou: string;
     end;

   TCar = class(TMachinery)
     public
      constructor Create; overload;
      function WhatAreYou: string;
     end;

   TAirplane = class(TMachinery)
     public
      constructor Create; overload;
      function WhatAreYou: string;
     end;


implementation


constructor TMachinery.Create;
begin
 inherited Create;
 Name:= ' some kind of machine';
end;

function TMachinery.WhatAreYou: string;
begin
 Result:= ' I''m a machine';
end;


constructor TCar.Create;
begin
 inherited Create; // This will construct the TMachinery and set the Name to 'some kind of machine'...
 Name:= ' a car';   // ...however, here we override the name with our own string (a car)
end;

function TCar.WhatAreYou: string;
begin
  Result:= ' I''m a car';
end;


constructor TAirplane.Create;
begin
 inherited Create; // This will set the name to 'some kind of machine' then to 'a car'...
 Name:= ' an airplane'; // ... and now we again overwrite those name with our onw (an airplane)
end;

function TAirplane.WhatAreYou: string;
begin
  Result:= ' I''m a bird';
end;


end.

