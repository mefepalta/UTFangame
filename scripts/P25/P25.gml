
function P25Baslat()
{
	if (global.p25phase != 0) { return false; }
	global.p25phase = 1;
	global.p25_dlg = false;
	global.p25_iska = false;

	Battle_SetEnemyDEF(1,5);

	if (instance_exists(battle_enemy_engage))
	{
		var _can = max(60,round((Player_GetAtkTotal()-5)*2.2*7));
		battle_enemy_engage._hp = _can;
		battle_enemy_engage._hp_max = _can;
	}

	return true;
}

function P25Sahneye()
{
	if (global.p25phase < 1) { return false; }
	if (global.p25phase == 1)
	{
		global.p25phase = 2;

		audio_stop_sound(snd_chevalier);
		BGM_Stop(5);
		audio_sound_gain(snd_surrender,1,0);
		audio_play_sound(snd_surrender,1,true);
	}

	if (!instance_exists(o_p25_battle))
	{
		instance_create_depth(0,0,DEPTH_BATTLE.ENEMY,o_p25_battle);
	}

	with (o_sans_blockp2) { instance_destroy(); }
	return true;
}

function P25Metin()
{
	switch (global.p25phase)
	{
		case 3:
			return "{speaker 0}{font 3}{voice 3}There's no way I'm&letting you-";
		case 5:
			return "{speaker 0}{font 3}{voice 3}...{pause}{clear}...{pause}{clear}Heh...{pause}{clear}Mweh heh heh.{pause}{clear}Well... you got&me...!{pause}{clear}At least now...&I can rest easy...{pause}{clear}...knowing... I tried&to make a difference.";
		default:
			return "{speaker 0}{font 3}{voice 3}...{pause}{clear}...{pause}{clear}Guess that's that.{pause}{clear}Hey... Papyrus...{pause}{clear}Let's go to Muffet's.";
	}
}

function P25Sahne()
{
	if (global.p25phase >= 8) { return false; }

	if (global.p25phase == 4)
	{
		global.p25_t += 1;

		if (global.p25_t == 42) and (instance_exists(battle_enemy_engage))
		{
			var _hp0 = battle_enemy_engage._hp;
			var _hpm = battle_enemy_engage._hp_max;
			var _bx = battle_enemy_engage.p2_draw_x;

			var _dmg = instance_create_depth(_bx,battle_enemy_engage.y,0,battle_damage);
			_dmg.damage = _hp0;
			_dmg.bar_hp_max = _hpm;
			_dmg.bar_hp_original = _hp0;
			_dmg.bar_hp_target = 0;
			audio_play_sound(snd_damage,0,false);

			if (instance_exists(o_p25_battle)) { o_p25_battle.govde_yarali = true; }
			Camera_Shake(4,4,2,2);
		}

		if (global.p25_t >= 117)
		{
			global.p25phase = 5;
			if (instance_exists(battle_enemy_engage)) { battle_enemy_engage._hp = 0; }
		}
		return false;
	}

	if (global.p25phase != 3) and (global.p25phase != 5) and (global.p25phase != 7)
	{
		return true;
	}

	if (!global.p25_dlg)
	{
		var _d = instance_create_depth(0,0,0,battle_dialog_enemy);
		_d.text = P25Metin();
		global.p25_dlg = true;

		if (global.p25phase >= 5) and (instance_exists(o_p25_battle))
		{
			o_p25_battle.kafa = 5;
		}
		return false;
	}

	if (instance_exists(battle_dialog_enemy)) { return false; }

	global.p25_dlg = false;
	switch (global.p25phase)
	{
		case 3:
			global.p25phase = 4;
			global.p25_t = 0;

			global.go_dodge = "damage";
			if (instance_exists(battle_enemy_engage))
			{
				instance_create_depth(battle_enemy_engage.p2_draw_x,
					battle_enemy_engage.y-100,0,battle_menu_fight_anim_knife);
			}
			return false;

		case 5:
			global.p25phase = 6;
			Battle_SetMenuDialog("* It's over.");
			break;

		case 7:
			global.p25phase = 8;
			break;
	}
	return true;
}
