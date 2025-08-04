UNIT MainForm;

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

TYPE
  TFormMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
    procedure FormAlignPosition(Sender: TWinControl; Control: TControl; var NewLeft, NewTop, NewWidth,
      NewHeight: Integer; var AlignRect: TRect; AlignInfo: TAlignInfo);
    procedure FormBeforeMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    procedure EmptyDummy;
  public
  end;

var
  FormMain: TFormMain;

IMPLEMENTATION
{$R *.dfm}




// This program shows in which order are the methods called during application startup/shutdown
// Put breakpoints on every single "EmptyDummy" line, then run the program.



procedure TFormMain.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer); // Introduced in Delphi 12
begin
  EmptyDummy;   // 1, 7(on form move)
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  EmptyDummy; // 2
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  EmptyDummy; // 3
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  EmptyDummy; // 4
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  EmptyDummy; // 5, also on form minimize/restore
end;

procedure TFormMain.FormPaint(Sender: TObject);
begin
  EmptyDummy; // 6, also on form minimize/restore
end;

procedure TFormMain.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  EmptyDummy; // 7 (on form move)
end;





procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  EmptyDummy;  // 9
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EmptyDummy; // 10
end;

procedure TFormMain.FormHide(Sender: TObject);
begin
  EmptyDummy;  // 11
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  EmptyDummy; // 12
end;





procedure TFormMain.FormDeactivate(Sender: TObject);
begin
  EmptyDummy;
end;

procedure TFormMain.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
begin
  EmptyDummy;
end;

procedure TFormMain.FormAlignPosition(Sender: TWinControl; Control: TControl; var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect; AlignInfo: TAlignInfo);
begin
  EmptyDummy;
end;

procedure TFormMain.FormBeforeMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
begin
  EmptyDummy;
end;






procedure TFormMain.EmptyDummy;
begin
  Caption:= ''; // does nothing
end;

end.
