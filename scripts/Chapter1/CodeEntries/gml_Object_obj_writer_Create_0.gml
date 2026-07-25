skipme = 0;
textsound = snd_text;
charline = 33;
charline_face = 26;
cur_string_width = 0;
originalcharline = charline;
hspace = 8;
vspace = floor(18 * get_lang_setting("line_height_factor", 1));
limit_by_width = !get_lang_setting("monospace_fonts", 0);
rate = 1;
mycolor = c_white;
myfont = scr_84_get_font("main");
shake = 0;
special = 0;
skippable = 1;
automash_timer = 0;
max_string_width = 0;
max_string_width_face = 0;

if (global.flag[6] == 1)
    skippable = 0;

f = 1;

if (global.darkzone == 1)
    f = 2;
xcolor = c_black;
scr_texttype();
autoaster = 1;
pos = 2;
lineno = 0;
aster = 0;
halt = 0;
wxskip = 0;
msgno = 0;
first_alarm = 0;
firstnoise = 0;
noiseskip = 0;
formatted = 0;
colorchange = 0;
fontchange = 0;
sound_played = 0;
writingx = x;
writingy = y;
dialoguer = 0;
smallface = 505050;
faced = 0;
facedever = 0;
facer = 0;
siner = 0;
specfade = 1;

for (i = 0; i < 7; i += 1)
{
    specx[i] = i * 6;
    specy[i] = i * 6;
}

mystring = global.msg[0];
origstring = mystring;

for (j = 0; j < 100; j += 1)
    nstring[j] = global.msg[j];

length = string_length(mystring);
alarm[0] = rate;

if (rate < 3)
    alarm[2] = 1;
else
    scr_textsound();
