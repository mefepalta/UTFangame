_t++;

if (follow_board)
{
	bolt_x = battle_board.x + bolt_off;
}

if (_state == 0)
{
	if (_t >= warn_time)
	{
		_state = 1;
		_t = 0;
		audio_play_sound(snd_bighit,2,false);
		Camera_Shake(4,6,1,1,1,1);
	}
}
else
{
	// Sutunun icindeyken hasar. Sprite 200 px yuksekliginde ve origin'i
	// altta oldugu icin carpma noktasindan yukari dogru uzaniyor.
	// Carpisma genisligi de olcekle birlikte buyuyor.
	var _top = strike_y - sprite_get_height(spr_alphys_shocker_breaker)*bolt_scale;
	var _hw = bolt_width*bolt_scale;
	if (collision_rectangle(bolt_x-_hw,_top,bolt_x+_hw,strike_y,battle_soul,false,true))
	{
		Battle_CallSoulEventBulletCollision();
	}

	if (_t >= strike_time)
	{
		instance_destroy();
	}
}
