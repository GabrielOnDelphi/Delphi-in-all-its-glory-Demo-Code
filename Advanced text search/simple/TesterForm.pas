UNIT TesterForm;

INTERFACE

USES
  WinApi.Windows,  WinApi.Messages, System.SysUtils, System.Classes, Vcl.StdCtrls, VCL.Forms, Vcl.Controls, Vcl.Samples.Spin,
  cvRichEdit, FormLog, Vcl.ComCtrls, ccCore, csSystem, cbDialogs, ccINIFile, Vcl.ExtCtrls, cvLabelEdit, cvPathEdit, cvCheckBox,
  llRichLog, cbAppData;

TYPE
 TfrmTester = class(TForm)
    lblInfo: TLabel;
    Log: TRichLog;
    Panel1: TPanel;
    edtSearchWord: TCubicLabelEdit;
    chkNonEmpty: TCubicCheckBox;
    Path: TCubicPathEdit;
    edtFileType: TCubicLabelEdit;
    btnStart: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  protected
  private
    procedure LateInitialize(VAR Msg: TMessage); message MSG_LateFormInit; // Called after the main form was fully created
    procedure SearchInFile(FileName: string);
  public
 end;

VAR
   frmTester: TfrmTester;

IMPLEMENTATION  {$R *.dfm}

USES shellApi, cbIniFile, cvIniFile, ccIO, cmIO, cmIO.Win, system.IniFiles;





{--------------------------------------------------------------------------------------------------
   APP START/CLOSE
--------------------------------------------------------------------------------------------------}
procedure TfrmTester.FormCreate(Sender: TObject);
begin
 DragAcceptFiles(Handle, True);                                             { Accept the dropped files from Windows Explorer }
 PostMessage(Self.Handle, MSG_LateAppInit_, 0, 0); Not needed anymore. Moved to cbAppData                       { This will call LateInitialize }
end;


procedure TfrmTester.LateInitialize;
begin
 LoadForm(Self);
 AppData.Initializing:= FALSE; moved to cbAppData
 edtSearchWord.Text:= ' My Text: ';
end;


procedure TfrmTester.FormDestroy(Sender: TObject);
begin
 SaveForm(Self);
 //FreeAndNil(AppData-);
end;





procedure TfrmTester.SearchInFile(FileName: string);
VAR
   iLine: Integer;
   Body: TStringList;

  procedure ListFile;
  begin
   Log.AddImpo(FileName);
   Log.AddMsg(IntToStr(iLine)+ ' -> '+ Body[iLine]);
   Log.AddEmptyRow;
  end;

begin
 Body:= ccIO.StringFromFileTSL(FileName);
 TRY

  for iLine:= 0 to Body.Count-1 DO

    if Pos(edtSearchWord.Text, Body[iLine]) > 0 then
     begin
      if chkNonEmpty.Checked
      then
       begin
        if Body[iLine].Length > Length(edtSearchWord.Text)
        then ListFile
       end
      else ListFile;

      //if FindOnce then Break;
     end;

  FINALLY
   FreeAndNil(Body);
  END;
end;



procedure TfrmTester.btnStartClick(Sender: TObject);
VAR
   i: Integer;
   FileList: TStringList;
begin
 log.Clear;
 Caption:= 'Building list of files...';
 FileList:= ccIO.ListFilesOf(Path.Path, edtFileType.Text, TRUE, TRUE);
 TRY

 for i:= 0 to FileList.Count-1 DO
  begin
   Caption:= 'File ' + IntToStr(i+1) + ' of ' + IntToStr(FileList.Count);
   SearchInFile(FileList[i]);
  end;

 Caption:= 'Ready';
 FINALLY
  FreeAndNil(FileList);
 END;
end;



end.
