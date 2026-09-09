if (!disc_shown) exit;

// room_other'in arka plan katmani zaten siyah, ama fade sirasinda altta ne
// oldugu garanti degil: metin her zaman siyah zemine cizilsin.
draw_set_color(c_black);
draw_rectangle(0, 0, 640, 480, false);

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(disc_alpha);

draw_set_font(font_determination_sans);
draw_text_transformed(320, disc_title_y, disc_title, TITLE_SCALE, TITLE_SCALE, 0);

for (var i = 0; i < array_length(disc_lines); i++) {
    draw_text(320, disc_body_y + i * LINE_H, disc_lines[i]);
}

// Prompt yanip sonuyor; sadece onay kabul edilmeye baslayinca gorunuyor,
// yani gorundugu an gercekten basilabilir durumda.
if (disc_blink > 0) {
    draw_set_alpha(disc_alpha * (0.35 + 0.65 * (0.5 + 0.5 * dsin(disc_blink * 2.4))));
    draw_text(320, 442, disc_prompt);
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
