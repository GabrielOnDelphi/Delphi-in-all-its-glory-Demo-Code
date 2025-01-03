unit uMachines;

INTERFACE

USES
  Classes, SysUtils;


TYPE
   TMachinery = class(TObject)
     public
      Name: string;
      constructor Create; overload;
      function WhatAreYou: string;
     end;

   TCar = class(TMachinery)
     private
      s: string;
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
 Name:= 'TMachinery';
end;

function TMachinery.WhatAreYou: string;
begin
 Result:= 'Machinery';
end;




constructor TCar.Create;
begin
 inherited Create; // This will construct the TMachinery and set the Name to 'some kind of machine'...
 Name:= 'TCar';   // ...however, here we override the name with our own string (a car)
end;


function TCar.WhatAreYou: string;
begin
  Result:= 'Car';
end;







constructor TAirplane.Create;
begin
 inherited Create; // This will set the name to 'some kind of machine' then to 'a car'...
 Name:= 'TAirplane'; // ... and now we again overwrite those name with our own (an airplane)
end;

function TAirplane.WhatAreYou: string;
begin
  Result:= 'Airplane';
end;


end.

