if (room == room_battle_1) and (_timer == 1)
{
	battle_enemy_engage.p2_head_sprite = spr_p2_idle;
}

var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle_1)
{
	if (!sari_aktif) and (_timer == 1)
	{
		_timer = 1500;
	}
	if (_timer == 1)
	{
		BGM_SetVolume(5,0.22,150);
		Battle_SetBoardSizeCubic(34,34,34,34,90);
	}
	if (_timer == 120)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_yellow_dr);
		Camera_Shake(3,3,2,2);
	}

	if (_timer == 180) { DrTarget(DR_TARGET.NORMAL,90,1.9); }
	if (_timer == 225) { DrTarget(DR_TARGET.NORMAL,90,1.9); }
	if (_timer == 270) { DrTarget(DR_TARGET.NORMAL,90,1.9); }
	if (_timer == 280) { DrTarget(DR_TARGET.NORMAL,0,2.6); }
	if (_timer == 285) { DrTarget(DR_TARGET.NORMAL,45,2.6); }
	if (_timer == 295) { DrTarget(DR_TARGET.NORMAL,135,2.6); }
	if (_timer == 305) { DrTarget(DR_TARGET.NORMAL,225,2.6); }
	if (_timer == 315) { DrTarget(DR_TARGET.NORMAL,90,1.9); }
	if (_timer == 340) { DrTarget(DR_TARGET.MIRROR,0,2.6); }
	if (_timer == 345) { DrTarget(DR_TARGET.MIRROR,45,2.6); }

	if (_timer == 430) { DrTarget(DR_TARGET.NORMAL,180,3.8); }
	if (_timer == 445) { DrTarget(DR_TARGET.NORMAL,0,3.8); }
	if (_timer == 455) { DrTarget(DR_TARGET.NORMAL,180,3.8); }
	if (_timer == 460) { DrTarget(DR_TARGET.NORMAL,45,2.6); }
	if (_timer == 470) { DrTarget(DR_TARGET.NORMAL,0,3.8); }
	if (_timer == 495) { DrTarget(DR_TARGET.NORMAL,0,3.8); }
	if (_timer == 520) { DrTarget(DR_TARGET.MIRROR,0,3.8); }
	if (_timer == 535) { DrTarget(DR_TARGET.MIRROR,180,3.8); }

	if (_timer == 555)
	{
		DrTarget(DR_TARGET.NORMAL,90,2.6);
		DrTarget(DR_TARGET.NORMAL,225,2.6);
	}
	if (_timer == 560) { DrTarget(DR_TARGET.NORMAL,270,2.6); }
	if (_timer == 590) { DrTarget(DR_TARGET.BIG,135,1.9); }
	if (_timer == 615) { DrTarget(DR_TARGET.MIRROR,90,2.6); }
	if (_timer == 620) { DrTarget(DR_TARGET.MIRROR,225,2.6); }
	if (_timer == 650) { DrTarget(DR_TARGET.NORMAL,135,2.2); }

	if (_timer == 680) { DrTarget(DR_TARGET.NORMAL,45,2.8); }
	if (_timer == 715) { DrTarget(DR_TARGET.NORMAL,225,2.8); }
	if (_timer == 750) { DrTarget(DR_TARGET.NORMAL,45,2.8); }
	if (_timer == 785) { DrTarget(DR_TARGET.NORMAL,225,2.8); }
	if (_timer == 795)
	{
		DrTarget(DR_TARGET.NORMAL,90,2.6);
		DrTarget(DR_TARGET.NORMAL,180,2.6);
	}
	if (_timer == 820) { DrTarget(DR_TARGET.NORMAL,45,2.8); }
	if (_timer == 850) { DrTarget(DR_TARGET.MIRROR,90,2.6); }
	if (_timer == 855)
	{
		DrTarget(DR_TARGET.MIRROR,180,2.6);
		DrTarget(DR_TARGET.NORMAL,225,2.8);
	}
	if (_timer == 895) { DrTarget(DR_TARGET.NORMAL,0,2.6); }
	if (_timer == 900) { DrTarget(DR_TARGET.NORMAL,135,2.6); }

	if (_timer == 920) { DrTarget(DR_TARGET.NORMAL,315,3.6); }
	if (_timer == 950)
	{
		DrTarget(DR_TARGET.NORMAL,180,3.2);
		DrTarget(DR_TARGET.MIRROR,315,3.6);
	}
	if (_timer == 995) { DrTarget(DR_TARGET.NORMAL,315,3.6); }
	if (_timer == 1010) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
	if (_timer == 1025) { DrTarget(DR_TARGET.MIRROR,315,3.6); }
	if (_timer == 1035) { DrTarget(DR_TARGET.MIRROR,180,3.2); }
	if (_timer == 1040) { DrTarget(DR_TARGET.BIG,90,1.8); }
	if (_timer == 1070)
	{
		DrTarget(DR_TARGET.NORMAL,135,3.2);
		DrTarget(DR_TARGET.NORMAL,315,3.6);
	}
	if (_timer == 1095) { DrTarget(DR_TARGET.MIRROR,225,3.2); }
	if (_timer == 1100) { DrTarget(DR_TARGET.MIRROR,315,3.6); }
	if (_timer == 1145) { DrTarget(DR_TARGET.NORMAL,315,3.6); }
	if (_timer == 1155) { DrTarget(DR_TARGET.MIRROR,135,3.2); }
	if (_timer == 1175) { DrTarget(DR_TARGET.MIRROR,315,3.6); }
	if (_timer == 1210)
	{
		DrTarget(DR_TARGET.NORMAL,0,2.6);
		DrTarget(DR_TARGET.NORMAL,45,2.6);
	}
	if (_timer == 1215) { DrTarget(DR_TARGET.NORMAL,180,2.6); }
	if (_timer == 1240) { DrTarget(DR_TARGET.BIG,270,2.2); }
	if (_timer == 1270) { DrTarget(DR_TARGET.MIRROR,0,2.6); }
	if (_timer == 1275) { DrTarget(DR_TARGET.MIRROR,45,2.6); }

	if (_timer == 1285) { DrTarget(DR_TARGET.NORMAL,90,3.0); }
	if (_timer == 1292) { DrTarget(DR_TARGET.NORMAL,225,3.0); }
	if (_timer == 1320)
	{
		DrTarget(DR_TARGET.BIG,0,1.8);
		DrTarget(DR_TARGET.NORMAL,45,1.8);
	}
	if (_timer == 1330) { DrTarget(DR_TARGET.MIRROR,90,3.0); }
	if (_timer == 1337) { DrTarget(DR_TARGET.MIRROR,225,3.0); }
	if (_timer == 1365)
	{
		DrTarget(DR_TARGET.NORMAL,90,1.8);
		DrTarget(DR_TARGET.NORMAL,135,1.8);
	}
	if (_timer == 1410)
	{
		DrTarget(DR_TARGET.BIG,180,1.8);
		DrTarget(DR_TARGET.NORMAL,225,1.8);
	}
	if (_timer == 1455)
	{
		DrTarget(DR_TARGET.NORMAL,270,1.8);
		DrTarget(DR_TARGET.NORMAL,315,1.8);
	}
	if (_timer == 1500)
	{
		DrTarget(DR_TARGET.NORMAL,0,1.8);
		DrTarget(DR_TARGET.BIG,90,1.8);
	}

	if (_timer > 1500) and (fade_at < 0)
	and (!instance_exists(battle_dr_target)) and (!instance_exists(battle_dr_shot))
	{
		fade_at = _timer;
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
		BGM_SetVolume(5,1,45);
		Fader_Fade(-1,1,1);
	}
	if (fade_at > 0) and (_timer == fade_at+15)
	{
		Battle_SetBoardSizeCubic(65,65,70,70,0);
		Battle_SetSoul(battle_soul_red);
	}
	if (fade_at > 0) and (_timer == fade_at+35)
	{
		Fader_Fade(-1,0,1);
	}

	var _bl = battle_board.x-battle_board.left;
	var _br = battle_board.x+battle_board.right;
	var _bt = battle_board.y-battle_board.up+2;
	var _bb = battle_board.y+battle_board.down-2;

	if (fade_at > 0) and (_timer == fade_at+20)
	{
		Battle_SetBoardSizeCubic(69,65,73,73,26);
	}
	if (fade_at > 0) and (_timer == fade_at+64)
	{
		RegularBone(_bl,_bt,92,0,3,270,0,0,1,0,0,0,0,true);
		RegularBone(_br,_bb,92,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+126)
	{
		RegularBone(_br+20,_bb,152,-4,0,0,1,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+186)
	{
		RegularBone(_bl+78,_bt,92,0,3,90,0,0,1,0,0,0,0,true);
		RegularBone(_br-78,_bb,92,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+246)
	{
		RegularBone(_bl-20,_bb,152,4,0,0,1,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+306)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		Battle_SetBoardSizeCubic(69,65,122,122,34);
	}
	if (fade_at > 0) and (_timer == fade_at+352)
	{
		WallMake(58,40);
	}
	if (fade_at > 0) and (_timer == fade_at+408)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}
	if (fade_at > 0) and (_timer == fade_at+436)
	{
		RegularBone(_br+22,_bt,70,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bt,70,5,0,180,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+474)
	{
		RegularBone(_br+22,_bb-41,70,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bb-41,70,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+512)
	{
		RegularBone(_br+22,_bt,70,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bt,70,5,0,180,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+550)
	{
		RegularBone(_br+22,_bb-41,70,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bb-41,70,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+588)
	{
		RegularBone(_br+22,_bt,70,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bt,70,5,0,180,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+626)
	{
		RegularBone(_br+22,_bb-41,70,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bb-41,70,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+664)
	{
		RegularBone(_br+22,_bt,70,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bt,70,5,0,180,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+702)
	{
		RegularBone(_br+22,_bb-41,70,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(_bl-22,_bb-41,70,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+756)
	{
		Dagger(_br+26,_bb-110,58,-16,0,90,26);
	}
	if (fade_at > 0) and (_timer == fade_at+765)
	{
		Dagger(_br+26,_bb-87,58,-16,0,90,26);
	}
	if (fade_at > 0) and (_timer == fade_at+774)
	{
		Dagger(_br+26,_bb-64,58,-16,0,90,26);
	}
	if (fade_at > 0) and (_timer == fade_at+826)
	{
		Dagger(_bl-26,_bb-64,58,16,0,270,26);
	}
	if (fade_at > 0) and (_timer == fade_at+835)
	{
		Dagger(_bl-26,_bb-87,58,16,0,270,26);
	}
	if (fade_at > 0) and (_timer == fade_at+844)
	{
		Dagger(_bl-26,_bb-110,58,16,0,270,26);
	}
	if (fade_at > 0) and (_timer == fade_at+900)
	{
		Dagger(_bl+18+0*34,_bt-30,52,0,15,180,40);
	}
	if (fade_at > 0) and (_timer == fade_at+900)
	{
		Dagger(_bl+18+1*34,_bt-30,52,0,15,180,40);
	}
	if (fade_at > 0) and (_timer == fade_at+900)
	{
		Dagger(_bl+18+2*34,_bt-30,52,0,15,180,40);
	}
	if (fade_at > 0) and (_timer == fade_at+900)
	{
		Dagger(_bl+18+3*34,_bt-30,52,0,15,180,40);
	}
	if (fade_at > 0) and (_timer == fade_at+900)
	{
		Dagger(_bl+18+4*34,_bt-30,52,0,15,180,40);
	}
	if (fade_at > 0) and (_timer == fade_at+900)
	{
		Dagger(_bl+18+5*34,_bt-30,52,0,15,180,40);
	}
	if (fade_at > 0) and (_timer == fade_at+900)
	{
		Dagger(_bl+18+6*34,_bt-30,52,0,15,180,40);
	}
	if (fade_at > 0) and (_timer == fade_at+906)
	{
		RegularBlaster(-90,_bt+22,150,_bt+22,0,0,40,44,2,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+958)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
	}
	if (fade_at > 0) and (_timer == fade_at+996)
	{
		WallClear();
	}
	if (fade_at > 0) and (_timer == fade_at+1024)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
	}
	if (fade_at > 0) and (_timer == fade_at+1060)
	{
		SeaMake(16);
	}
	if (fade_at > 0) and (_timer == fade_at+1094)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1134)
	{
		RegularBone(_bl-20,_bb,152,4.5,0,0,1,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1180)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1220)
	{
		RegularBone(_br+20,_bb,152,-4.5,0,0,1,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1266)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1306)
	{
		RegularBone(_bl-20,_bb,152,4.5,0,0,2,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1352)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1392)
	{
		RegularBone(_br+20,_bb,152,-4.5,0,0,2,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1438)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1478)
	{
		RegularBone(_bl-20,_bb,152,4.5,0,0,1,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1524)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1564)
	{
		RegularBone(_br+20,_bb,152,-4.5,0,0,1,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1610)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1650)
	{
		RegularBone(_bl-20,_bb,152,4.5,0,0,2,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1696)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1736)
	{
		RegularBone(_br+20,_bb,152,-4.5,0,0,2,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1782)
	{
		SeaDrop(6,30,22);
	}
	if (fade_at > 0) and (_timer == fade_at+1822)
	{
		RegularBone(_bl-20,_bb,152,4.5,0,0,1,0,1,0,0,0,0,true);
	}
	if (fade_at > 0) and (_timer == fade_at+1880)
	{
		SeaClear();
	}
	if (fade_at > 0) and (_timer == fade_at+1914)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}

	if (fade_at > 0) and (_timer == fade_at+1915)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125);
		Battle_SetMenuDialog("* Hold [Z] to make a POWER SHOT!")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}

	exit;
}

if (_timer >= T11_ILK) and (_timer <= T11_SON) and (((_timer-T11_ILK) mod T11_ARA) == 0)
{
	T11Vurus();
}
if (_timer == 1550)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
	Battle_SetMenuDialog("* Sans mutters the Guard's&  mantra under his breath.")
	if (instance_exists(o_sans_blockp2))
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
	}
	Battle_EndTurn();
}