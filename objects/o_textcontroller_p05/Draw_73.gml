// =====================================================================
//  ON PLAN (Draw End: her seyin ustunde)
//  Goz parlamasi -> savurma yayi -> sok dalgalari -> kivilcim ->
//  diyalog -> beyaz flas -> vinyet
// =====================================================================
var _sx = global.p05_sx;
var _sy = global.p05_sy;

gpu_set_blendmode(bm_add);

// ---- Sans'in gozlerindeki parlama -----------------------------------
// Goz merkezleri sprite'lardaki pembe pikseller olculerek bulundu.
if (eye_glow > 0.01) {
    var _g = eye_glow * (0.85 + sin(pulse * 2.3) * 0.15);
    if (instance_exists(o_p05head) && o_p05head.image_alpha > 0) {
        var _hx = o_p05head.x, _hy = o_p05head.y;
        p05_glow(_hx - 13, _hy - 32, 26 + 10 * _g, COL_EYE, _g * 0.75);
        p05_glow(_hx + 13, _hy - 34, 26 + 10 * _g, COL_EYE, _g * 0.75);
        p05_glow(_hx,      _hy - 33, 70 + 30 * _g, COL_MAG, _g * 0.16);
    }
    else if (instance_exists(o_p05decoy) && o_p05decoy.image_alpha > 0) {
        var _dx = o_p05decoy.x, _dy = o_p05decoy.y;
        p05_glow(_dx - 33, _dy - 125, 28 + 12 * _g, COL_EYE, _g * 0.75);
        p05_glow(_dx -  7, _dy - 126, 28 + 12 * _g, COL_EYE, _g * 0.75);
        p05_glow(_dx - 20, _dy - 125, 80 + 34 * _g, COL_MAG, _g * 0.16);
    }
}

// ---- kol savurmasinin biraktigi yay ---------------------------------
if (slash_t > 0) {
    var _u  = slash_t / 15;               // 1 -> 0
    var _ax = 356 + _sx, _ay = 214 + _sy; // kolun donme merkezi
    var _r  = 34 + (1 - _u) * 40;
    var _a  = _u * 0.34;
    var _n  = 18;
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _n; i++) {
        var _d = -96 + (i / _n) * 104;    // yukaridan asagi supuruyor
        var _t = sin((i / _n) * pi);      // uclari inceltir
        draw_vertex_colour(_ax + lengthdir_x(_r - 7 * _t, _d), _ay + lengthdir_y(_r - 7 * _t, _d), c_white, 0);
        draw_vertex_colour(_ax + lengthdir_x(_r + 7 * _t, _d), _ay + lengthdir_y(_r + 7 * _t, _d), COL_MAG, _a * _t);
    }
    draw_primitive_end();
}

// ---- sok dalgalari ---------------------------------------------------
for (var i = 0; i < array_length(shock); i++) {
    var _s = shock[i];
    var _a = (_s.life / _s.maxlife);
    p05_ring(_s.x + _sx * 0.5, _s.y + _sy * 0.5, _s.r, _s.w, _s.col, _a * _a * 0.85, _s.ys);
}

// ---- kivilcimlar ------------------------------------------------------
for (var i = 0; i < array_length(spark); i++) {
    var _k = spark[i];
    var _a = _k.life / _k.maxlife;
    draw_set_alpha(_a);
    draw_set_colour(_k.col);
    // hiz yonunde kisa cizgi -> hareket hissi
    draw_line_width(_k.x + _sx, _k.y + _sy, _k.x - _k.hs * 1.6 + _sx, _k.y - _k.vs * 1.6 + _sy, 2);
}
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

// ---- diyalog ----------------------------------------------------------
if (current_line >= 0) {
    var _txt     = string_copy(dialogue[current_line].text, 1, chars_visible);
    var _last    = (current_line == array_length(dialogue) - 2);   // "REAL monster..."
    var _tx      = 85 + _sx;
    var _ty      = 310 + _sy;
    var _sep     = 40;
    var _wid     = 500;

    draw_set_font(font_sans_1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    if (_last && _txt != "") {
        // Son replik: arkasinda nabiz gibi atan magenta bir parlama
        gpu_set_blendmode(bm_add);
        p05_glow(_tx + 250, _ty + 42, 250 + sin(pulse * 3) * 18, COL_EYE, 0.16);
        gpu_set_blendmode(bm_normal);
    }

    // golge -> yazinin gradyan uzerinde okunakli kalmasi icin
    draw_set_colour(c_black);
    draw_set_alpha(0.65);
    draw_text_ext(_tx + 2, _ty + 2, _txt, _sep, _wid);
    draw_set_alpha(1);

    draw_set_colour(_last ? make_colour_rgb(255, 208, 240) : c_white);
    draw_text_ext(_tx, _ty, _txt, _sep, _wid);
    draw_set_colour(c_white);
}

// ---- vinyet: kenarlar hafifce kararsin --------------------------------
// Yazi alanina (x 85..585, y 310..430) girmesin diye dar tutuldu.
// Ekran beyaza gomuldugunde (darbe flasi ya da o_shine ortusu) tamamen
// kapaniyor; aksi halde beyazin uzerinde koyu bir cerceve gorunuyordu.
var _cover = flash;
if (instance_exists(o_shine)) _cover = max(_cover, clamp(o_shine.image_alpha, 0, 1));
var _v = (0.24 + aura * 0.20) * (1 - _cover);
gpu_set_blendmode(bm_normal);
draw_primitive_begin(pr_trianglestrip);
// ust
draw_vertex_colour(0,  0,  c_black, _v); draw_vertex_colour(640, 0,  c_black, _v);
draw_vertex_colour(0,  72, c_black, 0);  draw_vertex_colour(640, 72, c_black, 0);
draw_primitive_end();
draw_primitive_begin(pr_trianglestrip);
// alt
draw_vertex_colour(0,  440, c_black, 0);  draw_vertex_colour(640, 440, c_black, 0);
draw_vertex_colour(0,  480, c_black, _v); draw_vertex_colour(640, 480, c_black, _v);
draw_primitive_end();
draw_primitive_begin(pr_trianglestrip);
// sol
draw_vertex_colour(0,  0,   c_black, _v); draw_vertex_colour(0,  480, c_black, _v);
draw_vertex_colour(64, 0,   c_black, 0);  draw_vertex_colour(64, 480, c_black, 0);
draw_primitive_end();
draw_primitive_begin(pr_trianglestrip);
// sag
draw_vertex_colour(576, 0, c_black, 0);  draw_vertex_colour(576, 480, c_black, 0);
draw_vertex_colour(640, 0, c_black, _v); draw_vertex_colour(640, 480, c_black, _v);
draw_primitive_end();

// ---- darbe flasi (vinyetin ustunde, ki ekran duz beyaza gitsin) -------
if (flash > 0.01) {
    var _f = flash * flash;
    gpu_set_blendmode(bm_add);
    draw_set_alpha(_f * 0.62);
    draw_set_colour(c_white);
    draw_rectangle(0, 0, 640, 480, false);
    gpu_set_blendmode(bm_normal);
}

draw_set_alpha(1);
draw_set_colour(c_white);
