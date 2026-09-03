/// @description Game Over yazisi -- cizim

draw_set_font(font_sans_1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (shown > 0) {
    draw_text(room_width * 0.5, 384, string_copy(line, 1, shown));
}

// Yanip sonen ucgen: tus adi yazmiyoruz cunku CONFIRM tusu ayarlardan
// degistirilebiliyor.
if (prompt_a > 0.001) {
    var _a = prompt_a * (0.35 + 0.65 * (0.5 + 0.5 * dsin(blink * 2.4)));
    var _x = room_width * 0.5;
    var _y = 430;
    draw_set_alpha(_a);
    draw_triangle(_x - 7, _y - 4, _x + 7, _y - 4, _x, _y + 5, false);
    draw_set_alpha(1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
