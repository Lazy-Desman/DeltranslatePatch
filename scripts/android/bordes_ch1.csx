using System;
using System.Collections.Generic;
using System.IO;
using UndertaleModLib.Util;

EnsureDataLoaded();

if (Data?.GeneralInfo?.DisplayName?.Content.ToLower() != "deltarune chapter 1")
{
    ScriptError("Error : Not a Deltarune CH1 data.win file");
    return;
}

string bordersPath = Path.Combine(Path.GetDirectoryName(ScriptPath), "Borders/chapter1");

Dictionary<string, UndertaleEmbeddedTexture> textures = new();
if (!Directory.Exists(bordersPath))
{
    throw new ScriptException("Border textures not found??");
}

int lastTextPage = Data.EmbeddedTextures.Count - 1;
int lastTextPageItem = Data.TexturePageItems.Count - 1;

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

AssignBorderBackground("bg_border_line_1080", textures["bg_border_line_1080.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_dark", textures["border_dark.png"], 2, 2, 1920, 1080);
AssignBorderBackground("border_light", textures["border_light.png"], 2, 2, 1920, 1080);

ScriptMessage("Texturas de bordes e imágenes importadas correctamente :3");