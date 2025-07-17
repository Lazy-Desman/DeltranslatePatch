-- Deltranslate Mod v2.0 by Neprim --
My contacts: 
Discord: @neprim
Discord Server: https://discord.com/invite/K98BzHZG9P

-------------------------------------
If you want to add another language, just copy en folder and rename it. Profit! You can change anything in your brand new translation.
-------------------------------------

--- Fonts ---

You can (and should if you have characters other from base Latin) add your own fonts by putting them into `fonts` folder. If you don't have them, you can copy those from en folder and add characters that you want to them via any font editor. Font sizes that game uses are:
fnt_main - 12 
fnt_mainbig - 24
fnt_tinynoelle - 7
fnt_dotumche - 12
fnt_comicsans - 10
fnt_small - 6
fnt_8bit - 12
Also you can place fnt_main_mono and it will be used in chapter 3 name input and rock video minigame. If absent, base fnt_main will be used.

If you previously worked with UMT and have made fonts via glyphs (.png + .csv files), you can rename them as "font_name_(your lang)" (for example, "fnt_main_ja") and import them via UMT script.



--- settings.json ---

"name"
Full name of your language translation.


"fonts_range"
Define first and last character codes that would be used in your translation. 32-128 defines ASCII table.


"monospace_fonts"
Set true if you want dialogues looks like in original with monospaced symbols. Highly unrecommended for languages with w i d e characters.

"limit_by_width"
Sets limitation of symbols-per-line in dialogues from symbols limit to width limit. Although, line limit still based on amount of allowed characters (33 and 26 for faces).

"charline_base"
"charline_face"
Those two options determine maximum amount of characters in base dialogues and dialogues with faces, with defaults 33 and 26. They also correspond to the limit_by_width option.

"special_mode"
If true, adds button "Special: " in language config menu that allows players to switch between usual strings and special string (string, that starts from "sp_")
For example:
"scr_something": "Usual Deltarune"
"sp_scr_something": "Very Special Deltarune"
Sprites and sounds are also affected by this setting if you copy them with "sp_" prefix.


"enable_translated_songs_switch"
If true, adds button "Translated OSTs: " in language config menu that allows players to switch between translated songs (if you have ones) and original ones. This setting includes following files (they all lie in en folder):
Chapter 1: dontforget.ogg, snd_joker_*.ogg
Chapter 2: ch2_credits.ogg, spamton_battle.ogg, spamton_meeting.ogg, spamton_neo_mix_ex_wip.ogg


"translate_mode"
If true, allows you to switch to translate mode (U) that allows you to 
(K) Run the game in x4 speed
(S) Save the game in current room
(L) Load the game from the last save
(R) Reload lang files without reloading a game*
(Q) Change language*
(N) Enter next room
(P) Enter previous room
(H) Max heal party
*Be careful, as it also reloads sprites and sounds that sometimes can lead to unexpected results. Althought, it fixes by re-entering the room.**
**In chapter 3 it only reloads strings, so it's safe  to use anywhere.



--- chapter_settings.json ---
(all settings here are optional and listed in en folder only as example)

"sprites_settings"
Allows you to change parametres for sprites that you load such as:
frame_num - amount of frames in a sprite
xoffset, yoffset - origin offsets of a sprite
spr_speed - speed of a sprite
If any parameter is absent the one from original sprite is taken.



Chapter 1:

"do_not_forget_timings"
0 (60) - "When the"
1 (108) - "light is running low" && Credits next page (CNP)
2 (180) - "And the shadows start to grow"
3 (201) - CNP
4 (278) - "And the places that you know"
5 (298) - CNP
6 (366) - "Seem like fantasy"
7 (390) - CNP
8~9 (480-520) - Lyrics shading
10 (526) - "There's a"
11 (573) - "Light inside your soul" && CNP with translators
12 (645) - "That's still shining in the cold"
13 (668) - CNP
14 (735) - "With the truth"
15 (765) - CNP
16 (798) - "The promise in our hearts"
17 (870) - CNP
18~19 (960-1030) - Lyrics shading
20 (1033) - "Don't forget"
21 (1086) - "I'm with you in the dark"
22-23 (1300-1560) - "To be continued" shading++
23 (1560) - "To be continued" shading--
24 (1660) - Song ending
25 (1680) - "Continue to Chapter 2"


"boob"
Defines what sprites would be used in the end of the first Chapter ("spr_blockler_" + corresponding letter). *Yeah, I really added that option.*


Chapter 2:

"welcome_sign_x1"/"welcome_sign_x2":
Xs for "Welcome to the City" sign's lights. First X for letter's start x, second for end x.


"button_sounds_symbols"
Sounds for buttons with letter. Just list all the letters you use in puzzles and don't forget to add appropriate sound files in sounds/button_sounds. All sounds MUST be in .ogg format (strangely, but the game just can't read another formats). If you don't change puzzle or use only english sounds, just keep english "button_sounds_symbols" - will be used original sounds.


"only_one_tutoriel"
If you need only one pixel Toriel in Kris's room in the mansion for a good pun adaptation, set this parameter to 1


Chapter 3:
To be done, but, I guess, you can guess for what each parameter by its name.