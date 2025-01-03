unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.messages, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, cFindInFile, Vcl.Mask, Vcl.Menus, Vcl.CheckLst;

type
  TfrmMain = class(TForm)
    btnNext       : TButton;
    btnPrev       : TButton;
    btnReset      : TButton;
    btnStart      : TButton;
    Copyfilename1 : TMenuItem;
    edtFilter     : TLabeledEdit;
    edtPath       : TLabeledEdit;
    lblCurFile    : TLabel;
    lblRewind     : TLabel;
    lbxResults    : TListBox;
    mmoView       : TMemo;
    open1         : TMenuItem;
    Panel1        : TPanel;
    Panel2        : TPanel;
    pnlFiles      : TPanel;
    pnlView       : TPanel;
    PopupMenu     : TPopupMenu;
    Splitter      : TSplitter;
    TimerRew      : TTimer;
    procedure btnNextClick       (Sender: TObject);
    procedure btnPrevClick       (Sender: TObject);
    procedure btnResetClick      (Sender: TObject);
    procedure btnStartClick      (Sender: TObject);
    procedure Copyfilename1Click (Sender: TObject);
    procedure FormCreate         (Sender: TObject);
    procedure FormDestroy        (Sender: TObject);
    procedure lbxResultsDblClick (Sender: TObject);
    procedure TimerRewTimer      (Sender: TObject);
  private
    function GetSelectedSearch: TSearchResult;
    procedure FreeResults;
    procedure SelectLine(Line: Integer); { UNUSED }
    procedure Reset;
  end;

var
  frmMain: TfrmMain;

implementation {$R *.dfm}
USES
   ccIO, cmIO, cmIO.Win,
   ccCore, csSystem, cbDialogs,
   cbAppData, cbINIFile,
   cmINIFileQuick,
   csSystem,
   cbIniFile, cvIniFile;

var
  CurFoundPos: Integer;
  LastLine: Integer;  { We need it for the 'Next' button }



procedure TfrmMain.FormCreate(Sender: TObject);
begin
  edtPath.Text:= cmINIFileQuick.ReadString('Path', 'C:\Projects');
  //btnStartClick(Sender);
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
 WriteString('Path', edtPath.Text);  { Save GUI }
 AppData.Initializing:= FALSE; 
 FreeResults;                        { Release objects }
end;


procedure TfrmMain.FreeResults;
var i : Integer;
begin
 for i:= 0 to lbxResults.Items.Count -1 do
    FreeAndNil(lbxResults.Items.Objects[i]);          { Release list and owned objects }

 lbxResults.Clear;
end;







procedure TfrmMain.btnStartClick(Sender: TObject);
var
   TextFile: string;
   FileList: TStringList;
   SearchResult: TSearchResult;
begin
  FreeResults;
  mmoView.Clear;
  Reset;
  pnlView.Visible:= True;
  btnNext.Visible:= True;
  btnPrev.Visible:= True;
  lblRewind.Visible:= false;

  FileList:= ListFilesOf(edtPath.Text, edtFilter.Text, True, True);
  try
    for TextFile in FileList do
     begin
       SearchResult:= FindStringInFile(TextFile);

       if SearchResult.Found
       then lbxResults.AddItem(SearchResult.FileName + '  Pos: '+ SearchResult.PositionsAsString, SearchResult)
       else Freeandnil(SearchResult);
     end;
  finally
    FreeAndNil(FileList);
  end;

 { Load first result }
 if lbxResults.Items.Count > 0 then
  begin
   lbxresults.ItemIndex:= 0;
   lbxResultsDblClick(Sender);
  end;

 Caption:= 'Total: '+ IntToStr(lbxResults.Items.Count);
end;


{ Returns the object selected by the user }
function TfrmMain.GetSelectedSearch: TSearchResult;
begin
 Result:= lbxResults.Items.Objects[lbxResults.ItemIndex] as TSearchResult;
end;


procedure TfrmMain.lbxResultsDblClick(Sender: TObject);
begin
 lblCurFile.Caption:= GetSelectedSearch.FileName;
 mmoView.Lines.LoadFromFile(GetSelectedSearch.FileName);
 Reset;
 lblRewind.Visible:= false;

 //Scroll to first found pos
 var CurLine:= GetSelectedSearch.Positions[0];
 SendMessage(mmoView.Handle, EM_LINESCROLL, 0, CurLine);

 LastLine:= CurLine;
end;





procedure TfrmMain.btnResetClick(Sender: TObject);
begin
 Reset;
end;


procedure TfrmMain.btnNextClick(Sender: TObject);
var Delta, CurLine: Integer;
begin
 TimerRew.Enabled:= True;

 Inc(CurFoundPos);
 if CurFoundPos > High(GetSelectedSearch.Positions) then
  begin
   Reset;
   lblRewind.Left:= 10000;
   lblRewind.Visible:= true;
  end;

 CurLine:= GetSelectedSearch.Positions[CurFoundPos];
 Delta:= CurLine - LastLine;
 LastLine:= CurLine;

 SendMessage(mmoView.Handle, EM_LINESCROLL, 0, Delta);

 //Application.ProcessMessages;
 //SelectLine(CurLine);
 Caption:= IntToStr(CurLine);
end;






procedure TfrmMain.btnPrevClick(Sender: TObject);
var Delta, CurLine: Integer;
begin
 TimerRew.Enabled:= True;

 Dec(CurFoundPos);
 if CurFoundPos < 0 then
  begin
   Reset;
   lblRewind.Left:= 10000;
   lblRewind.Visible:= true;
  end;

 CurLine:= GetSelectedSearch.Positions[CurFoundPos];
 Delta:= CurLine - LastLine;
 LastLine:= CurLine;

 SendMessage(mmoView.Handle, EM_LINESCROLL, 0, Delta);
 //MoveToLine(CurLine);
 //Application.ProcessMessages;
 //SelectLine(CurLine);
end;






procedure TfrmMain.TimerRewTimer(Sender: TObject);
begin
 lblRewind.Visible:= False;
 TimerRew.Enabled:= false;
end;


procedure TfrmMain.Reset;
begin
 LastLine:= 0;
 CurFoundPos:= 0;
 mmoView.SelStart  := 0;     { Scroll at the top }
 mmoView.SelLength := 0;
 mmoView.Perform(EM_SCROLLCARET, 0, 0);
end;


{ Does not work! }
procedure TfrmMain.SelectLine(Line : Integer);                                                   { http://delphi.about.com/od/adptips2005/qt/memoselectline.htm }
begin
 Caption:= IntToStr(Line);
 if Line >= mmoView.Lines.Count then EXIT;

 mmoView.SelStart  := mmoView.Perform(EM_LINEINDEX, Line, 0);
 mmoView.SelLength := Length(mmoView.Lines[Line]);

// mmoView.Perform(EM_SCROLLCARET, 0, Line);
 //mmoView.VerticalScrollBar.Position:= Line;
end;


procedure TfrmMain.Copyfilename1Click(Sender: TObject);
begin
 StringToClipboard(GetSelectedSearch.FileName);
end;



end.






(*
FUNCTION TfrmMain.GetLineNo : INTEGER;
BEGIN
 Result:= mmoView.Perform(EM_LINEFROMCHAR, mmoView.SelStart,0)
END;

PROCEDURE TfrmMain.SetLineNo(NewLineNo : INTEGER);
BEGIN
 IF NewLineNo<0 THEN NewLineNo:=0;
 IF NewLineNo> mmoView.Lines.Count THEN NewLineNo:= mmoView.Lines.Count;
 mmoView.SelStart:= mmoView.Perform(EM_LINEINDEX, NewLineNo, 0);
 Perform(EM_SCROLLCARET, NewLineNo, 0); // Should LinePos be NewLineNo ?? //
END;

procedure TfrmMain.MoveToLine(LineNo: integer);
begin
 //SendMessage(mmoView.Handle, EM_LINESCROLL, 0, LineNo);

 //mmoView.SelStart:=mmoView.Perform(EM_LINEINDEX, LineNo, 0);

 mmoView.SetFocus;
 with mmoView do
 begin
  selstart := perform( em_lineindex, LineNo, 0 );
  perform( em_scrollcaret, 0, 0 );
 end;

    {
    with mmoView do
    begin
        SelStart := mmoView.Perform(EM_LINEINDEX, LineNo, 0);
        mmoView.Perform(EM_SCROLLCARET, mmoView.LinePos, 0);
    end;   }
end;  *)


{ Does not work! }   {
procedure TfrmMain.SelectLine(Line : Integer);        { http://delphi.about.com/od/adptips2005/qt/memoselectline.htm
begin
 if Line >= mmoView.Lines.Count then EXIT;

 mmoView.SelStart  := Perform(EM_LINEINDEX, Line, 0);
 mmoView.SelLength := Length(mmoView.Lines[Line]);
 //mmoView.SetFocus;
end;         }

