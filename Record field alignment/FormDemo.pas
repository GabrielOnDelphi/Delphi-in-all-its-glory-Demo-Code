unit FormDemo;

{-------------------------------------------------------------------------------------------------------------
   This program demonstrates:
      Record field alignment
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

TYPE
   TDynArray  = array of byte;         // Size at compile time: undeterminate
   TStatArray = array [0..0] of Byte;  // Size: 1 byte

TYPE
  TfrmFieldAlign = class(TForm)
    mmoRec1     : TMemo;
    Panel1      : TPanel;
    btnSizeOf   : TButton;
    procedure FormCreate       (Sender: TObject);
    procedure btnSizeOfClick   (Sender: TObject);
  public
  end;

VAR
  frmFieldAlign: TfrmFieldAlign;

implementation {$R *.dfm}




{-------------------------------------------------------------------------------------------------------------
   Test Record field alignment
-------------------------------------------------------------------------------------------------------------}
procedure TfrmFieldAlign.FormCreate(Sender: TObject);
begin
  btnSizeOfClick(Sender);
end;


procedure TfrmFieldAlign.btnSizeOfClick(Sender: TObject);
TYPE
   // It is recommended to put all your 4-byte fields at the top of the record and the other fields at the bottom.
   TUnpackedRec= record   // 20 bytes
     i: Integer;
     s: string;
     StatArray: TStatArray;
     DynArray: TDynArray;
     B: Boolean;       // The compiler will automatically add three empty bytes to make this boolean 4-byte long (alignment to 32 bit boundary).
   end;

   // Different data layout will result in different boundry alignment
   TRevertedRec= record   // 16 bytes
     i: Integer;
     s: string;
     DynArray: TDynArray;
     StatArray: TStatArray;
     B: Boolean;
   end;

   // This will reflect the real size. Always use packed when saving records to disk or sharing data between applications.
   TPackedRec= packed record //14 bytes
     i: Integer;              // 4 bytes  (real size)
     s: string;               // 4 bytes  (real size)
     StatArray: TStatArray;   // 1 bytes  (real size)
     DynArray: TDynArray;     // 4 bytes  (real size)
     B: Boolean;              // 1 byte   (real size)
   end;

VAR
   UnpRec: TUnpackedRec;
   RevRec: TRevertedRec;
   PckRec: TPackedRec;
begin
 mmoRec1.Lines.Add('');
 mmoRec1.Lines.Add('Size of UnpRec is: '+ IntToStr(SizeOf(UnpRec)));
 mmoRec1.Lines.Add('Size of RevRec is: '+ IntToStr(SizeOf(RevRec)));
 mmoRec1.Lines.Add('Size of PckRec is: '+ IntToStr(SizeOf(PckRec)));
end;


end.

