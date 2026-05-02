if (!visible || dialogue_index >= array_length(dialogue)) exit;

// Box
var margin = 12;
var box_x1 = margin;
var box_y1 = display_get_gui_height() - 160;
var box_x2 = display_get_gui_width() - margin;
var box_y2 = display_get_gui_height() - margin;

draw_set_color(c_white);
draw_rectangle(box_x1 - 6, box_y1 - 6, box_x2 + 6, box_y2 + 6, false);

draw_set_color(c_black);
draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);

// Current dialogue + data
var current = dialogue[dialogue_index];
var data = char_data[current.speaker];

// Portrait
var portrait_x = box_x1 + 48;
var portrait_y = box_y1 + 48;

if (data.portrait != noone && current.expression >= 0) {
    draw_sprite(data.portrait, current.expression, portrait_x, portrait_y);
}

// Font
if (data.font != undefined) {
    draw_set_font(data.font);
}

// Text
var text_x = (data.portrait == noone) ? box_x1 + 24 : portrait_x + 100;
var text_y = portrait_y - 35;

draw_set_color(c_white);
draw_text_ext(text_x, text_y, current_text, -1, box_x2 - text_x - 32);

