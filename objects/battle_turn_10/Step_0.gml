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
	var _wl = battle_board.x-battle_board.left;
	var _wr = battle_board.x+battle_board.right;
	var _wt = battle_board.y-battle_board.up;
	var _wb = battle_board.y+battle_board.down;

	if (_timer == arm_reset)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}
	if (_timer >= 560) and (_timer <= 960)
	{
		FanStep();
	}
	if (_timer >= 1100) and (_timer <= 1850)
	{
		WallStep();
	}

	if (_timer == 1)
	{
		Battle_SlamDown();
		Battle_SetBoardSizeCubic(65,65,180,180);
	}
	if (_timer >= 60) and (_timer <= 460) and (_timer % 85 == 4)
	{
		RegularBone(left_box ,bottom_box,irandom_range(28,54), 3.5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,irandom_range(28,54),-3.5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150) or (_timer == 280) or (_timer == 410)
	{
		AlphysBigBolt(battle_board.x+irandom_range(-110,110),-60,270,6,8,2.2);
	}

	if (_timer == 520)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer == 560)
	{
		Battle_SetSoul(battle_soul_red);
		FanSet(3,1.4,95);
	}
	if (_timer >= 640) and (_timer <= 860) and (_timer % 70 == 10)
	{
		RegularBone(left_box ,bottom_box,152, 7,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,152,-7,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 680) or (_timer == 790) or (_timer == 880)
	{
		AlphysShocker(battle_board.x+irandom_range(-40,40),_wb,45);
	}
	if (_timer == 900)
	{
		FanRetract(46);
	}
	if (_timer == 955)
	{
		FanClear();
	}

	if (_timer == 990)
	{
		MakeBoneExplode(battle_board.x,battle_board.y,0,55);
	}

	if (_timer == 1100)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamLeft();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		arm_reset = 1107;
		Battle_SetBoardSizeCubic(65,65,190,190);
		LeftWall(12,46,80);
	}
	if (_timer == 1140)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
		arm_reset = 1147;
	}
	if (_timer == 1200)
	{
		Anim_Create(battle_board,"left",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,190,-130,650);
	}

	if (_timer >= 1256) and (_timer <= 1850) and ((_timer mod 4) == 0)
	{
		Carpet();
	}

	if (_timer == 1300)
	{
		RegularBone(right_box + 10,top_box,20,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,100,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1320)
	{
		makeplatform(right_box + 10,bottom_box - 30,40,-3,0,true,0);
	}
	if (_timer == 1370)
	{
		RegularBone(right_box + 10,bottom_box,120,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 40,bottom_box,120,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 70,bottom_box,120,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 100,bottom_box,120,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 130,bottom_box,120,-5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1360)
	{
		makeplatform(right_box + 10,bottom_box - 30,40,-0.75,0,true,0);
	}
	if (_timer == 1430)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamup;
		RegularBoneWall(DIR.UP   ,440,36,50,left_box,top_box   ,45,30,0,false);
	}
	if (_timer == 1437)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}
	if (_timer == 1490)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
	}
	if (_timer == 1497)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}
	if (_timer == 1520)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamup;
		RegularBoneWall(DIR.UP   ,440,36,50,left_box,top_box   ,45,30,0,false);
	}
	if (_timer == 1527)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}
	if (_timer == 1580)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
	}
	if (_timer == 1587)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}
	if (_timer == 1630)
	{
		RegularBone(right_box + 10,top_box,20,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,100,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 40,top_box,20,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 40,bottom_box,100,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1660)
	{
		RegularBone(right_box + 10,top_box,90,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,90,-4,0,180,0,0,1,0,0,0,0,true);
		makeplatform(right_box + 10,bottom_box - 30,60,-4,0,true,0);
	}
	if (_timer == 1720)
	{
		makeplatform(right_box + 10,bottom_box - 30,100,-3,0,false,0);
		RegularBlaster(-80,_wb-46,_wl-60,_wb-60,0,0,26,16,2,2,34);
	}
	if (_timer == 1830)
	{
		WallClear();
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}

	if (_timer == 1890)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer == 1950) or (_timer == 2100)
	{
		AlphysBigBolt(battle_board.x,-60,270,6,10,2.6);
	}
	if (_timer == 1990) or (_timer == 2050) or (_timer == 2110)
	{
		AlphysShocker(battle_board.x+irandom_range(-42,42),_wb,40);
	}

	if (_timer == 2290)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125);
		Battle_SetMenuDialog("* You should really stop&  reading all these.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
	exit;
}

if (_timer == 1)
{
	Battle_SlamDown();
    Battle_SetBoardSizeCubic(65,65,160,160);
	audio_play_sound(snd_impact,2,false);
	RegularBlaster(320,-50,420,top_box-100,270,270,270,1,4,2,50);
	RegularBlaster(320,-50,220,top_box-100,270,270,270,1,4,2,50);
}
if (_timer == 30)
{
	RegularBoneWall(DIR.UP,20,1,150,left_box + 130,top_box,50,246,0,false);
	RegularBoneWall(DIR.DOWN,20,1,150,left_box + 200,bottom_box,50,246,0,false);
}
if (_timer > 70) and (_timer < 286) and (_timer % 31 == 0)
{
	RegularBone(left_box + 155,top_box - 10,25,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(left_box + 175,top_box - 60,25,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(left_box + 135,top_box - 60,25,0,3,270,0,0,1,0,0,0,0,true);
}
if (_timer == 330)
{
	RegularBone(right_box + 20,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,50,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 50,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 65,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 80,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 95,bottom_box,50,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 110,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 370)
{
	RegularBone(left_box - 20,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 50,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 65,bottom_box,70,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 80,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 95,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 110,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 410)
{
	RegularBone(right_box + 20,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer > 430) and (_timer < 630) and (_timer % 30 == 0)
{
	RegularBone(right_box,bottom_box,25,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 480)
{
	RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,170,1,2,2,50);
}
if (_timer == 550)
{
	RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,100,1,2,2,50);
}
if (_timer == 600)
{
	Battle_SlamUp();
	audio_play_sound(snd_impact,2,false);
}
if (_timer > 600) and (_timer % 5 == 0)
{
	RegularBone(right_box,top_box,25,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 680)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}
if (_timer == 650)
{
	RegularBlaster(320,-50,right_box + 100,top_box + 70,180,180,50,1,2,2,50);
}
if (_timer == 750)
{
	RegularBone(right_box + 20,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 800)
{
	RegularBone(right_box + 20,bottom_box,152,-5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,152,-5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,152,5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,bottom_box,152,5,0,0,1,0,1,0,0,0,0,true);
}
if (_timer == 900)
{
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* Sans flips a bone mid-air&  to look intimidating.")
	if (instance_exists(o_sans_blockp2))
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
	}
	Battle_EndTurn();
}
