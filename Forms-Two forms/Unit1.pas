UNIT Unit1;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

TYPE
  TForm1 = class(TForm)
    Button1: TButton;
    btnCreateNoVar: TButton;
    chkShowModal: TCheckBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnCreateNoVarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
  protected
  end;

VAR
  Form1: TForm1;  // Global variable. Not good!

IMPLEMENTATION {$R *.dfm}

USES Unit2;



{ Note: Open the DPR file (main menu, Project -> View Source) and play with Application.MainFormOnTaskbar }


procedure TForm1.Button1Click(Sender: TObject);
begin
 Form2:= TForm2.Create(Self);

 if chkShowModal.Checked
 then
  begin
    Form2.ShowModal;
    Form2.Close;
  end
 else
   Form2.Show;

 //Form2.WindowState:= wsMaximized;  //Try me
end;


procedure TForm1.btnCreateNoVarClick(Sender: TObject);
begin
 VAR LocalForm:= TForm2.Create(Self);
 if chkShowModal.Checked
 then
  begin
    LocalForm.ShowModal;
    LocalForm.Close;
  end
 else
   LocalForm.Show;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
 VAR LocalForm:= TForm2.Create(Self);
 LocalForm.FormStyle:= fsStayOnTop;

 if chkShowModal.Checked
 then
  begin
    LocalForm.ShowModal;
    LocalForm.Close;
  end
 else
   LocalForm.Show;
end;


end.
