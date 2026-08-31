if (global.transition_alpha > 0) {
    draw_set_alpha(global.transition_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1); // reset alpha
}