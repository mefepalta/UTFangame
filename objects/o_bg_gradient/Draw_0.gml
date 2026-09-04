draw_self();

if (room == room_battle_1)
{
	var mx = matrix_build(x, y, 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
	matrix_set(matrix_world, mx);

	draw_set_alpha(0.07 * image_alpha);
	draw_set_color(c_white);

	var line_gap = 28;
	var i = -sprite_height / 4;
	repeat (sprite_height / line_gap) {
	    draw_rectangle(-sprite_width/2, i, sprite_width/2, i + 2, false);
	    i += line_gap;
	}

	draw_set_alpha(1);
	matrix_set(matrix_world, matrix_build_identity());
}