unit Unit1;

interface
uses Vcl.Forms;

implementation

procedure MyProcedure();
begin
 var Form:= TForm.Create(nil);
 Form.Free;
end;

end.
