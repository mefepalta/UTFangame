
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _cx = room_width * 0.5;
var _p  = pages[cur];

if (shown > 0) {
    draw_set_font(_p.fnt);
    draw_text_transformed(_cx, _p.y, string_copy(_p.txt, 1, shown), _p.scl, _p.scl, 0);
}

if (prompt_a > 0.001) {
    var _a = prompt_a * (0.35 + 0.65 * (0.5 + 0.5 * dsin(blink * 2.4)));
    var _y = min(_p.bot + 16, 468);
    draw_set_alpha(_a);
    draw_triangle(_cx - 7, _y - 4, _cx + 7, _y - 4, _cx, _y + 5, false);
    draw_set_alpha(1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
