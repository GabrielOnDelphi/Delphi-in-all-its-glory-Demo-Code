UNIT TesterForm;

INTERFACE

USES
  WinApi.Windows,  WinApi.Messages, System.SysUtils, System.Classes, Vcl.StdCtrls, VCL.Forms, vcl.Menus, VCL.Controls, Vcl.Samples.Spin, Vcl.ActnList,
  cvRichEdit, Vcl.ComCtrls, Vcl.StdActns, System.Actions, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

CONST
   MSG_LateFormInit= WM_APP + 4711;

TYPE
 TfrmTester = class(TForm)
    btnStart: TButton;
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuCopy: TMenuItem;
    mnuCut: TMenuItem;
    mnuDelete: TMenuItem;
    mnuPaste: TMenuItem;
    mnuSelectAll: TMenuItem;
    mnuUndo: TMenuItem;
    lboxMain: TListBox;
    Timer: TTimer;
    CheckBox1: TCheckBox;
    DemoImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  protected
  private
    procedure LateInitialize(VAR Msg: TMessage); message MSG_LateFormInit; // Called after the main form was fully created
  public
 end;

VAR
   frmTester: TfrmTester;

IMPLEMENTATION  {$R *.dfm}

USES cmVclUtils;






{--------------------------------------------------------------------------------------------------
   APP START/CLOSE
--------------------------------------------------------------------------------------------------}
procedure TfrmTester.FormCreate(Sender: TObject);
begin

end;


procedure TfrmTester.LateInitialize;
begin
end;


procedure TfrmTester.TimerTimer(Sender: TObject);
VAR
   Control: TControl;
begin
   //GetCursorPos(P);
   Control:= cmVclUtils.FindControlAtPos(Mouse.CursorPos);   // Note FindVCLWindow could be used also, but it doesn't search disabled controls (Enabled=False).
   if Control <> NIL then
    begin
     Caption:= IntToStr(Mouse.CursorPos.X)+ ' '+ IntToStr(Mouse.CursorPos.Y)+ ' '+ Control.Name;
     lboxMain.Items.Text:= 'Name: '+ Control.Name+ #13#10+ ShowInheritanceTree(Control);
    end;
end;


















end.
