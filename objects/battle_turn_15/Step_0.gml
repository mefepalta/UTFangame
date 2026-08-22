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
		Battle_SetBoardSizeCubic(65,65,65,65);
		Battle_SlamDown();
		RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,20,0,false);
	}
	if (_timer = 60)
	{
		Battle_SetBoardSizeCubic(65,65,125,125);
	}
	if (_timer = 60)
	{
		RegularBone(right_box,top_box,102,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,top_box,102,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,102,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,102,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,top_box,102,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,top_box,102,3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 60) and (_timer < 360) and (_timer % 30 == 0)
	{
		RegularBone(right_box,top_box,112,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,112,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box + 2,22,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box + 2,22,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 360)
	{
		Battle_SetBoardSizeCubic(65,65,105,105);
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}
	if (_timer = 360)
	{
		var gbX = random_range(50,540);
		var gbY = random_range(top_box - 20,top_box - 220);
		var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
	}
	if (_timer = 410)
	{
		var gbX = random_range(50,540);
		var gbY = random_range(top_box - 20,top_box - 220);
		var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
	}
	if (_timer = 510)
	{
		Battle_SlamDown();
	}
	if (_timer = 520)
	{
		RegularBone(right_box,bottom_box + 2,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,bottom_box + 2,32,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box + 2,42,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 45,bottom_box + 2,52,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 60,bottom_box + 2,62,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 75,bottom_box + 2,72,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 90,bottom_box + 2,62,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 105,bottom_box + 2,52,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 120,bottom_box + 2,42,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 135,bottom_box + 2,32,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 150,bottom_box + 2,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,22,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,top_box,32,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,top_box,42,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 45,top_box,52,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 60,top_box,62,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 75,top_box,72,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 90,top_box,62,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 105,top_box,52,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 120,top_box,42,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 135,top_box,32,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 150,top_box,22,5,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer = 570)
	{
		Battle_SlamUp();
	}
	if (_timer = 580)
	{
		RegularBone(right_box,top_box,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,top_box,32,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,42,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 45,top_box,52,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 60,top_box,62,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 75,top_box,72,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 90,top_box,62,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 105,top_box,52,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 120,top_box,42,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 135,top_box,32,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 150,top_box,22,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,bottom_box + 2,32,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box + 2,42,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 45,bottom_box + 2,52,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 60,bottom_box + 2,62,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 75,bottom_box + 2,72,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 90,bottom_box + 2,62,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 105,bottom_box + 2,52,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 120,bottom_box + 2,42,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 135,bottom_box + 2,32,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 150,bottom_box + 2,22,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 630)
	{
		Battle_SlamDown();
		RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,30,0,false);
	}
	if (_timer = 710)
	{
		Battle_SetBoardSizeCubic(65,65,155,155);
		Battle_SlamUp();
	}
	if (_timer > 720) and (_timer < 900) and (_timer % 50 == 0)
	{
		RegularBone(right_box,bottom_box + 2,112,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,22,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box + 2,112,6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,22,6,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 726) and (_timer < 900) and (_timer % 25 == 0) and (_timer % 50 != 0)
	{
		RegularBone(right_box,top_box,152,-6,0,180,1,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,152,6,0,180,1,0,1,0,0,0,0,true);
	}
	if (_timer = 920)
	{
		audio_play_sound(snd_ding,2,false);
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer > 920) and (_timer < 1250)
	{
		if (_timer % 5 == 0)
		{
			RegularBone(left_box,top_box,60+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
		
		}
		if (_timer % 50 == 0)
		{
			var gbX = random_range(50,540);
			var gbY = top_box - 80;
			var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
			RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		}
	}
	if (_timer = 1300)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer = 1310)
	{
		RegularBlaster(-50,320,left_box - 80,top_box + 60,0,0,18,20,3,3,50);
		RegularBlaster(-50,320,left_box + 85,top_box - 80,0,270,18,20,3,3,50);
	}
	if (_timer = 1450)
	{
		Battle_SetMenuDialog("* The last hope.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == arm_reset)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}

	if (faz == 0) and (_timer > 210)
	{
		if ((instance_exists(battle_soul_yellow_dr) and battle_soul_yellow_dr.big_fired > 0) or (_timer >= 400))
		{
			faz = 1;
			_timer = 600;
		}
	}

	if (faz == 1) and (_timer > 1120) and (!instance_exists(battle_dr_obstacle))
	{
		faz = 2;
		DrCorridorStop();
		_timer = 2015;
	}

	if (_timer > 2340) and (_timer < 4230) { PlatStep(); }

	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(34,34,34,34,60);
	}

	if (_timer == 70)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_yellow_dr);
		battle_soul.small_on = false;
		Camera_Shake(3,3,2,2);
	}

	if (_timer == 120)
	{
		audio_play_sound(snd_exclamation,0,false);
		DrBoneWall(3,22,286,70);
	}

	if (_timer == 600)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		audio_play_sound(snd_impact,2,false);
		Camera_Shake(6,6,3,3);
		with(battle_dr_obstacle) { break_bar(x); }
		with(battle_dr_shot) { instance_destroy(); }
		Battle_SetBoardSizeCubic(320,160,120,120,40);
		Battle_SetSoul(battle_soul_orange_dr);
		DrCorridor(false,4);
	}

	if (_timer == 645)
	{
		Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.y,400-battle_soul.y,50);
	}

	if (_timer == 760)
	{
		DrBone(-61,122);
	}

	if (_timer == 840)
	{
		DrBone(0,64);
	}

	if (_timer == 1000)
	{
		DrBone(0,260);
	}

	if (_timer == 1006)
	{
		DrBone(0,260);
	}

	if (_timer == 1012)
	{
		DrBone(0,260);
	}

	if (_timer == 2015)
	{
		Fader_Fade(-1,1,1);
	}

	if (_timer == 2030)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(165,65,180,180,0);
		battle_board.angle = 0;
		Battle_SetSoul(battle_soul_blue);
		battle_soul.x = battle_board.x;
		battle_soul.y = battle_board.y+battle_board.down-10;
		plat = makeplatform(battle_board.x,320,100,0,0,1,0);
	}

	if (_timer == 2050)
	{
		Fader_Fade(-1,0,1);
	}

	if (_timer == 2120)
	{
		PapSlam(spr_papyrus_slamdown);
	}

	if (_timer == 2176)
	{
		PapIdle();
	}

	if (_timer == 2250)
	{
		ForestMake(20,64,45);
	}

	if (_timer == 2340)
	{
		plat.move_x = 2;
	}

	if (_timer == 2420)
	{
		AlphysShocker(battle_board.x+-120,battle_board.y+battle_board.down-4,44);
	}

	if (_timer == 2464)
	{
		ForestBurst(battle_board.x+-120);
		Camera_Shake(4,4,2,2);
	}

	if (_timer == 2512)
	{
		SansBone(false,26,308,6);
	}

	if (_timer == 2570)
	{
		AlphysShocker(battle_board.x+90,battle_board.y+battle_board.down-4,44);
	}

	if (_timer == 2614)
	{
		ForestBurst(battle_board.x+90);
		Camera_Shake(4,4,2,2);
	}

	if (_timer == 2662)
	{
		SansBone(true,30,308,6);
	}

	if (_timer == 2720)
	{
		AlphysShocker(battle_board.x+-60,battle_board.y+battle_board.down-4,44);
	}

	if (_timer == 2764)
	{
		ForestBurst(battle_board.x+-60);
		Camera_Shake(4,4,2,2);
	}

	if (_timer == 2812)
	{
		SansBone(false,34,308,6);
	}

	if (_timer == 2870)
	{
		AlphysShocker(battle_board.x+130,battle_board.y+battle_board.down-4,44);
	}

	if (_timer == 2914)
	{
		ForestBurst(battle_board.x+130);
		Camera_Shake(4,4,2,2);
	}

	if (_timer == 2962)
	{
		SansBone(true,38,308,6);
	}

	if (_timer == 3080)
	{
		PapSlam(spr_papyrus_slamup);
	}

	if (_timer == 3110)
	{
		plat.move_x = 0;
		plat.move_y = -1.6;
	}

	if (_timer == 3136)
	{
		PapIdle();
	}

	if (_timer == 3176)
	{
		plat.move_y = 0;
		plat.move_x = 1.6;
	}

	if (_timer == 3230)
	{
		RoofBone(-140,30,70);
	}

	if (_timer == 3292)
	{
		RoofBone(-95,70,70);
	}

	if (_timer == 3354)
	{
		RoofBone(-45,30,70);
	}

	if (_timer == 3416)
	{
		RoofBone(5,70,70);
	}

	if (_timer == 3478)
	{
		RoofBone(55,30,70);
	}

	if (_timer == 3540)
	{
		RoofBone(105,70,70);
	}

	if (_timer == 3602)
	{
		RoofBone(150,30,70);
	}

	if (_timer == 3664)
	{
		RoofBone(-120,70,70);
	}

	if (_timer == 3726)
	{
		RoofBone(40,30,70);
	}

	if (_timer == 3788)
	{
		RoofBone(130,70,70);
	}

	if (_timer == 3260)
	{
		AlphysHammer(0,battle_board.x-battle_board.left+50,battle_board.y+battle_board.down,1,2,1);
	}

	if (_timer == 3420)
	{
		AlphysHammer(0,battle_board.x+battle_board.right-50,battle_board.y+battle_board.down,-1,2,1);
	}

	if (_timer == 3580)
	{
		AlphysHammer(0,battle_board.x-battle_board.left+50,battle_board.y+battle_board.down,1,2,1);
	}

	if (_timer == 3740)
	{
		AlphysHammer(0,battle_board.x+battle_board.right-50,battle_board.y+battle_board.down,-1,2,1);
	}

	if (_timer == 3890)
	{
		PapSlam(spr_papyrus_slamdown);
		RoofClear();
	}

	if (_timer == 3920)
	{
		plat.move_x = 0;
		plat.move_y = 1.6;
	}

	if (_timer == 3946)
	{
		PapIdle();
	}

	if (_timer == 3986)
	{
		plat.move_y = 0;
		plat.move_x = 2;
	}

	if (_timer == 4060)
	{
		plat.move_x = 0;
		PapSlam(spr_papyrus_slamup);
	}

	if (_timer == 4116)
	{
		PapIdle();
	}

	if (_timer == 4130)
	{
		ForestDagger();
		Camera_Shake(5,5,2,2);
	}

	if (_timer == 4230)
	{
		if (instance_exists(plat)) { instance_destroy(plat); }
		audio_play_sound(snd_impact,2,false);
	}

	if (_timer == 4270)
	{
		ForestRise(274,34);
		Camera_Shake(4,6,2,2);
	}

	if (_timer == 4440)
	{
		ForestClear();
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125,40);
		Camera_Shake(3,3,2,2);
	}

	if (_timer == 4540)
	{
		Battle_SetMenuDialog("* Papyrus won't stop grinning.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}
