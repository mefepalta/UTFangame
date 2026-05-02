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
	if (_timer == 1000)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		Battle_EndTurn();
	}
}