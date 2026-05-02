draw_set_font(font_determination_mono_1);
draw_set_color(c_white);

if (current_line >= 0) {
    var elapsed = (current_time - start_time) / 1000;
    var text_to_show = dialogue[current_line].text;
    // How many characters should be visible
    var chars_visible = floor((elapsed - line_start_time) / char_speed);
    chars_visible = clamp(chars_visible, 0, string_length(text_to_show));

    // Take only visible characters
    var visible_text = string_copy(text_to_show, 1, chars_visible);

    // typewriter substring you already compute:
    /// visible_text = string_copy(text_to_show, 1, chars_visible);

    var max_width = 500;  // wrap width in pixels
    var line_sep  = 40;    // extra spacing between lines (in pixels)

    // Built-in wrap + typewriter (no '#' needed)
    draw_text_ext(85, 310, visible_text, line_sep, max_width);
}
