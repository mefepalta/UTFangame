// =====================================================================
//  ON PLAN (Draw End: her seyin ustunde)
//  Goz parlamasi -> yatay isik cizgileri -> kivilcim -> diyalog ->
//  sicak vinyet -> kenar isi parlamasi
// =====================================================================
var _sx = global.p15_sx;
var _sy = global.p15_sy;

gpu_set_blendmode(bm_add);

// ---- goz parlamasi ---------------------------------------------------
// Yuzdeki yanan kareler (3, 7, 8) hem kizil hem mor piksel iceriyor;
// burada kizil taraf one cikarilip sahnenin ates paletine baglandi.
if (eye_glow > 0.01) {
    var _g = eye_glow * (0.85 + sin(pulse * 2.1) * 0.15);
    if (instance_exists(o_p15_eye) && o_p15_eye.image_alpha > 0) {
        // Faz 2'nin gozu: beyaz-sicak cekirdek, genis turuncu hale ve
        // ekrani yalayan merceksi bir cizgi (P05'te halka vardi).
        var _ex = o_p15_eye.x + _sx, _ey = o_p15_eye.y + _sy;
        p15_flare(_ex, _ey, 210 + 120 * _g, 15 + 9 * _g, COL_FIRE, _g * 0.55);
        p15_glow(_ex, _ey, 60 + 26 * _g, COL_EMBER, _g * 0.75);
        p15_glow(_ex, _ey, 26 + 12 * _g, COL_GOLD,  _g * 0.60);
        p15_glow(_ex, _ey, 11 +  6 * _g, c_white,   _g * 0.50);
        // dikey ince huzme
        p15_glow(_ex, _ey, 26 + 14 * _g, COL_FIRE, _g * 0.30, 5.0);
    }
    else if (instance_exists(o_p15_head) && o_p15_head.image_alpha > 0) {
        // Parlama, o an ekranda duran KARENIN gozleri yaniyorsa cizilir.
        // Eskiden kare ne olursa olsun basiliyordu: gozleri kapali
        // karelerin uzerinde bos bir kizillik olusuyordu.
        //   s_p15_headraise      -> kalkis animasyonu, gozler kademeli yaniyor
        //   s_p15_headraise_2    -> 8 ve 3 iki goz, 7 sadece SAG goz,
        //                           digerleri sonuk
        var _spr = o_p15_head.sprite_index;
        var _idx = floor(o_p15_head.image_index);
        var _L = 0, _R = 0;                       // sol / sag goz siddeti

        if (_spr == s_p15_headraise) {
            var _p2 = clamp(_idx / 6, 0, 1);      // kalkista kademeli
            _L = _p2; _R = _p2;
        }
        else if (_spr == s_p15_headraise_2) {
            if (_idx == 8 || _idx == 3) { _L = 1;    _R = 1; }
            else if (_idx == 7)         { _L = 0;    _R = 1; }
        }

        if (_L > 0 || _R > 0) {
            // Goz merkezleri sprite'taki renkli pikseller olculerek bulundu
            // (sol ~ (10,17), sag ~ (22,16); origin (16,33), olcek 2).
            var _hx = o_p15_head.x + _sx, _hy = o_p15_head.y + _sy;
            if (_L > 0) p15_glow(_hx - 12, _hy - 32, 20 + 8 * _g, COL_EYE, _g * 0.70 * _L);
            if (_R > 0) p15_glow(_hx + 12, _hy - 34, 20 + 8 * _g, COL_EYE, _g * 0.70 * _R);
            var _mid = (_L > 0 && _R > 0) ? 0 : (_R > 0 ? 8 : -8);
            p15_glow(_hx + _mid, _hy - 33, 54 + 24 * _g, COL_EMBER,
                     _g * 0.15 * max(_L, _R));
        }
    }
}

// ---- muzik vuruslarinda ekrani yalayan isik cizgileri ------------------
for (var i = 0; i < array_length(flare); i++) {
    var _f = flare[i];
    var _u = _f.life / _f.maxlife;              // 1 -> 0
    p15_flare(320 + _sx, _f.y + _sy, 200 + (1 - _u) * 520, 5 + _u * 22, _f.col, _u * _u * 0.45);
}

// ---- kivilcimlar ------------------------------------------------------
for (var i = 0; i < array_length(spark); i++) {
    var _k = spark[i];
    var _a = _k.life / _k.maxlife;
    draw_set_alpha(_a);
    draw_set_colour(_k.col);
    draw_line_width(_k.x + _sx, _k.y + _sy, _k.x - _k.hs * 1.5 + _sx, _k.y - _k.vs * 1.5 + _sy, 2);
}
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

// ---- diyalog ----------------------------------------------------------
if (current_line >= 0) {
    var _txt      = string_copy(dialogue[current_line].text, 1, chars_visible);
    var _narrator = (current_line >= LINE_NARRATOR);
    var _shout    = (current_line == LINE_NARRATOR - 1);   // "I'VE NEVER BEEN MORE EXCITED!"
    var _tx       = 85 + _sx;
    var _ty       = 310 + _sy;

    draw_set_font(font_custom);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    if (_shout && _txt != "") {
        gpu_set_blendmode(bm_add);
        p15_flare(_tx + 250, _ty + 22, 300 + sin(pulse * 3) * 24, 34, COL_EMBER, 0.30);
        gpu_set_blendmode(bm_normal);
    }

    // golge -> yazi sicak zeminin uzerinde okunakli kalsin
    draw_set_colour(c_black);
    draw_set_alpha(0.68);
    draw_text_ext(_tx + 2, _ty + 2, _txt, 40, 500);
    draw_set_alpha(1);

    if (_shout)         draw_set_colour(make_colour_rgb(255, 206, 150));  // kizgin demir
    else if (_narrator) draw_set_colour(make_colour_rgb(240, 228, 214));  // sicak beyaz
    else                draw_set_colour(c_white);
    draw_text_ext(_tx, _ty, _txt, 40, 500);
    draw_set_colour(c_white);
}

// ---- vinyet ------------------------------------------------------------
// Duz siyah degil koyu kizil: kenarlar da yangina ait gorunsun.
var _cover = flash;
if (instance_exists(o_shine)) _cover = max(_cover, clamp(o_shine.image_alpha, 0, 1));
var _v  = (0.24 + aura * 0.24) * (1 - _cover);
var _vc = merge_colour(c_black, COL_BLOOD, 0.35);
draw_primitive_begin(pr_trianglestrip);
draw_vertex_colour(0,  0,  _vc, _v); draw_vertex_colour(640, 0,  _vc, _v);
draw_vertex_colour(0,  72, _vc, 0);  draw_vertex_colour(640, 72, _vc, 0);
draw_primitive_end();
draw_primitive_begin(pr_trianglestrip);
draw_vertex_colour(0,  440, _vc, 0);  draw_vertex_colour(640, 440, _vc, 0);
draw_vertex_colour(0,  480, _vc, _v); draw_vertex_colour(640, 480, _vc, _v);
draw_primitive_end();
draw_primitive_begin(pr_trianglestrip);
draw_vertex_colour(0,  0, _vc, _v); draw_vertex_colour(0,  480, _vc, _v);
draw_vertex_colour(64, 0, _vc, 0);  draw_vertex_colour(64, 480, _vc, 0);
draw_primitive_end();
draw_primitive_begin(pr_trianglestrip);
draw_vertex_colour(576, 0, _vc, 0);  draw_vertex_colour(576, 480, _vc, 0);
draw_vertex_colour(640, 0, _vc, _v); draw_vertex_colour(640, 480, _vc, _v);
draw_primitive_end();

// ---- kenar isi parlamasi ----------------------------------------------
// P05'teki tam ekran beyaz flas yerine, vuruslarda kenarlardan iceri
// vuran turuncu bir kizarma: sahne beyaza bogulmuyor, kiziyor.
var _rim = flash * flash + beat * 0.35;
if (_rim > 0.01) {
    gpu_set_blendmode(bm_add);
    var _ra = min(_rim, 1) * 0.55;
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(0, 480, COL_EMBER, _ra); draw_vertex_colour(640, 480, COL_EMBER, _ra);
    draw_vertex_colour(0, 300, COL_EMBER, 0);   draw_vertex_colour(640, 300, COL_EMBER, 0);
    draw_primitive_end();
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(0, 0,   COL_BLOOD, _ra * 0.7); draw_vertex_colour(640, 0,   COL_BLOOD, _ra * 0.7);
    draw_vertex_colour(0, 150, COL_BLOOD, 0);         draw_vertex_colour(640, 150, COL_BLOOD, 0);
    draw_primitive_end();
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(0,   0, COL_EMBER, _ra * 0.8); draw_vertex_colour(0,   480, COL_EMBER, _ra * 0.8);
    draw_vertex_colour(120, 0, COL_EMBER, 0);         draw_vertex_colour(120, 480, COL_EMBER, 0);
    draw_primitive_end();
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(520, 0, COL_EMBER, 0);         draw_vertex_colour(520, 480, COL_EMBER, 0);
    draw_vertex_colour(640, 0, COL_EMBER, _ra * 0.8); draw_vertex_colour(640, 480, COL_EMBER, _ra * 0.8);
    draw_primitive_end();
    gpu_set_blendmode(bm_normal);
}

draw_set_alpha(1);
draw_set_colour(c_white);
