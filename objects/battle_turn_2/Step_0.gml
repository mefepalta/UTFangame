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
	    Battle_SetBoardSizeCubic(65,65,110,110);
	}
	if (_timer == 40)
	{
		RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 45)
	{
		RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 60)
	{
		RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 65)
	{
		RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 85)
	{
		RegularBone(right_box,top_box,26,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,26,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,104,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 115)
	{
		RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,26,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box,26,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer > 135) and (_timer < 190)
	{
		if (_timer % 15 == 0)
		{
			RegularBone(right_box,bottom_box,104,-4,0,0,0,0,1,0,0,0,0,true);
		    RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer == 215)
	{
	    Battle_SetBoardSizeCubic(65,65,150,150);
		Battle_SlamDown();
		audio_play_sound(snd_impact,2,0);
	}
	if (_timer == 230)
	{
		RegularBone(right_box,top_box,60,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,60,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 235)
	{
		RegularBone(right_box,top_box,60,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,60,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 250)
	{
		RegularBone(left_box,bottom_box,30,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 260)
	{
		RegularBone(left_box,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 270)
	{
		RegularBone(left_box,bottom_box,90,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 280)
	{
		RegularBone(left_box,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 290)
	{
		RegularBone(left_box,bottom_box,30,3,0,0,0,0,1,0,0,0,0,true);
	}

	if (_timer == 350)
	{
		RegularBone(right_box,bottom_box,94,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,31,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 350)
	{
		RegularBlaster(320,-50,320,top_box-100,270,270,20,20,2,2,50);
		RegularBlaster(320,-50,200,top_box-100,270,270,20,20,2,2,50);
		RegularBlaster(320,-50,440,top_box-100,270,270,20,20,2,2,50);
	}
	if (_timer == 355)
	{
		RegularBone(right_box,bottom_box,74,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 360)
	{
		RegularBone(right_box,bottom_box,54,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 365)
	{
		RegularBone(right_box,bottom_box,34,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 375)
	{
		RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 380)
	{
		RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 385)
	{
		RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 390)
	{
		RegularBone(right_box,bottom_box,44,-3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 395)
	{
		RegularBone(right_box,bottom_box,44,-3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 400)
	{
		RegularBone(right_box,bottom_box,44,-3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer > 500) and (_timer < 560) and (_timer % 10 == 0)
	{
		RegularBone(left_box,bottom_box,70,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 650)
	{
	    Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer > 650) and (_timer % 40 == 0) and (_timer < 1000)
	{
		RegularBone(left_box,bottom_box,33,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,117,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1000)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Sans gives you an enraged&  stare.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}
	if (_timer = 10)
	{
		Battle_SetBoardSizeCubic(85,65,40,40);
		Anim_Create(battle_board, "x", ANIM_TWEEN.EXPO, ANIM_EASE.OUT, bottom_box - 50, -230, 50);
	}
	if (_timer = 60)
	{
		RegularBlaster(320,-50,battle_soul.x + 50,top_box-100,270,270,20,10,2,2,30);
	}
	if (_timer == 70)
	{
		Anim_Create(battle_board, "x", ANIM_TWEEN.LINEAR, ANIM_EASE.IN, bottom_box - 280, 460, 350);
		RegularBone(right_box,top_box,33,-2,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,124,-2,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 130)
	{
		RegularBlaster(320,-50,battle_soul.x + 50,top_box-100,270,270,20,10,2,2,30);
	}
	if (_timer == 140)
	{
		RegularBone(right_box,top_box,124,-2,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,33,-2,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 200)
	{
		RegularBlaster(320,-50,battle_soul.x + 50,top_box-100,270,270,20,10,2,2,30);
	}
	if (_timer == 210)
	{
		RegularBone(right_box,top_box,33,-2,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,124,-2,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 270)
	{
		RegularBlaster(320,-50,battle_soul.x + 50,top_box-100,270,270,20,10,2,2,30);
	}
	if (_timer == 280)
	{
		RegularBone(right_box,top_box,124,-2,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,33,-2,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 340)
	{
		RegularBlaster(320,-50,battle_soul.x + 50,top_box-100,270,270,20,10,2,2,30);
	}
	if (_timer == 350)
	{
		RegularBone(right_box,top_box,33,-2,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,124,-2,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 410)
	{
		Battle_SlamUp();
		RegularBlaster(320,-50,left_box - 50,top_box + 20,0,0,20,10,2,2,30);
	}
	if (_timer = 460)
	{
		Battle_SlamDown();
		RegularBlaster(320,-50,left_box - 50,bottom_box - 20,0,0,20,10,2,2,30);
	}
	if (_timer == 510)
	{
		Battle_SetSoul(battle_soul_red);
		Anim_Create(battle_board, "x", ANIM_TWEEN.LINEAR, ANIM_EASE.IN, bottom_box + 180, -240, 50);
	}
	if (_timer == 560)
	{
		Battle_SetBoardSizeCubic(65,65,150,150);
	}
	if (_timer == 590)
	{
		RegularBone(left_box,top_box,182,0,3,270,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,182,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer == 640)
	{
		RegularBone(left_box,bottom_box,182,0,-3,270,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,182,0,3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer == 710)
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		Battle_EndTurn();
	}
}