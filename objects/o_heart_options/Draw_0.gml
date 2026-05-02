if (global.fade_alpha > 0) {
    draw_set_alpha(global.fade_alpha);
    draw_set_font(font_determination_mono_2);
    draw_set_color(c_white);

    var start_x = 350;
    var start_y = 250;
    var spacing = 30;

    for (var i = 0; i < array_length(menu_items); i++) {
        var text = menu_items[i];
        if (i == 0) text += " : " + (global.fullscreen ? "ON" : "OFF");
        if (i == 1) text += " : " + (global.no_heal ? "ON" : "OFF");
        if (i == 2) text += " : " + (global.no_hit ? "ON" : "OFF");

        if (i == 3) {
            draw_text(start_x, start_y + i * spacing, "Volume");

            var bar_x = start_x + 55;
            var bar_y = start_y + i * spacing + 5;
            var bar_w = 70;
            var bar_h = 6;

            draw_set_color(c_white);
            draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
            draw_set_color(c_red);
            draw_rectangle(bar_x, bar_y, bar_x + bar_w * global.display_volume, bar_y + bar_h, true);

            draw_set_color(c_white);
            continue;
        }

        draw_text(start_x, start_y + i * spacing, text);
    }

    draw_set_alpha(1);
}
