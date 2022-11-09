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
   TDynArray  = array of byte;         // Size at compile time: undeterminate
   TStatArray = array [0..0] of Byte;  // Size: 1 byte

   TMyRec= record
     i         : Integer;     // On copy, this filed will be: Unique
     s         : string;      // On copy, this filed will be: Unique
     StatArray : TStatArray;  // On copy, this filed will be: Unique
     DynArray  : TDynArray;   // On copy, this filed will be: Not unique (will point to the same dynamic array)
     MyObject  : TObject;     // On copy, this filed will be: Not unique (will point to the same object)
   end;

TYPE
  TfrmCopyRecords = class(TForm)
    mmoRec1     : TMemo;
    mmoRec2     : TMemo;
    Panel1      : TPanel;
    btnChange   : TButton;
    btnCopy     : TButton;
    chkDeepCopy : TCheckBox;
    Label1      : TLabel;
    btnInitR1: TButton;
    btnPointers: TButton;
    procedure FormCreate       (Sender: TObject);
    procedure chkDeepCopyClick (Sender: TObject);
    procedure btnChangeClick   (Sender: TObject);
    procedure btnCopyClick     (Sender: TObject);
    procedure btnInitR1Click  (Sender: TObject);
    procedure btnPointersClick(Sender: TObject);
  private
    procedure ShowRecord(MyRec: TMyRec; Memo: TMemo);
    procedure InitRec1;
  public
  end;

VAR
  frmCopyRecords: TfrmCopyRecords;

implementation {$R *.dfm}

VAR
  r1, r2: TMyRec;



{-------------------------------------------------------------------------------------------------------------
   Deep copy a records
-------------------------------------------------------------------------------------------------------------}

{ Initialization }
procedure TfrmCopyRecords.FormCreate(Sender: TObject);
begin
  InitRec1;
  ShowRecord(r1, mmoRec1);
end;


procedure TfrmCopyRecords.btnInitR1Click(Sender: TObject);
begin
  InitRec1;
  ShowRecord(r1, mmoRec1);
  mmoRec2.Clear;
end;


procedure TfrmCopyRecords.InitRec1;
begin
  // We fill rec1 with data (small numbers)
  Setlength(r1.DynArray, 1);
  r1.i:= 0;
  r1.s:= 'R1';
  r1.StatArray[0]:= 2;
  r1.DynArray[0]:= 1;

  Caption:= '';
end;


procedure TfrmCopyRecords.chkDeepCopyClick(Sender: TObject);
begin
  InitRec1;
  ShowRecord(r1, mmoRec1);
end;


procedure TfrmCopyRecords.btnCopyClick(Sender: TObject);
begin
  InitRec1;

  // We copy data from one record to the other
  r2:= r1;

  ShowRecord(r1, mmoRec1);
  ShowRecord(r2, mmoRec2);

  chkDeepCopy.Enabled:= True;
  btnChange.Enabled:= True;

  Caption:= 'R2 has exactly the same content as R1 but R2.DynArray field is not unique!'
end;



procedure TfrmCopyRecords.btnChangeClick(Sender: TObject);
begin
  // This will make the the dynamic array in the second record unique!
  if chkDeepCopy.Checked
  then Setlength(r2.DynArray, 1);

  // We fill rec2 with different data (big numbers this time so we can easily see the difference)
  r2.i:= 99;
  r2.s:= 'R2';
  r2.DynArray[0] := 199;
  r2.StatArray[0]:= 200;

  ShowRecord(r1, mmoRec1);
  ShowRecord(r2, mmoRec2);

  if chkDeepCopy.Checked
  then Caption:= 'All fields in Rec2 are unique. Changing Rec2 will not affect Rec1'
  else Caption:= 'Changing Rec2.DynArray also affected R1.DynArray!'
end;


procedure TfrmCopyRecords.ShowRecord(MyRec: TMyRec; Memo: TMemo);
begin
  Memo.Clear;
  Memo.Lines.Add('"'+MyRec.s+'"');
  Memo.Lines.Add('Simple int: '+IntToStr(MyRec.i));
  Memo.Lines.Add('StatArray: '+ IntToStr(MyRec.StatArray[0]));

 // if Length(MyRec.DynArray) > 0 then
  Memo.Lines.Add('DynArray: '+ IntToStr(MyRec.DynArray[0]));
end;







TYPE
  PMyRec = ^TMyRec;  // We declare a pointer to a TMyRec

procedure TfrmCopyRecords.btnPointersClick(Sender: TObject);
VAR
  PRec1, PRec2: PMyRec;
begin
  New(PRec1);  { In Delphi code, the New procedure creates a new dynamic variable and sets a pointer variable to point to it. P is a variable of any pointer type. The size of the allocated memory block corresponds to the size of the type that P points to. The newly created variable can be referenced as P^. If there is not enough memory available to allocate the dynamic variable, an EOutOfMemory exception is raised. When an application is finished using a dynamic variable created with New, it should dispose of the memory allocated for the variable using the Dispose standard procedure. }
  TRY
    PRec1.s:= 'Pointer 1 to TMyRec';
    PRec1.i:= 3;
    PRec1.StatArray[0]:= 4;
    SetLength(PRec1.DynArray, 3);
    PRec1.DynArray[0]:= 5;
    ShowRecord(PRec1^, mmoRec1);

    PRec2:= PRec1;  // ALL the changes done to PRec2 will now affect also PRec1
    PRec2.s:= 'Pointer 2 to TMyRec';
    PRec2.i:= 253;
    PRec2.StatArray[0]:= 254;
    PRec2.DynArray[0]:= 255;
    ShowRecord(PRec1^, mmoRec1);
    ShowRecord(PRec2^, mmoRec2);
  FINALLY
    Dispose(PRec1);
  END;
end;


end.

