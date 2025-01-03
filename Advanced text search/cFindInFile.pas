unit cFindInFile;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.Forms;

type
  TFoundPositions = array of Integer;

  TSearchResult= class(TObject)
     FileName: string;
     Positions: TFoundPositions;
     procedure AddNewPos(Pos: Integer);
     function Found: Boolean;
     function PositionsAsString: string;
  end;


function FindStringInFile(FileName: string): TSearchResult;




implementation
Uses ccCore, csSystem, cbDialogs, ccINIFile, ccIO, cmIO, cmIO.Win;





{ Find a text using very specific rules. Change the rules and recompile. }
function FindStringsInLine(TextLine: string): Boolean;
var
   iFunction, iEnum: Integer;
begin
 iFunction:= PosInsensitive('function', TextLine);
 iEnum:= PosInsensitive('.enum', TextLine);
 Result:= (iFunction = 1) AND (iEnum > 9) AND (iEnum < 50);
end;


function FindStringInLine(TextLine, Needle: string): Boolean;
begin
 var iPos:= PosInsensitive(Needle, TextLine);
 Result:= (iPos > 0);
end;

{ Returns the line(s) where the text was found }
function FindStringInFile(FileName: string): TSearchResult;
var
   TextBody: TStringList;
   sLine: string;
   i: Integer;
begin
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 TextBody:= StringFromFileTSL(FileName);
 try
   for i:= 0 to TextBody.Count-1 do
     begin
       sLine:= TextBody[i];
       if FindStringInLine(sLine, '{$')             // Find lines that has compiler directives
       and not FindStringInLine(sLine, '{$R *')     // Ignore lines that are DFM resource files
       and not FindStringInLine(sLine, '{$EXTERNALSYM') //   API
       and not FindStringInLine(sLine, '{$IFDEF')       // Ignore lines that are DEF
       and not FindStringInLine(sLine, '{$IFNDEF')      // Ignore lines that are DEF
       and not FindStringInLine(sLine, '{$DEF')         // Ignore lines that are DEF
       and not FindStringInLine(sLine, '{$ENDIF')       // Ignore lines that are DEF
       then
        begin
          { Returns the line(s) where the text was found }
          Result.AddNewPos(i);
        end;
     end;
 finally
   FreeAndNil(TextBody);
 end;
end;







{ TSearchResult }
procedure TSearchResult.AddNewPos(Pos: Integer);
begin
 SetLength(Positions, Length(Positions)+1);
 Positions[High(Positions)]:= Pos;
end;


function TSearchResult.Found: Boolean;
begin
 Result:= Length(Positions) > 0;
end;


function TSearchResult.PositionsAsString: string;
begin
 Result:= '';
 for var i in Positions
   do Result:= Result+ IntToStr(i)+ ',';
 Result:= RemoveLastChar(Result);
end;


end.
