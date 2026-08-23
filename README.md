# Deltranslate Mod v2.0 by Neprim
```
Contacts: 
Discord: @neprim
Deltranslate Discord Server: https://discord.com/invite/K98BzHZG9P
```

`lang` folder means using `https://github.com/Lazy-Desman/EngDeltranslatePack/lang` as template.

- Fast-check:
  - [Fonts](#fonts)
  - [settings.json](#settingsjson)
  - [chapter_settings.json](#chapter_settingsjson)
  - [changes.json](#changesjson)
  - [lang_info.json](#lang_infojson)

## Fonts

You can (and should if you have characters other from base Latin) add your own fonts by putting them into `fonts` folder. If you don't have them, you can copy those from en folder and add characters that you want to them via any font editor. Font sizes that game uses are:
- `fnt_small` - 6
- `fnt_tinynoelle` - 7
- `fnt_comicsans` - 10
- `fnt_dotumche` - 12
- `fnt_main` - 12
- `fnt_main_mono` - 12 (if not present, `fnt_main` is used)
- `fnt_8bit` - 12
- `fnt_legend` - 12
- `fnt_mainbig` - 24
- `fnt_mainbig_mono` - 24 (if not present, `fnt_mainbig` is used)



## settings.json

`name`
Full name of your language translation.

`lang_code`
Language code of your language translation.

`description`
Description of your language translation.


`link`
Link to your social media (if needed).


`monospace_fonts`
Set true if you want dialogues looks like in original with monospaced symbols. Highly unrecommended for languages with w i d e characters.
It also change limitations from 33 and 26 (for faces) symbols per line to 33\*8 = 264 and 26\*8 = 208 pixels per line, so more symbols should fit in one line. If you only want SOME of the fonts to be monospace, you can do so by defining an array like this:
```
"monospace_fonts": [ "8bit", "comicsans", "main", "mainbig", "small", "tinynoelle" ],
```
In this example, `fnt_dotumche` and `fnt_legend` will not be monospace.

![Monospace and non-monospace image](https://imgur.com/m7Pwi2c.png)

`special_mode`
If true, adds button "Special Mode: " in language config menu that allows players to switch between usual strings and special string (string, that starts from "sp_")

 ![Special mode image](https://imgur.com/To8KhR5.png)

For example:
```json
"scr_something": "Usual Deltarune",
"sp_scr_something": "Very Special Deltarune"
```
 ![Special mode image](https://imgur.com/KmGuRot.png)

Sprites and sounds are also affected by this setting if you copy them with "sp_" prefix.

 ![Special mode image](https://imgur.com/EC7ZnKd.png)

`enable_translated_voices_switch`
If true, adds button "Translated Voices: " in language config menu that allows players to switch between translated songs (if you have ones) and original ones.

![](https://imgur.com/UIZGKpK.png)

This setting includes following files (they all lie in en folder):

Chapter 1:
`AUDIO_INTRONOISE.ogg`, `dontforget.ogg`, `snd_joker_anything.ogg`, `snd_joker_chaos.ogg`, `snd_joker_metamorphosis.ogg`, `snd_joker_neochaos.ogg`, `snd_joker_laugh0.ogg`, `snd_joker_laugh1.ogg`, `snd_joker_ha0.ogg`, `snd_joker_ha1.ogg`, `snd_joker_oh.ogg`, `snd_joker_byebye.ogg`

  

Chapter 2:
`AUDIO_INTRONOISE.ogg`, `ch2_credits.ogg`, `spamton_battle.ogg`, `spamton_meeting.ogg`, `spamton_neo_mix_ex_wip.ogg`, `snd_tm_quiz_a.ogg`, `snd_tm_quiz_b.ogg`, `snd_tm_quiz_c.ogg`, `snd_tm_quiz_d.ogg`, `snd_boxing_fight.ogg`, `snd_boxing_fight_bc.ogg`, `snd_boxing_round1.ogg`, `snd_boxing_round1_bc.ogg`, `snd_boxing_round2.ogg`, `snd_boxing_round2_bc.ogg`, `snd_boxing_round3.ogg`, `snd_boxing_round3_bc.ogg`

  

Chapter 3:
`AUDIO_INTRONOISE.ogg`, `ch2_credits.ogg`, `snd_joker_laugh0.ogg`, `snd_its_tv_time.ogg`, `snd_smashreveal.ogg`

  

Chapter 4:
`AUDIO_INTRONOISE.ogg`, `snd_alt_takingtoolong.ogg`, `snd_jackolantern_laugh.ogg`, `snd_jackolantern_laugh_small.ogg`, `snd_long_only.ogg`, `snd_pumpkin_scream_mama.ogg`, `snd_pumpkin_scream_mama_end.ogg`, `snd_takingtoolongtoolong.ogg`, `snd_taking_too_lol.ogg`, `snd_taking_too_long.ogg`, `snd_taking_too_long_fast.ogg`, `snd_taking_too_long_small.ogg`, `snd_taking_too_long_small_fast.ogg`, `snd_taking_tutu.ogg`, `snd_tem_sing_1.ogg`, `snd_tem_sing_2.ogg`, `snd_tem_sing_3.ogg`, `snd_tem_sing_4.ogg`, `snd_tutu_fast.ogg`, `snd_your_long.ogg`, `snd_your_too_bright.ogg`, `snd_your_tutu.ogg`, `snd_statue_left.ogg`, `snd_statue_right.ogg`, `snd_statue_up.ogg`, `snd_statue_down.ogg`



Chapter 5:
`AUDIO_INTRONOISE.ogg`, `deltarune_logo_ch5_itoki.ogg`, `pink.ogg`, `snd_flowery_voiceclip_all_according_to_all_according_to_plant.ogg`, `snd_flowery_voiceclip_calling_for_help.ogg`, `snd_flowery_voiceclip_dont_you_like_serving_humans.ogg`, `snd_flowery_voiceclip_flowers_blooms_in_your_heart.ogg`, `snd_flowery_voiceclip_flowery2.ogg`, `snd_flowery_voiceclip_forget_it.ogg`, `snd_flowery_voiceclip_get_a_chance_1.ogg`, `snd_flowery_voiceclip_get_a_chance_2.ogg`, `snd_flowery_voiceclip_give_to_you.ogg`, `snd_flowery_voiceclip_glue.ogg`, `snd_flowery_voiceclip_go_home.ogg`, `snd_flowery_voiceclip_goodbye.ogg`, `snd_flowery_voiceclip_great_style.ogg`, `snd_flowery_voiceclip_grown_like_a_turnip.ogg`, `snd_flowery_voiceclip_heh_it_s_my_jarona.ogg`, `snd_flowery_voiceclip_hereicomesanfrandisc.ogg`, `snd_flowery_voiceclip_hereicomesanfrandisco_strong.ogg`, `snd_flowery_voiceclip_hey.ogg`, `snd_flowery_voiceclip_hey_boys.ogg`, `snd_flowery_voiceclip_hey_raly.ogg`, `snd_flowery_voiceclip_heyguys.ogg`, `snd_flowery_voiceclip_heyguysithinkifoundaglue.ogg`, `snd_flowery_voiceclip_heytherelittleguy.ogg`, `snd_flowery_voiceclip_hoo.ogg`, `snd_flowery_voiceclip_huh.ogg`, `snd_flowery_voiceclip_im_falling.ogg`, `snd_flowery_voiceclip_im_only_trying_to_help_you.ogg`, `snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting.ogg`, `snd_flowery_voiceclip_its_all_in_a_name.ogg`, `snd_flowery_voiceclip_its_all_yours.ogg`, `snd_flowery_voiceclip_its_so_human.ogg`, `snd_flowery_voiceclip_itsme.ogg`, `snd_flowery_voiceclip_itsmeflowery.ogg`, `snd_flowery_voiceclip_jarona1.ogg`, `snd_flowery_voiceclip_jarona2.ogg`, `snd_flowery_voiceclip_jarona3.ogg`, `snd_flowery_voiceclip_jarona4.ogg`, `snd_flowery_voiceclip_kris.ogg`, `snd_flowery_voiceclip_last_jarona.ogg`, `snd_flowery_voiceclip_leaf_it_to_me.ogg`, `snd_flowery_voiceclip_lend_me_your_power.ogg`, `snd_flowery_voiceclip_minipeppers.ogg`, `snd_flowery_voiceclip_mostlys.ogg`, `snd_flowery_voiceclip_my_favorite_two.ogg`, `snd_flowery_voiceclip_my_human.ogg`, `snd_flowery_voiceclip_my_king.ogg`, `snd_flowery_voiceclip_mysterious_wind.ogg`, `snd_flowery_voiceclip_no_way_its_your_children.ogg`, `snd_flowery_voiceclip_nonono.ogg`, `snd_flowery_voiceclip_omega_flowery.ogg`, `snd_flowery_voiceclip_prism_blow.ogg`, `snd_flowery_voiceclip_say_that_again.ogg`, `snd_flowery_voiceclip_smile_again.ogg`, `snd_flowery_voiceclip_sorryaboutthatguys.ogg`, `snd_flowery_voiceclip_sorryaboutthatlittleguy.ogg`, `snd_flowery_voiceclip_sorryabouttheguy.ogg`, `snd_flowery_voiceclip_sorrytokeepaladyinwaiting.ogg`, `snd_flowery_voiceclip_sorrytokeepyouladies.ogg`, `snd_flowery_voiceclip_sorrytokeepyouwaiting1.ogg`, `snd_flowery_voiceclip_sorrytokeepyouwaiting2.ogg`, `snd_flowery_voiceclip_stingus.ogg`, `snd_flowery_voiceclip_suckle_it_up.ogg`, `snd_flowery_voiceclip_susie.ogg`, `snd_flowery_voiceclip_take_that.ogg`, `snd_flowery_voiceclip_thats_my_dreams.ogg`, `snd_flowery_voiceclip_thatsgreat.ogg`, `snd_flowery_voiceclip_the_boys.ogg`, `snd_flowery_voiceclip_the_diner.ogg`, `snd_flowery_voiceclip_theyre_eating_my_flesh.ogg`, `snd_flowery_voiceclip_thisguysyourbestfriend.ogg`, `snd_flowery_voiceclip_try_my_flavor.ogg`, `snd_flowery_voiceclip_what_a_predictable_creature.ogg`, `snd_flowery_voiceclip_with_your_powers_combined.ogg`, `snd_flowery_voiceclip_wow.ogg`, `snd_flowery_voiceclip_yes.ogg`, `snd_flowery_voiceclip_your_dad.ogg`, `snd_flowery_voiceclip_yourdadsmybestfriend.ogg`, `snd_flowery_voiceclip_youre_a_hero.ogg`, `snd_flowery_voicenoise_1.ogg`, `snd_flowery_voicenoise_2.ogg`, `snd_flowery_voicenoise_3.ogg`, `snd_flowery_voicenoise_loop.ogg`, `snd_forthefans.ogg`, `snd_ja_kidding.ogg`, `snd_jarona_orange1.ogg`, `snd_jarona_orange2.ogg`, `snd_joker_laugh0.ogg`, `snd_lo.ogg`, `snd_ol.ogg`, `snd_pink_stretch_2_fixed.ogg`, `snd_pink_stretch_2_troubled.ogg`, `snd_ruoy.ogg`, `snd_your.ogg`, `snd_your_long.ogg`
    



If some strings or sprites depends on voices switch, you can add `spm_` prefixed ones that would be used instead of base ones if translated voices are disabled. For example, it can be used for using different strings in Jackenstein battle if you adapt tutu jokes for your language but they wouldn't make sense without translated voices.

 ![spm_ usage image](https://imgur.com/Km06Xbf.png)
 
`translate_mode`
If true, allows you to switch to translate mode (U) that allows you: 
- (F) Run the game in x4 speed
- (Shift + F) Run the game in x12 speed
- (F + A) Run the game in x0.25 speed
- (F + 0) Run the game in x1/30 speed
- (S) Save the game in current room
- (L) Load the game from the last save
- (N) Enter next room *(use with caution)*
- (P) Enter previous room *(use with caution)*
- (H) Heal each party member for 1000
- (Q) Change language*
- (R) Reload language strings without reloading a game
- (G) Go to selected room
- (I) Insert your translation for the current dialogue string**. Translations saved to `new_translations_chX.json` in the save folder.

*Be careful, as it also reloads sprites and sounds that sometimes can lead to unexpected results. Althought, it fixes by re-entering the room.
**This function sometimes do not work fully as intended, beware.

`files_url` 
Link to root for your language files pack, including pack folder. For example, if settings file in your language pack accessed via `https://example.com/lang/en/setting.json` and chapter 1 strings via `https://example.com/lang/en/chapter1/strings.json`, you should put `https://example.com/lang/en/` in `files_url`.

`datas_url` 
Link to data.win's base path in case you want to update them by yourself. 

`line_height_factor`
Multiplies line height in dialogues by this value. Can be used for adding forth line in dialogues if you need so.

![line](https://imgur.com/aPO3Mel.png)

## chapter_settings.json
(all settings here are optional and listed in `en` folder only as example)

`sprites_settings`
Allows you to change parametres for sprites that you load such as:
- `frame_num` - amount of frames in a sprite
- `xoffset`, `yoffset` - origin offsets of a sprite
- `spr_speed` - speed of a sprite

If any parameter is absent the one from original sprite is taken.


Chapter 1:

`do_not_forget_timings`
- 0 (60) - "When the"
- 1 (108) - "light is running low" && Credits next page (CNP)
- 2 (180) - "And the shadows start to grow"
- 3 (201) - CNP
- 4 (278) - "And the places that you know"
- 5 (298) - CNP
- 6 (366) - "Seem like fantasy"
- 7 (390) - CNP
- 8~9 (480-520) - Lyrics shading
- 10 (526) - "There's a"
- 11 (573) - "Light inside your soul" && CNP with translators
- 12 (645) - "That's still shining in the cold"
- 13 (668) - CNP
- 14 (735) - "With the truth"
- 15 (765) - CNP
- 16 (798) - "The promise in our hearts"
- 17 (870) - CNP
- 18~19 (960-1030) - Lyrics shading
- 20 (1033) - "Don't forget"
- 21 (1086) - "I'm with you in the dark"
- 22-23 (1300-1560) - "To be continued" shading++
- 23 (1560) - "To be continued" shading--
- 24 (1660) - Song ending
- 25 (1680) - "Continue to Chapter 2"

`boob`
Defines what sprites would be used in the end of the first Chapter ("spr_blockler_" + corresponding letter). *Yeah, I really added that option.*

![boob](https://imgur.com/Q64mAr1.png)

Chapter 2:

`welcome_sign_x1"/"welcome_sign_x2`:
Xs for "Welcome to the City" sign's lights. First X for letter's start x, second for end x.

![Welcome to the City](https://imgur.com/WSmanFu.png)

`button_sounds_symbols`
Sounds for buttons with letter. Just list all the letters you use in puzzles and don't forget to add appropriate sound files in sounds/button_sounds. All sounds MUST be in .ogg format (strangely, but the game just can't read another formats). If you don't change puzzle or use only english sounds, just keep english "button_sounds_symbols" - will be used original sounds.

![buttons](https://imgur.com/XdMaKx2.png)

`only_one_tutoriel`
If you need only one pixel Toriel in Kris's room in the mansion for a good pun adaptation, set this parameter to 1

![One Toriel](https://imgur.com/NBGqOhO.png)

Chapter 3:

`logo_pieces_pos`
Positions for appearing pieces of logo for chapter 3 intro.

For example, let's take the English logo to show how it works:
```json
    "logo_pieces_pos": [
        [48, 21, 83, 33],
        [252, 19, 93, 23],
        [76, 19, 93, 23],
        [226, 19, 93, 23],
        [102, 7, 83, 33],
        [200, 19, 93, 23],
        [116, 19, 83, 33],
        [174, 19, 93, 23],
        [142, 25, 93, 23]
    ],
```
Let's take the first element as an example, which corresponds to the letter "d":
`[48, 21, 83, 33]`
- 48 — Distance from the left side
- 21 — Width
- 83 — Distance from the top
- 33 — Height

![Intro](https://imgur.com/H6oyM8u.png)

```json
"additional_funny_words": [
	"spr_funnytext_star2",
	"spr_funnytext_loves"
],
"additional_funny_sounds": [
	"snd_amogus",
]
```
↑ You can add additional funny words and sounds for Tenna's strings if you need so. Just add them in arrays if needed and add `{I:spr_funnytext_something}` for images or `{S:snd_something}` for sounds.

For example:

```json
    "obj_ch3_GSA04_slash_Step_0_gml_230_0": "* Kris^1, your mother used to {I:spr_funnytext_something}{S:snd_something} cooking shows^1, didn't she?/%",
```

`video_caption_times`
Timings for Tenna's VHS intro.

`input_game_name_chars`
Alphabet for game podium name input.

![Podium](https://imgur.com/VPtNXsU.png)

`kri_word`
"KRI" word for podium reaction.

`krs_word`
"KRS" word for podium reaction

`bad_word`
Bad words for podium reactions.

`other_name_word` 
Names of other characters for podium reaction.

`aaa_word`
"AAA" word for podium reaction (in case you do not use latin A as first character).

`bad_word_parent_control`
Bad words that have special interaction for some reason.

`very_bad_word`
Very bad words for secret podium interaction.
    
`forbidden_words_schemas`
Words that fit corresponding schemas are not allowed to be entered in podium.

`its_tv_time_lights_xs`
Right Xs for "ITS TV TIME" sign's lights.

![tv time](https://imgur.com/80v0yLU.png)

`tv_time_timestamps`
"It's TV Time!" timings.

`button_sounds_symbols`
Sounds for buttons with letter. Just list all the letters you use in puzzles and don't forget to add appropriate sound files in sounds/button_sounds. All sounds MUST be in .ogg format (strangely, but the game just can't read another formats). If you don't change puzzle or use only english sounds, just keep english "button_sounds_symbols" - will be used original sounds.

![Button](https://imgur.com/iSjrP0U.png)

`tvlangfont_string`
Used for making font from `spr_tvlandfont` that used in Green Room Minigames Room for running line.

![Tv land font](https://imgur.com/phi6vAK.gif)
	
`t_pose_offset`
X offset for spinning Tenna in secret T-rank room.

![T-V POSE](https://imgur.com/1MSdEpZ.png)

`lyrics_chart_raise_up_your_bat`
Timings for "Raise up your bat" Ralsei's lyric charts.

Chapter 4:

`alternate_pass`
Alternate password for Mike's room. Original 6453 remains usable.

`jack_phrases`
Jackenstein phrases. You can use more or less words in one phrase, just do not forget to add corresponding timings.

`jack_timings`
Jackenstein phases' timings. So, yet again, do not forget to change them if you translate original voices.

Chapter 5:

`tome_bullet_letters`
Array of letters of the tome bullet attack if you want to change it from default english alphabet.

`additional_voicelines`
You can add additional voicelines to use in dialogues. The use is following:
1) Add a line like `"ඞ": "snd_flowery_amogus"` to the setting. Beware, you can't use default english letters or numbers as they are already used by the original game.
2) Place corresponding `snd_flowery_amogus.ogg` in the `chapter5/sounds` folder.
3) Add `\Vඞ` to the wanted string.


Chapter 3&5:
```json
"translators_credits": [
	[
		{
			"header": ["-Some header-"],
			"text_line": ["Some string"],
			"columns": 1
		},
		{
			"header": ["-Some header-"],
			"text_line": ["Some string"],
			"columns": 1
		}
	],
	[
		{
			"header": ["-Some header-"],
			"text_line": ["Some string 1", "Some string 2"],
			"columns": 1
		},
		{
			"header": ["-Some header-"],
			"text_line": [
				"String 1, column 1",
				"String 2, columnn 1",
				
				"String 3, column 2",
				"String 4, column 2"
			],
			"columns": 2
		}
	]
]
```
↑ Two pages for your localization team credits. Working for chapter 3-5, for chapter 1 and 2 change corresponding lines in `strings.json`



## changes.json
If you want to make new version of translation (and make it automatically downloadable), add new entry in `changes.json` like this:

```
"major.minor.patch": {
	"description": "- Some changes.",
	"name": "Version name",
	"files": [
		"file_to/be_changed.txt", 
		"another_file.json"
	],
	"datas": [0, 1, 2, 3, 4] // 0 means chapters menu. Omit this field if you don't update data.win's
}
```

So, how it works. The game downloads `files_url` + `changes.json` file from server and compares it with local `lang/your_lang/changes.json`. If some versions on server are greater than local ones, the game suggests to user to download new translation files:

![Language update notification image](https://imgur.com/Yb7bKhx.gif)

If user press `G`, files stated in greater versions are downloaded from `files_url` + `files_path`. New `changes.json` and `settings.json` are downloaded too.
