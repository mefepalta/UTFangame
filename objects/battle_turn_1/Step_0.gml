var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+4;

if (room == room_battle)
{
	if (_timer) = 1
	{
		Battle_SetSoul(battle_soul_blue);
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer > 40) and (_timer < 50)
	{
		if (_timer % 3 ==0)
		{
			RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer > 80) and (_timer < 90)
	{
		if (_timer % 3 ==0)
		{
			RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
		}
	}

	if (_timer > 120) and (_timer < 130)
	{
		if (_timer % 3 ==0)
		{
			RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
		}
	}

	if (_timer > 160) and (_timer < 170)
	{
		if (_timer % 3 ==0)
		{
			RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer) = 170
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer) = 170
	{
		RegularBlaster(320,-50,320,top_box-100,270,270,20,1,2,2,50);
		RegularBlaster(320,-50,400,top_box-100,275,245,20,1,2,2,50);
		RegularBlaster(320,-50,240,top_box-100,265,295,20,1,2,2,50);
	}
	if (_timer) = 250
	{
	    Battle_SetBoardSizeCubic(80,65,270,-100);
	}
	if (_timer) > 270 and (_timer < 600)
	{
		if (_timer % 30 == 0)
		{
			audio_play_sound(snd_stab,2,0);
			RegularBone(left_box,top_box,90,4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,90,-4,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer = 570)
	{
		RegularBlaster(320,-50,right_box + 100,top_box + 70,180,180,20,1,2,2,50);
		RegularBlaster(320,-50,50,top_box - 70,270,270,20,1,1,2,50);
		RegularBlaster(320,-50,220,top_box - 70,270,270,20,1,1,2,50);
	}
	if (_timer = 670)
	{
	    Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer = 700)
	{
		Battle_SlamDown()
		RegularBoneWall(DIR.DOWN,200,18,20,230,bottom_box,50,250,0,false);
	}
	if (_timer = 760)
	{
		Battle_SlamUp()
		RegularBoneWall(DIR.UP,200,18,20,230,top_box,50,190,0,false);
	}
	if (_timer = 820)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_bell,2,0);
		RegularBlaster(320,-50,320,top_box-100,270,270,20,20,2,2,50);
		RegularBlaster(-50,battle_board.y,left_box-100,battle_board.y,0,0,20,20,2,2,50);
		RegularBlaster(690,battle_board.y,right_box+100,battle_board.y,180,180,20,20,2,2,50);
		RegularBlaster(320,540,320,bottom_box+100,90,90,20,20,2,2,50);
	}
	if (_timer == 1000)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	var platform = makeplatform(left_box+50,bottom_box + 50,60,0,0,true,0);
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}
	if (_timer = 1)
	{
		Battle_SlamDown();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
	}
	if (_timer = 5)
	{
		platform.vspeed = -1;
	}
	if (_timer = 7)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}
	if (_timer == 1000)
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		Battle_EndTurn();
	}
}