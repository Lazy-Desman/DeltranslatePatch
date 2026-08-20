using System;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Linq;
using System.Collections.Generic;
using UndertaleModLib.Util;

EnsureDataLoaded();

int roomCount = 0;

foreach (var room in Data.Rooms)
{
    if (room == null) continue;
    
    if (room.Flags.HasFlag(UndertaleRoom.RoomEntryFlags.DoNotClearDisplayBuffer))
    {
        room.Flags &= ~UndertaleRoom.RoomEntryFlags.DoNotClearDisplayBuffer;
        roomCount++;
    }
}

ScriptMessage($"- Ghosting fix applied to {roomCount} ROOMs");
