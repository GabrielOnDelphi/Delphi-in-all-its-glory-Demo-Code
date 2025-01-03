program Project_VirtualKeyb;

uses
  Vcl.Forms,
  FormKeyboard in 'FormKeyboard.pas' {FormKeyb};

{$R *.res}

begin
  Application.Initialize;
  
  { MainFormOnTaskbar
    See: stackoverflow.com/questions/66720721

    If true:
      The taskbar button represents the application's Main Form and displays its caption.

      Bad: All child forms will stay on top of the MainForm!
      But they are not modal! The MainForm can still be clicked!
      If we don't really want this, we should stick with MainFormOnTaskbar = false.
      When we do want a child form to stay on top, then can use fsStayOnTop.

    If False:
      The taskbar button represents the application's (hidden) main window and bears the application's Title.
      Must be True to use Windows (Vista) Aero effects (live taskbar thumbnails, Dynamic Windows, Windows Flip, Windows Flip 3D).

      Bad: All child forms will disapear under the MainForm! }
      
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormKeyb, FormKeyb);
  Application.Run;
end.
