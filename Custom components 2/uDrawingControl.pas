unit uDrawingControl;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Graphics, Winapi.Messages, Math, System.Types,
  Winapi.Windows, Vcl.Dialogs;

type
  TShapeType = (stCircle, stRectangle);

  // Enhanced TDrawingControl with mouse interaction for drawing shapes
  TDrawingControl = class(TCustomControl)
  private
    FColor: TColor;
    FShapeType: TShapeType;
    FStartPoint: TPoint;
    FEndPoint: TPoint;
    FMouseDown: Boolean;
    procedure DrawShape;
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // Published properties accessible in the Object Inspector
    property Color: TColor read FColor write FColor default clRed;
    property ShapeType: TShapeType read FShapeType write FShapeType default stCircle;
  end;

procedure Register;

implementation


constructor TDrawingControl.Create(AOwner: TComponent);
begin
  inherited;
  FColor := clRed;
  FShapeType := stCircle;
end;


// This is called when the control has to repaint itself. For example when the form containing the control is resized.
procedure TDrawingControl.Paint;
begin
  inherited;
  DrawShape;
end;


procedure TDrawingControl.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseDown := False;
  DrawShape; // Draw the final shape when mouse button is released
end;


procedure TDrawingControl.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FStartPoint := Point(X, Y);
  FMouseDown  := True;
end;


procedure TDrawingControl.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if FMouseDown then
  begin
    FEndPoint := Point(X, Y);
    Invalidate; // Trigger repaint to show shape preview while dragging. In the end, it calls DrawShape
  end;
end;


procedure TDrawingControl.DrawShape;
var R: TRect;
begin
  Canvas.Pen.Color  := FColor;
  Canvas.Brush.Style:= bsClear;  // Change to bsSolid to fill the shape with color

  // Determine shape based on ShapeType property
  case FShapeType of
    stCircle:
      begin
        R.Left   := Min(FStartPoint.X, FEndPoint.X);
        R.Top    := Min(FStartPoint.Y, FEndPoint.Y);
        R.Right  := Max(FStartPoint.X, FEndPoint.X);
        R.Bottom := Max(FStartPoint.Y, FEndPoint.Y);
        Canvas.Ellipse(R);
      end;
    stRectangle:
      begin
        R := Rect(FStartPoint.X, FStartPoint.Y, FEndPoint.X, FEndPoint.Y);
        Canvas.Rectangle(R);
      end;
  end;
end;


procedure Register;
begin
  RegisterComponents('Glorious Controls', [TDrawingControl]);
end;

end.
