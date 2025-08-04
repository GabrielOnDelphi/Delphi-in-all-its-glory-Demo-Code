unit formSecond;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TfrmSecond = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
  public
  end;

var
  frmSecond: TfrmSecond;

implementation {$R *.dfm}

uses MainForm;


procedure TfrmSecond.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmMain.tgl.State = tssOff
  then Action:= caHide
  else Action:= caFree;

  if Action = caFree
  then frmMain.Memo.Lines.Add('FormClose (caFree)')
  else frmMain.Memo.Lines.Add('FormClose (caHide)');
end;

procedure TfrmSecond.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frmMain.Memo.Lines.Add('FormCloseQuery');
end;

procedure TfrmSecond.FormDestroy(Sender: TObject);
begin
  frmMain.Memo.Lines.Add('FormDestroy');
end;

end.
