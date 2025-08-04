UNIT FormMain;

// This program shows in which order are the methods called during application startup/shutdown
// Put breakpoints on every single "EmptyDummy" line, then run the program.

INTERFACE

USES
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

TYPE
  TForm1 = class(TForm)
    procedure FormActivate          (Sender: TObject);
    procedure FormClose             (Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery        (Sender: TObject; var CanClose: Boolean);
    procedure FormConstrainedResize (Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Single);
    procedure FormCreate            (Sender: TObject);
    procedure FormDeactivate        (Sender: TObject);
    procedure FormDestroy           (Sender: TObject);
    procedure FormFocusChanged      (Sender: TObject);
    procedure FormHide              (Sender: TObject);
    procedure FormPaint             (Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure FormResize            (Sender: TObject);
    procedure FormSaveState         (Sender: TObject);
    procedure FormShow              (Sender: TObject);
    procedure FormTap               (Sender: TObject; const Point: TPointF);
  private
    procedure EmptyDummy;
  public
  end;

VAR
  Form1: TForm1;

IMPLEMENTATION
{$R *.fmx}


procedure TForm1.FormCreate(Sender: TObject);
begin
  EmptyDummy;  // 1
end;


procedure TForm1.FormResize(Sender: TObject);
begin
  EmptyDummy; // 2, 4
end;


procedure TForm1.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Single);
begin
  EmptyDummy; // 3  (when resizing OR moving the form)
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  EmptyDummy; // 5
end;


procedure TForm1.FormActivate(Sender: TObject);
begin
  EmptyDummy;  //6 (11 when focusing back to this form)
end;


procedure TForm1.FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  EmptyDummy; // 7, 8
end;


procedure TForm1.FormDeactivate(Sender: TObject);
begin
  EmptyDummy;  // 9 when switching away to another form. 13b
end;


procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  EmptyDummy; // 12
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EmptyDummy;  // 13 (then it jumps to FormDeactivate)
end;


procedure TForm1.FormSaveState(Sender: TObject);
begin
  EmptyDummy; // 14
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  EmptyDummy;  // 15
end;





procedure TForm1.FormFocusChanged(Sender: TObject);
begin
  EmptyDummy;  // Never called in this simple application
end;

procedure TForm1.FormHide(Sender: TObject);
begin
  EmptyDummy;  // Never called in this simple application
end;

procedure TForm1.FormTap(Sender: TObject; const Point: TPointF);
begin
  EmptyDummy;  // Never called in this simple application
end;





procedure TForm1.EmptyDummy;
begin
  Caption:= ''; // does nothing
end;

end.
