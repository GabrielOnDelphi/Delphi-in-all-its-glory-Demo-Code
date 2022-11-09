UNIT  Unit1;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

TYPE
  TForm20 = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    btnMemAddress: TButton;
    btnLength: TButton;
    btnSizeOf: TButton;
    Button3: TButton;
    procedure btnSizeOfClick(Sender: TObject);
    procedure btnLengthClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMemAddressClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
  public
  end;

VAR
  Form20: TForm20;

IMPLEMENTATION {$R *.dfm}


VAR
  i: Integer;
  r: Real;
  s: string;
  Rec: packed record
     i: Integer;
     s: string;
     r: Real;
  end;
  Obj: TButton;                   // Object
  Set3: TTextLayout;              // Set
  ArrayDy: array of Byte;         // Dynamic array
  ArraySt: array[1..100] of Byte; // Static array (100 elements)



procedure TForm20.FormCreate(Sender: TObject);
begin
 SetLength(ArrayDy, 100);   // Set this dynamic array to 100 elements
 SetLength(s, 100);         // Make this string 100 chars long
 Obj:= TButton.Create(Self);

 btnSizeOfClick(Sender);
 btnLengthClick(Sender);
 btnMemAddressClick(Sender);
end;


procedure TForm20.FormDestroy(Sender: TObject);
begin
 FreeAndNil(Obj);
end;


procedure TForm20.Button3Click(Sender: TObject);
begin
 Memo.Lines.Clear;
end;






procedure TForm20.btnSizeOfClick(Sender: TObject);
begin
 Memo.Lines.Add('');
 Memo.Lines.Add('SIZEOF');
 Memo.Lines.Add('');
 Memo.Lines.Add('  True values: ');
 Memo.Lines.Add(#9+ 'Integer:  ' +#9+ IntToStr(SizeOf(i))       + ' bytes');
 Memo.Lines.Add(#9+ 'Record:   ' +#9+ IntToStr(SizeOf(rec))     + ' bytes');
 Memo.Lines.Add(#9+ 'Real:     ' +#9+ IntToStr(SizeOf(r))       + ' bytes');
 Memo.Lines.Add(#9+ 'Set:      ' +#9+ IntToStr(SizeOf(Set3))    + ' bytes');
 Memo.Lines.Add(#9+ 'ArraySt:  ' +#9+ IntToStr(SizeOf(ArraySt)) + ' bytes');

 Memo.Lines.Add('');
 Memo.Lines.Add(#9+ 'ArrayDy: ' +#9+ IntToStr(SizeOf(ArrayDy)) + ' bytes (pointer)');
 Memo.Lines.Add(#9+ 'Object:  ' +#9+ IntToStr(SizeOf(Obj))     + ' bytes (pointer)');
 Memo.Lines.Add(#9+ 'String:  ' +#9+ IntToStr(SizeOf(s))       + ' bytes (pointer)');
end;


procedure TForm20.btnLengthClick(Sender: TObject);
begin
 Memo.Lines.Add('');
 Memo.Lines.Add('LENGTH:');
 Memo.Lines.Add(#9+ 'ArraySt: ' +#9+ IntToStr(Length(ArraySt)) + ' bytes');
 Memo.Lines.Add(#9+ 'ArrayDy: ' +#9+ IntToStr(Length(ArrayDy)) + ' bytes');
 Memo.Lines.Add(#9+ 'String:  ' +#9+ IntToStr(Length(s))       + ' bytes');
end;


procedure TForm20.btnMemAddressClick(Sender: TObject);
begin
 Memo.Lines.Add('');
 Memo.Lines.Add('ADDRESS:');
 Memo.Lines.Add(#9+ '@i:      ' +#9+ IntToStr(Integer(@i)));
 Memo.Lines.Add(#9+ '@r:      ' +#9+ IntToStr(Integer(@r)));
 Memo.Lines.Add(#9+ '@String: ' +#9+ IntToStr(Integer(@s)));
 Memo.Lines.Add('');

 Memo.Lines.Add(#9+ '@Record: ' +#9+ IntToStr(Integer(@Rec)));
 Memo.Lines.Add(#9+ ' @Rec.i: ' +#9+ IntToStr(Integer(@Rec.i)));
 Memo.Lines.Add(#9+ ' @Rec.s: ' +#9+ IntToStr(Integer(@Rec.s)));
 Memo.Lines.Add(#9+ ' @Rec.r: ' +#9+ IntToStr(Integer(@Rec.r)));
 Memo.Lines.Add('');

 Memo.Lines.Add(#9+ '@Object:  ' +#9+ IntToStr(Integer(@Obj)));
 Memo.Lines.Add(#9+ '@Set:     ' +#9+#9+ IntToStr(Integer(@Set3)));
 Memo.Lines.Add(#9+ '@ArrayDy: ' +#9+ IntToStr(Integer(@ArrayDy)));
 Memo.Lines.Add('');

 Memo.Lines.Add(#9+ '@ArrayDy[0]: ' +#9+ IntToStr(Integer(@ArrayDy[0])));
 Memo.Lines.Add(#9+ '@String[1]:  ' +#9+ IntToStr(Integer(@s[1])));
end;




end.


