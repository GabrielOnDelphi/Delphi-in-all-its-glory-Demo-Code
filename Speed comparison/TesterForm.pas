UNIT TesterForm;

{=============================================================================================================
   2026.09.29
   www.GabrielMoraru.com
--------------------------------------------------------------------------------------------------------------
   The speed test shown in Book 2, "Reaching for the gods", chapter "Speed up your program".
   Ported to the current LightSaber (LightCore.* / LightVcl.*) on 2026.09.29.

   For valid numbers:
     - Build in Release (Optimization on)
     - Run outside the debugger
     - Use the same computer for all tests
=============================================================================================================}

INTERFACE

USES
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.StdCtrls, Vcl.Forms, Vcl.Controls, Vcl.ExtCtrls,
  LightVcl.Visual.AppDataForm;

TYPE
 TfrmTester = class(TLightForm)
    pnlRight: TPanel;
    btnForLoop: TButton;
    mmo: TMemo;
    bntMemAlloc: TButton;
    btnFillString: TButton;
    btnFindShortStr: TButton;
    btnFillMem: TButton;
    procedure btnForLoopClick(Sender: TObject);
    procedure bntMemAllocClick(Sender: TObject);
    procedure btnFillStringClick(Sender: TObject);
    procedure btnFindShortStrClick(Sender: TObject);
    procedure btnFillMemClick(Sender: TObject);
  public
    procedure FormPostInitialize; override; // Called after the main form was fully created
 end;


IMPLEMENTATION  {$R *.dfm}

USES
   Winapi.PsAPI, System.Win.Registry,
   LightCore, LightCore.Debugger, LightVcl.Visual.AppData;



{--------------------------------------------------------------------------------------------------
   UTILS
--------------------------------------------------------------------------------------------------}

{ RAM used by this process right now (the working set) }
function ProcessCurrentMemS: string;
VAR Counters: TProcessMemoryCounters;
begin
  Counters.cb:= SizeOf(Counters);
  if NOT GetProcessMemoryInfo(GetCurrentProcess, @Counters, SizeOf(Counters))
  then RaiseLastOSError;
  Result:= FormatBytes(Counters.WorkingSetSize, 2);
end;


{ The CPU name, as Windows shows it }
function CpuName: string;
VAR Reg: TRegistry;
begin
  Result:= '';
  Reg:= TRegistry.Create(KEY_READ);
  TRY
    Reg.RootKey:= HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('HARDWARE\DESCRIPTION\System\CentralProcessor\0')
    then Result:= Trim(Reg.ReadString('ProcessorNameString'));
  FINALLY
    FreeAndNil(Reg);
  END;
end;



{--------------------------------------------------------------------------------------------------
   APP START
--------------------------------------------------------------------------------------------------}
procedure TfrmTester.FormPostInitialize;
begin
  inherited FormPostInitialize;

  AppData.SetMaxPriority;

  if IsRunningUnderDelphiDebugger then mmo.Lines.Add('Warning: running under debugger!');

  { Checked here, in this unit, because $O is a per-unit setting: LightCore.Debugger.CompilerOptimization reports the state of ITS unit, not of the benchmark. }
  {$IFOPT O+}
  mmo.Lines.Add('Compiler optimization: ON');
  {$ELSE}
  mmo.Lines.Add('Warning: Compiler optimization is OFF!');
  {$ENDIF}

  mmo.Lines.Add('CPU: '                  + CpuName);
  mmo.Lines.Add('No of logical cores: '  + IntToStr(CPUCount));
  mmo.Lines.Add('');
end;



{--------------------------------------------------------------------------------------------------
   TESTS
--------------------------------------------------------------------------------------------------}
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
 mmo.Lines.Add('2 billion for loop: '+ s);
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
