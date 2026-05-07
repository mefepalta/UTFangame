draw_self();

var mx = matrix_build(x, y, 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
matrix_set(matrix_world, mx);

draw_set_alpha(0.07);
draw_set_color(c_white);

var line_gap = 28;
var i = -sprite_height / 4; // ← height'a göre tekrarla
repeat (sprite_height / line_gap) {
    draw_rectangle(-sprite_width/2, i, sprite_width/2, i + 2, false); // ← yatay çizgi
    i += line_gap;
}

draw_set_alpha(1);
matrix_set(matrix_world, matrix_build_identity());