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
		RegularBone(left_box,top_box,81,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,top_box,81,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,81,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,81,-4,0,0,0,0,1,0,0,0,0,true);
	}
    if (_timer == 50)
	{
		RegularBone(left_box,bottom_box,81,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,81,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,81,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,top_box,81,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		Battle_SetSoul(battle_soul_blue);
	}
	if (_timer == 100)
	{
		RegularBone(left_box,top_box,122,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,top_box,122,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,122,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,top_box,122,-4,0,180,0,0,1,0,0,0,0,true);
	}
    if (_timer == 130)
	{
		RegularBone(left_box,bottom_box,72,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,72,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,72,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,72,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		Battle_SlamUp();
		RegularBoneWall(DIR.UP,290,24,75,left_box,bottom_box,50,90,0,false);
	}
	if (_timer == 220)
	{
		Battle_SetSoul(battle_soul_red);
		RegularBone(left_box,bottom_box,72,4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,72,4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,72,-4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,72,-4,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 230)
	{
		RegularBlaster(320,-50,317,top_box-100,270,270,20,1,2,2,50);
	}
	if (_timer == 310)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
		RegularBoneWall(DIR.UP,290,24,60,left_box,bottom_box,50,90,0,false);
		RegularBoneWall(DIR.DOWN,290,24,60,left_box,bottom_box,50,90,0,false);
		RegularBoneWall(DIR.LEFT,130,11,60,left_box,top_box,50,90,0,false);
		RegularBoneWall(DIR.RIGHT,130,11,60,left_box,top_box,50,90,0,false);
	}
	if (_timer == 450)
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