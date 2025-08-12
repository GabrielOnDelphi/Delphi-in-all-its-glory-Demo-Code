unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  //Inroduced in Delphi 12.0. So it won't work on older Delphis
  Caption:= 'Delphi v'+ IntToStr(Hi(System.GetCompilerVersion))+'.'+IntToStr(Lo(System.GetCompilerVersion));
end;

end.
