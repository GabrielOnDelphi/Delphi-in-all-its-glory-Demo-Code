unit FormRounding;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls;

type
  TfrmMine2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
  public
  end;

var
  frmMine2: TfrmMine2;

implementation  {$R *.dfm}






procedure TfrmMine2.Button1Click(Sender: TObject);
var
   S, T: string;
begin
   Str(1.4:2:1, T);
   S := T + ' rounds to ' + IntToStr(Round(1.4)) + #13#10;
   Str(1.5:2:1, T);
   S := S + T + ' rounds to ' + IntToStr(Round(1.5)) + #13#10;
   Str(-1.4:2:1, T);
   S := S + #13#10;

   S := S + T + ' rounds to ' + IntToStr(Round(-1.4)) + #13#10;
   Str(-1.5:2:1, T);
   S := S + T + ' rounds to ' + IntToStr(Round(-1.5))+ #13#10;

   S := S + #13#10;

   Str(2.5:2:1, T);
   S := S + T + ' rounds to ' + IntToStr(Round(2.5)) + #13#10;

   Str(3.5:2:1, T);
   S := S + T + ' rounds to ' + IntToStr(Round(3.5)) + #13#10;

   MessageDlg(S, mtInformation, [mbOk], 0, mbOk);
end;


end.













