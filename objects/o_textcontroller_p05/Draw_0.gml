// =====================================================================
//  ARKA PLAN (depth 50: siyah zeminin ustunde, Sans'in arkasinda)
//
//  Sahne, Faz 1'in (room_battle) gece goguyle ayni gokyuzunun altinda
//  geciyor: yildizlar ve kar bastan beri var. Konusma ilerledikce mor
//  hale buyuyor ve yildizlari yutuyor - Sans'in Papyrus'la baktigi gok,
//  hiddeti kabardikca sonuyor. Mizrak dustugunde geriye sadece magenta
//  kaliyor; oda gecisi de tam oraya denk geliyor.
// =====================================================================
var _sx = global.p05_sx * 0.45;
var _sy = global.p05_sy * 0.45;
var _cx = 320 + _sx;
var _cy = 300 + _sy;
var _pl = 1 + sin(pulse) * 0.06;          // yavas nabiz

// ---- gece zemini ------------------------------------------------------
// sky: 0 -> 1, ilk ~8 saniyede aciliyor. Smoothstep ile yumusatiliyor,
// boylece basta cok yavas, sonra oturarak beliriyor.
var _sk = sky * sky * (3 - 2 * sky);

p05_vgrad(  0, 190, COL_NIGHT, 0.88 * _sk, COL_NIGHT, 0.72 * _sk);
p05_vgrad(190, 350, COL_NIGHT, 0.72 * _sk, COL_DEEP,  0.30 * _sk);
p05_vgrad(350, 482, COL_DEEP,  0.30 * _sk, COL_NIGHT, 0.55 * _sk);

gpu_set_blendmode(bm_add);

// ---- yildiz alani -----------------------------------------------------
// Once yavasca beliriyor (_sk), sonra hale buyudukce sonuyor (aura).
var _sv = _sk * (1 - min(aura * 0.85, 0.92));
if (_sv > 0.02) {
    draw_set_colour(COL_STAR);
    for (var i = 0; i < array_length(star); i++) {
        var _st = star[i];
        var _tw = 0.45 + 0.55 * (0.5 + 0.5 * sin(_st.ph));
        draw_set_alpha(_st.a * _tw * _sv);
        var _r = _st.sz * (0.8 + _tw * 0.4);
        draw_rectangle(_st.x - _r + _sx, _st.y - _r + _sy,
                       _st.x + _r + _sx, _st.y + _r + _sy, false);
        if (_st.sz > 1.2 && _tw > 0.78) {
            var _fl = _st.sz * 3.2 * _tw;
            draw_set_alpha(_st.a * (_tw - 0.78) * 2.4 * _sv);
            draw_rectangle(_st.x - _fl + _sx, _st.y - 0.5 + _sy,
                           _st.x + _fl + _sx, _st.y + 0.5 + _sy, false);
            draw_rectangle(_st.x - 0.5 + _sx, _st.y - _fl + _sy,
                           _st.x + 0.5 + _sx, _st.y + _fl + _sy, false);
        }
    }
}

// ---- Sans'in ofkesi: buyuyen mor hale ---------------------------------
p05_glow(_cx, _cy - 50, 340 * _pl, COL_DEEP, aura * 0.90);
p05_glow(_cx, _cy - 70, 170 * _pl, COL_EYE,  aura * aura * 0.45);
p05_glow(_cx, 440, 270 * _pl, COL_MAG, aura * 0.20, 0.55);

// Mizrak yukarida sarj olurken tepeden inen isik sutunu
if (p05 > 2680 && p05 < 2740) {
    var _c = clamp((p05 - 2680) / 24, 0, 1);
    p05_glow(320 + _sx, -40 + _sy, 150 + 90 * _c, COL_MAG, 0.35 * _c);
    // dar dikey huzme
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(320 - 26 * _c + _sx,  -60, COL_MAG, 0);
    draw_vertex_colour(320 + 26 * _c + _sx,  -60, COL_MAG, 0);
    draw_vertex_colour(320 -  9 * _c + _sx,  200, COL_MAG, 0.22 * _c);
    draw_vertex_colour(320 +  9 * _c + _sx,  200, COL_MAG, 0.22 * _c);
    draw_vertex_colour(320 -  2 * _c + _sx,  330, COL_MAG, 0);
    draw_vertex_colour(320 +  2 * _c + _sx,  330, COL_MAG, 0);
    draw_primitive_end();
}

draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

// ---- yagan kar ---------------------------------------------------------
// Halenin icine girince magentaya boyaniyor, disarida soguk beyaz.
for (var i = 0; i < array_length(mote); i++) {
    var _m = mote[i];
    draw_set_colour(merge_colour(COL_SNOW, COL_MAG, min(aura, 1)));
    draw_set_alpha(_m.a * (0.55 + 0.45 * sin(_m.ph)) * (0.55 + aura * 0.45) * _sk);
    var _s = _m.sz;
    draw_rectangle(_m.x - _s + _sx, _m.y - _s + _sy, _m.x + _s + _sx, _m.y + _s + _sy, false);
}

draw_set_alpha(1);
draw_set_colour(c_white);
