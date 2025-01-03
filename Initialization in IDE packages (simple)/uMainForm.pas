unit uMainForm;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTest2_R;

type
  TfrmMain = class(TForm)
    mmo: TMemo;
    MyPanel1: TMyPanel;
    procedure FormCreate(Sender: TObject);
    procedure MyPanel1Click(Sender: TObject);
  end;

var
  frmMain: TfrmMain;

implementation {$R *.dfm}

uses uTest1;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  mmo.Lines.Add('Global: '+ IntToStr(Global));
end;

procedure TfrmMain.MyPanel1Click(Sender: TObject);
begin
  TMyPanel.Print('App running - OnClick');
end;

end.
