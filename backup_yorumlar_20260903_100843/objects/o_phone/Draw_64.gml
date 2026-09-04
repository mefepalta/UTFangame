if (!visible || dialogue_index >= array_length(dialogue)) exit;

// Kutu
draw_sprite_ext(spr_pixel, 0, 26, 315, 590, 162, 0, c_black, 1);
draw_sprite_ext(spr_pixel, 0, 32, 320, 578, 152, 0, c_white, 1);
draw_sprite_ext(spr_pixel, 0, 38, 326, 566, 140, 0, c_black, 1);

// Portre
if (_portrait_sprite != noone && _portrait_expression >= 0) {
    draw_sprite(_portrait_sprite, _portrait_expression, 100, 440); // y'yi aşağı çek
}