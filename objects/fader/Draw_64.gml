draw_sprite_ext(spr_pixel,0,0,0,640,480,0,color,alpha);

if(instance_exists(world)){
	with(world){
		if(_quit_alpha>0){
			var _dots="";
			for(var _i=0; _i<_quit_dot_count; _i++){
				_dots+=".";
			}

			draw_set_alpha(_quit_alpha);
			draw_set_font(font_determination_mono_3);
			draw_set_color(c_black);
			draw_text(6,8,"QUITTING"+_dots);
			draw_text(10,8,"QUITTING"+_dots);
			draw_text(8,6,"QUITTING"+_dots);
			draw_text(8,10,"QUITTING"+_dots);
			draw_text(6,6,"QUITTING"+_dots);
			draw_text(10,6,"QUITTING"+_dots);
			draw_text(6,10,"QUITTING"+_dots);
			draw_text(10,10,"QUITTING"+_dots);
			draw_set_color(c_white);
			draw_text(8,8,"QUITTING"+_dots);
			draw_set_alpha(1);
		}
	}
}
