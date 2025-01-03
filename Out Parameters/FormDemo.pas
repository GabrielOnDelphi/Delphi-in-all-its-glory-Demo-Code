unit FormDemo;

{-------------------------------------------------------------------------------------------------------------
   This program demonstrates:
      How to deep copy a record that has managed fields (for example dynamic arrays)
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

TYPE
  TfrmTest = class(TForm)
    Panel1: TPanel;
    btnTestRec: TButton;
    btnTestStr: TButton;
    btnTestInt: TButton;
    Memo: TMemo;
    procedure btnTestRecClick  (Sender: TObject);
    procedure btnTestStrClick(Sender: TObject);
    procedure btnTestIntClick(Sender: TObject);
  private
  public
  end;

VAR
  frmTest: TfrmTest;

implementation {$R *.dfm}



{-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------}


TYPE TMyRec = record
  i: Integer;
end;


Procedure TestInteger(OUT i: Integer);
Begin
End;


Procedure TestRec(OUT R: TMyRec);
Begin
End;


Procedure TestStr(OUT S: string);
Begin
End;



procedure TfrmTest.btnTestRecClick(Sender: TObject);
begin
  VAR MyRecord: TMyRec;
  MyRecord.i:= 7;
  TestRec(MyRecord);
  Memo.Lines.Add('Test rec: '+ IntToStr(MyRecord.i));
end;


procedure TfrmTest.btnTestStrClick(Sender: TObject);
begin
  VAR s: string:= 'x';
  TestStr(s);
  Memo.Lines.Add('Test str: '+ s);
end;


procedure TfrmTest.btnTestIntClick(Sender: TObject);
begin
  VAR i: Integer:= 7;
  TestInteger(i);
  Memo.Lines.Add('Test int: '+ IntToStr(i));
end;


end.


{
Procedure TestList(OUT tsl: TStringList);
Begin
 tsl.Add('x');
End;


procedure TfrmTest.btnTestClick(Sender: TObject);
begin
  VAR tsl:= TStringList.Create;
  TestList(tsl);
  Caption:= tsl.Text;

  VAR i: Integer;
  TestInteger(i);
end;
}


