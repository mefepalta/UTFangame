
depth = 60;

fire = (room == room_battle_1);

t      = 0;
alpha  = 1;
settle = 1;


bg_vgrad = function(_y0, _y1, _c0, _a0, _c1, _a1) {
    if (_a0 <= 0.002 && _a1 <= 0.002) return;
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(-40, _y0, _c0, _a0); draw_vertex_colour(680, _y0, _c0, _a0);
    draw_vertex_colour(-40, _y1, _c1, _a1); draw_vertex_colour(680, _y1, _c1, _a1);
    draw_primitive_end();
}

bg_glow = function(_x, _y, _r, _col, _a, _ys = 1) {
    if (_a <= 0.002 || _r <= 0) return;
    var _n = 28;
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_colour(_x, _y, _col, _a);
    for (var i = 0; i <= _n; i++) {
        var _d = i * (360 / _n);
        draw_vertex_colour(_x + lengthdir_x(_r, _d), _y + lengthdir_y(_r, _d) * _ys, _col, 0);
    }
    draw_primitive_end();
}

if (!fire)
{
    COL_NIGHT = make_colour_rgb( 20,  10,  44);
    COL_NEB   = make_colour_rgb(112,  32, 156);
    COL_ACC   = make_colour_rgb(226,  11, 177);
    COL_STAR  = make_colour_rgb(234, 228, 255);
    COL_SNOW  = make_colour_rgb(206, 216, 255);
    COL_GND   = make_colour_rgb( 30,  20,  62);

    GND_Y = 388;

    star = [];
    repeat (110) {
        array_push(star, {
            x: random(660) - 10, y: random(GND_Y - 6),
            sz: random_range(0.5, 1.1), a: random_range(0.20, 0.55),
            ph: random(6.28), fl: random_range(0.010, 0.030),
            hs: random_range(-0.012, 0.012), near: false
        });
    }
    repeat (26) {
        array_push(star, {
            x: random(660) - 10, y: random(GND_Y - 40),
            sz: random_range(1.3, 2.4), a: random_range(0.55, 1.00),
            ph: random(6.28), fl: random_range(0.020, 0.055),
            hs: random_range(-0.035, 0.035), near: true
        });
    }

    constel = [];
    var _anchors = [[118, 108], [498, 92], [312, 196]];
    for (var c = 0; c < 3; c++) {
        var _pts = [];
        var _ax  = _anchors[c][0], _ay = _anchors[c][1];
        var _n   = irandom_range(4, 6);
        for (var k = 0; k < _n; k++) {
            array_push(_pts, {x: _ax, y: _ay});
            _ax += random_range(-58, 58);
            _ay += random_range(-34, 40);
            _ay  = clamp(_ay, 34, 262);
            _ax  = clamp(_ax, 40, 600);
        }
        array_push(constel, {pts: _pts, ph: c * 2.09, spd: 0.0055});
    }

    nebula = [];
    repeat (3) {
        var _bx = random_range(60, 580), _by = random_range(40, 230);
        var _bd = random_range(-38, -12);
        var _pieces = [];
        repeat (5) {
            array_push(_pieces, {
                dx: 0, dy: 0, r: random_range(70, 150)
            });
        }
        for (var k = 0; k < 5; k++) {
            _pieces[k].dx = lengthdir_x(k * 62, _bd) + random_range(-16, 16);
            _pieces[k].dy = lengthdir_y(k * 62, _bd) + random_range(-14, 14);
        }
        array_push(nebula, {
            x: _bx, y: _by, pieces: _pieces,
            a: random_range(0.055, 0.105), hs: random_range(-0.045, 0.045),
            ph: random(6.28)
        });
    }

    snow = [];
    repeat (44) {
        array_push(snow, {
            x: random(660) - 10, y: random(480),
            vs: random_range(0.20, 0.62), sw: random_range(0.5, 1.6),
            sz: random_range(0.8, 2.0), a: random_range(0.22, 0.62),
            ph: random(6.28), fl: random_range(0.014, 0.034)
        });
    }

    shoot = [];
}
else
{
    COL_SKY   = make_colour_rgb( 26,   9,   7);
    COL_SMOKE = make_colour_rgb( 74,  36,  28);
    COL_MID   = make_colour_rgb(150,  22,  10);
    COL_ACC   = make_colour_rgb(249, 105,   0);
    COL_HOT   = make_colour_rgb(255, 214, 130);
    COL_ROCK  = make_colour_rgb( 16,   7,   7);
    COL_ASH   = make_colour_rgb(120,  98,  92);

    LAVA_Y = 316;

    RIDGE_N = 34;
    ridge = [];
    for (var i = 0; i <= RIDGE_N; i++) {
        var _u    = i / RIDGE_N;
        var _edge = 1 - sin(_u * pi);
        var _h    = 96 + _edge * 78 + irandom_range(0, 26)
                  + sin(_u * 17.0) * 9;
        array_push(ridge, {x: -20 + _u * 680, y: 486 - _h});
    }

    ridge_top_at = function(_x) {
        var _f = clamp((_x + 20) / 680 * RIDGE_N, 0, RIDGE_N);
        var _i = clamp(floor(_f), 0, RIDGE_N - 1);
        return lerp(ridge[_i].y, ridge[_i + 1].y, _f - _i);
    };

    ridge_top_span = function(_x, _r) {
        var _a = _x - _r, _b = _x + _r;
        var _t = max(ridge_top_at(_a), ridge_top_at(_b));
        var _i0 = clamp(ceil( (_a + 20) / 680 * RIDGE_N), 0, RIDGE_N);
        var _i1 = clamp(floor((_b + 20) / 680 * RIDGE_N), 0, RIDGE_N);
        for (var i = _i0; i <= _i1; i++) { _t = max(_t, ridge[i].y); }
        return _t;
    };

    crack = [];
    repeat (5) {
        var _cx = (choose(0, 1) == 0) ? random_range(40, 185) : random_range(455, 600);
        var _cy = ridge_top_at(_cx);
        var _n  = irandom_range(4, 6);
        var _pts = [];
        for (var k = 0; k < _n; k++) {
            _cy = max(_cy, ridge_top_at(_cx));
            if (_cy > 372) break;
            array_push(_pts, {x: _cx, y: _cy, hw: 0, gr: 0});
            _cx += random_range(-7, 7);
            _cy += random_range(9, 15);
        }

        var _np = array_length(_pts);
        if (_np < 2) continue;

        for (var k = 0; k < _np; k++) {
            var _q  = k / (_np - 1);
            var _px = _pts[k].x, _py = _pts[k].y;

            var _hw = 3.2 * (1 - _q * 0.7) + 0.5;
            while (_hw > 0 && _py < ridge_top_span(_px, _hw)) { _hw -= 0.3; }
            _pts[k].hw = max(_hw, 0);

            var _gr = 24 * (1 - _q * 0.35);
            while (_gr > 3 && (_py - ridge_top_span(_px, _gr)) < _gr) { _gr -= 3; }
            _pts[k].gr = (_gr > 3) ? _gr : 0;
        }

        array_push(crack, {pts: _pts, ph: random(6.28), spd: random_range(0.012, 0.03)});
    }

    smoke = [];
    repeat (7) {
        array_push(smoke, {
            x: random(760) - 60, y: random_range(-30, 170),
            r: random_range(90, 210), vs: random_range(-0.16, 0.16),
            hs: random_range(0.10, 0.42) * choose(-1, 1),
            a: random_range(0.20, 0.46), ph: random(6.28)
        });
    }

    spark = [];

    ash = [];
    repeat (34) {
        array_push(ash, {
            x: random(640), y: random(480),
            vs: random_range(0.18, 0.75), hs: random_range(-0.30, 0.30),
            sz: random_range(0.7, 2.0), a: random_range(0.10, 0.34),
            ph: random(6.28), fl: random_range(0.02, 0.06)
        });
    }

    bg_ridge = function(_pts, _dy, _col, _a) {
        draw_primitive_begin(pr_trianglestrip);
        for (var i = 0; i < array_length(_pts); i++) {
            draw_vertex_colour(_pts[i].x, _pts[i].y + _dy, _col, _a);
            draw_vertex_colour(_pts[i].x, 486,             _col, _a);
        }
        draw_primitive_end();
    };
}
