var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer == 1)
	{
		Battle_SetSoul(battle_soul_red);
	    Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer > 20) and (_timer < 320) and (_timer % 30 == 0)
	{
		RegularBone(left_box,bottom_box,82,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 350)
	{
		with (o_excmark)
		{
			image_index = 0;
		}
		instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
		audio_play_sound(snd_bonewarn,2,false);
	}
	if (_timer == 370)
	{
		RegularBone(left_box + 60,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box + 70,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box + 80,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 400) and (_timer < 520) and (_timer % 30 == 0)
	{
		RegularBone(left_box,bottom_box,82,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 560)
	{
		instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
		with (o_excmark)
		{
			image_index = 2;
		}
		audio_play_sound(snd_bonewarn,2,false);
	}
	if (_timer == 530)
	{
		RegularBlaster(-50,-50,left_box + 70,top_box - 80,270,270,30,5,2,2,50);
	}
	if (_timer == 580)
	{
		RegularBlaster(-50,-50,left_box + 10,top_box - 80,270,270,30,5,1,2,50);
		RegularBlaster(-50,-50,right_box - 10,top_box - 80,270,270,30,5,1,2,50);
	}
	if (_timer == 600)
	{
		RegularBone(left_box - 80,top_box + 50,77,7,0,90,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 80,top_box + 60,77,7,0,90,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 80,top_box + 70,77,7,0,90,0,0,1,0,0,0,0,true);
	}
	if (_timer == 730)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He's reliving a painful&  memory.")
		Battle_EndTurn();
	}
}

if (room == room_battle_1)
{

	if (_timer == arm_reset)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}

	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
		Battle_SetBoardSizeCubic(60,60,185,185);
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer == 40)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamLeft();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		arm_reset = 47;
	}
	if (_timer >= 52) and (_timer < 980) and (_timer % 10 == 2)
	{
		RegularBone(left_box,top_box+2,48,0,3,-90,0,0,1,0,0,0,0,true);
	}
	if (_timer == 105)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamRight();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		arm_reset = 112;
	}
	if (_timer >= 120) and (_timer < 980) and (_timer % 10 == 7)
	{
		RegularBone(right_box,top_box+2,48,0,3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer == 170)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
		arm_reset = 177;
	}
	if (_timer == 175)
	{
		Anim_Create(battle_board,"left" ,ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,185,-95,805);
		Anim_Create(battle_board,"right",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,185,-95,805);
	}

	if (_timer == 360) { Gate(true , 99,22,6); }
	if (_timer == 404) { Gate(false, 99,22,6); }
	if (_timer == 448) { Gate(true , 69,47,6); }
	if (_timer == 492) or (_timer == 496) { Gate(false, 99,22,6); }
	if (_timer == 560) or (_timer == 564) or (_timer == 568) { Gate(true , 47,69,6); }

	if (_timer == 420) or (_timer == 640) or (_timer == 860)
	{
		MakeBoneExplode(((_timer == 640) ? right_box-14 : left_box+14),top_box+14,0,50);
	}

	if (_timer == 780)
	{
		audio_play_sound(snd_bell,2,false);
		BlueWall(0);
		BlueWall(30);
		BlueWall(60);
	}

	if (_timer == 980)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamup;
		arm_reset = 987;
		RegularBoneWall(DIR.UP,190,17,60,left_box,top_box,35,40,0,false);
	}
	if (_timer == 1035)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
		arm_reset = 1042;
	}
	if (_timer == 1050)
	{
		RegularBlaster(left_box-140,bottom_box+55,left_box-55,bottom_box-16,0,0,30,10,2,2,35);
		RegularBlaster(right_box+140,bottom_box+55,right_box+55,bottom_box-16,180,180,30,10,2,2,35);
	}
	if (_timer == 1170)
	{
		Battle_SetSoul(battle_soul_red);
	}

	if (_timer == 1200) or (_timer == 1214) { Dagger(left_box-80,bottom_box-30,46,6,0,90); }
	if (_timer == 1235) or (_timer == 1249) { Dagger(left_box-80,top_box+30,46,6,0,90); }
	if (_timer == 1275) or (_timer == 1289) { Dagger(left_box+38,top_box-80,46,0,6,0); }
	if (_timer == 1310) or (_timer == 1324) { Dagger(right_box-38,top_box-80,46,0,6,0); }
	if (_timer == 1355) { Dagger(left_box-80,battle_board.y,46,6,0,90); }
	if (_timer == 1375) { Dagger(battle_board.x,top_box-80,46,0,6,0); }
	if (_timer == 1415) or (_timer == 1435) or (_timer == 1455) or (_timer == 1475)
	{
		var _d4 = ((_timer div 20) % 2 == 0);
		Dagger(left_box-80,(_d4 ? top_box+34 : bottom_box-34),46,6,0,90);
	}

	if (_timer == 1530)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
		arm_reset = 1537;
		Battle_SetBoardSizeCubic(65,65,90,90);
	}
	if (_timer >= 1580) and (_timer <= 1960) and (_timer % 40 == 0)
	{
		audio_play_sound(snd_stab,2,false);
		Gate(true ,118,22,5);
		Gate(false,118,22,5);
	}

	if (_timer == 2040)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125);
		Battle_SetMenuDialog("* The three of them stare&  into your soul.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}
