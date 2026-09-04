// =====================================================================
//  Mizrak: sarj parlamasi -> hiz cizgileri -> hayalet iz -> mizrak
// =====================================================================
if (image_alpha <= 0) exit;

gpu_set_blendmode(bm_add);

// ---- yukarida sarj olurken cevresinde toplanan isik ------------------
if (state == 1) {
    var _c = charge;
    var _n = 18;
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_colour(x, y, COL_SPEAR, 0.55 * _c);
    for (var i = 0; i <= _n; i++) {
        var _d = i * (360 / _n);
        draw_vertex_colour(x + lengthdir_x(120, _d), y + lengthdir_y(70, _d), COL_SPEAR, 0);
    }
    draw_primitive_end();
}

// ---- dususte arkada kalan hiz cizgileri ------------------------------
if (state == 2 && fall_speed > 1) {
    var _len = fall_speed * 5;
    for (var i = 0; i < 7; i++) {
        var _ox = -74 + i * 24 + random_range(-4, 4);
        var _a  = random_range(0.10, 0.34);
        draw_primitive_begin(pr_trianglestrip);
        draw_vertex_colour(x + _ox - 1, y - _len, COL_SPEAR, 0);
        draw_vertex_colour(x + _ox + 1, y - _len, COL_SPEAR, 0);
        draw_vertex_colour(x + _ox - 1, y,        COL_SPEAR, _a);
        draw_vertex_colour(x + _ox + 1, y,        COL_SPEAR, _a);
        draw_primitive_end();
    }
}

// ---- hayalet iz -------------------------------------------------------
var _cnt = array_length(trail);
for (var i = 0; i < _cnt; i++) {
    var _t = trail[i];
    var _f = (i + 1) / _cnt;                 // eskiden yeniye
    draw_sprite_ext(sprite_index, image_index,
                    _t.x + global.p05_sx, _t.y + global.p05_sy,
                    image_xscale, image_yscale, image_angle,
                    COL_SPEAR, _f * _f * 0.35 * image_alpha);
}

// ---- mizragin kendi parlamasi ----------------------------------------
var _glow = (state == 3) ? 0.75 * exp(-land_t / 10) : (state == 2 ? 0.30 : 0.18 * charge);
if (_glow > 0.01) {
    var _n2 = 20;
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_colour(x + 4, y + 6, COL_SPEAR, _glow);
    for (var i = 0; i <= _n2; i++) {
        var _d = i * (360 / _n2);
        draw_vertex_colour(x + 4 + lengthdir_x(130, _d), y + 6 + lengthdir_y(78, _d), COL_SPEAR, 0);
    }
    draw_primitive_end();
}

gpu_set_blendmode(bm_normal);

// ---- mizragin kendisi -------------------------------------------------
draw_self();

// Carpma aninda bir kare beyaz parlama
if (state == 3 && land_t < 5) {
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index, image_index, x, y,
                    image_xscale, image_yscale, image_angle,
                    c_white, 1 - land_t / 5);
    gpu_set_blendmode(bm_normal);
}
