if _perfect == 1 {
	if _ac == 0 {
		_aim_color=c_yellow;
		_ac=1;
	} else if _ac == 1 {
		_aim_color=c_aqua;
		_ac=2;
	} else if _ac == 2 {
		_aim_color=c_red;
		_ac=0;
	}
} else {
	if _ac == 0 {
		_aim_color=c_aqua;
		_ac=1;
	} else if _ac == 1 {
		_aim_color=c_red;
		_ac=0;
	}
}
alarm[0]=5;