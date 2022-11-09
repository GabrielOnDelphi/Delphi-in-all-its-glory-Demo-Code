UNIT MainForm;

INTERFACE

USES
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

TYPE
  TMainFrom = class(TForm)
    btnHello: TButton;
    procedure btnHelloClick(Sender: TObject);
  end;

VAR
  MainFrom: TMainFrom;

IMPLEMENTATION {$R *.dfm}



procedure TMainFrom.btnHelloClick(Sender: TObject);
begin
 ShowMessage('Hello world!');
end;

end.
