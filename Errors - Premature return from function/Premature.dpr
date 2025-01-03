program Premature;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  Forms,
  TesterForm in 'TesterForm.pas' {frmTester};

{$R *.res}

begin
  Application.Initialize;
  
  { If true, a taskbar button represents the application's main form and displays its caption. 
    All child forms will stay on top of the MainForm (bad)!
    Since I don't really want "modal" forms all over in my app,
    I should stick with MainFormOnTaskbar = false. 
    When I do want a child form to stay on top, then I make it modal or use fsStayOnTop.
    
    If False, a taskbar button  represents the application's (hidden) main window and 
    bears the application's Title. 
    Must be True to use Windows (Vista) Aero effects (ive taskbar thumbnails, 
    Dynamic Windows, Windows Flip, Windows Flip 3D). stackoverflow.com/questions/66720721    }
  Application.MainFormOnTaskbar := True;      
  Application.Title := 'CubicTester'; // Set by AppData
  Application.CreateForm(TfrmTester, frmTester);
  frmTester.Show;
  Application.Run;
end.
