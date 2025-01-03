unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm10 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

{$R-}
procedure TForm10.FormCreate(Sender: TObject);
var s: String;
    p: PByte;
begin
  { 1. Testing for #0 at the end of the string }

  // Make sure the memory was not occupied accidentally by zeroes
  s:= 'ABBBBBBB';
  s:= 'A';                        // Its ASCII code is 65
  Caption:= IntToStr(Ord(s[1]));  // 65
  Caption:= IntToStr(Ord(s[2]));  // #0
  Caption:= IntToStr(Ord(s[3]));  // Random data


  { 2. Testing for length counter at the begining of the string }
  s:= 'XYZ';
  p := PByte(s);  // Get the pointer to the string buffer

  // This is the first character ('X')
  Caption := IntToStr(p[0]);

  // Accessing the length counter
  Caption := IntToStr(p[-1]); // 0
  Caption := IntToStr(p[-2]); // 0
  Caption := IntToStr(p[-3]); // 0
  Caption := IntToStr(p[-4]); // 3
  Assert(p[-4] = Length(s));  // It is the same
end;

end.
