var left_box   = (battle_board.x-battle_board.left)-5;
var right_box  = (battle_board.x+battle_board.right)+5;
var top_box    = (battle_board.y-battle_board.up)+2;
var bottom_box = (battle_board.y+battle_board.down)-2;

if (room == room_battle_1)
{
	if (global.p25phase >= 3)
	{
		if (P25Sahne()) { Battle_EndTurn(); }
		exit;
	}
	if (_timer == 80)  { RegularBone(right_box,bottom_box,40,-2,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 220) { RegularBone(right_box,top_box,40,-2,0,180,0,0,1,0,0,0,0,true); }
	if (_timer == 360) { RegularBone(right_box,bottom_box,40,-2,0,0,0,0,1,0,0,0,0,true); }

	if (_timer == 480)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* 1 left.");

		Battle_SetTurnNumber(24);
		Battle_EndTurn();
	}
}
