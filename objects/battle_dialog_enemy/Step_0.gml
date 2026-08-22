if(fast&&Input_IsPressed(INPUT.CONFIRM)){
	instance_destroy();
}else if(instance_exists(_inst)){
	_inst._outline=false;

	// Konusan karakterin anlik konumu (sahne disina/ortaya yururken balon takip etsin)
	with (battle_enemy_engage)
	{
		if (other.SPEAKER == 1)
		{
			other.SPEAKER_X = pap_draw_x - x;
			other.SPEAKER_Y = -64;			// Papyrus'un kafa hizasi
		}
		else if (other.SPEAKER == 2)
		{
			other.SPEAKER_X = alp_draw_x - x;
			other.SPEAKER_Y = 6;			// Alphys'in kafa hizasi
		}
		else
		{
			other.SPEAKER_X = p2_off_x;
			other.SPEAKER_Y = 0;
		}

		// Her karakterin govde genisligi farkli; balonun ne kadar uzakta
		// duracagini buna gore veriyoruz. Eskiden Sans'in govde sprite'inin
		// genisligi kullaniliyordu ve genis olan Papyrus/Alphys'e yapisiyordu.
		if (other.SPEAKER == 1)      { other.SPEAKER_HALFW = 75; }
		else if (other.SPEAKER == 2) { other.SPEAKER_HALFW = 90; }
		else                         { other.SPEAKER_HALFW = 70; }
	}

	// Balon hangi yana acilsin? Sagda yer kaliyorsa saga, kalmiyorsa sola.
	// Boylece hem karaktere yapismiyor hem de ekran disina tasmiyor.
	var _spk_x = battle_enemy_engage.x + SPEAKER_X;
	var _text_w = xscale_box*47;
	var _right_edge = _spk_x + SPEAKER_HALFW + SPEAKER_GAP + 15 + _text_w;
	SIDE = (_right_edge <= 632 ? 0 : 1);

	if SIDE = 0{
		_inst.x=x_box+15;
		_inst.y=y_box-yscale_box*20;
		x_box=battle_enemy_engage.x+SPEAKER_X+SPEAKER_HALFW+SPEAKER_GAP;
		y_box=battle_enemy_engage.y+SPEAKER_Y-100
	}
	if SIDE = 1{
		_inst.x=x_box-xscale_box*47;
		_inst.y=y_box-yscale_box*20;
		x_box=battle_enemy_engage.x+SPEAKER_X-SPEAKER_HALFW-SPEAKER_GAP
		y_box=battle_enemy_engage.y+SPEAKER_Y-100
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