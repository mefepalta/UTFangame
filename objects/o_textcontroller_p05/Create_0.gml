dialogue = [
    {time:  1,   text: "Everyone..."},
    {time:  3,   text: "Every single one of those monsters who were crushed beneath your hands..."},
    {time:  8,   text: "Heartless criminals, and innocent bystanders alike."},
    {time: 12,   text: "They weren't just... obstacles."},
    {time: 15,   text: "They were people."},
    {time: 18,   text: "People like my brother, who wanted no part in this dumb war."},
    {time: 22,   text: "I wanted this life."},
    {time: 24,   text: "HE should've never been dragged into all this."},
    {time: 27.5, text: "So it goes without saying..."},
    {time: 30,   text: "That you aren't the only one with something to fight for down here."},
    {time: 34.5, text: "The name's Sans! I wear it like a badge!"},
    {time: 38,   text: "Prepare yourself..."},
    {time: 41.5, text: "Because now, the REAL monster bares its teeth!"},
    {time: 45,   text: ""},
];

current_line    = -1;
start_time      = current_time;
line_start_time = 0;
char_speed      = 0.05;
font_custom     = font_determination_mono_1;
last_chars      = 0;
chars_visible   = 0;
p05             = 0;
global.sanstalk     = 0;
global.finalstretch = 0;

global.battle_fadein     = 1;
global.battle_fadein_col = make_colour_rgb(150, 30, 190);

depth = 50;

global.p05_sx = 0;
global.p05_sy = 0;

shake_power = 0;
rumble      = 0;

aura        = 0;
aura_target = 0;
sky         = 0;
pulse       = 0;

flash       = 0;
eye_glow    = 0;
slash_t     = 0;

shock = [];
spark = [];
mote  = [];
star  = [];

COL_EYE   = make_colour_rgb(226,  11, 177);
COL_MAG   = make_colour_rgb(255,  96, 220);
COL_DEEP  = make_colour_rgb( 88,  40, 132);
COL_DUST  = make_colour_rgb(150, 140, 178);
COL_NIGHT = make_colour_rgb( 20,  10,  44);
COL_STAR  = make_colour_rgb(234, 228, 255);
COL_SNOW  = make_colour_rgb(206, 216, 255);

repeat (86) {
    array_push(star, {
        x:  random(660) - 10,
        y:  random(470),
        sz: random_range(0.5, 1.2),
        a:  random_range(0.20, 0.60),
        ph: random(6.28),
        fl: random_range(0.010, 0.032),
        hs: random_range(-0.012, 0.012)
    });
}
repeat (18) {
    array_push(star, {
        x:  random(660) - 10,
        y:  random(400),
        sz: random_range(1.3, 2.3),
        a:  random_range(0.55, 1.00),
        ph: random(6.28),
        fl: random_range(0.020, 0.052),
        hs: random_range(-0.030, 0.030)
    });
}

repeat (30) {
    array_push(mote, {
        x:  random(660) - 10,
        y:  random(480),
        vs: random_range(0.20, 0.60),
        sw: random_range(0.5, 1.5),
        sz: random_range(0.8, 2.0),
        a:  random_range(0.20, 0.58),
        ph: random(6.28),
        fl: random_range(0.014, 0.032)
    });
}


p05_vgrad = function(_y0, _y1, _c0, _a0, _c1, _a1) {
    if (_a0 <= 0.002 && _a1 <= 0.002) return;
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(-40, _y0, _c0, _a0); draw_vertex_colour(680, _y0, _c0, _a0);
    draw_vertex_colour(-40, _y1, _c1, _a1); draw_vertex_colour(680, _y1, _c1, _a1);
    draw_primitive_end();
}

p05_glow = function(_x, _y, _r, _col, _a, _yscale = 1) {
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

p05_ring = function(_x, _y, _r, _w, _col, _a, _yscale = 1) {
    if (_a <= 0.002 || _r <= 0) return;
    var _n = 40;
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _n; i++) {
        var _d  = i * (360 / _n);
        var _cx = lengthdir_x(1, _d), _cy = lengthdir_y(1, _d) * _yscale;
        var _ri = max(_r - _w, 0);
        draw_vertex_colour(_x + _cx * _ri, _y + _cy * _ri, _col, 0);
        draw_vertex_colour(_x + _cx * _r,  _y + _cy * _r,  _col, _a);
    }
    draw_primitive_end();
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _n; i++) {
        var _d  = i * (360 / _n);
        var _cx = lengthdir_x(1, _d), _cy = lengthdir_y(1, _d) * _yscale;
        var _ro = _r + _w;
        draw_vertex_colour(_x + _cx * _r,  _y + _cy * _r,  _col, _a);
        draw_vertex_colour(_x + _cx * _ro, _y + _cy * _ro, _col, 0);
    }
    draw_primitive_end();
}

p05_impact = function(_ix, _iy) {
    shake_power = 17;
    flash       = 1;
    eye_glow    = 1;
    aura_target = 1;
    slash_t     = 0;

    array_push(shock, {x: _ix, y: _iy, r: 10, spd: 13, life: 30, maxlife: 30, col: COL_MAG,   ys: 1.0, w: 9});
    array_push(shock, {x: _ix, y: _iy, r: 0,  spd: 8,  life: 42, maxlife: 42, col: c_white,   ys: 1.0, w: 5});
    array_push(shock, {x: 320,  y: 296, r: 14, spd: 11, life: 36, maxlife: 36, col: COL_EYE, ys: 0.30, w: 12});

    repeat (38) {
        var _d = random_range(190, 350);
        var _v = random_range(2.5, 9.0);
        array_push(spark, {
            x:    _ix + random_range(-16, 16),
            y:    _iy + random_range(-8, 8),
            hs:   lengthdir_x(_v, _d),
            vs:   lengthdir_y(_v, _d),
            life: irandom_range(20, 44),
            maxlife: 44,
            col:  choose(COL_MAG, COL_EYE, c_white)
        });
    }
    repeat (16) {
        array_push(spark, {
            x:    320 + random_range(-46, 46),
            y:    294 + random_range(-4, 4),
            hs:   random_range(-3.2, 3.2),
            vs:   -random_range(1.0, 3.4),
            life: irandom_range(24, 46),
            maxlife: 46,
            col:  COL_DUST
        });
    }
}
