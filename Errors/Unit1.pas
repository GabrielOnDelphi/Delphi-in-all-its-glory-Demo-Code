UNIT Unit1;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, System.Classes;

TYPE
  TForm1 = class(TForm)
    btnError1: TButton;
    btnError2: TButton;
    btnError3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnError1Click(Sender: TObject);
    procedure btnError2Click(Sender: TObject);
    procedure btnError3Click(Sender: TObject);
  private
  public
  end;

VAR
  Form1: TForm1;

function TestFunction2Proper: Boolean;

IMPLEMENTATION
{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
 //raise Exception.Create('Something is wrong with the Force!'); //Try me
 //Exception raised, but after it, the program will continue to load/work
end;



function GetMeANumber: integer;
begin
 Result:= StrToInt('0,01');
end;


function TestFunction2: Boolean;
begin
 Result:= FALSE;
 GetMeANumber;
 Result:= TRUE;
end;


procedure TForm1.btnError1Click(Sender: TObject);
begin
 raise Exception.Create('There is a disturbance in the Force!');
end;



procedure TForm1.btnError2Click(Sender: TObject);
begin
 Caption:= '';

 // What will the program show? 'Ok' or 'Not Ok'?
 if TestFunction2
 then Caption:= 'Ok'
 else Caption:= 'Not ok!';
end;



procedure TForm1.btnError3Click(Sender: TObject);
begin
 if TestFunction2Proper
 then Caption:= 'Ok [2]'
 else Caption:= 'Not ok! [2]';
end;


function TestFunction2Proper: Boolean;
begin
 Result:= TRUE;
 TRY
   GetMeANumber;   // Please note that this code might not be always be the perfect solution. Why? Because we still swallow the error in GetMeANumbber. We don’t know what failed and where (consider the case where we have more lines of code between the try and except. Therefore, try to put no more than one line of code between try/except AND try to catch only specific exceptions, not all!
 EXCEPT
   Result:= FALSE;  // This code will be executed if an exception is raised
 END;
end;



end.
