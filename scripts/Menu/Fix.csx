using UndertaleModLib.Util;
using System.Text.Json;
using System.Linq;
using System.Text;
using System.IO;
using System;
using System.Text.RegularExpressions;

string gameFolder = Path.GetDirectoryName(FilePath) + Path.DirectorySeparatorChar;
string scriptFolder = Path.GetDirectoryName(ScriptPath) + Path.DirectorySeparatorChar;

void SaveDataFile() {
    Console.WriteLine(FilePath);
    using (FileStream fs = new(FilePath, FileMode.Create, FileAccess.Write))
    {
        UndertaleIO.Write(fs, Data);
    }
}

var globalDecompileContext = new GlobalDecompileContext(Data);

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

void ReplaceGML(UndertaleCode code, string text) {
    CompileGroup group = new(Data);
    group.QueueCodeReplace(code, text);
    group.Compile();
}

void AddNewEvent(UndertaleGameObject obj, EventType evType, uint evSubtype, string codeGML) {
    ReplaceGML(obj.EventHandlerFor(evType, evSubtype, Data), codeGML);
}

void AddNewEvent(string objName, EventType evType, uint evSubtype, string codeGML) {
    AddNewEvent(Data.GameObjects.ByName(objName), evType, evSubtype, codeGML);
}

#region Считывание кусков кода

var codeEntrs = new List <(string, string)>();
foreach (string fileName in Directory.GetFiles(scriptFolder + "CodeEntries")) {
    var codeName = Path.GetFileNameWithoutExtension(fileName);
    codeEntrs.Add((codeName, File.ReadAllText(fileName)));
    if (codeName.Contains("GlobalScript") && Data.Code.ByName(codeName) == null) {
        CreateBlankFunction(codeName.Substring(17));
    }
}

#endregion


#region Менюшка настроек

var obj_lang_settings = Data.GameObjects.ByName("obj_lang_settings");
if (obj_lang_settings == null) {
    obj_lang_settings = new UndertaleGameObject();
    obj_lang_settings.Name = Data.Strings.MakeString("obj_lang_settings");
    Data.GameObjects.Add(obj_lang_settings);
    AddNewEvent(obj_lang_settings, EventType.Create, 0, "");
    AddNewEvent(obj_lang_settings, EventType.Step, 0, "");
    AddNewEvent(obj_lang_settings, EventType.Draw, 0, "");
}

#endregion

#region Замена кусков кода

foreach (var code in codeEntrs) {
    // GetOrig(code.Item1);
    // ScriptMessage(code.Item1);
    // Data.Code.ByName(code.Item1).ReplaceGML(code.Item2, Data);
    ReplaceGML(Data.Code.ByName(code.Item1), code.Item2);
}

#endregion

#region Замена шрифтов

foreach(var font in Data.Fonts) {
    if (font.Name.ToString().Contains("_ja_")) {
        font.Name.Content = font.Name.ToString().Trim(new char[] {'"'}).Replace("_ja_", "_") + "_ja";
    }
}



#endregion


SaveDataFile()