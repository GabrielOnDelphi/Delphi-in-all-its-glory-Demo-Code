unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
  public
  end;

var
  Form3: TForm3;

implementation {$R *.dfm}

procedure SplitName(FullName: string; out FirstName, FamilyName: string);
var FoundAt: Integer;
begin
 FoundAt:= Pos(' ', FullName, 1);
 if FoundAt > 0
 then
  begin
   FirstName := Copy(FullName, 1, FoundAt-1);
   FamilyName:= Copy(FullName, FoundAt, Length(FullName));
  end
 else ShowMessage('Invalid name!');
end;

procedure TForm3.Button1Click(Sender: TObject);
var
   MyName: string;
   Name1, Name2: string;
begin
 MyName:= 'John Lennon';
 SplitName(MyName, Name1, Name2);
 Caption:= 'First name is: '+ Name1+ '. Last name is: '+ Name2;
end;

end.
