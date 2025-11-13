unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormClick(Sender: TObject);
var i, Counter: Integer;
begin
  Counter:= 0;
  Memo1.Lines.BeginUpdate; //  be a good citizen and do use try/finally here!
  try
    for i := 0 to 15000 do
    begin
     Memo1.Lines.Add(IntToStr(i));

     { Prevent freeze }
     inc(Counter);
     if counter > 10000 then // A smaller number will make the app more responsive but will waste more CPU.
      begin
        Counter:= 0;
        Application.ProcessMessages;          // Necessary to process the messages
        if Application.Terminated then Exit;  // Necessary if you want to "quit early"
       end;
    end;
  finally
    Memo1.Lines.EndUpdate;
  end;
end;

end.
