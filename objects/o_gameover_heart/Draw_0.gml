
var _ox = shake_x;
var _oy = shake_y;

if (!burst_done && soul_scale > 0) {
    var _fade = (val_ < T_CRACK) ? 1 : max(0, 1 - (val_ - T_CRACK) / 90);
    var _ha   = 0.17 * _fade * soul_pulse * clamp(soul_scale, 0, 1);
    if (_ha > 0.002) {
        var _hr = 118 * soul_pulse;
        var _hx = soul_x + tremble_x + _ox;
        var _hy = soul_y + _oy;
        draw_primitive_begin(pr_trianglefan);
        draw_vertex_colour(_hx, _hy, c_red, _ha);
        for (var i = 0; i <= 24; i++) {
            var _a = i * 15;
            draw_vertex_colour(_hx + lengthdir_x(_hr, _a), _hy + lengthdir_y(_hr, _a), c_red, 0);
        }
        draw_primitive_end();
    }
}

for (var i = 0; i < array_length(shards); i++) {
    var _s = shards[i];
    if (!_s.behind) continue;
    draw_sprite_ext(s_go_shard, _s.img, _s.x + _ox, _s.y + _oy,
                    _s.sc, _s.sc, _s.draw_rot, c_white, 1);
}

if (hand_t > 0) {
    var _e  = 1 - power(1 - hand_t, 2);
    var _hy = lerp(home_y + 18, home_y + 38, _e)
            + hand_snap
            + dsin(hand_bob) * 2.2 * _e;
    draw_sprite_ext(s_go_hand, 0, home_x + 6 + _ox, _hy + _oy,
                    SOUL_SCALE, SOUL_SCALE, 0, c_white, _e);
}

if (!burst_done && soul_alpha > 0 && soul_scale > 0) {
    var _s = soul_scale * soul_pulse * SOUL_SCALE;
    draw_sprite_ext(s_go_soul, soul_frame,
                    soul_x + tremble_x + _ox, soul_y + _oy,
                    _s, _s, 0, c_white, soul_alpha);
}

for (var i = 0; i < array_length(shards); i++) {
    var _s = shards[i];
    if (_s.behind) continue;
    draw_sprite_ext(s_go_shard, _s.img, _s.x + _ox, _s.y + _oy,
                    _s.sc, _s.sc, _s.draw_rot, c_white, 1);
}

if (array_length(sparks) > 0) {
    draw_set_color(c_red);
    for (var i = 0; i < array_length(sparks); i++) {
        var _s = sparks[i];
        var _a = 1 - (_s.age / _s.life);
        draw_set_alpha(_a);
        draw_rectangle(_s.x + _ox, _s.y + _oy,
                       _s.x + _ox + _s.sz, _s.y + _oy + _s.sz, false);
    }
    draw_set_alpha(1);
}

if (array_length(beams) > 0) {
    draw_set_color(c_red);
    for (var i = 0; i < array_length(beams); i++) {
        var _b  = beams[i];
        var _l  = _b.len * _b.t;
        var _w  = _b.wid * _b.t;
        var _nx = lengthdir_x(_w, _b.dir + 90);
        var _ny = lengthdir_y(_w, _b.dir + 90);
        draw_set_alpha(min(1, _b.t * 1.7));
        draw_triangle(home_x + _nx + _ox, home_y + _ny + _oy,
                      home_x - _nx + _ox, home_y - _ny + _oy,
                      home_x + lengthdir_x(_l, _b.dir) + _ox,
                      home_y + lengthdir_y(_l, _b.dir) + _oy, false);
    }
    draw_set_alpha(1);
}

if (array_length(embers) > 0) {
    draw_set_color(c_maroon);
    for (var i = 0; i < array_length(embers); i++) {
        var _m = embers[i];
        draw_set_alpha(_m.a);
        draw_rectangle(_m.x, _m.y, _m.x + _m.sz, _m.y + _m.sz, false);
    }
    draw_set_alpha(1);
}

if (white_a > 0.001) {
    draw_set_color(c_white);
    draw_set_alpha(white_a);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
}

if (array_length(bars) > 0) {
    draw_set_color(c_white);
    for (var i = 0; i < array_length(bars); i++) {
        var _b = bars[i];
        draw_set_alpha(_b.a);
        draw_rectangle(0, _b.y, room_width, _b.y + _b.h, false);
    }
    draw_set_alpha(1);
}

draw_set_color(c_white);
