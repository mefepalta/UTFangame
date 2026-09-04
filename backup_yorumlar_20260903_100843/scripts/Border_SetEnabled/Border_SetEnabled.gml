///@arg enabled
function Border_SetEnabled() {
	var ENABLED=argument[0];
	if(ENABLED && variable_global_exists("border_enabled") && !global.border_enabled){
		ENABLED=false;
	}
	var SCALE=1;
	if(variable_global_exists("window_scale")){
		SCALE=global.window_scale;
	}
	if(SCALE<=0){
		SCALE=1;
	}

	global.border_enabled=ENABLED;
	var BASE_W=640;
	var BASE_H=480;
	if(ENABLED){
		BASE_W=960;
		BASE_H=540;
	}

	if(!window_get_fullscreen()){
		var WINDOW_X=window_get_x();
		var WINDOW_Y=window_get_y();
		var WINDOW_W=window_get_width();
		var WINDOW_H=window_get_height();
		var NEW_W=round(BASE_W*SCALE);
		var NEW_H=round(BASE_H*SCALE);
		window_set_size(NEW_W,NEW_H);
		window_set_position(round(WINDOW_X+WINDOW_W*0.5-NEW_W*0.5),round(WINDOW_Y+WINDOW_H*0.5-NEW_H*0.5));
	}

	if(ENABLED){
		border._enabled=true;
		if(!sprite_exists(border._sprite)){
			border._sprite=spr_border_hall;
			border._sprite_previous=-1;
			border._alpha=1;
		}
	}else{
		border._enabled=false;
	
		if(sprite_exists(border._sprite)){
			sprite_flush(border._sprite);
			border._sprite=-1;
		}
		if(sprite_exists(border._sprite_previous)){
			sprite_flush(border._sprite_previous);
			border._sprite_previous=-1;
		}
	}
	return true;


}
