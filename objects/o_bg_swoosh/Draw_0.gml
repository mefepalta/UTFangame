// Renk geçişi: mor → turuncu → sarı
var colors = [
    make_color_rgb(180, 0, 255),  // mor
    make_color_rgb(255, 100, 0),  // turuncu
    make_color_rgb(255, 220, 0),  // sarı
];

var Sspeed = 0.02;
var t = (current_time * Sspeed / 100) mod 3;
var idx = floor(t);
var blend_t = frac(t);
var next_idx = (idx + 1) mod 3;

var r = lerp(color_get_red(colors[idx]),   color_get_red(colors[next_idx]),   blend_t);
var g = lerp(color_get_green(colors[idx]), color_get_green(colors[next_idx]), blend_t);
var b = lerp(color_get_blue(colors[idx]),  color_get_blue(colors[next_idx]),  blend_t);

var col = make_color_rgb(r, g, b);

draw_sprite_ext(Sprite340, 0, x, y, image_xscale, image_yscale, image_angle, col, alpha);