using System;
using System.Collections.Generic;
using System.IO;
using UndertaleModLib.Util;

EnsureDataLoaded();

if (Data?.GeneralInfo?.DisplayName?.Content.ToLower() != "deltarune chapter 5")
{
    ScriptError("Error : Not a Deltarune CH5 data.win file");
    return;
}

string bordersPath = Path.Combine(Path.GetDirectoryName(ScriptPath), "../Borders/chapter5");

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

Action<string, UndertaleEmbeddedTexture, ushort, ushort, ushort, ushort, ushort, ushort, ushort, ushort, ushort, ushort> AssignBorderBackground = (name, tex, x, y, SourceWidth, SourceHeight, tarX, tarY, tarWidth, tarHeight, BoundingWidth, BoundingHeight) =>
{
    var bg = Data.Sprites.ByName(name);
    if (bg is null)
    {
        ScriptError(name + " not found!");
        return;
    }
    UndertaleTexturePageItem tpag = new UndertaleTexturePageItem();
    tpag.Name = new UndertaleString($"PageItem {++lastTextPageItem}");
    tpag.SourceX = x; tpag.SourceY = y; 
    tpag.SourceWidth = SourceWidth; tpag.SourceHeight = SourceHeight;
    tpag.TargetX = tarX; tpag.TargetY = tarY; 
    tpag.TargetWidth = tarWidth; tpag.TargetHeight = tarHeight;
    tpag.BoundingWidth = BoundingWidth; tpag.BoundingHeight = BoundingHeight;
    tpag.TexturePage = tex;
    Data.TexturePageItems.Add(tpag);
    bg.Textures[0].Texture = tpag;
};

AssignBorderBackground("border_lw_town_morning", textures["border_lw_town_morning.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_castle_left", textures["border_dw_castle_left.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_castle_cafe", textures["border_dw_castle_cafe.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_garden_cliff_bottom", textures["border_dw_garden_cliff_bottom.png"], 2, 2, 1920, 1350, 0, 0, 1920, 1350, 1920, 1350);
AssignBorderBackground("border_dw_garden", textures["border_dw_garden.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_castle_right", textures["border_dw_castle_right.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_garden_cliff_frame", textures["border_dw_garden_cliff_bottom_frame.png"], 2, 1023, 1337, 1017, 292, 32, 1337, 1017, 1920, 1080);
AssignBorderBackground("border_lw_town_sunset", textures["border_lw_town_sunset.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_garden_cliff_lattice", textures["border_dw_castle_cafe.png"], 2, 1086, 1864, 852, 28, 199, 1864, 852, 1920, 1350);
AssignBorderBackground("border_dw_pink_alt", textures["border_dw_pink_alt.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_garden_cliff_lattice_bottom", textures["border_dw_garden_cliff.png"], 1946, 2, 1, 1, 0, 0, 1, 1, 1920, 1350);
AssignBorderBackground("border_line_1080", textures["border_line_1080.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_lw_town", textures["border_lw_town.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_castletown", textures["border_dw_castletown.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_castle_top", textures["border_dw_castle_top.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_pink", textures["border_dw_pink.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_garden_cliff_bottom_frame", textures["border_dw_garden_cliff_bottom_frame.png"], 2, 2, 1337, 1017, 292, 32, 1337, 1017, 1920, 1080);
AssignBorderBackground("border_dw_castle_right_gold", textures["border_dw_castle_right_gold.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_lw_town_night", textures["border_lw_town_night.png"], 2, 2, 1920, 1080, 0, 0, 1920, 1080, 1920, 1080);
AssignBorderBackground("border_dw_garden_cliff", textures["border_dw_garden_cliff.png"], 2, 2, 1920, 1350, 0, 0, 1920, 1350, 1920, 1350);

ScriptMessage("- Border textures and images imported correctly");