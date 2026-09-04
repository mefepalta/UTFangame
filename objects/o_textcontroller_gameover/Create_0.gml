
depth = -30;

SPK_NARR = 0;
SPK_SANS = 1;
SPK_PAP  = 2;
SPK_ALP  = 3;

CAST_SANS  = 1;
CAST_PAP   = 2;
CAST_ALP   = 4;
CAST_MERCY = 8;

spk_font  = [font_determination_sans, font_sans, font_papyrus, font_determination_sans];
spk_scale = [1,                       2,         2,            1];
spk_voice = [snd_text_voice_default, snd_text_voice_sans, snd_text_voice_papyrus, snd_text_voice_alphys];
spk_need  = [0, CAST_SANS, CAST_PAP, CAST_ALP];


msg_narrator = [
    [[SPK_NARR, "Your time here is far from over, human."],
     [SPK_NARR, "Rise."]],

    [[SPK_NARR, "Determination bends to your will. Remember."],
     [SPK_NARR, "Rise."]],

    [[SPK_NARR, "Get back on your feet. Feel that Determination burn within you, young one."],
     [SPK_NARR, "Arise."]],

    [[SPK_NARR, "Just a little more. Get up."]],

    [[SPK_NARR, "Wake from this endless night. Take back your future. Stand."]],

    [[SPK_NARR, "Rise from the ashes, and choose your own fate."]],

    [[SPK_NARR, "You can feel your soul splitting apart..."],
     [SPK_NARR, "But you don't have to let it break. Please, rise."]],

    [[SPK_NARR, "The sun will shine brightly on your future if you don't give up."]]
];

msg_phase2 = [
    [[SPK_ALP,  "For our fallen comrades... THIS is for you!"]],

    [[SPK_PAP,  "WELL, GUESS YOU'RE BETTER OFF THIS WAY."]],

    [[SPK_SANS, "Honestly, if all humans are as weak as you, we have nothing to worry about."]],

    [[SPK_PAP,  "THAT'S ALL YOU GOT? WHAT A SURPRISE."],
     [SPK_PAP,  "HERE I WAS EXPECTING A CHALLENGE."]],

    [[SPK_ALP,  "What's the matter? Can't take the heat?"],
     [SPK_ALP,  "Well too bad! That puny Determination means nothing to us!"]],

    [[SPK_SANS, "This is your idea of Determination? How pathetic."]],

    [[SPK_PAP,  "NYEH HEH HEH... HOW DOES IT FEEL TO STARE DEATH IN THE FACE?"]],

    [[SPK_SANS, "Don't you get it? You asked for this. Now you're paying the price!"]],

    [[SPK_PAP,  "SEE YA, KID."],
     [SPK_ALP,  "Hey! Who said you could hog all the glory? I helped too!"],
     [SPK_SANS, "Would you guys stop arguing? The job is done. So long, human."]],

    [[SPK_SANS, "I'd wish you a goodbye... but we're past that."]],

    [[SPK_PAP,  "HEY, DEATH'S ON THE PHONE! BE A PAL AND PICK IT UP, WILL YA?"]],

    [[SPK_ALP,  "I was so anxious about this fight. Pfft- ha! I was worried about nothing!"]],

    [[SPK_SANS, "The stars are rooting for your demise. Come on, let's not keep them waiting."]],

    [[SPK_PAP,  "YOU CAME ALL THIS WAY JUST TO FAIL. TISK TISK, HUMAN."]]
];

msg_mercy = [
    [[SPK_SANS, "Mweh heh heh!"],
     [SPK_SANS, "I'm glad to get rid of you!"]]
];

WRAP_W = 576;

go_wrap = function(_txt, _font, _scl) {
    draw_set_font(_font);
    if (string_width(_txt) * _scl <= WRAP_W) return _txt;

    var _words = string_split(_txt, " ");
    var _out   = "";
    var _line  = "";
    for (var i = 0; i < array_length(_words); i++) {
        var _try = (_line == "") ? _words[i] : _line + " " + _words[i];
        if (string_width(_try) * _scl > WRAP_W) and (_line != "") {
            _out += (_out == "" ? "" : "\n") + _line;
            _line = _words[i];
        } else {
            _line = _try;
        }
    }
    if (_line != "") _out += (_out == "" ? "" : "\n") + _line;
    return _out;
};

var _cast = Flag_Get(FLAG_TYPE.TEMP, FLAG_TEMP.GAMEOVER_CAST);
if (!is_numeric(_cast)) _cast = 0;
_cast = real(_cast);
cast_mask = _cast;

var _pool = [];
var _p2   = _cast & (CAST_SANS | CAST_PAP | CAST_ALP);

if ((_cast & CAST_MERCY) != 0) and ((_p2 == 0) or ((_p2 & CAST_SANS) != 0)) {
    _pool = msg_mercy;
} else if (_p2 != 0) {
    for (var i = 0; i < array_length(msg_phase2); i++) {
        var _m  = msg_phase2[i];
        var _ok = true;
        for (var j = 0; j < array_length(_m); j++) {
            if ((_cast & spk_need[_m[j][0]]) == 0) { _ok = false; break; }
        }
        if (_ok) array_push(_pool, _m);
    }
}
if (array_length(_pool) == 0) _pool = msg_narrator;

if (!variable_global_exists("gameover_last_msg")) global.gameover_last_msg = -1;
var _pick = irandom(array_length(_pool) - 1);
if (array_length(_pool) > 1) {
    var _guard = 0;
    while (_pick == global.gameover_last_msg) and (_guard < 12) {
        _pick = irandom(array_length(_pool) - 1);
        _guard++;
    }
}
global.gameover_last_msg = _pick;

pages = [];
var _src = _pool[_pick];
var _cur_spk = -1;

for (var i = 0; i < array_length(_src); i++) {
    var _spk = _src[i][0];
    var _txt = go_wrap(_src[i][1], spk_font[_spk], spk_scale[_spk]);

    if (_spk != _cur_spk) {
        array_push(pages, {
            spk : _spk,
            fnt : spk_font[_spk],
            scl : spk_scale[_spk],
            snd : spk_voice[_spk],
            txt : _txt,
            len : 0, h : 0, y : 0, bot : 0
        });
        _cur_spk = _spk;
    } else {
        var _p = pages[array_length(pages) - 1];
        _p.txt += "\n" + _txt;
    }
}

for (var i = 0; i < array_length(pages); i++) {
    var _p = pages[i];
    draw_set_font(_p.fnt);
    _p.len = string_length(_p.txt);
    _p.h   = string_height(_p.txt) * _p.scl;
    _p.y   = max(340, 394 - _p.h * 0.5);
    _p.bot = _p.y + _p.h;
}

char_speed = 2;
page_hold  = 80;
cur        = 0;
shown      = 0;
wait       = 0;
t          = 0;
started    = false;
done       = false;

prompt_a   = 0;
blink      = 0;
