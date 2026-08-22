var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer = 1)
	{
		Battle_SetBoardSizeCubic(65,65,85,85);
	}
	if (_timer = 20)
	{
		Battle_SlamDown()
		RegularBoneWall(DIR.DOWN,200,18,40,230,bottom_box,50,150,0,false);
	}
	if (_timer = 100)
	{
		Battle_SlamUp();
	}
	if (_timer = 100)
	{
		RegularBlaster(320,-50,left_box - 30,top_box + 20,0,0,20,1,2,2,50);
		RegularBlaster(320,-50,right_box + 30,top_box + 20,0,180,20,1,2,2,50);
	}
	if (_timer = 200)
	{
		Battle_SlamRight();
	}
	if (_timer = 210)
	{
		Battle_SetBoardSizeCubic(65,65,105,105);
	}
	if (_timer > 230) and (_timer < 430)
	{
		if (_timer % 4 == 0)
		{
			RegularBone(left_box,top_box,70+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer = 460)
	{
		audio_play_sound(snd_ding,2,false);
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,65,65);
		RegularBlaster(320,-50,left_box - 30,top_box + 30,0,0,20,1,2,2,25);
		RegularBlaster(320,-50,left_box + 60,top_box - 60,0,270,20,1,2,2,25);
		RegularBlaster(320,-50,right_box - 60,bottom_box + 60,0,90,20,1,2,2,25);
		RegularBlaster(320,-50,right_box + 30,bottom_box - 20,0,180,20,1,2,2,25);
	}
	if (_timer = 500)
	{
		RegularBlaster(320,-50,left_box - 30,top_box - 50,0,315,20,1,2,2,25);
		RegularBlaster(320,-50,right_box + 30,top_box - 50,0,225,20,1,2,2,25);
		RegularBlaster(320,-50,bottom_box - 60,bottom_box + 60,0,90,20,1,2,2,25);
	}
	if (_timer = 540)
	{
		RegularBlaster(320,-50,bottom_box - 10,top_box - 60,0,270,20,1,2,2,25);
		RegularBlaster(320,-50,bottom_box - 110,top_box - 60,0,270,20,1,2,2,25);
		RegularBlaster(320,-50,left_box - 30,top_box + 20,0,0,20,1,2,2,25);
		RegularBlaster(320,-50,right_box + 30,bottom_box - 30,0,180,20,1,2,2,25);
	}
	if (_timer = 570)
	{
		RegularBlaster(320,-50,left_box - 60,top_box + 60,0,0,40,1,3,3,35);
		RegularBlaster(320,-50,right_box + 60,top_box + 60,0,180,40,1,3,3,35);
	}

	if (_timer = 720)
	{
		Battle_SetMenuDialog("* He doesn't look happy.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
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

	if (_timer == 150)
	{
		DrTarget(DR_TARGET.NORMAL,0,3.2);
		DrTarget(DR_TARGET.NORMAL,180,3.2);
	}
	if (_timer == 196) { DrTarget(DR_TARGET.MIRROR,0,3.0); }
	if (_timer == 200) { DrTarget(DR_TARGET.MIRROR,180,3.0); }
	if (_timer == 210) { DrTarget(DR_TARGET.NORMAL,90,3.6); }
	if (_timer == 215) { DrTarget(DR_TARGET.NORMAL,270,3.6); }
	if (_timer == 246) { DrTarget(DR_TARGET.MIRROR,90,3.4); }
	if (_timer == 250) { DrTarget(DR_TARGET.MIRROR,270,3.4); }
	if (_timer == 252) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
	if (_timer == 270) { DrTarget(DR_TARGET.NORMAL,45,3.0); }
	if (_timer == 285) { DrTarget(DR_TARGET.NORMAL,225,3.0); }
	if (_timer == 296) { DrTarget(DR_TARGET.MIRROR,45,3.0); }
	if (_timer == 300)
	{
		DrTarget(DR_TARGET.NORMAL,90,3.8);
		DrTarget(DR_TARGET.MIRROR,315,3.0);
	}
	if (_timer == 330) { DrTarget(DR_TARGET.NORMAL,270,3.8); }
	if (_timer == 335) { DrTarget(DR_TARGET.MIRROR,225,3.0); }
	if (_timer == 340) { DrTarget(DR_TARGET.NORMAL,0,3.4); }
	if (_timer == 345) { DrTarget(DR_TARGET.MIRROR,90,3.4); }
	if (_timer == 352) { DrTarget(DR_TARGET.NORMAL,225,3.0); }
	if (_timer == 360) { DrTarget(DR_TARGET.NORMAL,135,2.2); }
	if (_timer == 372) { DrTarget(DR_TARGET.MIRROR,270,3.4); }
	if (_timer == 375) { DrTarget(DR_TARGET.NORMAL,315,2.2); }
	if (_timer == 390) { DrTarget(DR_TARGET.MIRROR,0,3.0); }
	if (_timer == 392) { DrTarget(DR_TARGET.NORMAL,180,3.6); }
	if (_timer == 395) { DrTarget(DR_TARGET.MIRROR,135,4.2); }
	if (_timer == 398) { DrTarget(DR_TARGET.MIRROR,225,4.4); }
	if (_timer == 410) { DrTarget(DR_TARGET.MIRROR,315,4.2); }
	if (_timer == 440) { DrTarget(DR_TARGET.MIRROR,180,3.0); }
	if (_timer == 455) { DrTarget(DR_TARGET.BIG,90,1.5); }
	if (_timer == 470) { DrTarget(DR_TARGET.NORMAL,0,4.0); }
	if (_timer == 490) { DrTarget(DR_TARGET.NORMAL,180,4.0); }
	if (_timer == 510) { DrTarget(DR_TARGET.NORMAL,45,4.0); }
	if (_timer == 530) { DrTarget(DR_TARGET.NORMAL,225,4.0); }
	if (_timer == 560) { DrTarget(DR_TARGET.NORMAL,0,3.4); }
	if (_timer == 608) { DrTarget(DR_TARGET.MIRROR,0,3.0); }
	if (_timer == 610) { DrTarget(DR_TARGET.NORMAL,270,3.4); }
	if (_timer == 640) { DrTarget(DR_TARGET.NORMAL,315,3.4); }
	if (_timer == 660) { DrTarget(DR_TARGET.MIRROR,270,3.0); }
	if (_timer == 670) { DrTarget(DR_TARGET.NORMAL,135,3.4); }
	if (_timer == 690) { DrTarget(DR_TARGET.MIRROR,315,3.0); }
	if (_timer == 700) { DrTarget(DR_TARGET.NORMAL,45,4.0); }
	if (_timer == 704)
	{
		DrTarget(DR_TARGET.NORMAL,90,3.0);
		DrTarget(DR_TARGET.MIRROR,135,2.8);
	}
	if (_timer == 722) { DrTarget(DR_TARGET.NORMAL,270,4.2); }
	if (_timer == 742) { DrTarget(DR_TARGET.NORMAL,180,3.0); }
	if (_timer == 745) { DrTarget(DR_TARGET.MIRROR,45,3.6); }
	if (_timer == 756) { DrTarget(DR_TARGET.MIRROR,90,2.8); }
	if (_timer == 760) { DrTarget(DR_TARGET.MIRROR,270,3.8); }
	if (_timer == 778) { DrTarget(DR_TARGET.NORMAL,0,3.0); }
	if (_timer == 794) { DrTarget(DR_TARGET.MIRROR,180,2.8); }
	if (_timer == 800) { DrTarget(DR_TARGET.BIG,225,1.4); }
	if (_timer == 820) { DrTarget(DR_TARGET.NORMAL,45,4.2); }
	if (_timer == 845) { DrTarget(DR_TARGET.NORMAL,315,4.2); }
	if (_timer == 870)
	{
		DrTarget(DR_TARGET.MIRROR,45,3.8);
		DrTarget(DR_TARGET.NORMAL,135,4.2);
	}
	if (_timer == 895)
	{
		DrTarget(DR_TARGET.NORMAL,0,4.2);
		DrTarget(DR_TARGET.MIRROR,315,3.8);
	}
	if (_timer == 920) { DrTarget(DR_TARGET.NORMAL,90,3.6); }
	if (_timer == 945) { DrTarget(DR_TARGET.NORMAL,270,3.6); }
	if (_timer == 970)
	{
		DrTarget(DR_TARGET.MIRROR,90,3.2);
		DrTarget(DR_TARGET.NORMAL,180,3.6);
	}
	if (_timer == 995) { DrTarget(DR_TARGET.MIRROR,270,3.2); }
	if (_timer == 1010) { DrTarget(DR_TARGET.BIG,0,1.6); }
	if (_timer == 1030) { DrTarget(DR_TARGET.NORMAL,135,3.8); }
	if (_timer == 1055) { DrTarget(DR_TARGET.NORMAL,225,3.8); }
	if (_timer == 1078) { DrTarget(DR_TARGET.MIRROR,225,3.4); }
	if (_timer == 1080)
	{
		DrTarget(DR_TARGET.NORMAL,45,3.8);
		DrTarget(DR_TARGET.MIRROR,135,3.4);
	}
	if (_timer == 1098) { DrTarget(DR_TARGET.MIRROR,45,3.4); }
	if (_timer == 1112) { DrTarget(DR_TARGET.NORMAL,315,3.4); }
	if (_timer == 1118) { DrTarget(DR_TARGET.NORMAL,135,3.0); }
	if (_timer == 1132) { DrTarget(DR_TARGET.MIRROR,225,3.0); }
	if (_timer == 1140) { DrTarget(DR_TARGET.NORMAL,90,3.4); }
	if (_timer == 1156) { DrTarget(DR_TARGET.MIRROR,315,3.0); }
	if (_timer == 1166)
	{
		DrTarget(DR_TARGET.MIRROR,135,4.6);
		DrTarget(DR_TARGET.NORMAL,180,3.2);
	}
	if (_timer == 1186) { DrTarget(DR_TARGET.MIRROR,90,3.0); }
	if (_timer == 1196) { DrTarget(DR_TARGET.MIRROR,315,2.8); }
	if (_timer == 1200) { DrTarget(DR_TARGET.BIG,180,1.8); }
	if (_timer == 1210) { DrTarget(DR_TARGET.MIRROR,180,3.6); }
	if (_timer == 1224) { DrTarget(DR_TARGET.NORMAL,0,2.8); }
	if (_timer == 1244) { DrTarget(DR_TARGET.MIRROR,0,2.6); }
	if (_timer == 1250) { DrTarget(DR_TARGET.NORMAL,90,3.4); }
	if (_timer == 1284) { DrTarget(DR_TARGET.MIRROR,90,3.0); }
	if (_timer == 1296) { DrTarget(DR_TARGET.NORMAL,45,3.0); }
	if (_timer == 1300) { DrTarget(DR_TARGET.MIRROR,0,2.6); }
	if (_timer == 1322) { DrTarget(DR_TARGET.MIRROR,90,3.0); }
	if (_timer == 1328) { DrTarget(DR_TARGET.NORMAL,135,3.6); }
	if (_timer == 1356) { DrTarget(DR_TARGET.MIRROR,45,2.8); }
	if (_timer == 1360) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
	if (_timer == 1364) { DrTarget(DR_TARGET.MIRROR,135,2.6); }
	if (_timer == 1392) { DrTarget(DR_TARGET.NORMAL,270,3.8); }
	if (_timer == 1396) { DrTarget(DR_TARGET.MIRROR,225,3.0); }
	if (_timer == 1424) { DrTarget(DR_TARGET.NORMAL,315,3.0); }
	if (_timer == 1428) { DrTarget(DR_TARGET.MIRROR,270,3.4); }
	if (_timer == 1456) { DrTarget(DR_TARGET.NORMAL,0,3.4); }
	if (_timer == 1484) { DrTarget(DR_TARGET.MIRROR,315,2.8); }

	if (_timer > 1484) and (fade_at < 0)
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
	var _bx = battle_board.x;

	if (fade_at > 0) and (_timer > fade_at+1010) and (_timer < fade_at+1560) { PendStep(66,1.5); BarsStep(0); }
	if (fade_at > 0) and (_timer > fade_at+1060) and (_timer < fade_at+1530) and ((_timer mod 26) == 0) { BarsSpawn(2.2); }
	if (fade_at > 0) and (_timer == fade_at+30)
	{
		Battle_SetBoardSizeCubic(67,67,158,158,30);
	}
	if (fade_at > 0) and (_timer == fade_at+66)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
	}
	if (fade_at > 0) and (_timer == fade_at+120)
	{
		GateMake(_bl-30,4,36,44);
		GateMake(_br+30,-4,36,44);
	}
	if (fade_at > 0) and (_timer == fade_at+140)
	{
		GateTo(0,_bx+24,44);
		GateTo(1,_bx-24,44);
	}
	if (fade_at > 0) and (_timer == fade_at+204)
	{
		GateGap(0,88,48,54);
		GateGap(1,88,48,54);
	}
	if (fade_at > 0) and (_timer == fade_at+330)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamLeft();
	}
	if (fade_at > 0) and (_timer == fade_at+348)
	{
		GateTo(0,_bl+54,30);
		GateTo(1,_br-54,30);
	}
	if (fade_at > 0) and (_timer == fade_at+430)
	{
		RegularBlaster(_bl+40,-110,_bl+40,_bt-46,270,270,40,10,2,2,44);
	}
	if (fade_at > 0) and (_timer == fade_at+496)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamRight();
	}
	if (fade_at > 0) and (_timer == fade_at+540)
	{
		RegularBlaster(_br-40,-110,_br-40,_bt-46,270,270,40,10,2,2,44);
	}
	if (fade_at > 0) and (_timer == fade_at+612)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}
	if (fade_at > 0) and (_timer == fade_at+688)
	{
		GateMove(0,8,26);
		GateMove(1,-8,26);
	}
	if (fade_at > 0) and (_timer == fade_at+772)
	{
		GateClear();
	}
	if (fade_at > 0) and (_timer == fade_at+676)
	{
		Dagger(_bl-40,_bt+20,62,16,270,22);
	}
	if (fade_at > 0) and (_timer == fade_at+684)
	{
		Dagger(_br+40,_bt+30,62,-16,90,22);
	}
	if (fade_at > 0) and (_timer == fade_at+692)
	{
		Dagger(_bl-40,_bt+40,62,16,270,22);
	}
	if (fade_at > 0) and (_timer == fade_at+700)
	{
		Dagger(_br+40,_bt+50,62,-16,90,22);
	}
	if (fade_at > 0) and (_timer == fade_at+708)
	{
		Dagger(_bl-40,_bt+60,62,16,270,22);
	}
	if (fade_at > 0) and (_timer == fade_at+716)
	{
		Dagger(_br+40,_bt+70,62,-16,90,22);
	}
	if (fade_at > 0) and (_timer == fade_at+724)
	{
		Dagger(_bl-40,_bt+80,62,16,270,22);
	}
	if (fade_at > 0) and (_timer == fade_at+732)
	{
		Dagger(_br+40,_bt+90,62,-16,90,22);
	}
	if (fade_at > 0) and (_timer == fade_at+740)
	{
		Dagger(_bl-40,_bt+100,62,16,270,22);
	}
	if (fade_at > 0) and (_timer == fade_at+748)
	{
		Dagger(_br+40,_bt+110,62,-16,90,22);
	}
	if (fade_at > 0) and (_timer == fade_at+812)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
	}
	if (fade_at > 0) and (_timer == fade_at+844)
	{
		WallMake(true,52,44,22);
	}
	if (fade_at > 0) and (_timer == fade_at+876)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
	}
	if (fade_at > 0) and (_timer == fade_at+908)
	{
		WallMake(false,52,44,22);
	}
	if (fade_at > 0) and (_timer == fade_at+970)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}
	if (fade_at > 0) and (_timer == fade_at+986)
	{
		GateMake(_bl-30,6,67,46);
		GateMake(_br+30,-6,67,46);
	}
	if (fade_at > 0) and (_timer == fade_at+1046)
	{
		GateClear();
		PendMake(120);

	}
	if (fade_at > 0) and (_timer == fade_at+1080)
	{
		RegularBlaster(-90,_bt+24,140,_bt+24,0,0,30,12,1,2,42);
		RegularBlaster(730,_bb-24,500,_bb-24,180,180,30,12,1,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+1144)
	{
		RegularBlaster(-90,_bt+38,140,_bt+38,0,0,30,12,1,2,42);
		RegularBlaster(730,_bb-38,500,_bb-38,180,180,30,12,1,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+1208)
	{
		RegularBlaster(-90,_bt+52,140,_bt+52,0,0,30,12,1,2,42);
		RegularBlaster(730,_bb-52,500,_bb-52,180,180,30,12,1,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+1272)
	{
		RegularBlaster(-90,_bt+66,140,_bt+66,0,0,30,12,1,2,42);
		RegularBlaster(730,_bb-66,500,_bb-66,180,180,30,12,1,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+1336)
	{
		RegularBlaster(-90,_bt+80,140,_bt+80,0,0,30,12,1,2,42);
		RegularBlaster(730,_bb-80,500,_bb-80,180,180,30,12,1,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+1400)
	{
		RegularBlaster(-90,_bt+94,140,_bt+94,0,0,30,12,1,2,42);
		RegularBlaster(730,_bb-94,500,_bb-94,180,180,30,12,1,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+1464)
	{
		RegularBlaster(-90,_bt+108,140,_bt+108,0,0,30,12,1,2,42);
		RegularBlaster(730,_bb-108,500,_bb-108,180,180,30,12,1,2,42);
	}
	if (fade_at > 0) and (_timer == fade_at+1560)
	{
		PendClear();
		BarsClear();
	}

	if (fade_at > 0) and (_timer == fade_at+1640)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}
