unit UnitArrays;

{-------------------------------------------------------------------------------------------------------------
This program demonstrates how to declare, initializa and copy arrays }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm21 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form21: TForm21;

implementation {$R *.dfm}


procedure TestCopyArray;
VAR
  i : Integer;
  Source, Target : array of Integer;
begin
  SetLength(Source, 8);

  for i := 1 to 8 do    // Build the dynamic source array
    Source[i-1] := i;   // Remember that arrays start at index 0

  Target := Copy(Source, 3, 4);

  for i := 0 to Length(Target) -1 do   // Display the created array
    ShowMessage('Target['+IntToStr(i)+'] : '+IntToStr(Target[i]));
end;



procedure TForm21.FormCreate(Sender: TObject);
CONST
   A: Array[1..2,1..2] of Real =  ((1,2),(3,4));
   TwoDee:  array[1..2, 1..5] of Integer = ( (2,4,6,8,10), (101,102,103,104,105) );

   Days:    array[1..7] of string = ('Mon','Tue','Wed','Thu','Fri','Sat','Sun');
   Numbers: array[0..9] of integer = (0,1,2,3,4,5,6,7,8,9);

VAR
    Source, Target: array of Integer;
begin
 Target:= Source;
 Target:= Copy(Source, 0, High(Source));
end;


end.
