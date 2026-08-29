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
        new scr_credit(
            [
                stringsetloc("-Main Artist-", "scr_credit_slash_scr_credit_gml_18_0"),
                stringsetloc("-Main Animator-", "scr_credit_slash_scr_credit_gml_19_0")
            ],
            [
                stringsetloc("Temmie Chang", "scr_credit_slash_scr_credit_gml_20_0")
            ]
        )
    ];
    credits[1] = [
        new scr_credit(
            [
                stringsetloc("-Main Team-", "scr_credit_slash_scr_credit_gml_29_0")
            ],
            [
                stringsetloc("Sarah O'Donnell", "scr_credit_slash_scr_credit_gml_30_0"),
                stringsetloc("Juju (Taxiderby)", "scr_credit_slash_scr_credit_gml_31_0"),
                stringsetloc("Fred Wood", "scr_credit_slash_scr_credit_gml_32_0"),
                stringsetloc("Jean Canellas", "scr_credit_slash_scr_credit_gml_33_0"),
                stringsetloc("AlexMdle", "scr_credit_slash_scr_credit_gml_34_0"),
                stringsetloc("PureQuestion", "scr_credit_slash_scr_credit_gml_35_0")
            ]
        )
    ];
    credits[2] = [
        new scr_credit(
            [
                stringsetloc("-Main Team-", "scr_credit_slash_scr_credit_gml_44_0_b")
            ],
            [
                stringsetloc("Enjl", "scr_credit_slash_scr_credit_gml_45_0"),
                stringsetloc("Joost (waddle)", "scr_credit_slash_scr_credit_gml_46_0"),
                stringsetloc("Sara Spalding (SaraJS)", "scr_credit_slash_scr_credit_gml_47_0"),
                stringsetloc("Robert Sephazon (Producer)", "scr_credit_slash_scr_credit_gml_48_0"),
                stringsetloc("Andy Brophy", "scr_credit_slash_scr_credit_gml_49_0"),
                stringsetloc("Xan Wetherall", "scr_credit_slash_scr_credit_gml_50_0")
            ]
        )
    ];
    credits[3] = [
        new scr_credit(
            [
                stringsetloc("-Concept Art-", "scr_credit_slash_scr_credit_gml_58_0")
            ],
            [
                stringsetloc("Gigi DG (Susie outfits)", "scr_credit_slash_scr_credit_gml_62_0"),
                stringsetloc("Matt Cummings (Festival)", "scr_credit_slash_scr_credit_gml_63_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Platforming System Development-", "scr_credit_slash_scr_credit_gml_65_0")
            ],
            [
                stringsetloc("ondydev", "scr_credit_slash_scr_credit_gml_66_0"),
                stringsetloc("Enjl", "scr_credit_slash_scr_credit_gml_67_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Guest Bullet Program-", "scr_credit_slash_scr_credit_gml_74_0")
            ],
            [
                stringsetloc("Eebrozgi", "scr_credit_slash_scr_credit_gml_75_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Platforming VFX-", "scr_credit_slash_scr_credit_gml_82_0")
            ],
            [
                stringsetloc("Zu Ehtisham", "scr_credit_slash_scr_credit_gml_83_0")
            ]
        )
    ];
    credits[4] = [
        new scr_credit(
            [
                stringsetloc("-Flowery Intro Animation-", "scr_credit_slash_scr_credit_gml_84_0"),
                stringsetloc("-Director and Storyboard-", "scr_credit_slash_scr_credit_gml_85_0"),
                stringsetloc("-Animation Character Design-", "scr_credit_slash_scr_credit_gml_86_0"),
                stringsetloc("-Key Animation-", "scr_credit_slash_scr_credit_gml_87_0")
            ],
            [
                stringsetloc("Toko Yatabe", "scr_credit_slash_scr_credit_gml_90_0_b")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-In-between Animation-", "scr_credit_slash_scr_credit_gml_95_0_b")
            ],
            [
                stringsetloc("Yasuhito Murata", "scr_credit_slash_scr_credit_gml_98_0"),
                stringsetloc("Mayuko Kanosue", "scr_credit_slash_scr_credit_gml_99_0")
            ],
            2
        ),
        new scr_credit(
            [
                stringsetloc("-Color Design-", "scr_credit_slash_scr_credit_gml_103_0"),
                stringsetloc("-Color Coordination Inspection-", "scr_credit_slash_scr_credit_gml_104_0")
            ],
            [
                stringsetloc("Akiko Inoue", "scr_credit_slash_scr_credit_gml_107_0_b")
            ]
        )
    ];
    credits[5] = [
        new scr_credit(
            [
                stringsetloc("-Flowery Intro Animation Cont.-", "scr_credit_slash_scr_credit_gml_114_0"),
                stringsetloc("-Color Clean-up-", "scr_credit_slash_scr_credit_gml_115_0")
            ],
            [
                stringsetloc("Wish", "scr_credit_slash_scr_credit_gml_118_0"),
                stringsetloc("Hikaru Takigawa", "scr_credit_slash_scr_credit_gml_119_0"),
                stringsetloc("Shiho Okamiya", "scr_credit_slash_scr_credit_gml_120_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Color Clean-up Manager-", "scr_credit_slash_scr_credit_gml_125_0")
            ],
            [
                stringsetloc("Kosuke Kobashi", "scr_credit_slash_scr_credit_gml_128_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Backgrounds-", "scr_credit_slash_scr_credit_gml_132_0")
            ],
            [
                stringsetloc("Akane Iwakuma", "scr_credit_slash_scr_credit_gml_135_0")
            ]
        )
    ];
    credits[6] = [
        new scr_credit(
            [
                stringsetloc("-Flowery Intro Animation Cont.-", "scr_credit_slash_scr_credit_gml_142_0_b"),
                stringsetloc("-Backgrounds Manager-", "scr_credit_slash_scr_credit_gml_143_0")
            ],
            [
                stringsetloc("Kaoru Inamura", "scr_credit_slash_scr_credit_gml_146_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Filming-", "scr_credit_slash_scr_credit_gml_151_0_b")
            ],
            [
                stringsetloc("Nanae Hirabayashi", "scr_credit_slash_scr_credit_gml_154_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Animation Producer-", "scr_credit_slash_scr_credit_gml_159_0_b")
            ],
            [
                stringsetloc("Yuki Sugitani", "scr_credit_slash_scr_credit_gml_162_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Production Studio-", "scr_credit_slash_scr_credit_gml_166_0")
            ],
            [
                stringsetloc("studio khara", "scr_credit_slash_scr_credit_gml_169_0")
            ]
        )
    ];
    credits[7] = [
        new scr_credit(
            [
                stringsetloc("-Guest Character Design-", "scr_credit_slash_scr_credit_gml_92_0")
            ],
            [
                stringsetloc("(Terakota & Shinobeetle)", "scr_credit_slash_scr_credit_gml_95_0"),
                stringsetloc("Nelnal", "scr_credit_slash_scr_credit_gml_96_0"),
                stringsetloc("(Netskie)", "scr_credit_slash_scr_credit_gml_97_0"),
                stringsetloc("Hitoshi Ariga", "scr_credit_slash_scr_credit_gml_98_0_b")
            ]
        )
    ];
    var pink_credits = stringsetloc("-Pink Overworld & Face Sprites-", "scr_credit_slash_scr_credit_gml_107_0");
    
    if (scr_flag_get(1846) < 2)
        pink_credits = stringsetloc("-Secret Art-", "scr_credit_slash_scr_credit_gml_110_0");
    
    credits[8] = [
        new scr_credit(
            [
                stringsetloc("-Bromide Art-", "scr_credit_slash_scr_credit_gml_116_0")
            ],
            [
                stringsetloc("Moa", "scr_credit_slash_scr_credit_gml_117_0"),
                stringsetloc("Yukanuntiusel", "scr_credit_slash_scr_credit_gml_118_0_b")
            ]
        ),
        new scr_credit(
            [
                stringset(pink_credits)
            ],
            [
                stringsetloc("Claire Belton", "scr_credit_slash_scr_credit_gml_119_0_b")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Guest Music Arrangement-", "scr_credit_slash_scr_credit_gml_131_0")
            ],
            [
                [
                    stringsetloc("(Garden of Hopes & Dreams)", "scr_credit_slash_scr_credit_gml_130_0")
                ],
                stringsetloc("Carlos \"insaneintherain\" Eiene", "scr_credit_slash_scr_credit_gml_134_0")
            ]
        )
    ];
    var music_credits = stringsetloc("(Cutie Mew Mew Magic)", "scr_credit_slash_scr_credit_gml_139_0");
    
    if (scr_flag_get(1846) < 2)
        music_credits = stringsetloc("(??????)", "scr_credit_slash_scr_credit_gml_142_0");
    
    credits[9] = [
        new scr_credit(
            [
                stringsetloc("-Guest Music Arrangement-", "scr_credit_slash_scr_credit_gml_148_0")
            ],
            [
                [
                    stringsetloc("(Rakuichi Buster)", "scr_credit_slash_scr_credit_gml_151_0")
                ],
                stringsetloc("rakuichi", "scr_credit_slash_scr_credit_gml_152_0"),
                [
                    stringset(music_credits),
                    stringsetloc("(Flower Man)", "scr_credit_slash_scr_credit_gml_160_0")
                ],
                stringsetloc("Camellia", "scr_credit_slash_scr_credit_gml_153_0"),
                [
                    stringsetloc("(Chapter 5 Credits)", "scr_credit_slash_scr_credit_gml_159_0"),
                    stringsetloc("(Deltarune Piano Collections)", "scr_credit_slash_scr_credit_gml_160_0_b")
                ],
                stringsetloc("Trevor Alan Gomes", "scr_credit_slash_scr_credit_gml_161_0")
            ]
        )
    ];
    credits[10] = [
        new scr_credit(
            [
                stringsetloc("-Guest Music Arrangement-", "scr_credit_slash_scr_credit_gml_148_0")
            ],
            [
                [
                    stringsetloc("(I guess I'm in love)", "scr_credit_slash_scr_credit_gml_173_0_b")
                ],
                stringsetloc("Itoki Hana", "scr_credit_slash_scr_credit_gml_174_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Musical Assistance-", "scr_credit_slash_scr_credit_gml_273_0")
            ], 
            [
                stringsetloc("Marcy Nabors", "scr_credit_slash_scr_credit_gml_274_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Anime Cutscene SFX-", "scr_credit_slash_scr_credit_gml_90_0")
            ],
            [
                stringsetloc("Power-Up Audio", "scr_credit_slash_scr_credit_gml_91_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Development Tools (Cool)-", "scr_credit_slash_scr_credit_gml_164_0")
            ],
            [
                stringsetloc("Juju Adams", "scr_credit_slash_scr_credit_gml_165_0")
            ]
        )
    ];
    credits[11] = [
        new scr_credit(
            [
                stringsetloc("-Japanese Localization-", "scr_credit_slash_scr_credit_gml_170_0")
            ],
            [
                stringsetloc("8-4, Ltd.", "scr_credit_slash_scr_credit_gml_173_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Translator-", "scr_credit_slash_scr_credit_gml_177_0")
            ],
            [
                stringsetloc("Keiko Fukuichi", "scr_credit_slash_scr_credit_gml_178_0")
            ]
        )
    ];
    credits[12] = [
        new scr_credit(
            [
                stringsetloc("-Localization Producers-", "scr_credit_slash_scr_credit_gml_187_0")
            ],
            [
                stringsetloc("Tina Carter", "scr_credit_slash_scr_credit_gml_188_0"),
                stringsetloc("John Ricciardi", "scr_credit_slash_scr_credit_gml_189_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Localization Support-", "scr_credit_slash_scr_credit_gml_195_0")
            ],
            [
                stringsetloc("Graeme Howard", "scr_credit_slash_scr_credit_gml_196_0"),
                stringsetloc("Hiroyuki Matsushita", "scr_credit_slash_scr_credit_gml_197_0"),
                stringsetloc("Yutaka Ohbuchi", "scr_credit_slash_scr_credit_gml_198_0"),
                stringsetloc("Sami Ragone", "scr_credit_slash_scr_credit_gml_199_0"),
                stringsetloc("JP Wentz", "scr_credit_slash_scr_credit_gml_200_0")
            ]
        )
    ];

    var translators_credits = get_chapter_lang_setting("translators_credits", json_parse("[[{\"header\": [\"-Japanese Localization-\"],\"text_line\": [\"8-4, Ltd.\"],\"columns\": 1},{\"header\": [\"-Translator-\"],\"text_line\": [\"Keiko Fukuichi\"],\"columns\": 1}],[{\"header\": [\"-Localization Producers-\"],\"text_line\": [\"Tina Carter\", \"John Ricciardi\"],\"columns\": 1},{\"header\": [\"-Localization Support-\"],\"text_line\": [\"Graeme Howard\", \"Hiroyuki Matsushita\", \"Yutaka Ohbuchi\", \"Sami Ragone\", \"JP Wentz\"],\"columns\": 1}]]"))
    // TODO своим заполнить
    credits[11] = translators_credits[0];
    credits[12] = translators_credits[1];

    credits[13] = [
        new scr_credit(
            [
                stringsetloc("-QA-", "scr_credit_slash_scr_credit_gml_231_0"),
                stringsetloc("DIGITAL HEARTS Co., Ltd.", "scr_credit_slash_scr_credit_gml_234_0")
            ],
            [
                stringsetloc("Shuhei Kaji [QA Project Manager]", "scr_credit_slash_scr_credit_gml_294_0"),
                stringsetloc("Yu Takamori [QA Lead]", "scr_credit_slash_scr_credit_gml_295_0"),
                stringsetloc("Tatsuki Imai [Sales Dept]", "scr_credit_slash_scr_credit_gml_296_0")
            ]
        )
    ];
    credits[14] = [
        new scr_credit(
            [
                stringsetloc("-Japanese Graphics-", "scr_credit_slash_scr_credit_gml_221_0")
            ],
            [
                stringsetloc("256graph", "scr_credit_slash_scr_credit_gml_222_0"),
                stringsetloc("Satoshi Maruyama", "scr_credit_slash_scr_credit_gml_223_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Super Tester-", "scr_credit_slash_scr_credit_gml_306_0")
            ],
            [
                stringsetloc("Esteban Criado (DruidVorse)", "scr_credit_slash_scr_credit_gml_307_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Website-", "scr_credit_slash_scr_credit_gml_253_0")
            ],
            [
                stringsetloc("Brian Coia", "scr_credit_slash_scr_credit_gml_254_0")
            ]
        ),
        new scr_credit(
            [
                stringsetloc("-Trailers & All Video Editing-", "scr_credit_slash_scr_credit_gml_277_0")
            ],
            [
                stringsetloc("Everdraed", "scr_credit_slash_scr_credit_gml_278_0")
            ]
        )
    ];
    credits[15] = [
        new scr_credit(
            [
                stringsetloc("-Special Thanks-", "scr_credit_slash_scr_credit_gml_287_0")
            ],
            [
                stringsetloc("Hiroko Minamoto", "scr_credit_slash_scr_credit_gml_288_0"),
                stringsetloc("Alissa Staples", "scr_credit_slash_scr_credit_gml_289_0"),
                stringsetloc("Fontworks Inc.", "scr_credit_slash_scr_credit_gml_290_0"),
                stringsetloc("Yutaka Sato (Happy Ruika)", "scr_credit_slash_scr_credit_gml_291_0"),
                stringsetloc("All 8-4 & Fangamer Staff", "scr_credit_slash_scr_credit_gml_293_0"),
                stringsetloc("Claire & Andrew", "scr_credit_slash_scr_credit_gml_294_0_b"),
                stringsetloc("Brian Lee", "scr_credit_slash_scr_credit_gml_295_0_b"),
                stringsetloc("YoYo Games", "scr_credit_slash_scr_credit_gml_296_0_b")
            ]
        )
    ];
    return credits;
}