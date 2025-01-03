unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TfrmMain = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    btnNormalFree: TButton;
    btnNormalClose: TButton;
    btnNormalRelease: TButton;
    btnModalRelease: TButton;
    btnModalClose: TButton;
    btnModalFree: TButton;
    Panel2: TPanel;
    tgl: TToggleSwitch;
    procedure btnModalFreeClick(Sender: TObject);
    procedure btnModalCloseClick(Sender: TObject);
    procedure btnModalReleaseClick(Sender: TObject);
    procedure btnNormalFreeClick(Sender: TObject);
    procedure btnNormalCloseClick(Sender: TObject);
    procedure btnNormalReleaseClick(Sender: TObject);
    procedure tglClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation  {$R *.dfm}
uses FormSecond;


procedure TfrmMain.btnModalFreeClick(Sender: TObject);
var
   frmSecond: TfrmSecond;
begin
 frmMain.Memo.Lines.Add('');
 frmMain.Memo.Lines.Add(' ** Modal form ** ');
 frmSecond:= TfrmSecond.Create(Nil);
 frmSecond.ShowModal;
 frmMain.Memo.Lines.Add('.Free');
 frmSecond.Free;
 frmMain.Memo.Lines.Add('.');
end;


procedure TfrmMain.btnModalCloseClick(Sender: TObject);
var
   frmSecond: TfrmSecond;
begin
 frmMain.Memo.Lines.Add('');
 frmMain.Memo.Lines.Add(' ** Modal form ** ');
 frmSecond:= TfrmSecond.Create(Nil);
 frmSecond.ShowModal;
 frmMain.Memo.Lines.Add('.Close');
 frmSecond.Close;
 frmMain.Memo.Lines.Add('.');
end;


procedure TfrmMain.btnModalReleaseClick(Sender: TObject);
var
   frmSecond: TfrmSecond;
begin
 frmMain.Memo.Lines.Add('');
 frmMain.Memo.Lines.Add(' ** Modal form ** ');
 frmSecond:= TfrmSecond.Create(Nil);
 frmSecond.ShowModal;
 frmMain.Memo.Lines.Add('.Release');
 frmSecond.Close;
 frmMain.Memo.Lines.Add('.');
end;










procedure TfrmMain.btnNormalFreeClick(Sender: TObject);
var
   frmSecond: TfrmSecond;
begin
 frmMain.Memo.Lines.Add('');
 frmMain.Memo.Lines.Add(' ** Normal form ** ');
 frmSecond:= TfrmSecond.Create(Nil);
 frmSecond.Show;
 frmMain.Memo.Lines.Add('.Free');
 frmSecond.Free;
 frmMain.Memo.Lines.Add('.');
end;


procedure TfrmMain.btnNormalCloseClick(Sender: TObject);
var
   frmSecond: TfrmSecond;
begin
 frmMain.Memo.Lines.Add('');
 frmMain.Memo.Lines.Add(' ** Normal form ** ');
 frmSecond:= TfrmSecond.Create(Nil);
 frmSecond.Show;
 frmMain.Memo.Lines.Add('.Close');
 frmSecond.Close;
 frmMain.Memo.Lines.Add('.');
end;


procedure TfrmMain.btnNormalReleaseClick(Sender: TObject);
var
   frmSecond: TfrmSecond;
begin
 frmMain.Memo.Lines.Add('');
 frmMain.Memo.Lines.Add(' ** Normal form ** ');
 frmSecond:= TfrmSecond.Create(Nil);
 frmSecond.Show;
 frmMain.Memo.Lines.Add('.Release');
 frmSecond.Release;
 frmMain.Memo.Lines.Add('.');
end;


procedure TfrmMain.tglClick(Sender: TObject);
begin
  if tgl.State = tssOff
  then Caption:= 'caHide'
  else Caption:= 'caFree';
end;

end.
