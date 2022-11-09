unit Unit1;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

TYPE
  TForm3 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
  public
  end;

var
  Form3: TForm3;

implementation {$R *.dfm}


function GetFirstName(FullName: string): string;
var FoundAt: Integer;
begin
 FoundAt:= Pos(' ', FullName, 1);
 if FoundAt > 0
 then Result:= Copy(FullName, 1, FoundAt-1)
 else ShowMessage('Invalid name!');
end;


procedure TForm3.Button1Click(Sender: TObject);
var
   MyName: string;
begin
 MyName:= 'John Lennon';
 Caption:= 'First name is: '+ GetFirstName(MyName);
end;

end.
