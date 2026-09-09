if(_enabled){
	var SW=(window_get_fullscreen() ? display_get_width() : window_get_width());
	var SH=(window_get_fullscreen() ? display_get_height() : window_get_height());
	var SX=SW/960;
	var SY=SH/540;
	var SF=min(SX,SY);
	display_set_gui_maximize(SF,SF,(SW-960*SF)/2+160*SF,(SH-540*SF)/2+30*SF);

	if(sprite_exists(_sprite_previous)){
		draw_sprite_part_ext(_sprite_previous,0,0,0,960,31,-160,-30,1,1,c_white,1);
		draw_sprite_part_ext(_sprite_previous,0,0,30,161,480,-160,0,1,1,c_white,1);
		draw_sprite_part_ext(_sprite_previous,0,799,30,161,480,639,0,1,1,c_white,1);
		draw_sprite_part_ext(_sprite_previous,0,0,509,960,31,-160,479,1,1,c_white,1);
	}
	if(sprite_exists(_sprite)){
		draw_sprite_part_ext(_sprite,0,0,0,960,31,-160,-30,1,1,c_white,_alpha);
		draw_sprite_part_ext(_sprite,0,0,30,161,480,-160,0,1,1,c_white,_alpha);
		draw_sprite_part_ext(_sprite,0,799,30,161,480,639,0,1,1,c_white,_alpha);
		draw_sprite_part_ext(_sprite,0,0,509,960,31,-160,479,1,1,c_white,_alpha);
	}
	var _line=max(1,1/SF);
	draw_sprite_ext(spr_pixel,0,0,-_line,640,_line,0,c_white,_alpha);
	draw_sprite_ext(spr_pixel,0,-_line,0,_line,480,0,c_white,_alpha);
	draw_sprite_ext(spr_pixel,0,640,0,_line,480,0,c_white,_alpha);
	draw_sprite_ext(spr_pixel,0,0,480,640+_line,_line,0,c_white,_alpha);
}
