draw_set_font(font_sans_1);
draw_set_color(c_white);
//draw_text(20,20,p05);

if (current_line >= 0) {
    var elapsed = (current_time - start_time) / 1000;
    var text_to_show = dialogue[current_line].text;

    // Count visible characters
    var chars_visible = floor((elapsed - line_start_time) / char_speed);
    chars_visible = clamp(chars_visible, 0, string_length(text_to_show));

    // Check each new character since last frame
    if (chars_visible > last_chars) {
        for (var i = last_chars + 1; i <= chars_visible; i++) {
            var new_char = string_char_at(text_to_show, i);

            // Play sound only if not space or punctuation
            if (new_char != " " && new_char != "." && new_char != "," && new_char != "!" && new_char != "?") {
                audio_play_sound(snd_text_voice_sans, 1, false);
            }
        }
        last_chars = chars_visible;
    }

    // Take only visible characters for drawing
    var visible_text = string_copy(text_to_show, 1, chars_visible);

    // Automatic word wrapping
    var max_width = 500;
    var line_sep  = 40;
    draw_text_ext(85, 310, visible_text, line_sep, max_width);
}
