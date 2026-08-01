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

#region Обратная совместимость с UndertaleModLib 0.8

Version utmLibVer = System.Reflection.Assembly.GetAssembly(typeof(UndertaleData)).GetName().Version;
bool isUTMLibDot8 = utmLibVer < new Version(0, 9, 0, 0);
object globalsInst = ((Action)IncrementProgress).Target;
Type globalsType = globalsInst.GetType();

Action<Action> ExecuteInUIThread;
if (isUTMLibDot8)
{
    void DummyAction(Action act)
    {
        act();
    }
    ExecuteInUIThread = DummyAction;

    // Если нужно было бы часто/много раз это выполнять, то нужно использовать `Delegate.CreateDelegate()`
    void syncBinding(string resType, bool enable)
    {
        globalsType.GetMethod("SyncBinding").Invoke(globalsInst, [resType, enable]);
    }
    syncBinding("Strings, Code, CodeLocals, Scripts, GlobalInitScripts, GameObjects, Functions, Variables", true);
}
else
{
    var mainThreadAct = globalsType.GetProperty("MainThreadAction")?.GetValue(globalsInst) as Action<Action>;
    ExecuteInUIThread = mainThreadAct;
}

#endregion

var changedCodes = new Dictionary<string, string>();

void CreateBlankFunction(string funcName)
{
    UndertaleCode code = Data.Code.ByName("gml_GlobalScript_" + funcName);
    if (code == null)
    {
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
    // ScriptMessage(code.Name.Content);
    changedCodes[code.Name.Content] = text;
    // CompileGroup group = new(Data);
    // group.QueueCodeReplace(code, text);
    // CompileResult result = group.Compile();

    // if (!result.Successful)
    // {
    //     File.WriteAllText(Path.Combine(scriptFolder, "test.txt"), text);
    //     ScriptMessage("Ошибка при компиляции кода '" + code.Name.Content + "'");
    //     return false;
    // }
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
        Regex rx = new Regex(string.Format(@"(?<!""){0}(?!"")", pair.Item1));
        if (matchWordsBounds)
        {
            rx = new Regex(string.Format(@"(?<!"")\b{0}\b(?!"")", pair.Item1));
        }

        if (!rx.IsMatch(text))
        {
            Regex rx_test = new Regex(string.Format(@"{0}", pair.Item1));
            if (matchWordsBounds)
            {
                rx_test = new Regex(string.Format(@"\b{0}\b", pair.Item1));
            }
            if (!rx_test.IsMatch(text)) {
                return false;
            }
        }
        text = rx.Replace(text, pair.Item2);
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

void AddNewEvent(UndertaleGameObject obj, EventType evType, uint evSubtype, string codeGML)
{
    UndertaleCode evHandler = null;
    ExecuteInUIThread(() =>
    {
        evHandler = obj.EventHandlerFor(evType, evSubtype, Data); 
    });

    ReplaceGML(evHandler, codeGML);
}

void AddNewEvent(string objName, EventType evType, uint evSubtype, string codeGML)
{
    AddNewEvent(Data.GameObjects.ByName(objName), evType, evSubtype, codeGML);
}

List<string> backedList = new List<string>();

string Decompile(UndertaleCode code)
{
    try
    {
        if (changedCodes.ContainsKey(code.Name.Content))
            return changedCodes[code.Name.Content];

        return new Underanalyzer.Decompiler.DecompileContext(globalDecompileContext, code, decompilerSettings).DecompileToString();
    } catch (Exception e) {
        throw new Exception(string.Format("Ошибка при декомпиляции кода \"{0}\". Если у вас старая версия игры, скачайте новейшую версию. \nЕсли же и так новейшая, то сообщите разработчикам о ошибке.", code.Name.Content));
    }
}

string Decompile(string code)
{
    return Decompile(Data.Code.ByName(code));
}

bool GetOrig(string codeName)
{
    if (backedList.Contains(codeName))
        return true;

    var code = Data.Code.ByName(codeName);
    var oldCode = Data.Code.ByName(codeName + "_old");

    if (code == null)
    {
        ScriptMessage(string.Format("Отсутствует такой кусок кода как \"{0}\". Это скорее всего связано со старой версией игры. Из-за этого могут возникнуть ошибки. А могут и не возникнуть.", codeName));
        // throw new Exception(string.Format("Отсутствует такой кусок кода как \"{0}\". Почему?", codeName));
        return false;
    }

    if (oldCode == null)
    {
        ExecuteInUIThread(() =>
        {
            oldCode = new UndertaleCode();
            oldCode.Name = Data.Strings.MakeString(codeName + "_old");
            Data.Code.Add(oldCode);
        });
    }

    var oldText = Decompile(oldCode);
    if (oldText == "")
    {
        ReplaceGML(oldCode, "var code = \"" + Decompile(code).Replace("\\", "\\\\").Replace("\\n", "\\_n").Replace("\n", "\\n").Replace("\"", "\\\"") + "\";\n");
        oldText = changedCodes[oldCode.Name.Content];
    }
    
    if (oldText != "")
    {
        // ScriptMessage(oldText);
        try
        {
            oldText = oldText.Substring(12);
        }
        catch (Exception err)
        {
            ScriptMessage("Ошибка при декомпиляции кода '" + codeName + "'. Вероятнее всего вы пытаетесь запустить скрипт на старых версиях игры (например, демо-версии).");
            throw new Exception("Ошибка при декомпиляции кода '" + codeName + "'. Вероятнее всего вы пытаетесь запустить скрипт на старых версиях игры (например, демо-версии).");
        }
        // ScriptMessage(oldCode.Name.Content);
        // ScriptMessage(oldText);
        oldText = oldText.Remove(oldText.Length - 3).Replace("\\n", "\n").Replace("\\\"", "\"").Replace("\\_n", "\\n").Replace("\\\\", "\\");
        ReplaceGML(code, oldText);
    }

    backedList.Add(codeName);

    return true;
}

void GetOrigSprite(string spriteName)
{
    // if (Data.Sprites.ByName(spriteName + "_old") == null)
    // {
    //     ExecuteInUIThread(() =>
    //     {
    //         var new_spr = new UndertaleSprite();
    //         Data.Sprites.Add(new_spr);
    //     });
    //     
    // }

    // var code = Data.Code.ByName(codeName);
    // var oldCode = Data.Code.ByName(codeName + "_old");

    // if (oldCode == null)
    // {
    //     ExecuteInUIThread(() =>
    //     {
    //         oldCode = new UndertaleCode();
    //         oldCode.Name = Data.Strings.MakeString(codeName + "_old");
    //         if (ReplaceGML(oldCode, "var code = \"" + Decompile(code).Replace("\\", "\\\\").Replace("\\n", "\\_n").Replace("\n", "\\n").Replace("\"", "\\\"") + "\""))
    //         {
    //             Data.Code.Add(oldCode);
    //         }
    //     });
    // }

    // var oldText = Decompile(oldCode).Substring(12);
    // oldText = oldText.Remove(oldText.Length - 3).Replace("\\n", "\n").Replace("\\\"", "\"").Replace("\\_n", "\\n").Replace("\\\\", "\\");
    // ReplaceGML(code, oldText);

    // backedList.Add(codeName);
}

UndertaleCode AddCreationCodeEntryForInstance(UndertaleRoom.GameObject inst) {
    UndertaleCode code = inst.PreCreateCode;
    if (code == null) {
        ExecuteInUIThread(() =>
        {
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
        });
    }

    return code;
}

async Task SaveEntries()
{
    maxCount = 1;
    await Task.Run(() =>
    {
        SetProgressBar(null, "Final compiling", 0, maxCount);

        CompileGroup group = new(Data)
        {
            MainThreadAction = ExecuteInUIThread
        };

        foreach (var c in changedCodes)
        {
            var codeName = c.Key;
            var text = c.Value;
            var code = Data.Code.ByName(codeName);

            group.QueueCodeReplace(code, text);
        }
        
        CompileResult result = group.Compile();

        if (!result.Successful)
        {
            ScriptMessage("Ошибка при компиляции:\n" + result.PrintAllErrors(true));
            // File.WriteAllText(Path.Combine(scriptFolder, "test.txt"), changedCodes["gml_Object_obj_lanino_rematch_enemy_Step_0"]);
            // ScriptMessage("Ошибка при компиляции кода '" + code.Name.Content + "'");
        }

        IncrementProgress();
        UpdateProgressValue(GetProgress());
        // foreach (var c in changedCodes)
        // {
        //     var codeName = c.Key;
        //     var text = c.Value;
        //     var code = Data.Code.ByName(codeName);
        //     CompileGroup group = new(Data)
        //     {
        //         ExecuteInUIThread = ExecuteInUIThread
        //     };
        //     group.QueueCodeReplace(code, text);
        //     CompileResult result = group.Compile();

        //     if (!result.Successful)
        //     {
        //         File.WriteAllText(Path.Combine(scriptFolder, "test.txt"), text);
        //         ScriptMessage("Ошибка при компиляции кода '" + code.Name.Content + "'");
        //     }

        //     IncrementProgress();
        //     UpdateProgressValue(GetProgress());
        // }
    });
}

#endregion

#region Добавление менюшки настроек и правка контроллера

// Менюшка настроек
var obj_lang_settings = Data.GameObjects.ByName("obj_lang_settings");
if (obj_lang_settings == null) {
    obj_lang_settings = new UndertaleGameObject();
    obj_lang_settings.Name = Data.Strings.MakeString("obj_lang_settings");
    Data.GameObjects.Add(obj_lang_settings);
    AddNewEvent(obj_lang_settings, EventType.Create, 0, "");
    AddNewEvent(obj_lang_settings, EventType.Step, 0, "");
    AddNewEvent(obj_lang_settings, EventType.Draw, 0, "");
    AddNewEvent(obj_lang_settings, EventType.Draw, 0, "");
    if (File.Exists(scriptFolder + "CodeEntries/gml_Object_obj_lang_settings_Other_62.gml"))
        AddNewEvent(obj_lang_settings, EventType.Other, (uint)EventSubtypeOther.AsyncHTTP, @"");
}

// Режим переводчика
Data.GameObjects.ByName("obj_gamecontroller").Visible = true;

AddNewEvent("obj_gamecontroller", EventType.Draw, (uint)EventSubtypeDraw.DrawGUI, "");
AddNewEvent("obj_gamecontroller", EventType.Step, (uint)EventSubtypeStep.Step, "");
AddNewEvent("obj_gamecontroller", EventType.Other, (uint)EventSubtypeOther.AsyncHTTP, @"");
AddNewEvent("obj_gamecontroller", EventType.Draw, (uint)EventSubtypeDraw.DrawEnd, @"");
AddNewEvent("obj_gamecontroller", EventType.Other, (uint)EventSubtypeOther.RoomEnd, @"");

int maxCount = 0;

#endregion

#region Считывание кусков кода
var codeEntrs = new List<(string, string)>();
void IterateOverCodeEntries(string curPath)
{
    foreach (string fileName in Directory.GetFiles(curPath, "*", SearchOption.AllDirectories))
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
}

// Дичайший костыль
if (!ScriptPath.Contains("Menu")) {
    IterateOverCodeEntries(scriptFolder + "../SharedCodeEntries");
}

IterateOverCodeEntries(scriptFolder + "CodeEntries");

#endregion

#region Замена кусков кода 

var codesWithSpritesIds = new Dictionary<string, List<string>>();
var spriteIdDict = Data.Sprites.Select((item, index) => (item, index))
                               .ToDictionary(x => x.item.Name.Content, x => x.index);

if (File.Exists(scriptFolder + "CodesWithSpritesIds.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "CodesWithSpritesIds.json");
    string json = r.ReadToEnd();
    codesWithSpritesIds = JsonSerializer.Deserialize<Dictionary<string, List<string>>>(json);
}


Dictionary<string, List<Dictionary<string, string>>> jsonCodeUpdates;

if (File.Exists(scriptFolder + "CodeUpdates.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "CodeUpdates.json");
    string json = r.ReadToEnd();
    jsonCodeUpdates = JsonSerializer.Deserialize<Dictionary<string, List<Dictionary<string, string>>>>(json);
}

var codeChanges = new Dictionary<string, List<(string, string, bool)>>();
if (File.Exists(scriptFolder + "CodeChanges.txt")) {
    var changes = File.ReadAllLines(scriptFolder + "CodeChanges.txt");
    var cur_code = "";
    var cur_from = "";
    var cur_to = "";
    int flag = 0;
    bool flag_ignore = false;
    foreach (var str in changes)
    {
        if (str.StartsWith("==="))
        {
            cur_code = str.Substring(4);
            if (!codeChanges.ContainsKey(cur_code))
                codeChanges[cur_code] = new List<(string, string, bool)>();
            flag = 0;
        }
        else
        if (str.StartsWith("---"))
        {
            flag = 1;
            if (str.Length > 3 && str[3] == '#')
            {
                flag_ignore = true;
            }
        }
        else if (str.StartsWith("+++"))
            flag = 2;
        else if (str.StartsWith("%%%"))
        {
            flag = 0;
            codeChanges[cur_code].Add((cur_from.Remove(cur_from.Length - 1), cur_to.Remove(cur_to.Length - 1), flag_ignore));
            cur_from = "";
            cur_to = "";
            flag_ignore = false;
        }
        else
        if (flag == 1)
            cur_from += str + "\n";
        else if (flag == 2)
            cur_to += str + "\n";
    }
    // jsonCodeUpdates = JsonSerializer.Deserialize<Dictionary<string, List<Dictionary<string, string>>>>(json);
}

maxCount = codesWithSpritesIds.Count + codeEntrs.Count + codeChanges.Count;
// maxCount = codeEntrs.Count + jsonCodeUpdates.Count;
await Task.Run(() =>
{
    SetProgressBar(null, "Code entries replacing", 0, maxCount);

    foreach (var code in codeEntrs)
    {
        if (!GetOrig(code.Item1))
            continue;
        // ScriptMessage(code.Item1);
        // Data.Code.ByName(code.Item1).ReplaceGML(code.Item2, Data);
        ReplaceGML(Data.Code.ByName(code.Item1), code.Item2);
        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var code in codesWithSpritesIds)
    {
        if (!GetOrig(code.Key))
            continue;
            
        foreach (var spr in code.Value)
        {
            int sprId = spriteIdDict.TryGetValue(spr, out int id) ? id : -1;
            if (sprId == -1)
            {
                ScriptMessage($"Не удалось найти спрайт с именем \"{spr}\"");
            }

            // Не забыть дублировать спрайты в CodesWithSprites, этот кусок кода просто вместо айдишников имена подставляет
            if (!ReplacePart(code.Key, sprId.ToString(), spr))
            {
                // ScriptMessage(string.Format("Ошибка при изменении айдишника \"{0}\" в \"{1}\".", spr, code.Key));
            }
        }

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var codeName in codeChanges.Keys)
    {
        if (!GetOrig(codeName))
            continue;

        foreach (var change in codeChanges[codeName])
        {
            var from = Regex.Replace(change.Item1, @"\s+", " ");
            from = Regex.Escape(from);
            from = from.Replace(" ", @"\s*").Replace("\\\\", "\\");
            from = from.Replace("{", "{?").Replace("}", "}?");
            if (!ReplacePart(codeName, from, change.Item2) && !change.Item3)
            {
                ScriptMessage(codeName + "\n" + change.Item1);
            }
        }

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    // foreach (var codeName in jsonCodeUpdates.Keys) {
    //     GetOrig(codeName);

    //     foreach (var change in jsonCodeUpdates[codeName])
    //     {
    //         ReplacePart(codeName, Regex.Escape(change["old"]), change["new"]);
    //     }

    //     IncrementProgress();
    //     UpdateProgressValue(GetProgress());
    // }

});
#endregion

#region Внедрение спрайтов и звуков


var jsonSpritesAssigned = new Dictionary<string, string>();
var jsonObjSprDraws = new Dictionary<string, List <string>>();
var jsonRooms = new Dictionary<string, List<Dictionary<string, string>>>();
var jsonObjSounds = new Dictionary<string, List <string>>();

if (File.Exists(scriptFolder + "ObjectsWithAssignedSprites.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "ObjectsWithAssignedSprites.json");
    string json = r.ReadToEnd();
    jsonSpritesAssigned = JsonSerializer.Deserialize<Dictionary<string, string>>(json);
}
if (File.Exists(scriptFolder + "CodesWithSprites.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "CodesWithSprites.json");
    string json = r.ReadToEnd();
    jsonObjSprDraws = JsonSerializer.Deserialize<Dictionary<string, List<string>>>(json);
}
if (File.Exists(scriptFolder + "RoomsWithBacksLayers.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "RoomsWithBacksLayers.json");
    string json = r.ReadToEnd();
    jsonRooms = JsonSerializer.Deserialize<Dictionary<string, List<Dictionary<string, string>>>>(json);
}
if (File.Exists(scriptFolder + "CodesWithSounds.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "CodesWithSounds.json");
    string json = r.ReadToEnd();
    jsonObjSounds = JsonSerializer.Deserialize<Dictionary<string, List<string>>>(json);
}

maxCount = jsonObjSprDraws.Count + jsonSpritesAssigned.Count + jsonRooms.Count + jsonObjSounds.Count;
await Task.Run(() =>
{
    SetProgressBar(null, "Sprites and sounds injecting", 0, maxCount);

    foreach (var code in jsonObjSprDraws)
    {
        GetOrig(code.Key);
        foreach (var spr in code.Value)
        {
            if (!ReplacePart(code.Key, spr, string.Format("scr_84_get_sprite(\"{0}\")", spr), true)) // scr_84_get_sprite
            {
                ScriptMessage(string.Format("Ошибка при добавлении спрайта \"{0}\" в \"{1}\".", spr, code.Key));
            }
        }

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var obj in jsonSpritesAssigned)
    {
        if (Data.Code.ByName("gml_Object_" + obj.Key + "_Create_0") == null)
        {
            AddNewEvent(obj.Key, EventType.Create, 0,
            string.Format("event_inherited();\nif (sprite_index == {0}) sprite_index = scr_84_get_sprite(\"{0}\");", obj.Value));
        }
        else
        {
            GetOrig("gml_Object_" + obj.Key + "_Create_0");
            AppendToStart("gml_Object_" + obj.Key + "_Create_0",
            string.Format("if (sprite_index == {0}) sprite_index = scr_84_get_sprite(\"{0}\");", obj.Value));
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
});

// Добавление спрайтов

var jsonNewSprites = new Dictionary<string, Dictionary<string, int>>();
if (File.Exists(scriptFolder + "new_sprites.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "new_sprites.json");
    string json = r.ReadToEnd();
    jsonNewSprites = JsonSerializer.Deserialize<Dictionary<string, Dictionary<string, int>>>(json);
}

foreach (var spr in jsonNewSprites)
{
    var newSprite = Data.Sprites.ByName(spr.Key);
    if (newSprite is null) {
        newSprite = new();
        newSprite.Name = Data.Strings.MakeString(spr.Key);
        Data.Sprites.Add(newSprite);
    }

    if (spr.Value.ContainsKey("width"))
    {
        newSprite.Width = (uint)spr.Value["width"];
        newSprite.MarginRight = spr.Value["width"] - 1;
        newSprite.MarginLeft = 0;

        newSprite.Height = (uint)spr.Value["height"];
        newSprite.MarginBottom = spr.Value["height"] - 1;
        newSprite.MarginTop = 0;

        newSprite.CollisionMasks.Clear();
        newSprite.CollisionMasks.Add(newSprite.NewMaskEntry());
    }
    
    if (spr.Value.ContainsKey("origin_x"))
    {
        newSprite.OriginX = spr.Value["origin_x"];
    }
    
    if (spr.Value.ContainsKey("origin_y"))
    {
        newSprite.OriginY = spr.Value["origin_y"];
    }

    if (spr.Value.ContainsKey("frames_num"))
    {
        var r_frames = spr.Value["frames_num"];
        if (r_frames < newSprite.Textures.Count) {
            while (newSprite.Textures.Count > r_frames) {
                newSprite.Textures.RemoveAt(newSprite.Textures.Count - 1);
            }
            // newSprite.Textures.RemoveRange(r_frames, newSprite.Textures.Count - r_frames);
            } else {
            var c = newSprite.Textures.Count;
            for (int i = c; i < spr.Value["frames_num"]; i++)
                newSprite.Textures.Add(new UndertaleSprite.TextureEntry());
        }
    }
}


#endregion

#region Замена шрифтов


var jsonFonts = new Dictionary<string, List<string>>();

if (File.Exists(scriptFolder + "CodesWithFonts.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "CodesWithFonts.json");
    string json = r.ReadToEnd();
    jsonFonts = JsonSerializer.Deserialize<Dictionary<string, List<string>>>(json);
}

maxCount = Math.Max(1, jsonFonts.Sum(e => e.Value.Count));
await Task.Run(() =>
{
    SetProgressBar(null, "Fonts injecting", 0, maxCount);

    foreach (var font in jsonFonts)
    {
        foreach (var scr in font.Value)
        {
            GetOrig(scr);
            ReplacePart(scr, font.Key, "scr_84_get_font(\"" + font.Key.Substring(4) + "\")", true);
            IncrementProgress();
            UpdateProgressValue(GetProgress());
        }
    }

    foreach (var font in Data.Fonts)
    {
        if (font.Name.ToString().Contains("_ja_"))
        {
            font.Name.Content = font.Name.ToString().Trim(new char[] { '"' }).Replace("_ja_", "_") + "_ja";
        }
    }
});

#endregion

