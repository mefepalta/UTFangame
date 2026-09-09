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
	if (_timer == 70)  { F25Cift(right_box,45,45,-3); }
	if (_timer == 200) { F25Cift(right_box,60,30,-3); }
	if (_timer == 330) { F25Cift(right_box,30,60,-3); }
	if (_timer == 450) { F25Cift(right_box,45,45,-3); }

	if (_timer == 600)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He clutches his scarf.");
		Battle_EndTurn();
	}
}
