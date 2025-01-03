unit MainForm;

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
    RandomValue: Integer;
    procedure Test1;
    procedure Test2;
    procedure FaultyProcedure(i: Integer);
    procedure Test3;
  public
  end;

var
  Form21: TForm21;

implementation {$R *.dfm}


procedure CallMeAtDebugTime;
begin
  System.SysUtils.beep;
end;


procedure TForm21.FormCreate(Sender: TObject);
begin
 Randomize;
 Application.ProcessMessages;
 RandomValue:= Random(999)+1;
 Test2;
 //CallMeAtDebugTime;
end;



procedure TForm21.Test1;
begin
 for VAR i:= 100 downto 0 DO
   Caption:= IntToStr(10 DIV i);
end;


procedure TForm21.FaultyProcedure(i: Integer);
begin
  if i = RandomValue
  then RAISE Exception.Create('Ups!')
end;


procedure TForm21.Test2;
VAR i: integer;
begin
 for i:= 1 to 999 DO
  begin
   FaultyProcedure(i);
   Caption:= IntToStr(i);
  end;
end;


procedure TForm21.Test3;
begin
 for VAR i:= 1 to 999 DO
  begin
   TRY
     FaultyProcedure(i);
     Caption:= IntToStr(i);
   EXCEPT
      Caption:= 'Ups!';  // Put break point here!
   END;
  end;
end;



end.
