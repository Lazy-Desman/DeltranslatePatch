#load "../BaseFix.csx"

using System.Threading;
using System.Threading.Tasks;

#region Отрисовка доп. спрайтов в контроллере

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

var sprites = new List<string>();
var sprites_ids = new Dictionary<string, string>();

if (File.Exists(scriptFolder + "sprites.json"))
{
    using StreamReader r = new StreamReader(scriptFolder + "sprites.json");
    string json = r.ReadToEnd();
    sprites = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, List<string>>>(json)["sprites"];
    foreach (var spr in sprites)
    {
        sprites_ids[Data.Sprites.IndexOf(Data.Sprites.ByName(spr)).ToString()] = spr;
    }
}

maxCount = scriptsWithTennaSpriteCall.Count;
await Task.Run(() =>
{
    SetProgressBar(null, "Codes with Tenna sprite replacing", 0, maxCount);

    foreach (var codeName in scriptsWithTennaSpriteCall)
    {
        GetOrig(codeName);
        
        var text = Decompile(codeName);
        Regex rx = new Regex(@"c_tenna_sprite\((.*?)\)");
        text = rx.Replace(text, new MatchEvaluator((match) => {
            var id = match.Groups[1].Value;
            if (sprites_ids.ContainsKey(id)) {
                return "c_tenna_sprite(scr_84_get_sprite(\"" + sprites_ids[id] + "\"));";
            } else if (sprites.Contains(id)) {
                return "c_tenna_sprite(scr_84_get_sprite(\"" + id + "\"));";
            } else {
                return match.Groups[0].Value;
            }
        }));
        ReplaceGML(codeName, text);

        IncrementProgress();
        UpdateProgressValue(GetProgress());
    }
});


#endregion

await SaveEntries();
