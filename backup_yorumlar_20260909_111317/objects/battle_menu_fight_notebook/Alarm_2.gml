if _perfect2 == 1 {
	if _ac2 == 0 {
		_aim_color2=c_yellow;
		_ac2=1;
	} else if _ac2 == 1 {
		_aim_color2=c_aqua;
		_ac2=2;
	} else if _ac2 == 2 {
		_aim_color2=c_red;
		_ac2=0;
	}
} else {
	if _ac2 == 0 {
		_aim_color2=c_aqua;
		_ac2=1;
	} else if _ac2 == 1 {
		_aim_color2=c_red;
		_ac2=0;
	}
}
alarm[2]=5;