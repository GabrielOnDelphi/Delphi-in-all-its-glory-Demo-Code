UNIT Soldier;

{=============================================================================================================
   2026.08.03
--------------------------------------------------------------------------------------------------------------
   One game object that can save/load itself.

   The soldier is not written straight to the disk stream. It is first written to a memory stream, then that
   memory stream is copied to disk, prefixed by its size. The extra step buys two things:
     - The padding block reserves room, so a later version of the game can add fields without breaking old files.
     - The size prefix marks where this soldier's block ends, so the reader can skip a block it does not
       understand and still find the next soldier.
=============================================================================================================}

INTERFACE

USES
   System.SysUtils, System.Classes, LightCore.StreamMem, LightCore.StreamBuff;

CONST
   PaddingSize = 1024;                       { Reserved space for fields added by future versions of the game }

TYPE
  TSoldier= class(TObject)
   public
     Bullets: Integer;
     Life   : Integer;
     Shields: Integer;
     Alive  : Boolean;
     Name   : String;

     procedure LoadFromStream(DiskStream: TLightStream);
     procedure SaveToStream  (DiskStream: TLightStream);

     procedure StartAnimation;
     procedure PlayDead;
   end;

IMPLEMENTATION




procedure TSoldier.PlayDead;
begin
 //
end;


procedure TSoldier.StartAnimation;
begin
 //
end;




procedure TSoldier.LoadFromStream(DiskStream: TLightStream);
VAR
   MemStream: TCubicMemStream;
   BlockSize: Cardinal;
begin
 BlockSize:= DiskStream.ReadCardinal;

 MemStream:= TCubicMemStream.Create;
 TRY
   { Load this soldier's block from disk into memory }
   MemStream.CopyFrom(DiskStream, BlockSize);
   MemStream.Position:= 0;

   { Load soldier's data from the memory stream }
   Bullets  := MemStream.ReadInteger;
   Life     := MemStream.ReadInteger;
   Shields  := MemStream.ReadInteger;
   Alive    := MemStream.ReadBoolean;
   Name     := MemStream.ReadString;

   MemStream.ReadPadding0(PaddingSize);
 FINALLY
  FreeAndNil(MemStream);
 END;

 { Initialize this object }
 if Alive
 then Self.StartAnimation
 else Self.PlayDead;
end;


procedure TSoldier.SaveToStream(DiskStream: TLightStream);
VAR
   MemStream: TCubicMemStream;
begin
 MemStream:= TCubicMemStream.Create;
 TRY
   { Save soldier's data to a memory stream }
   MemStream.WriteInteger(Bullets);
   MemStream.WriteInteger(Life);
   MemStream.WriteInteger(Shields);
   MemStream.WriteBoolean(Alive);
   MemStream.WriteString (Name);

   MemStream.WritePadding0(PaddingSize);

   { Save the memory stream to disk, prefixed by its size }
   DiskStream.WriteCardinal(MemStream.Size);
   MemStream.Position:= 0;
   DiskStream.CopyFrom(MemStream, 0);      { Count = 0 => rewind Source and copy all of it }
 FINALLY
  FreeAndNil(MemStream);
 END;
end;




end.
