program Project_PropertyAddress;

{ What the compiler does with a property when you need its ADDRESS.

  A property that reads a field directly ("read FCount") is replaced by that field at compile time.
  A property that reads through a getter ("read GetCalc") is a function call.
  This makes a difference in three places: the @ operator, var parameters and FreeAndNil.

  Compile it once without defines (it runs), then once with each define below
  (Project > Options > Delphi Compiler > Conditional defines).
  Results measured with Delphi 13, Win32:

    Define        Code                       Result
    ------------  -------------------------  -------------------------------------------------------
    (none)        FreeAndNil(Obj.Owned)      compiles; FOwned becomes nil
    ADDR_FIELD    @Obj.Count                 compiles; the address IS the address of FCount
    ADDR_GETTER   @Obj.Calc                  E2036 Variable required
    VAR_FIELD     Bump(Obj.Count)            E2197 Constant object cannot be passed as var parameter
    VAR_GETTER    Bump(Obj.Calc)             E2197 Constant object cannot be passed as var parameter
    FREE_GETTER   FreeAndNil(Obj.OwnedG)     compiles, no warning; the object is freed but FOwned
                                             is NOT nil - it points to a freed object (dangling)

  Note: the DocWiki page "Properties (Delphi)" says "nor can the @ operator be applied to a property".
  This is true only for a property that has a getter. }

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

type
  TOwned = class
  end;

  TTest = class
  private
    FCount: Integer;
    FOwned: TOwned;
    function GetCalc: Integer;
    function GetOwned: TOwned;
  public
    constructor Create;
    procedure TakeAddressInside;
    property Count : Integer read FCount;           { field-backed }
    property Calc  : Integer read GetCalc;          { getter-backed }
    property Owned : TOwned  read FOwned;           { field-backed object }
    property OwnedG: TOwned  read GetOwned;         { getter-backed object }
  end;


constructor TTest.Create;
begin
  inherited Create;
  FCount:= 7;
  FOwned:= TOwned.Create;
end;


function TTest.GetCalc: Integer;
begin
  Result:= FCount * 2;
end;


function TTest.GetOwned: TOwned;
begin
  Result:= FOwned;
end;


procedure TTest.TakeAddressInside;
{$IFDEF ADDR_FIELD}
VAR P: PInteger;
{$ENDIF}
begin
  {$IFDEF ADDR_FIELD}
  P:= @Count;                                       { the same, without the "Obj." prefix }
  WriteLn('Inside a method: @Count = @FCount: ', P = @FCount);
  P^:= 99;                                          { writing through the pointer changes the field }
  WriteLn('After P^ := 99, FCount = ', FCount);
  {$ENDIF}
end;


procedure Bump(VAR X: Integer);
begin
  Inc(X);
end;


VAR
  Obj: TTest;
  {$IF Defined(ADDR_FIELD) or Defined(ADDR_GETTER)}
  P: PInteger;
  {$ENDIF}
begin
  Obj:= TTest.Create;
  try
    {$IFDEF ADDR_FIELD}
    P:= @Obj.Count;
    WriteLn('@Obj.Count = @Obj.FCount: ', P = @Obj.FCount);
    Obj.TakeAddressInside;
    {$ENDIF}

    {$IFDEF ADDR_GETTER}
    P:= @Obj.Calc;
    WriteLn(P^);
    {$ENDIF}

    {$IFDEF VAR_FIELD}
    Bump(Obj.Count);
    {$ENDIF}

    {$IFDEF VAR_GETTER}
    Bump(Obj.Calc);
    {$ENDIF}

    {$IFDEF FREE_GETTER}
    FreeAndNil(Obj.OwnedG);
    WriteLn('After FreeAndNil(Obj.OwnedG): FOwned is nil: ', Obj.FOwned = NIL);
    Obj.FOwned:= NIL;                               { the object is already freed; drop the dangling pointer }
    {$ELSE}
    FreeAndNil(Obj.Owned);
    WriteLn('After FreeAndNil(Obj.Owned): FOwned is nil: ', Obj.FOwned = NIL);
    {$ENDIF}
  finally
    FreeAndNil(Obj);
  end;

  WriteLn('Press Enter');
  ReadLn;
end.
