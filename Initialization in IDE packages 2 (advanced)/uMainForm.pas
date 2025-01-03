unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTest2_R;

type
  TfrmMain = class(TForm)
    mmo: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation
{$R *.dfm}
uses uTest1;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //PrintMsg_Pkg2;
  mmo.Lines.Add('Global: '+ IntToStr(Global));
  mmo.Lines.Add('Singleton: '+ IntToStr(TSingleton.Instance.GetInstanceVar));
end;

end.
