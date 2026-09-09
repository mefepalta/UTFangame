
global.easy_final = false;

audio_stop_all();

global.ending_bgm = audio_play_sound(snd_dogsong, 10, false);

dialogue = [
	{ t:  1.0, text: "* oh my god!!! you actually&did it!" },
	{ t:  5.0, text: "* im so impressed!" },
	{ t:  8.0, text: "* im so impressed in fact&i can feel a white tear&dropping between my legs!" },
	{ t: 14.5, text: "* ... well, you did it!" },
	{ t: 18.5, text: "* completing the game in&EASY mode is not for&everyone..." },
	{ t: 24.0, text: "* im so proud of you!" },
	{ t: 28.0, text: "* ..." },
	{ t: 31.0, text: "* i lied. i fucking hate you." },
	{ t: 35.0, text: "* get out of my sight, twerp." },
];

son_satir_sonu = 40.0;

_prefix = "{gui true}{shadow true}{scale 2}{font 0}{voice -1}{instant false}{speed 2}{skippable false}{depth -9999}";

current_line = -1;
start_time   = current_time;
_inst_text   = noone;
_biten       = false;
_cikis_t     = -1;
