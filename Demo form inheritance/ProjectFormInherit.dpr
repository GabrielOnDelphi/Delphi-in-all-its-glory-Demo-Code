program ProjectFormInherit;

uses
  Vcl.Forms,
  {$IFDEF AUTOPILOT}Autopilot.Bridge.Vcl in 'c:\Projects\Projects AI\Autopilot for Delphi\Source\Bridge\Autopilot.Bridge.Vcl.pas',{$ENDIF}{Optional}
  Unit1 in 'Unit1.pas' {Form3},
  Unit2 in 'Unit2.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);

  { Optional: Via Autopilot, Claude can run/debug/test this program for you.
    For example, read Label1 in Form3 & in Form4 (Form4 inherits it from Form3).
    Don't have AUTOPILOT? Undefine $AUTOPILOT or get it from www.GabrielMoraru.com }
  {$IFDEF AUTOPILOT}
   Autopilot.Bridge.Vcl.StartBridge;
  {$ENDIF}
  Application.Run;
end.
