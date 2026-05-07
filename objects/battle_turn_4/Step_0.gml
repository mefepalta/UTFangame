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
		Battle_SlamDown();
	    Battle_SetBoardSizeCubic(65,65,170,170);
		audio_play_sound(snd_impact,2,false);
	}
	if (_timer > 0) and (_timer < 300) and (_timer % 90 == 0)
	{
		RegularBlaster(-50,-50,battle_soul.x,top_box - 80,270,270,10,20,2,2,50);
	}
	if (_timer == 50)
	{
		RegularBone(left_box,bottom_box,62,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,62,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,62,-2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,62,-2,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(left_box,bottom_box,42,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,42,-2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,82,-2,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 250)
	{
		RegularBone(left_box,bottom_box,82,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,42,2,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,82,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,42,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 350)
	{
		RegularBoneWall(DIR.UP,370,31,95,left_box,top_box,50,400,0,false);
	}
	if (_timer > 400) and (_timer < 750) and (_timer % 40 == 0)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box - 18,24,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 750)
	{
		RegularBlaster(320,-50,left_box - 50,battle_soul.y,0,0,10,20,2,2,50);
		RegularBlaster(320,-50,right_box + 50,battle_soul.y,180,180,10,20,2,2,50);
	}
	if (_timer == 900)
	{
		Battle_SetSoul(battle_soul_red);
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
	/* (_timer == 10)
	{
		for (var i = 195; i > 165; i -= 5)
		{
			var bone = RegularBone(left_box + 100,top_box - 50, 40,0, 0, i+90,0,1,1,0,0,0,0,true);
			bone.direction = i;
			bone.speed = 10;
		}
	}*/
	if (_timer = 10)
	{
		MakeBoneCircle(20,3,40,0,30,40,left_box,top_box,0)
	}
	if (_timer == 710)
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		Battle_EndTurn();
	}
}