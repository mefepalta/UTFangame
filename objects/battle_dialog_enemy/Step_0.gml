if(fast&&Input_IsPressed(INPUT.CONFIRM)){
	instance_destroy();
}else if(instance_exists(_inst)){
	_inst._outline=false;
	if SIDE = 0{
		_inst.x=x_box+15;
		_inst.y=y_box-yscale_box*20;
		x_box=(battle_enemy_engage.x+(sprite_get_width(battle_enemy_engage._body_sprite)-2))+25;
		y_box=battle_enemy_engage.y-100
	}
	if SIDE = 1{
		_inst.x=x_box-xscale_box*47;
		_inst.y=y_box-yscale_box*20;
		x_box=battle_enemy_engage.x-(sprite_get_width(battle_enemy_engage._body_sprite)-2)
		y_box=battle_enemy_engage.y-100
	}
	if (MODE == 0){
	if SIDE = 0{
		_spike_extra_x = 6
		_spike_extra_y = 0
		ANGLE_BUBBLE = 0
		ANGLE_SPIKE = 0
	}else if SIDE = 1{
		_spike_extra_x = -6
		_spike_extra_y = 0
		ANGLE_BUBBLE = 180
		ANGLE_SPIKE = 180
	}
	if (SPIKE){
		_spike_alpha = 1
	}else{
		_spike_alpha = 0
	}
}else if (MODE == 1){
	if SIDE = 0{
		_spike_extra_x = 4
		_spike_extra_y = 0
		ANGLE_BUBBLE = 0
		ANGLE_SPIKE = 0
	}else if SIDE = 1{
		_spike_extra_x = -4
		_spike_extra_y = 0
		ANGLE_BUBBLE = 180
		ANGLE_SPIKE = 180
	}
	if (SPIKE){
		_spike_alpha = 1
	}else{
		_spike_alpha = 0
	}
}
}else{
	instance_destroy();
}