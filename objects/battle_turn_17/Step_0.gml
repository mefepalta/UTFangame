var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer == 10)
	{
		RegularBone(left_box,bottom_box,152,2,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,152,-2,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 50)
	{
		RegularBlaster(-50,320,left_box + 70,top_box - 100,0,270,18,20,3,3,50);
	}
	if (_timer == 70)
	{
		Battle_SetBoardSizeCubic(65,65,165,165);
	}
	if (_timer == 140)
	{
		Battle_SlamDown();
		RegularBlaster(-50,320,left_box + 165,top_box - 150,0,270,2700,20,5,5,50);
	}
	if (_timer == 250)
	{
		RegularBone(left_box + 150,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box + 150,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box - 150,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box - 150,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 270) and (_timer < 841)
	{
		if (_timer % 40 == 0)
		{
			RegularBone(left_box + 150,bottom_box,24,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box + 100,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
			RegularBone(right_box - 150,bottom_box,24,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box - 100,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
		}
	}
	if (_timer == 840)
	{
		Battle_SetBoardSizeCubic(65,65,205,205);
	}
    if (_timer > 840) and (_timer < 1301)
	{
		if (_timer % 40 == 0)
		{
			RegularBone(left_box + 150,bottom_box,44,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box - 150,bottom_box,44,-3,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer > 840) and (_timer < 1301)
	{
		if (_timer % 100 == 0)
		{
			RegularBlaster(320,-50,battle_soul.x,battle_soul.y - 40,270,270,20,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x - 40,battle_soul.y,0,0,20,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x,battle_soul.y + 40,90,90,20,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x + 40,battle_soul.y,180,180,20,1,1,1,50);
		}
	}
	if (_timer == 1450)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
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