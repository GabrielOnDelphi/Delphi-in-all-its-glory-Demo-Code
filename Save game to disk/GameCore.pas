UNIT GameCore;

{=============================================================================================================
   2026.08.03
--------------------------------------------------------------------------------------------------------------
   Demo: save/load the state of a game to/from disk.

   File layout:
     LightSaber header (magic number + signature + file version)
     Cardinal         : how many soldiers follow
     for each soldier : Cardinal block size + the soldier's block (see Soldier.pas)
=============================================================================================================}

INTERFACE

USES
   System.SysUtils, System.Classes, System.Generics.Collections,
   LightCore.StreamBuff, Soldier;

CONST
   GameSignature = 'Shootem';
   GameVersion   = 1;

TYPE
  TGameCore= class(TObject)
   public
    Soldiers: TObjectList<TSoldier>;
    function  ReadFromFile(CONST FileName: string): Boolean;
    procedure SaveToFile  (CONST FileName: string);
    constructor Create;
    destructor Destroy; override;
  end;


IMPLEMENTATION




constructor TGameCore.Create;
VAR Soldier: TSoldier;
begin
 inherited Create;
 Soldiers:= TObjectList<TSoldier>.Create(TRUE);

 Soldier:= TSoldier.Create;
 Soldier.Life:= 1;                           { This guy is almost dead }
 Soldier.Shields:= 1;                        { No, seriously... he's really screwed! }
 Soldier.Bullets:= 7;
 Soldier.Alive:= TRUE;
 Soldier.Name:= 'Ryan';
 Soldiers.Add(Soldier);

 Soldier:= TSoldier.Create;
 Soldier.Life:= 100;
 Soldier.Shields:= 101;
 Soldier.Bullets:= 999;
 Soldier.Alive:= TRUE;
 Soldier.Name:= 'Terminator';                { Now we know who did it :) }
 Soldiers.Add(Soldier);
end;



destructor TGameCore.Destroy;
begin
 FreeAndNil(Soldiers);
 inherited;
end;




procedure TGameCore.SaveToFile(CONST FileName: string);   { Call this when you quit the game }
VAR
   I: Integer;
   DiskStream: TLightStream;
begin
 DiskStream:= TLightStream.CreateWrite(FileName);
 TRY
   DiskStream.WriteHeader(GameSignature, GameVersion);
   DiskStream.WriteCardinal(Soldiers.Count);

   for I:= 0 to Soldiers.Count-1 DO
     Soldiers[I].SaveToStream(DiskStream);
 FINALLY
   FreeAndNil(DiskStream);
 END;
end;




function TGameCore.ReadFromFile(CONST FileName: string): Boolean;
VAR
   I: Integer;
   Count: Cardinal;
   Soldier: TSoldier;
   DiskStream: TLightStream;
begin
 Result:= FALSE;
 DiskStream:= TLightStream.CreateRead(FileName);
 TRY
   { This is how we know if this is a file we can read or not }
   if NOT DiskStream.ReadHeader(GameSignature, GameVersion) then EXIT;

   Soldiers.Clear;
   Count:= DiskStream.ReadCardinal;
   for I:= 1 to Count DO
    begin
     Soldier:= TSoldier.Create;
     Soldiers.Add(Soldier);                  { Added first, so the list owns it even if the read below fails }
     Soldier.LoadFromStream(DiskStream);
    end;

   Result:= TRUE;
 FINALLY
   FreeAndNil(DiskStream);
 END;
end;




end.
