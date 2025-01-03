UNIT TesterForm;

INTERFACE

USES
  WinApi.Windows, Winapi.ShellAPI, WinApi.Messages, System.SysUtils, System.Classes, Vcl.StdCtrls, VCL.Forms, Vcl.Controls, Vcl.Samples.Spin,
  cvRichEdit, Vcl.ComCtrls, ccCore, csSystem, cbDialogs, ccINIFile, FormLog, cvPathEdit, Vcl.ExtCtrls, llRichLog;

TYPE
 TfrmTester = class(TForm)
    pnlRight: TPanel;
    btnForLoop: TButton;
    mmo: TMemo;
    bntMemAlloc: TButton;
    btnFillString: TButton;
    btnFindShortStr: TButton;
    btnFillMem: TButton;
    procedure btnForLoopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bntMemAllocClick(Sender: TObject);
    procedure btnFillStringClick(Sender: TObject);
    procedure btnFindShortStrClick(Sender: TObject);
    procedure btnFillMemClick(Sender: TObject);
  protected
  private
    procedure LateInitialize(VAR Msg: TMessage); message MSG_LateFormInit; // Called after the main form was fully created
  public
 end;

VAR
   frmTester: TfrmTester;

IMPLEMENTATION  {$R *.dfm}

USES chHardID, cbAppData, cbINIFile, cbWinVersion, cvIniFile, ccIO, cmIO, cmIO.Win, cmDebugger;




{--------------------------------------------------------------------------------------------------
   APP START/CLOSE
--------------------------------------------------------------------------------------------------}


procedure TfrmTester.FormCreate(Sender: TObject);
begin
 PostMessage(Self.Handle, MSG_LateAppInit_, 0, 0); Not needed anymore. Moved to cbAppData                       { This will call LateInitialize }
end;


//ToDo: switch to Release mode
//ToDo: switch to Realtime mode
//ToDo: switch off FastMM
//ToDo: use same computer
//ToDo: test outside debugger

procedure TfrmTester.LateInitialize;
begin
  Winapi.ShellAPI.DragAcceptFiles(Self.Handle, True);                                             { Accept the dropped files from Windows Explorer }

  LoadForm(Self);
  Randomize;

  if cbWinVersion.IsWindows8Up
  then SnapBuffer:= 4 moved to cbAppData
  else SnapBuffer:= 10;

  AppData.Initializing:= FALSE; moved to cbAppData
  AppData.SetMaxPriority;

  HDIDValid:= TRUE;
  if IsRunningUnderDelphiDebugger then mmo.Lines.Add('Warning: running under debugger!');
  if NOT CompilerOptimization     then mmo.Lines.Add('Warning: Compiler Optimization is off!');
  mmo.Lines.Add('CPU family: '                   + Tab + CPUFamily);                               { Get cpu identifier from the windows registry }
  mmo.Lines.Add('CPU speed: '                    + Tab + IntToStr(round(GetCPUSpeed)));
  mmo.Lines.Add('CPU theoretic speed: '          + IntToStr(GetCpuTheoreticSpeed));                { Get cpu speed (in MHz) }
  mmo.Lines.Add('No of logical cores: '          + Tab + IntToStr(GetCPUCount));                   { The number of LOGICAL processors in the current group }
  if IsIntel64BitCPU
  then mmo.Lines.Add('Intel 64 bit mode: '       + Tab+ BoolToStr(IsIntel64BitCPU, TRUE));         { Detects IA64 processors }
  if IsCPUIDAvailable
  then mmo.Lines.Add('CPU ID: '                  + GetCpuIdNow);
  mmo.Lines.Add('');
end;


procedure TfrmTester.FormDestroy(Sender: TObject);
begin
 SaveForm(Self);
 FreeAndNil(AppData-);  // This is the last object ot be freed. It will also free the Log
end;












procedure TfrmTester.btnForLoopClick(Sender: TObject);
VAR
   i, Total, Big, Small: Integer;
   s: string;
begin
  mmo.Lines.Add('------------------------');
  mmo.Lines.Add('');
  mmo.Lines.Add('');

  TimerStart;

   Total:= 0;
   Big  := 0;
   Small:= 0;
   for i:= 1 to 2000000000 DO    //2 billion
    begin
      Total:= Total+1;
      if Total > 500000
      then Big:= Big+1
      else Small:= Small+1;
    end;

 s:= TimerElapsedS;
 mmo.Lines.Add('2 billion for loop: '+ TimerElapsedS);
 mmo.Lines.Add(' Big: '          + IntToStr(Big));
 mmo.Lines.Add(' Small: '        + IntToStr(Small));
 mmo.Lines.Add(' Current RAM: '  + ProcessCurrentMemS);
end;



procedure TfrmTester.bntMemAllocClick(Sender: TObject);
TYPE
    TBigArray= Array of Integer;

VAR i: Integer;
    ArrayList: Array of TBigArray;
begin
  mmo.Lines.Add('------------------------');
  mmo.Lines.Add('');
  mmo.Lines.Add('');

  TimerStart;

   SetLength(ArrayList, 10000); //10k
   for i:= 0 to 10000-1 DO
    begin
      SetLength(ArrayList[i], 10000);
    end;

 VAR sTime:= TimerElapsedS;
 mmo.Lines.Add('10000 allocations: '+ sTime);
 mmo.Lines.Add('');
 mmo.Lines.Add(' Expected size: 400MB');
 mmo.Lines.Add(' Current RAM: '   + ProcessCurrentMemS);
end;



procedure TfrmTester.btnFillStringClick(Sender: TObject);
VAR
   i: Integer;
   s: string;
begin
  mmo.Lines.Add('------------------------');
  mmo.Lines.Add('');
  mmo.Lines.Add('');

  TimerStart;

   SetLength(s, 100000000); // 100 mil
   for i:= 1 to Length(s) DO
    begin
      s[i]:= 'A';
    end;

 VAR sTime:= TimerElapsedS;
 mmo.Lines.Add('Fill string 100 million chars with "A": '+ sTime);
 mmo.Lines.Add('');
 mmo.Lines.Add(' Expected size: '+ FormatBytes(Length(s)* SizeOf(Char), 2));
 mmo.Lines.Add(' Current RAM: '   + ProcessCurrentMemS);
end;


procedure TfrmTester.btnFillMemClick(Sender: TObject);
VAR
   s: string;
begin
  mmo.Lines.Add('------------------------');
  mmo.Lines.Add('');
  mmo.Lines.Add('');

  TimerStart;

   SetLength(s, 100000000); // 100 mil
   FillChar(s[1], 100000000, Ord('A'));

 VAR sTime:= TimerElapsedS;
 mmo.Lines.Add('FillChar 100 million chars with "A": '+ sTime);
 mmo.Lines.Add('');
 mmo.Lines.Add(' Expected size: '+ FormatBytes(Length(s)* SizeOf(Char), 2));
 mmo.Lines.Add(' Current RAM: '   + ProcessCurrentMemS);
end;


procedure TfrmTester.btnFindShortStrClick(Sender: TObject);
VAR Len, j, i, Smallest, Biggest: Integer;
    StrList: Array of string;
begin
  mmo.Lines.Add('------------------------');
  mmo.Lines.Add('');
  mmo.Lines.Add('');

  SetLength(StrList, 1000000);  // 1 mil
   for i:= 0 to High(StrList) DO
    begin
      SetLength(StrList[i], Random(500)+1);
    end;

  TimerStart;

   Biggest := 0;
   Smallest:= MaxInt;
   for j:= 0 to High(StrList) DO    //10k
    begin
      { 19ms }
      {
      if Length(StrList[j]) < Smallest
      then Smallest:= Length(StrList[j])
      else
        if Length(StrList[j]) > Biggest
        then Biggest:= Length(StrList[j]); }

      { 14ms }
      Len:= Length(StrList[j]);
      if Len < Smallest
      then Smallest:= Len
      else
        if Len > Biggest
        then Biggest:= Len;
    end;

 VAR sTime:= TimerElapsedS;
 mmo.Lines.Add('Search smallest string in 1 Million strings: '+ sTime);
 mmo.Lines.Add('Smallest'+ IntToStr(Smallest));
 mmo.Lines.Add('Biggest' + IntToStr(Biggest));
 mmo.Lines.Add('');
 mmo.Lines.Add(' Expected size: '+ FormatBytes(1000000*sizeof(Char)*(500 DIV 2), 2));
 mmo.Lines.Add(' Current RAM: '   + ProcessCurrentMemS);
end;


end.
