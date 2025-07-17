function scr_credit(arg0, arg1, arg2 = 1) constructor
{
    header = arg0;
    text_line = arg1;
    columns = arg2;
}

function generate_credits()
{
    var credits = [];
    credits[0] = [
        new scr_credit([
            stringsetloc("-Main Artist-", "scr_credit_slash_scr_credit_gml_18_0"), 
            stringsetloc("-Main Animator-", "scr_credit_slash_scr_credit_gml_19_0")
        ], [
            stringsetloc("Temmie Chang", "scr_credit_slash_scr_credit_gml_20_0")
        ])
    ];
    credits[1] = [
        new scr_credit([
            stringsetloc("-Main Team-", "scr_credit_slash_scr_credit_gml_29_0")
        ], [
            stringsetloc("Sarah O'Donnell", "scr_credit_slash_scr_credit_gml_30_0"), 
            stringsetloc("Taxiderby", "scr_credit_slash_scr_credit_gml_31_0"), 
            stringsetloc("Fred Wood", "scr_credit_slash_scr_credit_gml_32_0"), 
            stringsetloc("Jean Canellas", "scr_credit_slash_scr_credit_gml_33_0"), 
            stringsetloc("AlexMdle", "scr_credit_slash_scr_credit_gml_34_0"), 
            stringsetloc("PureQuestion", "scr_credit_slash_scr_credit_gml_35_0"), 
            stringsetloc("Robert Sephazon (Producer)", "scr_credit_slash_scr_credit_gml_38_0")
        ])
    ];
    credits[2] = [
        new scr_credit([
            stringsetloc("-BG Concept Art-", "scr_credit_slash_scr_credit_gml_44_0")
        ], [
            stringsetloc("(Original Board 1,2,3 Concept)", "scr_credit_slash_scr_credit_gml_47_0"), 
            stringsetloc("Gigi DG", "scr_credit_slash_scr_credit_gml_48_0"), 
            stringsetloc("(Teevie World)", "scr_credit_slash_scr_credit_gml_49_0"), 
            stringsetloc("Tcheska Lynn B (chess)", "scr_credit_slash_scr_credit_gml_50_0")
        ]), 
        new scr_credit([
            stringsetloc("-Costume Design-", "scr_credit_slash_scr_credit_gml_54_0")
        ], [
            stringsetloc("Gigi DG", "scr_credit_slash_scr_credit_gml_57_0")
        ])
    ];
    credits[3] = [
        new scr_credit([
            stringsetloc("-Guest Character Design-", "scr_credit_slash_scr_credit_gml_64_0")
        ], [
            stringsetloc("(Lancer, Rudinn, Hathy)", "scr_credit_slash_scr_credit_gml_67_0"), 
            stringsetloc("(Clover, King, Jevil)", "scr_credit_slash_scr_credit_gml_68_0"), 
            stringsetloc("Kanotynes", "scr_credit_slash_scr_credit_gml_69_0")
        ]), 
        new scr_credit([
            stringsetloc("-Singing This Song-", "scr_credit_slash_scr_credit_gml_73_0")
        ], [
            stringsetloc("Laura Shigihara", "scr_credit_slash_scr_credit_gml_74_0")
        ])
    ];
    credits[4] = [
        new scr_credit([
            stringsetloc("-Guest Character Design-", "scr_credit_slash_scr_credit_gml_83_0")
        ], [
            stringsetloc("(Lanino, Elnina)", "scr_credit_slash_scr_credit_gml_86_0"), 
            stringsetloc("NELNAL", "scr_credit_slash_scr_credit_gml_87_0")
        ]), 
        new scr_credit([
            stringsetloc("-Photoshop Edits & Weird Anim-", "scr_credit_slash_scr_credit_gml_98_0")
        ], [
            stringsetloc("Everdraed", "scr_credit_slash_scr_credit_gml_99_0")
        ])
    ];
    credits[5] = [
        new scr_credit([
            stringsetloc("-Pixel Art Assistance-", "scr_credit_slash_scr_credit_gml_108_0")
        ], [
            stringsetloc("Samanthuel Gillson (splendidland)", "scr_credit_slash_scr_credit_gml_109_0"), 
            stringsetloc("Shawn (puppiesandanime)", "scr_credit_slash_scr_credit_gml_110_0"), 
            stringsetloc("Kenju", "scr_credit_slash_scr_credit_gml_111_0"), 
            stringsetloc("Tcheska Lynn B (chess)", "scr_credit_slash_scr_credit_gml_112_0"), 
            stringsetloc("Satoshi Maruyama", "scr_credit_slash_scr_credit_gml_113_0")
        ]), 
        new scr_credit([
            stringsetloc("-Development Tools (Cool)-", "scr_credit_slash_scr_credit_gml_119_0")
        ], [
            stringsetloc("Juju Adams", "scr_credit_slash_scr_credit_gml_120_0")
        ])
    ];
    credits[6] = [
        new scr_credit([
            stringsetloc("-3D Assets, Anim, Posing-", "scr_credit_slash_scr_credit_gml_129_0")
        ], [
            stringsetloc("Chelsea Saunders (pixelatedcrown)", "scr_credit_slash_scr_credit_gml_130_0")
        ]), 
        new scr_credit([
            stringsetloc("-3D Tenna Pixel Cleanup-", "scr_credit_slash_scr_credit_gml_136_0")
        ], [
            stringsetloc("Clairevoire", "scr_credit_slash_scr_credit_gml_137_0")
        ]), 
        new scr_credit([
            stringsetloc("-Cutscene Assistance-", "scr_credit_slash_scr_credit_gml_143_0")
        ], [
            stringsetloc("Tcheska Lynn B (chess)", "scr_credit_slash_scr_credit_gml_144_0")
        ])
    ];
    credits[7] = [
        new scr_credit([
            stringsetloc("-Chef Minigame Program-", "scr_credit_slash_scr_credit_gml_153_0")
        ], [
            stringsetloc("ondydev", "scr_credit_slash_scr_credit_gml_154_0")
        ]), 
        new scr_credit([
            stringsetloc("-Cowboy Program & Other Detail-", "scr_credit_slash_scr_credit_gml_160_0")
        ], [
            stringsetloc("James Begg", "scr_credit_slash_scr_credit_gml_161_0")
        ]), 
        new scr_credit([
            stringsetloc("-Tenna VHS Final Scene Assist-", "scr_credit_slash_scr_credit_gml_167_0")
        ], [
            stringsetloc("Smallbu Animation", "scr_credit_slash_scr_credit_gml_168_0")
        ]), 
        new scr_credit([
            stringsetloc("-Additional Puzzle Design-", "scr_credit_slash_scr_credit_gml_174_0")
        ], [
            stringsetloc("NamaTakahashi", "scr_credit_slash_scr_credit_gml_175_0")
        ])
    ];

    var translators_credits = get_chapter_lang_setting("translators_credits", json_parse("[[{\"header\": [\"-Japanese Localization-\"],\"text_line\": [\"8-4, Ltd.\"],\"columns\": 1},{\"header\": [\"-Translator-\"],\"text_line\": [\"Keiko Fukuichi\"],\"columns\": 1}],[{\"header\": [\"-Localization Producers-\"],\"text_line\": [\"Tina Carter\", \"John Ricciardi\"],\"columns\": 1},{\"header\": [\"-Localization Support-\"],\"text_line\": [\"Hiroyuki Matsushita\", \"Yutaka Ohbuchi\", \"Sami Ragone\", \"Alissa Staples\", \"JP Wentz\"],\"columns\": 1}]]"))
    // TODO своим заполнить
    credits[8] = translators_credits[0];
    credits[9] = translators_credits[1];


    credits[10] = [
        new scr_credit([
            stringsetloc("-Platform Programming-", "scr_credit_slash_scr_credit_gml_207_0")
        ], [
            stringsetloc("Sarah O'Donnell", "scr_credit_slash_scr_credit_gml_208_0"), 
            stringsetloc("Henri Beeres (Enjl)", "scr_credit_slash_scr_credit_gml_209_0")
        ]), 
        new scr_credit([
            stringsetloc("-Programming Support-", "scr_credit_slash_scr_credit_gml_214_0")
        ], [
            stringsetloc("Gregg Tavares", "scr_credit_slash_scr_credit_gml_215_0")
        ]), 
        new scr_credit([
            stringsetloc("-Japanese Graphics-", "scr_credit_slash_scr_credit_gml_221_0")
        ], [
            stringsetloc("256graph", "scr_credit_slash_scr_credit_gml_222_0"), 
            stringsetloc("Satoshi Maruyama", "scr_credit_slash_scr_credit_gml_223_0")
        ])
    ];
    credits[11] = [
        new scr_credit([
            stringsetloc("-QA-", "scr_credit_slash_scr_credit_gml_231_0"), 
            stringsetloc("DIGITAL HEARTS Co., Ltd.", "scr_credit_slash_scr_credit_gml_234_0")
        ], [
            stringsetloc("Yoshikazu Hironaka", "scr_credit_slash_scr_credit_gml_235_0"), 
            stringsetloc("Riku Shimizu", "scr_credit_slash_scr_credit_gml_236_0"), 
            stringsetloc("Akira Ishiki", "scr_credit_slash_scr_credit_gml_237_0"), 
            stringsetloc("Hidemi Miyauchi", "scr_credit_slash_scr_credit_gml_238_0"), 
            stringsetloc("Kazutaka Kawahara", "scr_credit_slash_scr_credit_gml_239_0"), 
            stringsetloc("Yuta Nishimura", "scr_credit_slash_scr_credit_gml_240_0"), 
            stringsetloc("Daisuke Nakaie", "scr_credit_slash_scr_credit_gml_241_0"), 
            stringsetloc("Shinji Yasue", "scr_credit_slash_scr_credit_gml_242_0"), 
            stringsetloc("Taishi Mukaigawara", "scr_credit_slash_scr_credit_gml_243_0"), 
            stringsetloc("Hiromasa Tokida", "scr_credit_slash_scr_credit_gml_244_0"), 
            stringsetloc("Yuki Takeuchi", "scr_credit_slash_scr_credit_gml_245_0"), 
            stringsetloc("Yu Takamori", "scr_credit_slash_scr_credit_gml_246_0"), 
            stringsetloc("Yuta Doi", "scr_credit_slash_scr_credit_gml_247_0"), 
            stringsetloc("Yuki Wada", "scr_credit_slash_scr_credit_gml_248_0"), 
            stringsetloc("Satoru Watanuki", "scr_credit_slash_scr_credit_gml_249_0"), 
            stringsetloc("Monami Katayama", "scr_credit_slash_scr_credit_gml_250_0")
        ], 2)
    ];
    credits[12] = [
        new scr_credit([
            stringsetloc("-Super Tester-", "scr_credit_slash_scr_credit_gml_251_0")
        ], [
            stringsetloc("DruidVorse", "scr_credit_slash_scr_credit_gml_252_0")
        ]), 
        new scr_credit([
            stringsetloc("-Website-", "scr_credit_slash_scr_credit_gml_253_0")
        ], [
            stringsetloc("Brian Coia", "scr_credit_slash_scr_credit_gml_254_0")
        ])
    ];
    credits[13] = [
        new scr_credit([
            stringsetloc("-Trailers & All Video Editing-", "scr_credit_slash_scr_credit_gml_277_0")
        ], [
            stringsetloc("Everdraed", "scr_credit_slash_scr_credit_gml_278_0")
        ]), 
        new scr_credit([
            stringsetloc("-Typography and Logos-", "scr_credit_slash_scr_credit_gml_279_0")
        ], [
            stringsetloc("Audrey Waner", "scr_credit_slash_scr_credit_gml_280_0")
        ])
    ];
    credits[14] = [
        new scr_credit([
            stringsetloc("-Special Thanks-", "scr_credit_slash_scr_credit_gml_281_0")
        ], [
            stringsetloc("Hiroko Minamoto", "scr_credit_slash_scr_credit_gml_288_0"), 
            stringsetloc("Graeme Howard", "scr_credit_slash_scr_credit_gml_289_0"), 
            stringsetloc("Yutaka Sato (Happy Ruika)", "scr_credit_slash_scr_credit_gml_290_0"), 
            stringsetloc("All 8-4 & Fangamer Staff", "scr_credit_slash_scr_credit_gml_293_0"), 
            stringsetloc("Claire & Andrew", "scr_credit_slash_scr_credit_gml_294_0"), 
            stringsetloc("Brian Lee", "scr_credit_slash_scr_credit_gml_295_0"), 
            stringsetloc("YoYo Games", "scr_credit_slash_scr_credit_gml_296_0")
        ])
    ];
    return credits;
}
