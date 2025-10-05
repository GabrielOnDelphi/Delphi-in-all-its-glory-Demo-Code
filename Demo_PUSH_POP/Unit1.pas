unit Unit1;

(*------------------------------------------------------------------------------------------------------------
  The {$PUSHOPT} and {$POPOPT} directives introduced in Delphi 13 are used to save and restore the current set
  of compiler options and warning configurations.
  Useful when we want to include .inc files or code sections that might alter compiler settings,
  and we want to ensure that these changes do not affect the rest of your code.
------------------------------------------------------------------------------------------------------------*)

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

VAR
  Form1: TForm1;

implementation {$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
begin
  {$R+}          // Initial state: range checking on

  {$IFOPT R+}
  Memo1.Lines.Add('RangeChecking on');
  {$ELSE}
  Memo1.Lines.Add('RangeChecking off');
  {$ENDIF}


  {$PUSHOPT}     // Save the current state of compiler options
      {$R-}      // Change the range checking option

      {$IFOPT R+}
      Memo1.Lines.Add('RangeChecking on');
      {$ELSE}
      Memo1.Lines.Add('RangeChecking off');
      {$ENDIF}

  {$POPOPT}      // Restore the previous state of compiler options


  // Check to see if the state was restored correctly
  {$IFOPT R+}
  Memo1.Lines.Add('RangeChecking on');
  {$ELSE}
  Memo1.Lines.Add('RangeChecking off');
  {$ENDIF}
end;


end.
