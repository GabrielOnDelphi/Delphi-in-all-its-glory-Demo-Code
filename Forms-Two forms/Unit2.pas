UNIT Unit2;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

TYPE
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

VAR
  Form2: TForm2;   // Global variable. Not good!

IMPLEMENTATION {$R *.dfm}

uses Unit1;




procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:= caFree;
end;


procedure TForm2.Button1Click(Sender: TObject);
begin
 Form1.Caption:= 'Here I am!';
 Form1.Show;
end;


procedure TForm2.Button2Click(Sender: TObject);
begin
 Application.MainForm.Caption:= 'Here I am!!';
 Application.MainForm.Show;
end;


end.
