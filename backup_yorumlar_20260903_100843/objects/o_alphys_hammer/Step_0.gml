_t++;

switch (_state)
{
	// ---- duvara dik belirip bekleme ----
	case 0:
		_alpha = min(1,_t/8);
		_angle = start_angle;
		if (_t == 1)
		{
			audio_play_sound(snd_smash_rise,2,false);
		}
		if (_t >= ready_time)
		{
			_state = 1;
			_t = 0;
		}
		break;

	// ---- geriye yatma: yavas, sonunda iyice yavaslayarak ----
	case 1:
		_alpha = 1;
		_angle = lerp(start_angle,pull_angle,1-power(1-_t/pull_time,2));
		if (_t >= pull_time)
		{
			_angle = pull_angle;
			_state = 2;
			_t = 0;
		}
		break;

	// ---- ileri vurus: hizlanarak iniyor ----
	case 2:
		_angle = lerp(pull_angle,0,power(_t/strike_time,2));
		if (_t >= strike_time)
		{
			_angle = 0;
			_state = 3;
			_t = 0;
			audio_play_sound(snd_smash_impact,2,false);
			Camera_Shake(7,7,1,1,1,1);
			ShootWave(0);
			_wave = 1;
		}
		break;

	// ---- carpma sonrasi bolt dalgalari ----
	case 3:
		_angle = 0;
		if (_wave < wave_count) and (_t >= _wave*wave_delay)
		{
			ShootWave(_wave);
			_wave++;
		}
		if (_t >= max(hold_time,(wave_count-1)*wave_delay+10))
		{
			_state = 4;
			_t = 0;
		}
		break;

	// ---- kalkip kaybolma ----
	case 4:
		_angle = lerp(0,start_angle,_t/leave_time);
		_alpha = 1 - (_t/leave_time);
		if (_t >= leave_time)
		{
			instance_destroy();
		}
		break;
}
