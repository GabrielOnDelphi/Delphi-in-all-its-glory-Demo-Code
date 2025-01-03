UNIT TesterForm;

INTERFACE

USES
  WinApi.Windows, Winapi.ShellAPI, WinApi.Messages, System.SysUtils, System.Classes, Vcl.StdCtrls, VCL.Forms, Vcl.Controls, Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.ExtCtrls;

TYPE
 TfrmTester = class(TForm)
    btnSmall: TButton;
    btnMultiple: TButton;
    btnDang: TButton;
    btnBeeper: TButton;
    btnBeepFree: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    btnManualBeep: TButton;
    procedure btnSmallClick(Sender: TObject);
    procedure btnMultipleClick(Sender: TObject);
    procedure btnDangClick(Sender: TObject);
    procedure btnBeeperClick(Sender: TObject);
    procedure btnBeepFreeClick(Sender: TObject);
    procedure btnManualBeepClick(Sender: TObject);
  protected
  private
    function Test: TStringList;
  public
 end;

VAR
   frmTester: TfrmTester;

IMPLEMENTATION  {$R *.dfm}





{--------------------------------------------------------------------------------------------------
   APP START/CLOSE
--------------------------------------------------------------------------------------------------}

function TfrmTester.Test: TStringList;
begin
 Result:= TStringList.Create;
end;


procedure TfrmTester.btnSmallClick(Sender: TObject);
VAR TSL: TStringList;
begin
  TSL:= Test;
  TRY
    TSL.Text:= 'Some text';
  FINALLY
    //FreeAndNil(TSL);
  END;
end;


procedure TfrmTester.btnMultipleClick(Sender: TObject);
VAR TSL: TStringList;
begin
  for VAR i:= 1 to 10 DO
    TSL:= Test;
end;


procedure TfrmTester.btnDangClick(Sender: TObject);
VAR Variable1, Variable2: TObject;
begin
  Variable1:= TObject.Create;

  Variable2:= Variable1;

  FreeAndNil(Variable1);

  Variable2.GetHashCode;
end;









{---------------------------
  Class TBeeper
---------------------------}

TYPE

 TBeeper= class(TObject)
   Timer: TTimer;
   TotalBeeps: Integer;
   ALabel: TLabel;
   constructor Create;
   destructor Destroy; override;
   procedure TimerTimer(Sender: TObject);
   procedure DoBeep;
end;


constructor TBeeper.Create;
begin
  Timer:= TTimer.Create(NIL);
  Timer.OnTimer:= TimerTimer;
end;

destructor TBeeper.Destroy;
begin
  ALabel.Caption:= 'The Beeper was desptroyed';
  inherited;
end;

procedure TBeeper.DoBeep;
begin
  Beep;
  Inc(TotalBeeps);
  //ALabel.Caption:= 'Total beeps: '+ IntToStr(TotalBeeps);
end;

procedure TBeeper.TimerTimer(Sender: TObject);
begin
  DoBeep;
end;



{---------------------------
  Start Beeper
---------------------------}

VAR Beeper: TBeeper;

procedure TfrmTester.btnBeeperClick(Sender: TObject);
begin
  Beeper:= TBeeper.Create;
  Beeper.ALabel:= Label1;
end;


procedure TfrmTester.btnBeepFreeClick(Sender: TObject);
begin
  Beeper.Free; // The computer will beep even after we free the Beeper.
end;


procedure TfrmTester.btnManualBeepClick(Sender: TObject);
begin
 Beeper.DoBeep;
end;


{procedure TfrmTester.FormClick(Sender: TObject);
begin
  VAR p: PIntegerArray;
  p:= Pointer(Integer(Beeper.Timer));
  Caption:= IntToStr(Integer(p));
  for VAR i:= 0 to 100 DO
     p^[i]:= MaxInt;
end;  }


end.
