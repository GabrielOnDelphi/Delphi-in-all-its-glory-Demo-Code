UNIT TesterForm;

{=============================================================================================================
   2026.08.03
--------------------------------------------------------------------------------------------------------------
   Demo for GameCore: save the game to disk and load it back.
=============================================================================================================}

INTERFACE

USES
  WinApi.Windows, WinApi.Messages, System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Forms, Vcl.ComCtrls,
  LightVcl.Visual.AppDataForm, LightVcl.Visual.RichLog, GameCore;


TYPE
 TfrmTester = class(TLightForm)
    btnSave: TButton;
    Log: TRichLog;
    btnLoad: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
  private
    function  GameFile: string;
    procedure ShowSoldiers;
  public
    GameCore: TGameCore;
 end;

VAR
   frmTester: TfrmTester;

IMPLEMENTATION  {$R *.dfm}

USES
   LightCore;


procedure TfrmTester.FormCreate(Sender: TObject);
begin
 GameCore:= TGameCore.Create;
 Log.AddBold('Soldiers created in memory:');
 ShowSoldiers;
end;


procedure TfrmTester.FormDestroy(Sender: TObject);
begin
 FreeAndNil(GameCore);
end;


function TfrmTester.GameFile: string;
begin
 Result:= ExtractFilePath(Application.ExeName)+ 'Level1.gam';
end;


procedure TfrmTester.ShowSoldiers;
VAR I: Integer;
begin
 for I:= 0 to GameCore.Soldiers.Count-1 DO
   Log.AddInfo('  '
      + GameCore.Soldiers[I].Name
      + '   Life: '    + IntToStr(GameCore.Soldiers[I].Life)
      + '   Shields: ' + IntToStr(GameCore.Soldiers[I].Shields)
      + '   Bullets: ' + IntToStr(GameCore.Soldiers[I].Bullets)
      + '   Alive: '   + BoolToStr(GameCore.Soldiers[I].Alive, TRUE));
end;


procedure TfrmTester.btnLoadClick(Sender: TObject);
begin
 if GameCore.ReadFromFile(GameFile)
 then
   begin
    Log.AddBold('Loaded from ' + GameFile);
    ShowSoldiers;
   end
 else Log.AddError('Cannot load ' + GameFile + '. Wrong file format?');
end;


procedure TfrmTester.btnSaveClick(Sender: TObject);
begin
 GameCore.SaveToFile(GameFile);
 Log.AddBold('Saved to ' + GameFile);
end;


end.
