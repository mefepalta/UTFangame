var _sx = global.p15_sx * 0.45;
var _sy = global.p15_sy * 0.45;
var _pl = 1 + sin(pulse) * 0.05 + beat * 0.12;
var _a  = aura;

gpu_set_blendmode(bm_add);

p15_vgrad(480 + _sy, 372 + _sy, COL_EMBER, _a * 0.52, COL_BLOOD, _a * 0.34);
p15_vgrad(372 + _sy, 236 + _sy, COL_BLOOD, _a * 0.34, COL_BLOOD, _a * 0.13);
p15_vgrad(236 + _sy,  96 + _sy, COL_BLOOD, _a * 0.13, COL_BLOOD, 0);

p15_glow(320 + _sx, 470 + _sy, 340 * _pl, COL_FIRE,  _a * 0.30, 0.38);
p15_glow(320 + _sx, 478 + _sy, 170 * _pl, COL_GOLD,  _a * _a * 0.26, 0.30);

if (_a > 0.05) {
    for (var i = 0; i < 5; i++) {
        var _fx = 130 + i * 115 + sin(pulse * 0.7 + i * 2.1) * 26 + _sx;
        var _fh = 130 + sin(pulse * 1.3 + i * 1.7) * 45 + beat * 60;
        var _fa = _a * (0.10 + beat * 0.10);
        draw_primitive_begin(pr_trianglestrip);
        draw_vertex_colour(_fx - 34, 486 + _sy,       COL_EMBER, _fa);
        draw_vertex_colour(_fx + 34, 486 + _sy,       COL_EMBER, _fa);
        draw_vertex_colour(_fx - 12, 486 - _fh + _sy, COL_FIRE,  0);
        draw_vertex_colour(_fx + 12, 486 - _fh + _sy, COL_FIRE,  0);
        draw_primitive_end();
    }
}

if (volc > 0.01) {
    var _v  = volc;
    var _lb = 0.5 + 0.5 * sin(pulse * 1.4);

    p15_glow(320 + _sx, VLAVA_Y + _sy, 400 * _pl, COL_EMBER, 0.26 * _v, 0.42);
    p15_glow(320 + _sx, VLAVA_Y + _sy, 220 * _pl, COL_FIRE,  0.20 * _v, 0.34);

    var _vn = 36;
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _vn; i++) {
        var _u  = i / _vn;
        var _x  = -20 + _u * 680;
        var _wy = VLAVA_Y - 12 + sin(pulse * 0.9 + _u * 10.0) * 5 + sin(pulse * 0.6 + _u * 4.2) * 4;
        var _la = (0.44 + 0.28 * (0.5 + 0.5 * sin(pulse * 0.8 + _u * 6.6)) + 0.10 * _lb) * _v;
        draw_vertex_colour(_x, _wy + _sy,             COL_FIRE, 0);
        draw_vertex_colour(_x, VLAVA_Y + 8 + _sy,     COL_GOLD, _la);
    }
    draw_primitive_end();
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _vn; i++) {
        var _u  = i / _vn;
        var _x  = -20 + _u * 680;
        var _la = (0.44 + 0.28 * (0.5 + 0.5 * sin(pulse * 0.8 + _u * 6.6)) + 0.10 * _lb) * _v;
        draw_vertex_colour(_x, VLAVA_Y + 8 + _sy,  COL_GOLD, _la);
        draw_vertex_colour(_x, VLAVA_Y + 40 + _sy, COL_FIRE, 0);
    }
    draw_primitive_end();

    gpu_set_blendmode(bm_normal);
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i < array_length(vridge); i++) {
        draw_vertex_colour(vridge[i].x, vridge[i].y + _sy, COL_ROCK, 0.95 * _v);
        draw_vertex_colour(vridge[i].x, 486,               COL_ROCK, 0.95 * _v);
    }
    draw_primitive_end();
    gpu_set_blendmode(bm_add);
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i < array_length(vridge); i++) {
        draw_vertex_colour(vridge[i].x, vridge[i].y - 4 + _sy, COL_FIRE, 0);
        draw_vertex_colour(vridge[i].x, vridge[i].y + 2 + _sy, COL_FIRE, (0.30 + 0.10 * _lb) * _v);
    }
    draw_primitive_end();
}

p15_glow(320 + _sx, 250 + _sy, 220 * _pl, COL_BLOOD, _a * 0.42);
p15_glow(320 + _sx, 262 + _sy, 130 * _pl, COL_EMBER, _a * _a * 0.34);

if (current_line >= LINE_NARRATOR && instance_exists(o_p15_eye)) {
    var _ex = o_p15_eye.x + _sx, _ey = o_p15_eye.y + _sy;
    p15_glow(_ex, _ey, 110 + _a * 230, COL_EMBER, _a * 0.34);
    p15_glow(_ex, _ey,  55 + _a * 120, COL_FIRE,  _a * 0.28);
    p15_glow(_ex, _ey,  22 + _a *  55, COL_GOLD,  _a * 0.22);
}

for (var i = 0; i < array_length(mote); i++) {
    var _m = mote[i];
    var _fk = 0.45 + 0.55 * (0.5 + 0.5 * sin(_m.ph));
    draw_set_alpha(_m.a * _fk * (0.30 + aura * 0.95));
    draw_set_colour(_m.sz > 1.8 ? COL_GOLD : COL_EMBER);
    var _s = _m.sz * (0.75 + _fk * 0.45);
    draw_rectangle(_m.x - _s + _sx, _m.y - _s + _sy, _m.x + _s + _sx, _m.y + _s + _sy, false);
}

draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

if (volc > 0.01) {
    draw_set_colour(COL_ASH);
    for (var i = 0; i < array_length(ash); i++) {
        var _k = ash[i];
        draw_set_alpha(_k.a * (0.55 + 0.45 * sin(_k.ph)) * volc);
        draw_rectangle(_k.x - _k.sz + _sx, _k.y - _k.sz + _sy,
                       _k.x + _k.sz + _sx, _k.y + _k.sz + _sy, false);
    }
    draw_set_alpha(1);
    draw_set_colour(c_white);
}
