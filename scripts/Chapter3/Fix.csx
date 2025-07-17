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

#region Замена шрифтов
var scriptsWith8bit = new List<string>()
{
"gml_GlobalScript_scr_shop_space_display",
"gml_Object_obj_b2s_northernlightsroom_Draw_0",
"gml_Object_obj_b2westshop_Draw_0",
"gml_Object_obj_board_grayregion_Draw_0",
"gml_Object_obj_board_scoreboard_Draw_0",
"gml_Object_obj_chefs_game_Draw_0",
"gml_Object_obj_dw_gameshow_screen_Draw_0",
"gml_Object_obj_dw_points_get_display_Draw_0",
"gml_Object_obj_dw_teevie_tvtest_Draw_0",
"gml_Object_obj_gameshow_battlemanager_Draw_0",
"gml_Object_obj_gameshow_swordroute_Other_10",
"gml_Object_obj_gameshow_ui_scorebox_Draw_0",
"gml_Object_obj_GSA02_B0_Draw_0",
"gml_Object_obj_quizsequence_Draw_0",
"gml_Object_obj_round_evaluation_Draw_0",
"gml_Object_obj_susiezilla_perfect_chain_letter_Draw_0",
"gml_Object_obj_swordroute_consolestarter_Draw_0",
};

var scriptsWithMainBig = new List<string>()
{
"gml_Object_obj_board_spinner_Draw_0",
"gml_Object_obj_ch3_GSC05_susiezilla_tutorial_Draw_0",
"gml_Object_obj_chefs_customer_Draw_0",
"gml_Object_obj_chefs_scoretxt_Draw_0",
"gml_Object_obj_chefs_toggles_Draw_0",
"gml_Object_obj_darkcontroller_Draw_0",
"gml_Object_obj_elnina_bouncingbullet_Draw_0",
"gml_Object_obj_fusionmenu_Draw_0",
"gml_Object_obj_gif_analyzer_Draw_0",
"gml_Object_obj_intro_ch2_Draw_0",
"gml_Object_obj_intro_ch3_Draw_0",
"gml_Object_obj_rouxls_annyoing_dog_controller_Draw_0",
"gml_Object_obj_savemenu_Draw_0",
"gml_Object_obj_shootout_controller_Draw_64",
"gml_Object_obj_soundtester_Draw_0",
"gml_Object_obj_spritecomparer_Draw_0",
"gml_Object_obj_tenna_enemy_minigametext_Draw_0",
"gml_Object_obj_tenna_minigame_ui_Draw_0",
"gml_Object_obj_title_placeholder_Draw_0"
};

var scriptsWithMain = new List<string>()
{
"gml_GlobalScript_scr_board_objname",
"gml_GlobalScript_scr_rhythmgame_draw",
"gml_GlobalScript_scr_shop_space_display",
"gml_Object_DEVICE_MENU_Draw_0",
"gml_Object_obj_board_quizwheel_Draw_0",
"gml_Object_obj_board_wheel_Draw_0",
"gml_Object_obj_dw_chef_screen_empty_Draw_0",
"gml_Object_obj_dw_countdown_Draw_0",
"gml_Object_obj_dw_ranking_hub_sign_Draw_0",
"gml_Object_obj_dw_teevie_susiezilla_Draw_0",
"gml_Object_obj_elnina_lanino_controller_Draw_0",
"gml_Object_obj_elnina_lanino_rematch_controller_Draw_0",
"gml_Object_obj_gameshow_nameentry_Draw_0",
"gml_Object_obj_podium_Draw_0",
"gml_Object_obj_shootout_controller_Draw_64",
"gml_Object_obj_shootout_text_Draw_0",
"gml_Object_obj_snd_maker_Draw_0",
"gml_Object_obj_soundtester_Draw_0",
"gml_Object_obj_tenna_minigame_ui_Draw_0",
"gml_Object_obj_time_Draw_64",
"gml_Object_obj_title_placeholder_Draw_0",
"gml_Object_obj_umbrella_tv_Draw_0"
};

var scriptsWithDotumche = new List<string>()
{
"gml_Object_obj_couchwriter_Draw_0",
"gml_Object_obj_fusionmenu_Draw_0",
"gml_Object_obj_tennatalkbubble_Draw_0"
};

var scriptsWithSmall = new List<string>()
{
"gml_GlobalScript_scr_board_objname",
"gml_Object_obj_b2_ninfriendo_wiremanagement_Draw_73",
"gml_Object_obj_board_swordroute_loop_counter_Draw_0",
"gml_Object_obj_bullettester_enemy_Draw_0",
"gml_Object_obj_bullettester_enemy_new_Draw_0",
"gml_Object_obj_caterpillar_board_Draw_64",
"gml_Object_obj_gameshow_swordroute_Other_10",
"gml_Object_obj_mainchara_board_Draw_0",
"gml_Object_obj_mainchara_Draw_0",
"gml_Object_obj_overworldc_Draw_0",
"gml_Object_obj_pushableblock_board_Draw_0",
"gml_Object_obj_room_console_room_Draw_0",
"gml_Object_obj_soundtester_Draw_0",
"gml_Object_obj_title_placeholder_Draw_0",
"gml_Object_obj_treasure_room_Draw_0"
};

var scriptsWithComicSans = new List<string>()    
{
    "gml_Object_obj_susiezilla_singlescreen_hud_score_Draw_0",
    "gml_Object_obj_susiezilla_singlescreen_hud_time_counter_Draw_0",
    "gml_Object_obj_susiezilla_singlescreen_shadowguy_laser_machine_Draw_0",
    "gml_Object_obj_susiezilla_singlescreen_shadowguy_parent_Draw_73"
};

maxCount = scriptsWith8bit.Count + scriptsWithMainBig.Count + scriptsWithMain.Count + scriptsWithDotumche.Count + scriptsWithSmall.Count + scriptsWithComicSans.Count;
await Task.Run(() =>
{
    SetProgressBar(null, "Fonts injecting", 0, maxCount);

    foreach (var scr in scriptsWith8bit)
    {
        GetOrig(scr);
        ReplacePart(scr, "fnt_8bit", "scr_84_get_font(\"8bit\")");
        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var scr in scriptsWithMainBig)
    {
        GetOrig(scr);
        ReplacePart(scr, "fnt_mainbig", "scr_84_get_font(\"mainbig\")");
        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var scr in scriptsWithMain)
    {
        GetOrig(scr);
        ReplacePart(scr, "fnt_main", "scr_84_get_font(\"main\")");
        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var scr in scriptsWithDotumche)
    {
        GetOrig(scr);
        ReplacePart(scr, "fnt_dotumche", "scr_84_get_font(\"dotumche\")");
        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var scr in scriptsWithSmall)
    {
        GetOrig(scr);
        ReplacePart(scr, "fnt_small", "scr_84_get_font(\"small\")");
        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }

    foreach (var scr in scriptsWithComicSans)
    {
        GetOrig(scr);
        ReplacePart(scr, "fnt_comicsans", "scr_84_get_font(\"comicsans\")");
        IncrementProgress();
        UpdateProgressValue(GetProgress());
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
    if (scr_84_get_sprite(""spr_dw_tv_word_poster"") != -1) {
        if (room == room_dw_teevie_intro)
        {
            n = scr_marker(40 * 9, 40 * 1, scr_84_get_sprite(""spr_dw_tv_word_poster""))
            n.depth = 1000000 - 1
        }
        if (room == room_dw_teevie_large_01)
        {
            n = scr_marker(26 * 40, 5 * 40, scr_84_get_sprite(""spr_dw_tv_word_poster""))
            n.depth = 1000096 - 1
            n = scr_marker(40 * 40, 1 * 40, scr_84_get_sprite(""spr_dw_tv_word_poster""))
            n.depth = 1000096 - 1
        }
    }
    if (scr_84_get_sprite(""spr_board_shop"") != -1) {
        if (room == room_board_1)
        {
            var n = instance_create_layer(416, 128, ""BOARD_Instances"", obj_board_parent);
            n.sprite_index = scr_84_get_sprite(""spr_board_shop"");
            n.depth = 1000000 - 1
        }
    }
    ";
    foreach (var room in jsonRooms)
    {
        room_code += string.Format("if (room == {0}) {{\n", room.Key);

        foreach (var spr in jsonRooms[room.Key])
        {
            if (spr["type"] == "tile")
            {
                room_code += $@"    
                var n = scr_marker_animated({spr["x"]}, {spr["y"]}, scr_84_get_sprite(""{spr["sprite"]}""), sprite_get_speed(scr_84_get_sprite(""{spr["sprite"]}"")));
                n.depth = {spr["depth"]} - 1;
                ";
            }
            if (spr["type"] == "sprite")
            {
                room_code += $@"
                var lay_id = layer_get_id(""{spr["layer"]}"");
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


Dictionary<string, Dictionary<string, int>> jsonNewSprites;
using (StreamReader r = new StreamReader(scriptFolder + "new_sprites.json"))
{
    string json = r.ReadToEnd();
    jsonNewSprites = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, Dictionary<string, int>>>(json);
}

foreach (var spr in jsonNewSprites)
{
    if (Data.Sprites.ByName(spr.Key) is null) {
        UndertaleSprite newSprite = new();
        newSprite.Name = Data.Strings.MakeString(spr.Key);
        newSprite.Width = (uint)spr.Value["width"];
        newSprite.Height = (uint)spr.Value["height"];
        newSprite.MarginLeft = 0;
        newSprite.MarginRight = spr.Value["width"] - 1;
        newSprite.MarginTop = 0;
        newSprite.MarginBottom = spr.Value["height"] - 1;
        newSprite.OriginX = spr.Value["origin_x"];
        newSprite.OriginY = spr.Value["origin_y"];
        for (int i = 0; i < spr.Value["frames_num"]; i++)
            newSprite.Textures.Add(new UndertaleSprite.TextureEntry());
        newSprite.CollisionMasks.Add(newSprite.NewMaskEntry());
        Data.Sprites.Add(newSprite);
    }
}

GetOrigSprite("spr_board_lancercactus_help");
Data.Sprites.ByName("spr_board_lancercactus_help").Textures = new UndertaleSimpleList<UndertaleSprite.TextureEntry>{
    Data.Sprites.ByName("spr_board_lancercactus_help").Textures[0]
};

GetOrigSprite("spr_dw_ch3_b3bs_officesign_strip2");
Data.Sprites.ByName("spr_dw_ch3_b3bs_officesign_strip2").Textures = new UndertaleSimpleList<UndertaleSprite.TextureEntry>{
    Data.Sprites.ByName("spr_dw_ch3_b3bs_officesign_strip2").Textures[0]
};

#endregion

#region Прочая говнинка

var scriptsWithTennaSpriteCall = new List<string>()
{
  "gml_Object_obj_ch3_BTB02_Step_0",
  "gml_Object_obj_ch3_BTB03_Step_0",
  "gml_Object_obj_ch3_BTB04_Step_0",
  "gml_Object_obj_ch3_BTB06_Step_0",
  "gml_Object_obj_ch3_closet_Step_0",
  "gml_Object_obj_ch3_GSA01G_Step_0",
  "gml_Object_obj_ch3_GSA02_Step_0",
  "gml_Object_obj_ch3_GSA04_Step_0",
  "gml_Object_obj_ch3_GSA06_Step_0",
  "gml_Object_obj_ch3_GSB01_Step_0",
  "gml_Object_obj_ch3_GSB02_Step_0",
  "gml_Object_obj_ch3_GSB03_Step_0",
  "gml_Object_obj_ch3_GSB05_Step_0",
  "gml_Object_obj_ch3_GSC05_Step_0",
  "gml_Object_obj_ch3_GSC07_Step_0",
  "gml_Object_obj_ch3_GSD01_Step_0",
  "gml_Object_obj_ch3_PTB01_Step_0",
  "gml_Object_obj_ch3_PTB02_Step_0",
  "gml_Object_obj_room_chef_empty_Step_0",       
  "gml_Object_obj_room_rhythm_empty_Step_0",     
  "gml_Object_obj_room_stage_Step_0",
  "gml_Object_obj_room_teevie_bonus_zone_Step_0",
  "gml_Object_obj_room_teevie_large_02_Step_0",  
  "gml_Object_obj_room_teevie_stealth_c_Step_0",
  "gml_Object_obj_victory_chef_Step_0",
  "gml_Object_obj_victory_rhythm_Step_0"
};

var sprites_ids = new Dictionary<string, string>();

using (StreamReader r = new StreamReader(scriptFolder + "sprites_ids.json")) {
    string json = r.ReadToEnd();
    sprites_ids = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, string>>(json);
}

maxCount = scriptsWithTennaSpriteCall.Count;
await Task.Run(() =>
{
    SetProgressBar(null, "Codes with Tenna sprite replacing", 0, maxCount);

    foreach (var codeName in scriptsWithTennaSpriteCall)
    {
        GetOrig(codeName);
        
        var text = Decompile(codeName);
        Regex rx = new Regex(@"c_tenna_sprite\((\d*?)\)");
        text = rx.Replace(text, new MatchEvaluator((match) => {
            var id = match.Groups[1].Value;
            if (sprites_ids.ContainsKey(id)) {
                return "c_tenna_sprite(scr_84_get_sprite(\"" + sprites_ids[id] + "\"));";
            } else
                return match.Groups[0].Value;
        }));
        ReplaceGML(codeName, text);

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }
});


#endregion
