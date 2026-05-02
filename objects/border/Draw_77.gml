if(_enabled){
	var SW=(window_get_fullscreen() ? display_get_width() : window_get_width());
	var SH=(window_get_fullscreen() ? display_get_height() : window_get_height());
	var SX=SW/960;
	var SY=SH/540;
	var BY=SH/720;
	var SF=min(SX,SY);
	display_set_gui_maximize(SF,SF,(SW-960*SF)/2+160*SF,(SH-540*SF)/2+30*SF);
	if(sprite_exists(_sprite_previous)){
		draw_sprite_ext(_sprite_previous,0,(SW-960*SF)/2,(SH-540*SF)/2,960/sprite_get_width(_sprite_previous)*SF,540/sprite_get_height(_sprite_previous)*SF,0,c_white,1);
	}else{
		draw_sprite_ext(spr_pixel,0,(SW-960*SF)/2,(SH-540*SF)/2,SW,SH,0,c_black,1);
	}
	if(sprite_exists(_sprite)){
		draw_sprite_ext(_sprite,0,(SW-960*SF)/2,(SH-540*SF)/2,960/sprite_get_width(_sprite)*SF,540/sprite_get_height(_sprite)*SF,0,c_white,_alpha);
	}else{
		draw_sprite_ext(spr_pixel,0,(SW-960*SF)/2,(SH-540*SF)/2,SW,SH,0,c_black,_alpha);	
		if _enable_fancy_border // Fancy Border
		{
			var borderalpha = 0.5*_alpha; // Fancy Border's Alpha (0.5 by default)
			var xoffset = 0;
			var yoffset = -90;
		    draw_surface_stretched(application_surface, SX+xoffset*SF, BY+yoffset*SF, SW, SH+180*SF);
			draw_sprite_ext(spr_pixel,0,(SW-960*SF)/2,(SH-540*SF)/2,SW,SH,0,fader.color,fader.alpha); // Fader
			draw_sprite_ext(spr_pixel,0,(SW-960*SF)/2,(SH-540*SF)/2,SW,SH,0,c_black,1-borderalpha);
			draw_sprite_ext(spr_border_outline,0,(SW-960*SF)/2,(SH-540*SF)/2,960/sprite_get_width(spr_border_outline)*SF,540/sprite_get_height(spr_border_outline)*SF,0,c_white,_alpha);
		}
	}
	draw_surface_ext(application_surface,(SW-960*SF)/2+160*SF,(SH-540*SF)/2+30*SF,SF,SF,0,c_white,1);
}else{
	var SW=(window_get_fullscreen() ? display_get_width() : window_get_width());
	var SH=(window_get_fullscreen() ? display_get_height() : window_get_height());
	var SX=SW/640;
	var SY=SH/480;
	var SF=min(SX,SY);
	display_set_gui_maximize(SF,SF,(SW-640*SF)/2,(SH-480*SF)/2);
	draw_surface_ext(application_surface,(SW-640*SF)/2,(SH-480*SF)/2,SF,SF,0,c_white,1);
}