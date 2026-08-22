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

	if (_timer >= 40) and (_timer <= 850)
	{
		OrbitStep();
	}

	if (_timer == 1)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer == 40)
	{
		Anim_Create(battle_board,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,320, 180,240,  0);
		Anim_Create(battle_board,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,500,-360,320,240);
		Anim_Create(battle_board,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,140, 180,240,560);
		OrbitSet(230,24,2.2,46,[0,90]);
	}
	if (_timer == 110)
	{
		OrbitSet(230,24,2.2,46,[45,135]);
	}
	if (_timer == 150) or (_timer == 330) or (_timer == 510) or (_timer == 690)
	{
		var _sh = AlphysShocker(battle_board.x,_wb,40);
		_sh.follow_board = true;
		_sh.bolt_off = irandom_range(-42,42);
	}
	if (_timer == 815)
	{
		with (battle_regularbone)
		{
			Anim_Create(id,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,1,-1,26);
		}
	}
	if (_timer == 845)
	{
		with (battle_regularbone) { instance_destroy(); }
	}

	if (_timer == 880)
	{
		Battle_SetBoardSizeCubic(65,65,180,180);
	}
	if (_timer == 960)
	{
		AlphysHammer(1,_wl+75,_wt,-1,1,1);
		AlphysHammer(0,_wr-75,_wb,-1,1,1);
	}
	if (_timer == 1140)
	{
		AlphysHammer(1,_wr-75,_wt, 1,1,1);
		AlphysHammer(0,_wl+75,_wb, 1,1,1);
	}
	if (_timer == 1320)
	{
		AlphysHammer(1,_wl+75,_wt,-1,1,1);
		AlphysHammer(0,_wr-75,_wb,-1,1,1);
	}
	if (_timer == 1500)
	{
		AlphysHammer(1,_wr-75,_wt, 1,1,1);
		AlphysHammer(0,_wl+75,_wb, 1,1,1);
	}
	if (_timer >= 1000) and (_timer <= 1600) and (_timer % 5 == 0)
	{
		var _gate = sin(_timer*0.07)*22;
		RegularBone(left_box,top_box,50+_gate,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,down_box,50-_gate,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1000) or (_timer == 1300) or (_timer == 1500)
	{
		if (instance_exists(battle_soul))
		{
			RegularBlaster(320,-70,battle_soul.x,_wt-70,270,270,20,5,1,2,35);
		}
	}

	if (_timer == 1620)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer >= 1690) and (_timer <= 1800) and (_timer % 18 == 4)
	{
		var _sw = ((_timer-1690) div 18);
		var _bx = 240+_sw*32;
		var _by = _wt-70;
		RegularBlaster(320,-70,_bx,_by,270,point_direction(_bx,_by,battle_board.x,_wb),14,4,1,2,22);
	}

	if (_timer == 1880)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
		arm_reset = 1887;
	}
	if (_timer == 1920)
	{
		RegularBoneWall(DIR.UP   ,140,13,60,left_box,top_box   ,45,120,0,false);
		RegularBoneWall(DIR.DOWN ,140,13,60,left_box,bottom_box,45,120,0,false);
		RegularBoneWall(DIR.LEFT ,140,13,60,left_box,top_box   ,45,120,0,false);
		RegularBoneWall(DIR.RIGHT,140,13,60,left_box,top_box   ,45,120,0,false);
	}
	if (_timer == 1960)
	{
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer == 2040)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125);
		Battle_SetMenuDialog("* ...")
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
	Battle_SetSoul(battle_soul_red);
    Battle_SetBoardSizeCubic(65,65,130,130);
}
if (_timer == 50)
{
	RegularBone(left_box - 30,down_box -5,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 40,down_box -5,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,down_box -5,82,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 40,down_box -5,82,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 90)
{
	RegularBone(left_box - 30,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 40,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 40,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 130)
{
	RegularBone(left_box,top_box,120,5,0,180,0,0,1,0,0,0,0,true);
	audio_play_sound(snd_stab,2,false);
}
if (_timer == 150)
{
	RegularBoneWall(DIR.DOWN,280,25,40,left_box,bottom_box,50,999,0,false);
}
if (_timer == 230)
{
	RegularBone(left_box,top_box,70,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,70,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,70,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 280)
{
	RegularBoneWall(DIR.UP,280,25,40,left_box,top_box,50,999,0,false);
	RegularBone(left_box,top_box,30,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,110,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,30,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,110,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer > 280) and (_timer < 480) and (_timer % 40 == 0)
{
	RegularBlaster(-50,-50,battle_soul.x,top_box - 70 ,270,270,30,5,1,2,40);
}
if (_timer > 520) and (_timer < 720) and (_timer % 30 == 0)
{
	audio_play_sound(snd_pullback,2,false);
	RegularBone(left_box - 30,top_box + random_range(40,80),20,3,0,90,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box + random_range(40,80),20,-3,0,90,0,0,1,0,0,0,0,true);
}
if (_timer == 760)
{
	Battle_SlamLeft();
}
if (_timer == 780)
{
	RegularBone(left_box,bottom_box,152,0.5,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 800)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}
if (_timer == 820)
{
	RegularBone(right_box,top_box,80,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 40,bottom_box,80,-1.5,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 860)
{
	RegularBone(right_box,top_box,60,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,top_box,70,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,top_box,80,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box,90,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 50,bottom_box,60,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 60,bottom_box,70,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 70,bottom_box,80,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 80,bottom_box,90,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 90,bottom_box,152,-1.5,0,0,1,0,1,0,0,0,0,true);
}
if (_timer == 1070)
{
	Battle_SlamRight();
	RegularBoneWall(DIR.RIGHT,180,14,20,right_box,top_box,50,999,0,false);
}
if (_timer == 1150)
{
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* A familiar scent fills the&  room.")
	if (instance_exists(o_sans_blockp2))
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
	}
	Battle_EndTurn();
}
