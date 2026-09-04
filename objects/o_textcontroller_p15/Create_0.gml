HIT_STEPS   = [15, 48, 84, 126, 174];
RAISE_START = 240;
RAISE_STEP  = 15;

dialogue = [
    {time:  6.0, text: "Ugh!"},
    {time:  7.0, text: "*huff* *puff*"},
    {time:  8.2, text: "..."},
    {time:  9,   text: "Heh..."},
    {time: 11.5, text: "Heheheh..."},
    {time: 14,   text: "Man..."},
    {time: 16.5, text: "I can't remember the last time someone's landed a decisive blow on me."},
    {time: 21,   text: "Well, perhaps ''decisive'' isn't right..."},
    {time: 23.8, text: "You've yet to knock me off my feet, after all."},
    {time: 27,   text: "Come on..."},
    {time: 28.5, text: "Where's that EXPLOSIVE power of yours?!"},
    {time: 31.5, text: "You can't POSSIBLY be the same person I saw take down the guard."},
    {time: 35.5, text: "And that fight against Alphys?!"},
    {time: 37.5, text: "Don't tell me it was just a FLUKE!"},
    {time: 40,   text: "..."},
    {time: 42,   text: "Heh..."},
    {time: 43.5, text: "But you know..."},
    {time: 45,   text: "The thought of you having made it THIS far..."},
    {time: 48,   text: "...while STILL holding back a large majority of your strength?"},
    {time: 52.5, text: "Man..."},
    {time: 55.5, text: "I'VE NEVER BEEN MORE EXCITED!"},
    {time: 58.5, text: "The ground convulses beneath you, throwing you off balance."},
    {time: 62.5, text: "Light erupts from Sans' soul, flooding every corner of the room..."},
    {time: 66.5, text: "A searing blaze tears through the darkness, melting the walls like wax."},
    {time: 71,   text: "The air thrums with a triumphant force you're all too familiar with..."},
    {time: 75.5, text: "...Determination took physical shape."},
    {time: 78,   text: "Power incarnate."},
    {time: 79.5, text: "You watch as it slowly bares its teeth at you."},
    {time: 83.5, text: ""},
];

LINE_NARRATOR = 21;
LINE_MUSIC    = 3;
LINE_STANDUP  = 9;
LINE_EYECUE   = 6;

audio_stop_all();
BGM_Stop(5);

fader.color = c_black;
fader.alpha = 1;
Fader_Fade(1,0,50);

current_line    = -1;
start_time      = current_time;
line_start_time = 0;
char_speed      = 0.05;
font_custom     = font_sans_1;
last_chars      = 0;
chars_visible   = 0;
p15             = 0;
global.sanstalk     = 0;
global.finalstretch = 0;

global.battle_fadein     = 1;
global.battle_fadein_col = make_colour_rgb(230,  80,  10);

depth = 150;

global.p15_sx = 0;
global.p15_sy = 0;

shake_power = 0;
rumble      = 0;

aura        = 0;
aura_target = 0;
pulse       = 0;
beat        = 0;

flash       = 0;
eye_glow    = 0;

music_id    = -1;
music_t     = -1;
next_accent = 0;

spark = [];
mote  = [];
flare = [];

COL_BLOOD = make_colour_rgb(100,  16,   8);
COL_EMBER = make_colour_rgb(192,  24,  10);
COL_FIRE  = make_colour_rgb(249, 105,   0);
COL_GOLD  = make_colour_rgb(255, 190,  90);
COL_EYE   = make_colour_rgb(192,  24,  10);
COL_DUST  = make_colour_rgb(107,  96, 137);

repeat (34) {
    array_push(mote, {
        x:  random(640),
        y:  random(480),
        vs: -random_range(0.25, 0.95),
        hs: random_range(-0.25, 0.25),
        sz: random_range(0.8, 2.6),
        a:  random_range(0.20, 0.70),
        ph: random(6.28),
        fl: random_range(0.06, 0.16)
    });
}

volc    = 0;
VLAVA_Y = 452;

VRIDGE_N = 30;
vridge = [];
for (var i = 0; i <= VRIDGE_N; i++) {
    var _u    = i / VRIDGE_N;
    var _edge = 1 - sin(_u * pi);
    var _h    = 20 + _edge * 18 + irandom_range(0, 8)
              + sin(_u * 15.0) * 4;
    array_push(vridge, {x: -20 + _u * 680, y: 486 - _h});
}

ash = [];
repeat (28) {
    array_push(ash, {
        x:  random(660) - 10,
        y:  random(480),
        vs: random_range(0.20, 0.72),
        hs: random_range(-0.26, 0.26),
        sz: random_range(0.7, 1.9),
        a:  random_range(0.12, 0.36),
        ph: random(6.28),
        fl: random_range(0.02, 0.06)
    });
}
COL_ASH = make_colour_rgb(120,  98,  92);
COL_ROCK = make_colour_rgb( 16,   7,   7);

accents = [36.0, 37.5, 39.0, 40.5, 42.0, 43.5, 45.0, 46.5];


p15_glow = function(_x, _y, _r, _col, _a, _yscale = 1) {
    if (_a <= 0.002 || _r <= 0) return;
    var _n = 26;
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_colour(_x, _y, _col, _a);
    for (var i = 0; i <= _n; i++) {
        var _d = i * (360 / _n);
        draw_vertex_colour(_x + lengthdir_x(_r, _d), _y + lengthdir_y(_r, _d) * _yscale, _col, 0);
    }
    draw_primitive_end();
}

p15_shake = function(_power) {
    shake_power = max(shake_power, _power);
}

p15_burst = function(_x, _y, _count, _speed, _col) {
    repeat (_count) {
        var _d = random(360);
        var _v = random_range(_speed * 0.35, _speed);
        array_push(spark, {
            x: _x + random_range(-8, 8),
            y: _y + random_range(-6, 6),
            hs: lengthdir_x(_v, _d),
            vs: lengthdir_y(_v, _d),
            life: irandom_range(16, 40), maxlife: 40,
            col: _col
        });
    }
}

p15_vgrad = function(_y0, _y1, _c0, _a0, _c1, _a1) {
    if (_a0 <= 0.002 && _a1 <= 0.002) return;
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(-40, _y0, _c0, _a0); draw_vertex_colour(680, _y0, _c0, _a0);
    draw_vertex_colour(-40, _y1, _c1, _a1); draw_vertex_colour(680, _y1, _c1, _a1);
    draw_primitive_end();
}

p15_flare = function(_cx, _cy, _hw, _hh, _col, _a) {
    if (_a <= 0.002 || _hw <= 0) return;
    var _n = 26;
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _n; i++) {
        var _u = i / _n;
        var _t = sin(_u * pi);
        var _x = _cx - _hw + _u * 2 * _hw;
        draw_vertex_colour(_x, _cy - _hh * _t * _t, _col, 0);
        draw_vertex_colour(_x, _cy,                 _col, _a * _t);
    }
    draw_primitive_end();
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _n; i++) {
        var _u = i / _n;
        var _t = sin(_u * pi);
        var _x = _cx - _hw + _u * 2 * _hw;
        draw_vertex_colour(_x, _cy,                 _col, _a * _t);
        draw_vertex_colour(_x, _cy + _hh * _t * _t, _col, 0);
    }
    draw_primitive_end();
}

p15_add_flare = function(_y, _life, _col) {
    array_push(flare, {y: _y, life: _life, maxlife: _life, col: _col});
}
