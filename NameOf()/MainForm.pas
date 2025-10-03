unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
  public
  end;

var
  Form2: TForm2;

implementation
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var i: integer;
begin
  i:= 42;
  ShowMessage('Current unit = ' + NameOf(MainForm));      // Won't compile
  ShowMessage('Error in ' + NameOf(Form2.Button1));       // Won't compile
  ShowMessage('Variable ' + NameOf(i) + ' = '+ IntToStr(i));
  ShowMessage('Error in: ' + UnitName + '. Scope: ' + UnitScope);
  ShowMessage('TButton lives in: ' + TButton.UnitName);
end;

end.
