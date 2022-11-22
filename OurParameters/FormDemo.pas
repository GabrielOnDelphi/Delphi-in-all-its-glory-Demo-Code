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
    btnTest: TButton;
    procedure btnTestClick  (Sender: TObject);
  private
  public
  end;

VAR
  frmTest: TfrmTest;

implementation {$R *.dfm}



{-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------}


Procedure TestInteger(OUT i: Integer);
Begin
 if i = 7
 then i:= 14;
End;


TYPE TMyRec = record
  i: Integer;
end;


Procedure TestRec(OUT R: TMyRec);
Begin

End;


procedure TfrmTest.btnTestClick(Sender: TObject);
begin
  VAR i: Integer:= 7;
  TestInteger(i);

  VAR MyRecord: TMyRec;
  MyRecord.i:= 7;
  TestRec(MyRecord);
  Caption:= IntToStr(MyRecord.i);
end;



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

end.

