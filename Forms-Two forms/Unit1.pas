UNIT Unit1;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

TYPE
  TForm1 = class(TForm)
    Button1: TButton;
    btnCreateNoVar: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnCreateNoVarClick(Sender: TObject);
  private
  protected
  end;

VAR
  Form1: TForm1;  // Global variable. Not good!

IMPLEMENTATION {$R *.dfm}

USES Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Form2:= TForm2.Create(Self);
 Form2.Show;
 //Form2.WindowState:= wsMaximized;  //Try me
end;



procedure TForm1.btnCreateNoVarClick(Sender: TObject);
begin
 VAR LocalForm:= TForm2.Create(Self);
 LocalForm.ShowModal;
 LocalForm.Close;
end;


end.
