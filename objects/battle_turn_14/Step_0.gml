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
	if (_timer = 10)
	{
		Battle_SlamDown();
		RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,290,0,false);
	}
	if (_timer = 90)
	{
		Battle_SlamUp();
	}
	if (_timer = 90)
	{
		RegularBone(right_box,bottom_box + 2,152,-5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,bottom_box + 2,152,-5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box + 2,152,-5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box + 2,152,5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,bottom_box + 2,152,5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box + 2,152,5,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer = 120)
	{
		RegularBoneWall(DIR.LEFT,135,12,50,left_box,top_box,50,180,0,false);
		RegularBoneWall(DIR.RIGHT,135,12,50,right_box,top_box,50,180,0,false);
	}
	if (_timer = 180)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 195)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 210)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 225)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 240)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 255)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 270)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 285)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 290)
	{
		RegularBlaster(320,-50,left_box + 93,top_box - 40,270,270,20,20,2,2,50);
	}
	if (_timer = 370)
	{
		Battle_SlamRight();
	}
	if (_timer > 370) and (_timer < 550)
	{
		if (_timer % 5 == 0)
		{
			RegularBone(left_box,top_box,60+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer = 550)
	{
		audio_play_sound(snd_ding,2,false);
		Battle_SetSoul(battle_soul_red);
		RegularBlaster(320,-50,left_box - 30,top_box + 30,0,0,20,1,2,2,50);
		RegularBlaster(320,-50,left_box + 60,top_box - 60,0,270,20,1,2,2,50);
		RegularBlaster(320,-50,right_box + 40,bottom_box + 40,0,135,20,1,2,2,50);
	}
	if (_timer = 600)
	{
		RegularBlaster(320,-50,left_box - 30,top_box + 107,0,0,20,1,2,2,50);
		RegularBlaster(320,-50,left_box + 103,top_box - 60,0,270,20,1,2,2,50);
		RegularBlaster(320,-50,left_box - 20,top_box - 30,0,315,20,1,2,2,50);
	}
	if (_timer = 650)
	{
		RegularBlaster(320,-50,right_box + 40,bottom_box - 70,0,180,20,1,3,3,50);
		RegularBlaster(320,-50,left_box + 50,top_box - 70,0,270,20,1,2,2,50);
		RegularBlaster(320,-50,right_box - 50,bottom_box + 70,0,90,20,1,2,2,50);
	}
	if (_timer = 770)
	{
		Battle_SetMenuDialog("* He doesn't look happy.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == 1000)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		Battle_EndTurn();
	}
}