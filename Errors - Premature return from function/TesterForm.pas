UNIT TesterForm;

INTERFACE

USES
  WinApi.Windows, Winapi.ShellAPI, WinApi.Messages, System.SysUtils, System.Classes, Vcl.StdCtrls, VCL.Forms, Vcl.Controls, Vcl.Samples.Spin,
  cvRichEdit, Vcl.ComCtrls, ccCore, csSystem, cbDialogs, ccINIFile, FormLog, cvPathEdit, Vcl.ExtCtrls, llRichLog;

TYPE
 TfrmTester = class(TForm)
    mmo: TMemo;
    btnStart: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
  private
    procedure LateInitialize(VAR Msg: TMessage); message MSG_LateFormInit; // Called after the main form was fully created
  public
 end;

VAR
   frmTester: TfrmTester;

IMPLEMENTATION  {$R *.dfm}

USES cbAppData, cbINIFile, cbWinVersion, cvIniFile, ccIO, cmIO, cmIO.Win, cmDebugger;




{--------------------------------------------------------------------------------------------------
   APP START/CLOSE
--------------------------------------------------------------------------------------------------}


procedure TfrmTester.FormCreate(Sender: TObject);
begin
 PostMessage(Self.Handle, MSG_LateAppInit_, 0, 0); Not needed anymore. Moved to cbAppData                       { This will call LateInitialize }
end;


procedure TfrmTester.LateInitialize;
begin
end;


procedure SomeCodeToWriteToDataBase;
Begin
  raise Exception.Create('Some DB error!');
End;


Function WriteCustomer(sCustomerData: string): Boolean;
Begin
  Result:= False;
  SomeCodeToWriteToDataBase;
  Result:= True;
End;


procedure TfrmTester.btnStartClick(Sender: TObject);
begin
 Caption:= 'Starting...';
 if WriteCustomer('Roger Waters')
 then Caption:= 'Done'
 else Caption:= 'Failed!'
end;


end.
