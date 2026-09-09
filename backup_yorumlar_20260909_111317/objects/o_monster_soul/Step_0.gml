if (!active) { exit; }

t += 1;

with (text_typer)
{
	if (_sleep < 2) { _sleep = 2; }
	_skipping = false;
}

if (t >= T_BLACK) and (instance_exists(battle_enemy_engage))
{
	with (battle_enemy_engage)
	{
		other.soul_x = (other.who == 1 ? pap_draw_x : alp_draw_x);
		other.soul_y = y - 90;
	}
}

if (t <= T_BLACK)
{
	black_alpha = t / T_BLACK;
}

if (t == T_BLACK)
{
	with (battle_enemy_engage)
	{
		if (other.who == 1)
		{
			pap_alpha = 0;
			pap_state = 2;
			pap_snap = true;
		}
		else
		{
			alp_alpha = 0;
			alp_state = 2;
			alp_snap = true;
		}
		p2_snap = true;
	}
}

if (t > T_BLACK) and (t <= T_SOUL)
{
	var _p = (t-T_BLACK) / (T_SOUL-T_BLACK);
	piece_p = _p;
	soul_alpha = clamp((_p-0.65)/0.35,0,1);
	soul_bright = soul_alpha*0.55;
	if (t == T_BLACK+1)
	{
		audio_play_sound(snd_gb_charge,3,false);
	}
}
if (t > T_SOUL)
{
	piece_p = 1;
}

if (t > T_SOUL) and (t <= T_HOLD)
{
	var _p = (t-T_SOUL) / (T_HOLD-T_SOUL);
	soul_alpha = 1;
	soul_bright = 0.55 + _p*0.45;
	soul_scale = 1 + sin(t*0.25)*0.06 + _p*0.25;
	if (t == T_SOUL+1)
	{
		audio_play_sound(snd_smash_rise,3,false);
	}
}

if (t > T_HOLD) and (t <= T_GLITCH)
{
	var _p = (t-T_HOLD) / (T_GLITCH-T_HOLD);
	soul_bright = 1;
	soul_scale = 1.25 + _p*0.35;
	soul_shake_x = random_range(-5,5)*_p;
	soul_shake_y = random_range(-5,5)*_p;
	if (t == T_HOLD+1)
	{
		audio_play_sound(snd_impact,3,false);
	}
}
else
{
	soul_shake_x = 0;
	soul_shake_y = 0;
}

if (t > T_GLITCH) and (t <= T_BURST)
{
	var _p = (t-T_GLITCH) / (T_BURST-T_GLITCH);
	soul_alpha = max(0, 1 - _p*3);
	beam_alpha = 1;
	beam_len = 900 * _p;
	beam_spin += 0.35;
	circle_r = 130 * power(_p,2.4);
	if (t == T_GLITCH+1)
	{
		audio_play_sound(snd_slash_boom,3,false);
	}
}

if (debris_on)
{
	for (var i = 0; i < DEBRIS_N; i++)
	{
		deb_x[i] += deb_hs[i];
		deb_y[i] += deb_vs[i];
		deb_vs[i] += 0.22;
		deb_ang[i] += deb_spin[i];
	}
	if (t > T_END-18)
	{
		debris_alpha = max(0,debris_alpha-0.06);
	}
}

if (t > T_BURST) and (t <= T_FLASH)
{
	var _p = (t-T_BURST) / (T_FLASH-T_BURST);
	beam_alpha = 1 - _p;
	circle_r = 130 + 800*_p;
	flash_alpha = _p;
	if (t == T_BURST+1)
	{
		audio_play_sound(kaboom,3,false);
	}
}

if (t == T_FLASH+1)
{
	ring_r = 12;
	ring_alpha = 0.6;

	debris_on = true;
	debris_alpha = 1;
	for (var i = 0; i < DEBRIS_N; i++)
	{
		var _a = random_range(205,335);
		var _sp = random_range(2.5,4.5);
		deb_x[i] = 0;
		deb_y[i] = 0;
		deb_hs[i] = lengthdir_x(_sp,_a);
		deb_vs[i] = lengthdir_y(_sp,_a);
		deb_ang[i] = random(360);
		deb_spin[i] = random_range(-10,10);
		deb_img[i] = irandom(sprite_get_number(spr_battle_soul_slice_white)-1);
	}
}
if (t > T_FLASH)
{
	ring_r += (120-ring_r)*0.22;
	ring_alpha = max(0,ring_alpha-0.055);
}

if (t == T_FLASH+1)
{
	with (battle_enemy_engage)
	{
		if (other.who == 1) { pap_alpha = 1; } else { alp_alpha = 1; }
	}
	audio_resume_all();
}

if (t > T_FLASH) and (t <= T_END)
{
	var _p = (t-T_FLASH) / (T_END-T_FLASH);
	beam_alpha = 0;
	circle_r = 0;
	flash_alpha = 1 - _p;
	black_alpha = 1 - _p;
}

if (t > T_END)
{
	active = false;
	black_alpha = 0;
	flash_alpha = 0;
	soul_alpha = 0;
	debris_on = false;
	debris_alpha = 0;
	ring_alpha = 0;
	piece_p = 0;
}
