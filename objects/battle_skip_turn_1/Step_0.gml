var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (_timer == 5) and (global.sanstalk <= 22)
{
	Battle_SetSoul(battle_soul_red)
}
if (_timer == 5) and (global.sanstalk <= 22)
{
	RegularBoneWall(DIR.DOWN,200,18,152,230,bottom_box,5,999999999999999,0,false);
}
if (_timer == 5) and (global.sanstalk == 23) and (global.finalstretch == 8)
{
	with (o_p1final_screendark)
	{
		yesorno = true;
	}
}
if (_timer == 40) and (global.finalstretch < 8) and (global.sanstalk == 23)
{
	Battle_EndTurn()
}