if (_state == 0)
{
	var _wf = (floor(_t/warn_blink) % 2);
	draw_sprite_ext(spr_alphys_shocker_breaker_warning,_wf,bolt_x,warn_y,warn_scale,warn_scale,0,c_white,1);
}
else
{
	var _bf = (floor(_t/3) % 2);
	var _a = 1;
	if (_t > strike_time-6)
	{
		_a = (strike_time-_t)/6;
	}
	draw_sprite_ext(spr_alphys_shocker_breaker,_bf,bolt_x,strike_y,bolt_scale,bolt_scale,0,c_white,_a);
}
