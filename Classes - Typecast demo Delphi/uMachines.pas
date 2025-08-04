unit uMachines;

INTERFACE

USES
  SysUtils;


TYPE
   TMachinery = class(TObject)
     public
      Name: string;
      constructor Create; virtual;
      function WhatAreYou: string;
     end;

   TCar = class(TMachinery)
     private
     public
      constructor Create; override;
      function WhatAreYou: string;  // Notice! We don't override!
     end;

   TAirplane = class(TMachinery)
     public
      constructor Create; override;
      function WhatAreYou: string;  // Notice! We don't override!
     end;


implementation


constructor TMachinery.Create;
begin
 inherited Create;
 Name:= 'Machinery';
end;

function TMachinery.WhatAreYou: string;
begin
 Result:= 'A machinery';
end;




constructor TCar.Create;
begin
 inherited Create; // This will construct the TMachinery and set the Name to 'Machinery'...
 Name:= 'Car';     // ...however, here we overwrite it with our own string (a car).
end;


function TCar.WhatAreYou: string;
begin
  Result:= 'A car';
end;







constructor TAirplane.Create;
begin
 inherited Create; // This will set the name to 'some kind of machine' then to 'a car'...
 Name:= 'Airplane'; // ... and now we again overwrite those name with our own (an airplane)
end;

function TAirplane.WhatAreYou: string;
begin
  Result:= 'An airplane';
end;


end.

