if(_hint){
	var _a = clamp(hint_t / 40, 0, 1);
	_a = _a * _a * (3 - 2 * _a);
	var _pulse = 0.68 + 0.32 * sin(hint_t * 0.07);

	draw_set_font(font_crypt_of_tomorrow);
	draw_set_halign(fa_center);

	gpu_set_blendmode(bm_add);
	draw_set_color(make_colour_rgb(160, 175, 235));
	draw_set_alpha(_a * _pulse * 0.35);
	draw_text_ext_transformed(320,360,"[PRESS Z OR ENTER]",9,-1,2,2,0);
	gpu_set_blendmode(bm_normal);

	draw_set_color(make_colour_rgb(205, 210, 235));
	draw_set_alpha(_a * (0.62 + 0.38 * _pulse));
	draw_text_ext_transformed(320,360,"[PRESS Z OR ENTER]",9,-1,2,2,0);

	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
}
