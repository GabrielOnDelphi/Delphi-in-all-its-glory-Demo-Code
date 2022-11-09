UNIT Unit1;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

CONST
      MSG_LateInitialize= WM_APP + 4711;

TYPE
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure LateInitialize(var Message: TMessage); message MSG_LateInitialize;
  end;

var
  Form1: TForm1;

IMPLEMENTATION {$R *.dfm}

USES Unit2;




procedure TForm1.FormCreate (Sender: TObject);
begin
  PostMessage(Self.Handle, MSG_LateInitialize, 0, 0);
  Show;
  Sleep(1000);  // Form 1 is very bussy here.
end;


procedure TForm1.LateInitialize;
begin
   //Move as much as possible of your initialization code from FromCreate, here
   Button1Click(Self);  // The second form will only be created AFTER the first form was fully created
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
 Form2:= TForm2.Create(Self);
 Form2.Show;
 //Form2.WindowState:= wsMaximized;  //Try me
end;

end.
