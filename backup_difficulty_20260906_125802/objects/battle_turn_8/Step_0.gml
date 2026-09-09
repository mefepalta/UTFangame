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

	if (_timer == 1)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,180,180);
	}
	if (_timer ==  40) { AlphysHammer(0,410,_wb,-1,4,1); }
	if (_timer == 190) { AlphysHammer(1,170,_wt,-1,4,1); }

	if (_timer == 340)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamLeft();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		arm_reset = 347;
		RegularBoneWall(DIR.LEFT,132,12,45,left_box,top_box,40,30,0,false);
	}
	if (_timer == 415)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamup;
		arm_reset = 422;
		RegularBoneWall(DIR.UP,370,33,34,left_box,top_box,80,485,0,false);
	}
	if (_timer == 460)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
		arm_reset = 467;
		RegularBoneWall(DIR.DOWN,370,33,34,left_box,bottom_box,75,445,0,false);
	}
	if (_timer == 500)
	{
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer == 560) { UDagger(_wt+96,46,6,100,22); }
	if (_timer == 600) { UDagger(_wt+74,46,6,100,22); }
	if (_timer == 640) { UDagger(_wt+52,46,6,100,22); }
	if (_timer == 680) { UDagger(_wt+30,46,6,100,22); }
	if (_timer >= 590) and (_timer <= 800) and (_timer % 60 == 50)
	{
		AlphysShocker(190+((_timer div 60) % 5)*65,_wb,40);
	}

	if (_timer == 830)
	{
		AlphysHammer(2,_wl,300, 1,3,1);
		AlphysHammer(3,_wr,340, 1,3,1);
	}

	if (_timer == 1000)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer == 1040)
	{
		RegularBlasterCircle(320,320,2.2,190,24,30,20,5,1,150);
	}
	if (_timer == 1080) { AlphysShocker(285,_wb,40); }
	if (_timer == 1150) { AlphysShocker(355,_wb,40); }

	if (_timer == 1230)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
		arm_reset = 1237;
		Battle_SetBoardSizeCubic(65,65,150,150);
	}
	if (_timer >= 1280) and (_timer <= 1640) and (_timer % 60 == 20)
	{
		var _gp = ((_timer div 60) % 3);
		var _gt = (_gp == 0 ? 104 : (_gp == 1 ? 68 : 45));
		var _gb = (_gp == 0 ?  22 : (_gp == 1 ? 58 : 81));
		audio_play_sound(snd_stab,2,false);
		Gate(true ,_gt,_gb,5);
		Gate(false,_gt,_gb,5);
	}

	if (_timer == 1690)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer == 1730)
	{
		RegularBlaster(320,-70,320,_wt-70,270,270,18,5,2,2,25);
		RegularBlaster(-70,320,_wl-70,320,0,0,18,5,2,2,25);
		RegularBlaster(710,320,_wr+70,320,180,180,18,5,2,2,25);
		RegularBlaster(320,550,320,_wb+70,90,90,18,5,2,2,25);
	}
	if (_timer == 1790)
	{
		RegularBlaster(90,90,_wl-55,_wt-55,315,315,18,5,1.6,2,25);
		RegularBlaster(550,90,_wr+55,_wt-55,225,225,18,5,1.6,2,25);
		RegularBlaster(90,550,_wl-55,_wb+55,45,45,18,5,1.6,2,25);
		RegularBlaster(550,550,_wr+55,_wb+55,135,135,18,5,1.6,2,25);
	}

	if (_timer == 1910)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125);
		Battle_SetMenuDialog("* Here comes the trouble in&  the form of the undead.")
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
if (_timer > 50) and (_timer < 350)
{
	if (_timer % 5 == 0)
	{
		RegularBone(left_box,top_box,60+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
	}
}
if (_timer == 370)
{
	audio_play_sound(snd_impact,2,false);
	Battle_SlamLeft();
	RegularBoneWall(DIR.LEFT,140,12,70,left_box,top_box,50,180,0,false);
}
if (_timer > 391) and (_timer < 531) and (_timer % 30 == 0)
{
	RegularBlaster(-50,-50,battle_soul.x,top_box - 70 ,270,270,30,5,2,2,40);
}
if (_timer == 440)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}
if (_timer > 590) and (_timer < 820) and (_timer % 60 == 0)
{
	RegularBone(left_box,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 30,down_box,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,down_box,82,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 830)
{
    Battle_SetBoardSizeCubic(65,65,65,65);
}
if (_timer == 850)
{
	instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
	with (o_excmark)
	{
		image_index = 2;
	}
	audio_play_sound(snd_bonewarn,2,false);
}
if (_timer == 890)
{
	RegularBone(right_box + 110,top_box + 50,150,-6,0,90,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 110,top_box + 60,150,-6,0,90,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 110,top_box + 70,150,-6,0,90,0,0,1,0,0,0,0,true);
}
if (_timer == 970)
{
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* He anticipates your next&  move.")
	if (instance_exists(o_sans_blockp2))
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
	}
	Battle_EndTurn();
}

