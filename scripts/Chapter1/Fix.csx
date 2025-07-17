using UndertaleModLib.Util;
using System.Text.Json;
using System.Linq;
using System.Text;
using System.IO;
using System;
using System.Threading;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

#region Вспомогательные функции

string gameFolder = Path.GetDirectoryName(FilePath) + Path.DirectorySeparatorChar;
string scriptFolder = Path.GetDirectoryName(ScriptPath) + Path.DirectorySeparatorChar;

var globalDecompileContext = new GlobalDecompileContext(Data);
var decompilerSettings = Data.ToolInfo.DecompilerSettings;
SyncBinding("Strings, Code, CodeLocals, Scripts, GlobalInitScripts, GameObjects, Functions, Variables", true);

void CreateBlankFunction(string funcName) {
    UndertaleCode code = Data.Code.ByName("gml_GlobalScript_" + funcName);
    if (code == null) {
        code = new UndertaleCode();
        code.Name = Data.Strings.MakeString("gml_GlobalScript_" + funcName);
        code.ArgumentsCount = (ushort)0;
        code.LocalsCount = (uint)0;
        
        Data.Code.Add(code);

        UndertaleScript scr = new UndertaleScript();
        scr.Name = Data.Strings.MakeString(funcName);
        scr.Code = code;
        Data.Scripts.Add(scr);

        UndertaleGlobalInit ginit = new UndertaleGlobalInit();
        ginit.Code = code;
        Data.GlobalInitScripts.Add(ginit);

        // // code.ReplaceGML(funcCodeGML, Data);
        // // code.ReplaceGML($"function {funcName}() //gml_Script_{funcName}\n{{}}", Data);
        ReplaceGML(code, $"function {funcName}() //gml_Script_{funcName}\n{{}}");
    }
}

bool ReplaceGML(UndertaleCode code, string text)
{
    CompileGroup group = new(Data);
    group.QueueCodeReplace(code, text);
    CompileResult result = group.Compile();

    if (!result.Successful)
    {
        File.WriteAllText(Path.Combine(scriptFolder, "test.txt"), text);
        ScriptMessage(code.Name.Content);
        return false;
    }
    return true;
}

bool ReplaceGML(string codeName, string text)
{
    return ReplaceGML(Data.Code.ByName(codeName), text);
}

bool ReplacePart(UndertaleCode code, List<(string, string)> changes, bool matchWordsBounds = false)
{
    var text = Decompile(code);
    foreach (var pair in changes)
    {
        if (matchWordsBounds)
        {
            Regex rx = new Regex(string.Format(@"\b{0}\b", pair.Item1));
            text = rx.Replace(text, pair.Item2);
        }
        else
        {
            text = Regex.Replace(text, pair.Item1, pair.Item2);
        }
    }
    return ReplaceGML(code, text);
}

bool ReplacePart(UndertaleCode code, string from, string to, bool matchWordsBounds = false)
{
    return ReplacePart(code, new List<(string, string)>() { (from, to) }, matchWordsBounds);
}

bool ReplacePart(string codeName, List<(string, string)> changes, bool matchWordsBounds = false)
{
    return ReplacePart(Data.Code.ByName(codeName), changes, matchWordsBounds);
}

bool ReplacePart(string codeName, string from, string to, bool matchWordsBounds = false)
{
    return ReplacePart(Data.Code.ByName(codeName), from, to, matchWordsBounds);
}

bool AppendToStart(UndertaleCode code, string append)
{
    var text = Decompile(code);
    return ReplaceGML(code, append + "\n" + text);
}

bool AppendToStart(string codeName, string append)
{
    return AppendToStart(Data.Code.ByName(codeName), append);
}

bool AppendToEnd(UndertaleCode code, string append)
{
    var text = Decompile(code);
    return ReplaceGML(code, text + "\n" + append);
}

bool AppendToEnd(string codeName, string append)
{
    return AppendToStart(Data.Code.ByName(codeName), append);
}

void AddNewEvent(UndertaleGameObject obj, EventType evType, uint evSubtype, string codeGML) {
    ReplaceGML(obj.EventHandlerFor(evType, evSubtype, Data), codeGML);
}

void AddNewEvent(string objName, EventType evType, uint evSubtype, string codeGML) {
    AddNewEvent(Data.GameObjects.ByName(objName), evType, evSubtype, codeGML);
}

var backedList = new List<string>();

string Decompile(UndertaleCode code)
{
    return new Underanalyzer.Decompiler.DecompileContext(globalDecompileContext, code, decompilerSettings).DecompileToString();
}

string Decompile(string code)
{
    return Decompile(Data.Code.ByName(code));
}

void GetOrig(string codeName)
{
    if (backedList.Contains(codeName))
        return;

    var code = Data.Code.ByName(codeName);
    var oldCode = Data.Code.ByName(codeName + "_old");

    if (oldCode == null)
    {
        oldCode = new UndertaleCode();
        oldCode.Name = Data.Strings.MakeString(codeName + "_old");
        if (ReplaceGML(oldCode, "var code = \"" + Decompile(code).Replace("\\", "\\\\").Replace("\\n", "\\_n").Replace("\n", "\\n").Replace("\"", "\\\"") + "\""))
        {
            Data.Code.Add(oldCode);
        }
    }

    var oldText = Decompile(oldCode).Substring(12);
    oldText = oldText.Remove(oldText.Length - 3).Replace("\\n", "\n").Replace("\\\"", "\"").Replace("\\_n", "\\n").Replace("\\\\", "\\");
    ReplaceGML(code, oldText);

    backedList.Add(codeName);
}

void GetOrigSprite(string spriteName)
{
    // if (Data.Sprites.ByName(spriteName + "_old") == null)
    // {
    //     var new_spr = new UndertaleSprite();
    //     Data.Sprites.Add(new_spr);
    // }

    // var code = Data.Code.ByName(codeName);
    // var oldCode = Data.Code.ByName(codeName + "_old");

    // if (oldCode == null)
    // {
    //     oldCode = new UndertaleCode();
    //     oldCode.Name = Data.Strings.MakeString(codeName + "_old");
    //     if (ReplaceGML(oldCode, "var code = \"" + Decompile(code).Replace("\\", "\\\\").Replace("\\n", "\\_n").Replace("\n", "\\n").Replace("\"", "\\\"") + "\""))
    //     {
    //         Data.Code.Add(oldCode);
    //     }
    // }

    // var oldText = Decompile(oldCode).Substring(12);
    // oldText = oldText.Remove(oldText.Length - 3).Replace("\\n", "\n").Replace("\\\"", "\"").Replace("\\_n", "\\n").Replace("\\\\", "\\");
    // ReplaceGML(code, oldText);

    // backedList.Add(codeName);
}

#endregion


#region Добавление объектов

// Менюшка настроек
var obj_lang_settings = Data.GameObjects.ByName("obj_lang_settings");
if (obj_lang_settings == null) {
    obj_lang_settings = new UndertaleGameObject();
    obj_lang_settings.Name = Data.Strings.MakeString("obj_lang_settings");
    Data.GameObjects.Add(obj_lang_settings);
    AddNewEvent(obj_lang_settings, EventType.Create, 0, "");
    AddNewEvent(obj_lang_settings, EventType.Step, 0, "");
    AddNewEvent(obj_lang_settings, EventType.Draw, 0, "");
}

// Режим переводчика
Data.GameObjects.ByName("obj_gamecontroller").Visible = true;
AddNewEvent("obj_gamecontroller", EventType.Draw, (uint)EventSubtypeDraw.DrawGUI, "");
AddNewEvent("obj_gamecontroller", EventType.Step, (uint)EventSubtypeStep.Step, "");
int maxCount = 0;

#endregion


#region Считывание кусков кода

var codeEntrs = new List<(string, string)>();

foreach (string fileName in Directory.GetFiles(scriptFolder + "CodeEntries"))
{
    if (!fileName.EndsWith(".gml"))
        continue;
    var codeName = Path.GetFileNameWithoutExtension(fileName);
    codeEntrs.Add((codeName, File.ReadAllText(fileName)));
    if (codeName.Contains("GlobalScript") && Data.Code.ByName(codeName) == null)
    {
        CreateBlankFunction(codeName.Substring(17));
    }
}

#endregion

#region Замена кусков кода

Dictionary<string, List<Dictionary <string, string>>> jsonCodeUpdates;

using (StreamReader r = new StreamReader(scriptFolder + "CodeUpdates.json")) {
    string json = r.ReadToEnd();
    jsonCodeUpdates = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, List<Dictionary <string, string>>>>(json);
}

maxCount = codeEntrs.Count + jsonCodeUpdates.Count;
await Task.Run(() =>
{
    SetProgressBar(null, "Code entries replacing", 0, maxCount);




    foreach (var code in codeEntrs)
    {
        GetOrig(code.Item1);
        // ScriptMessage(code.Item1);
        // Data.Code.ByName(code.Item1).ReplaceGML(code.Item2, Data);
        ReplaceGML(Data.Code.ByName(code.Item1), code.Item2);
        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var codeName in jsonCodeUpdates.Keys) {
        GetOrig(codeName);

        foreach (var change in jsonCodeUpdates[codeName])
        {
            ReplacePart(codeName, Regex.Escape(change["old"]), change["new"]);
        }

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

});
#endregion



#region Внедрение спрайтов и звуков


Dictionary<string, string> jsonSpritesAssgned;
Dictionary<string, List <string> > jsonObjSprDraws;
Dictionary<string, List<Dictionary<string, string>>> jsonRooms;
Dictionary<string, List <string> > jsonObjSounds;

using (StreamReader r = new StreamReader(scriptFolder + "ObjectsWithAssignedSprites.json")) {
    string json = r.ReadToEnd();
    jsonSpritesAssgned = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, string>>(json);
}
using (StreamReader r = new StreamReader(scriptFolder + "CodesWithSprites.json")) {
    string json = r.ReadToEnd();
    jsonObjSprDraws = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, List <string>>>(json);
}
using (StreamReader r = new StreamReader(scriptFolder + "RoomsWithBacksLayers.json"))
{
    string json = r.ReadToEnd();
    jsonRooms = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, List<Dictionary<string, string>>>>(json);
}
using (StreamReader r = new StreamReader(scriptFolder + "CodesWithSounds.json")) {
    string json = r.ReadToEnd();
    jsonObjSounds = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, List <string>>>(json);
}

maxCount = jsonObjSprDraws.Count + jsonSpritesAssgned.Count + jsonRooms.Count + jsonObjSounds.Count;
await Task.Run(() =>
{
    SetProgressBar(null, "Sprites and sounds injecting", 0, maxCount);

    foreach (var code in jsonObjSprDraws)
    {
        var lst = new List<(string, string)>();
        foreach (var spr in code.Value)
        {
            lst.Add((spr, string.Format("scr_84_get_sprite(\"{0}\")", spr)));
        }
        GetOrig(code.Key);
        ReplacePart(code.Key, lst, true);// scr_84_get_sprite

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var obj in jsonSpritesAssgned)
    {
        if (Data.Code.ByName("gml_Object_" + obj.Key + "_Create_0") == null)
        {
            AddNewEvent(obj.Key, EventType.Create, 0,
            string.Format("event_inherited();\nsprite_index = scr_84_get_sprite(\"{0}\")", obj.Value));
        }
        else
        {
            GetOrig("gml_Object_" + obj.Key + "_Create_0");
            AppendToStart("gml_Object_" + obj.Key + "_Create_0",
            string.Format("sprite_index = scr_84_get_sprite(\"{0}\")", obj.Value));
        }

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var code in jsonObjSounds)
    {
        var lst = new List<(string, string)>();
        foreach (var snd in code.Value)
        {
            lst.Add((snd, string.Format("scr_84_get_sound(\"{0}\")", snd)));
        }
        GetOrig(code.Key);
        ReplacePart(code.Key, lst, true);

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }


    string room_code = @"
    if (room == room_cc_5f) {
        if (scr_84_get_sprite(""bg_rurus_shop"") != -1) {
            n = scr_marker(380, 600, scr_84_get_sprite(""bg_rurus_shop""))
            n.depth = 949999
            var arr = layer_get_all_elements(""Compatibility_Tiles_Depth_950000"")
            layer_tilemap_destroy(arr[array_length(arr) - 2])
        }
    }";
    foreach (var room in jsonRooms) {
        room_code += string.Format("if (room == {0}) {{\n", room.Key);

        foreach (var spr in jsonRooms[room.Key]) {
            if (spr["type"] == "tile") {
                if (room.Key == "room_town_school") {
                    room_code += $@"    
                    var n = scr_marker({spr["x"]}, {spr["y"]}, scr_84_get_sprite(""{spr["sprite"]}""))
                    n.depth = {spr["depth"]}
                    var arr = layer_get_all_elements(""{spr["layer"]}"")
                    layer_tilemap_destroy(arr[array_length(arr) - 4])
                    ";
                } else {
                    room_code += $@"    
                    var n = scr_marker({spr["x"]}, {spr["y"]}, scr_84_get_sprite(""{spr["sprite"]}""))
                    n.depth = {spr["depth"]} - 1
                    ";
                }
            }
            if (spr["type"] == "sprite") {
                room_code += $@"
                var lay_id = layer_get_id(""{spr["layer"]}"")
                var back_id = layer_sprite_get_id(lay_id, ""{spr["spr_name"]}"");
                layer_sprite_change(back_id, scr_84_get_sprite(""{spr["sprite"]}""));
                ";
            }
            if (spr["type"] == "background") {
                room_code += $@"
                var lay_id = layer_get_id(""{spr["layer"]}"");
                var back_id = layer_background_get_id(lay_id);
                layer_background_sprite(back_id, scr_84_get_sprite(""{spr["sprite"]}""));
                ";
            }
        }

        room_code += "}\n";
    }

    AddNewEvent("obj_gamecontroller", EventType.Other, (uint)EventSubtypeOther.RoomStart, room_code);
});

#endregion

#region Всякая говнинка

// Ставим obj_gamecontroller перед obj_initializer2
var room = Data.Rooms.ByName("ROOM_INITIALIZE");

foreach (var layer in room.Layers)
{
    if (layer.LayerName.Content == "Compatibility_Instances_Depth_0")
    {
        for (var i = 0; i < layer.InstancesData.Instances.Count; i++)
        {
            var inst = layer.InstancesData.Instances[i];
            if (inst.ObjectDefinition.Name.Content == "obj_gamecontroller")
            {
                (layer.InstancesData.Instances[0].InstanceID, layer.InstancesData.Instances[i].InstanceID) = (layer.InstancesData.Instances[i].InstanceID, layer.InstancesData.Instances[0].InstanceID);
                (layer.InstancesData.Instances[0], layer.InstancesData.Instances[i]) = (layer.InstancesData.Instances[i], layer.InstancesData.Instances[0]);
            }
        }
    }
}

for (var i = 0; i < room.GameObjects.Count; i++)
{
    if (room.GameObjects[i].ObjectDefinition.Name.Content == "obj_gamecontroller")
    {
        (room.GameObjects[i], room.GameObjects[0]) = (room.GameObjects[0], room.GameObjects[i]);
    }
}

#endregion