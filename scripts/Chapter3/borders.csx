using System;
using System.Collections.Generic;
using System.IO;
using UndertaleModLib.Util;

EnsureDataLoaded();

if (Data?.GeneralInfo?.DisplayName?.Content.ToLower() != "deltarune chapter 3")
{
    ScriptError("Error : Not a Deltarune CH3 data.win file");
    return;
}

string bordersPath = Path.Combine(Path.GetDirectoryName(ScriptPath), "../../borders/chapter3");

Dictionary<string, UndertaleEmbeddedTexture> textures = new();
if (!Directory.Exists(bordersPath))
{
    throw new ScriptException("Border textures not found??");
}

int lastTextPage = Data.EmbeddedTextures.Count - 1;
int lastTextPageItem = Data.TexturePageItems.Count - 1;
// shared borders
foreach (var path in Directory.EnumerateFiles(Path.Join(bordersPath, "..")))
{
    UndertaleEmbeddedTexture newtex = new UndertaleEmbeddedTexture();
    newtex.Name = new UndertaleString($"Texture {++lastTextPage}");
    newtex.TextureData.Image = GMImage.FromPng(File.ReadAllBytes(path));
    Data.EmbeddedTextures.Add(newtex);
    textures.Add(Path.GetFileName(path), newtex);
}
// chapter exclusive borders
foreach (var path in Directory.EnumerateFiles(bordersPath))
{
    UndertaleEmbeddedTexture newtex = new UndertaleEmbeddedTexture();
    newtex.Name = new UndertaleString($"Texture {++lastTextPage}");
    newtex.TextureData.Image = GMImage.FromPng(File.ReadAllBytes(path));
    Data.EmbeddedTextures.Add(newtex);
    textures.Add(Path.GetFileName(path), newtex);
}

Action<string, UndertaleEmbeddedTexture, ushort, ushort, ushort, ushort> AssignBorderBackground = (name, tex, x, y, width, height) =>
{
    var bg = Data.Sprites.ByName(name);
    if (bg is null)
    {
        ScriptError(name + " not found!");
        return;
    }
    UndertaleTexturePageItem tpag = new UndertaleTexturePageItem();
    tpag.Name = new UndertaleString($"PageItem {++lastTextPageItem}");
    tpag.SourceX = x; tpag.SourceY = y; tpag.SourceWidth = width; tpag.SourceHeight = height;
    tpag.TargetX = 0; tpag.TargetY = 0; tpag.TargetWidth = width; tpag.TargetHeight = height;
    tpag.BoundingWidth = width; tpag.BoundingHeight = height;
    tpag.TexturePage = tex;
    Data.TexturePageItems.Add(tpag);
    bg.Textures[0].Texture = tpag;
};

AssignBorderBackground("border_dw_tv_meta", textures["border_dw_tv_meta.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_tv_black", textures["border_dw_tv_black.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_green_room", textures["border_dw_green_room.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_word", textures["border_dw_word.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_teevie", textures["border_dw_teevie.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_red_smiles", textures["border_dw_red_smiles.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_blue_light", textures["border_dw_blue_light.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_green_sloppy_z", textures["border_dw_green_sloppy_z.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_blue_stars", textures["border_dw_blue_stars.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_lw_town_night", textures["border_lw_town_night.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_tv_blue", textures["border_dw_tv_blue.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_line_1080", textures["border_line_1080.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_lw_town", textures["border_lw_town.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_castletown", textures["border_dw_castletown.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_blue", textures["border_dw_blue.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dw_green_sloppy", textures["border_dw_green_sloppy.png"], 2, 2, 1920, 1080);

var markerFuncName = "borders_added";
var markerCodeName = "gml_GlobalScript_" + markerFuncName;
var markerCode = Data.Code.ByName(markerCodeName);

if (markerCode == null)
{
    CodeImportGroup importGroup = new CodeImportGroup(Data);
    importGroup.QueueReplace(markerCodeName, "return true;");
    importGroup.Import();

    markerCode = Data.Code.ByName(markerCodeName);

    if (Data.Scripts.ByName(markerFuncName) == null)
    {
        Data.Scripts.Add(new UndertaleScript
        {
            Name = Data.Strings.MakeString(markerFuncName),
            Code = markerCode
        });
    }

    if (Data.Functions?.ByName(markerFuncName) == null && Data.Functions is not null)
    {
        Data.Functions.Add(new UndertaleFunction
        {
            Name = Data.Strings.MakeString(markerFuncName)
        });
    }
}

ScriptMessage("- Border textures and images imported correctly");