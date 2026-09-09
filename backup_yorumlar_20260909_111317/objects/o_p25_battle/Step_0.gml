bob += 0.02;

if (instance_exists(battle_enemy_engage))
{
	with (battle_enemy_engage)
	{
		p2_head_alpha = 0;
		p2_body_alpha = 0;
		p2_legs_alpha = 0;
		p2_legs_alpha1 = 0;
		p2_cape_alpha = 0;
		p2_armleft_alpha = 0;
		p2_armright_alpha = 0;
		p2_thingy_alpha = 0;
		pap_alpha = 0;
		alp_alpha = 0;
	}
}

with (o_sans_blockp2) { instance_destroy(); }

if (global.p25phase == 8)
{
	yuru_hiz = min(2.6,yuru_hiz+0.035);
	yuru_x -= yuru_hiz;

	if (instance_exists(battle_enemy_engage))
	{
		var _ax = battle_enemy_engage.x+battle_enemy_engage.p2_off_x+yuru_x;
		if (_ax < -140)
		{
			global.p25phase = 9;
			alfa = 0;
			fader.color = c_black;
			Fader_Fade(0,1,180);
		}
	}
}

if (global.p25phase == 9)
{
	if (fader.alpha >= 1)
	{
		global.p25phase = 10;
		audio_stop_sound(snd_surrender);
		room_goto(room_story_final);
	}
}
