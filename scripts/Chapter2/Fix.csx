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

UndertaleCode AddCreationCodeEntryForInstance(UndertaleRoom.GameObject inst) {
    UndertaleCode code = inst.PreCreateCode;
    if (code == null) {
        var name = Data.Strings.MakeString("gml_Instance_" + inst.InstanceID.ToString());
        code = new UndertaleCode()
        {
            Name = name,
            LocalsCount = 1
        };
        Data.Code.Add(code);

        UndertaleCodeLocals.LocalVar argsLocal = new UndertaleCodeLocals.LocalVar();
        argsLocal.Name = Data.Strings.MakeString("arguments");
        argsLocal.Index = 0;

        var locals = new UndertaleCodeLocals()
        {
            Name = name
        };
        locals.Locals.Add(argsLocal);
        Data.CodeLocals.Add(locals);
    }
    return code;
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




    int cnt = 0;
    foreach (var code in codeEntrs)
    {
        GetOrig(code.Item1);
        // ScriptMessage(code.Item1);
        // Data.Code.ByName(code.Item1).ReplaceGML(code.Item2, Data);
        ReplaceGML(Data.Code.ByName(code.Item1), code.Item2);
        IncrementProgress();
        UpdateProgressValue(GetProgress());
        cnt++;
    }

    foreach (var codeName in jsonCodeUpdates.Keys)
    {
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



#region И ещё говнинка

foreach (var font in Data.Fonts)
{
if (font.Name.ToString().Contains("_ja_"))
{
    font.Name.Content = font.Name.ToString().Trim(new char[] { '"' }).Replace("_ja_", "_") + "_ja";
}
}

// Пазлы
GetOrig("gml_Object_obj_ch2_keyboardpuzzle_monologue_controller_Create_0");
AppendToEnd("gml_Object_obj_ch2_keyboardpuzzle_monologue_controller_Create_0", @"
    keys_symbols = stringsetloc(""DECEMBER"", ""obj_ch2_keyboard_cutscene_controller_slash_Create_0_gml_15_0"")
");

Data.Sprites.ByName("spr_pipissign").Textures = new UndertaleSimpleList<UndertaleSprite.TextureEntry>{
    Data.Sprites.ByName("spr_pipissign").Textures[0]
};

Data.Sprites.ByName("spr_rouxls_bubble_hey").Textures = new UndertaleSimpleList<UndertaleSprite.TextureEntry>{
    Data.Sprites.ByName("spr_rouxls_bubble_hey").Textures[0]
};

UndertaleSprite sprite = Data.Sprites.ByName("spr_queen_poster");
if (sprite is null) {
    UndertaleSprite newSprite = new();
    newSprite.Name = Data.Strings.MakeString("spr_queen_poster");
    newSprite.Width = 120;
    newSprite.Height = 64;
    newSprite.MarginLeft = 0;
    newSprite.MarginRight = 120 - 1;
    newSprite.MarginTop = 0;
    newSprite.MarginBottom = 64 - 1;
    newSprite.OriginX = 0;
    newSprite.OriginY = 0;
    for (int i = 0; i < 3; i++)
        newSprite.Textures.Add(new UndertaleSprite.TextureEntry());
    newSprite.CollisionMasks.Add(newSprite.NewMaskEntry());
    Data.Sprites.Add(newSprite);
}

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
    if (room == room_dw_city_treasure && scr_84_get_sprite(""spr_queen_poster"") != -1)
    {
        n = scr_marker(400, 174, scr_84_get_sprite(""spr_queen_poster""))
        n.depth = 899999
        n.image_index = 1
    }
    else if (room == room_dw_city_spamton_alley && scr_84_get_sprite(""spr_queen_poster"") != -1)
    {
        n = scr_marker(240, 94, scr_84_get_sprite(""spr_queen_poster""))
        n.depth = 989999
        n.image_index = 1
        n = scr_marker(400, 94, scr_84_get_sprite(""spr_queen_poster""))
        n.depth = 989999
        n.image_index = 1
        n = scr_marker(800, 94, scr_84_get_sprite(""spr_queen_poster""))
        n.depth = 989999
        n.image_index = 2
    }";
    foreach (var room in jsonRooms)
    {
        room_code += string.Format("if (room == {0}) {{\n", room.Key);

        foreach (var spr in jsonRooms[room.Key])
        {
            if (spr["type"] == "tile")
            {
                if (room.Key == "room_town_school")
                {
                    room_code += $@"    
                    var n = scr_marker_animated({spr["x"]}, {spr["y"]}, scr_84_get_sprite(""{spr["sprite"]}""), sprite_get_speed(scr_84_get_sprite(""{spr["sprite"]}"")))
                    n.depth = {spr["depth"]}
                    var arr = layer_get_all_elements(""{spr["layer"]}"")
                    layer_tilemap_destroy(arr[array_length(arr) - 4])
                    ";
                }
                else
                {
                    room_code += $@"    
                    var n = scr_marker_animated({spr["x"]}, {spr["y"]}, scr_84_get_sprite(""{spr["sprite"]}""), sprite_get_speed(scr_84_get_sprite(""{spr["sprite"]}"")))
                    n.depth = {spr["depth"]} - 1
                    ";
                }
            }
            if (spr["type"] == "sprite")
            {
                room_code += $@"
                var lay_id = layer_get_id(""{spr["layer"]}"")
                var back_id = layer_sprite_get_id(lay_id, ""{spr["spr_name"]}"");
                layer_sprite_change(back_id, scr_84_get_sprite(""{spr["sprite"]}""));
                ";
            }
            if (spr["type"] == "background")
            {
                room_code += $@"
                var lay_id = layer_get_id(""{spr["layer"]}"");
                var back_id = layer_background_get_id(lay_id);
                layer_background_sprite(back_id, scr_84_get_sprite(""{spr["sprite"]}""));
                ";
            }

            IncrementProgress();
            UpdateProgressValue(GetProgress());
        }

        room_code += "}\n";
    }

    AddNewEvent("obj_gamecontroller", EventType.Other, (uint)EventSubtypeOther.RoomStart, room_code);
});

#endregion



#region Буковы на кнопках


Dictionary <string, Dictionary<string, string>> insts_with_letters;

using (StreamReader r = new StreamReader(scriptFolder + "InstancesToLetters.json")) {
    string json = r.ReadToEnd();
    insts_with_letters = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, Dictionary<string, string>>>(json);
}

foreach (var inst in Data.Rooms.ByName("room_dw_cyber_keyboard_puzzle_1").Layers.FirstOrDefault(x => x.LayerName.Content == "OBJECTS_MAIN").InstancesData.Instances) {
    if (insts_with_letters.ContainsKey(inst.InstanceID.ToString())) {
        inst.PreCreateCode = AddCreationCodeEntryForInstance(inst);
        GetOrig(inst.PreCreateCode.Name.Content);
        AppendToEnd(inst.PreCreateCode, $@"myString = string_char_at(scr_get_lang_string(""{insts_with_letters[inst.InstanceID.ToString()]["orig_letter"]}"", ""obj_ch2_keyboardpuzzle_tile_Create_0_gml_1_0""), {insts_with_letters[inst.InstanceID.ToString()]["num"]} + 1)");
    }
}

foreach (var inst in Data.Rooms.ByName("room_dw_cyber_keyboard_puzzle_2").Layers.FirstOrDefault(x => x.LayerName.Content == "OBJECTS_MAIN").InstancesData.Instances) {
    if (insts_with_letters.ContainsKey(inst.InstanceID.ToString())) {
        inst.PreCreateCode = AddCreationCodeEntryForInstance(inst);
        GetOrig(inst.PreCreateCode.Name.Content);
        AppendToEnd(inst.PreCreateCode, $@"myString = string_char_at(scr_get_lang_string(""{insts_with_letters[inst.InstanceID.ToString()]["orig_letter"]}"", ""obj_ch2_keyboardpuzzle_tile_Create_0_gml_2_0""), {insts_with_letters[inst.InstanceID.ToString()]["num"]} + 1)");
    }
}

foreach (var inst in Data.Rooms.ByName("room_dw_city_monologue").Layers.FirstOrDefault(x => x.LayerName.Content == "OBJECTS_MAIN").InstancesData.Instances) {
    if (insts_with_letters.ContainsKey(inst.InstanceID.ToString())) {
        inst.PreCreateCode = AddCreationCodeEntryForInstance(inst);
        GetOrig(inst.PreCreateCode.Name.Content);
        AppendToEnd(inst.PreCreateCode, $@"myString = string_char_at(obj_ch2_keyboardpuzzle_monologue_controller.keys_symbols, {insts_with_letters[inst.InstanceID.ToString()]["num"]} + 1)");
    }
}


#endregion