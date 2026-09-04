//==========================================================================
// FINAL PHASE 5. tur -- alcak/yuksek donusumlu kemikler
//==========================================================================
var left_box   = (battle_board.x-battle_board.left)-5;
var right_box  = (battle_board.x+battle_board.right)+5;
var top_box    = (battle_board.y-battle_board.up)+2;
var bottom_box = (battle_board.y+battle_board.down)-2;

if (room == room_battle_1)
{
	// FINAL PHASE olum sahnesi: Sans yenildiyse bu tur atak yapmiyor,
	// onun yerine son sozlerini / vedasini soyluyor (bkz. scripts/P25).
	if (global.p25phase >= 3)
	{
		if (P25Sahne()) { Battle_EndTurn(); }
		exit;
	}
	// Boylari donusumlu: kisa olanin ustunden, uzun olanin yanindan
	// gecmek gerekiyor. Hiz yine 3.
	if (_timer == 70)  { RegularBone(right_box,bottom_box,30,-3,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 150) { RegularBone(right_box,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 230) { RegularBone(right_box,bottom_box,30,-3,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 310) { RegularBone(right_box,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 390) { RegularBone(right_box,bottom_box,30,-3,0,0,0,0,1,0,0,0,0,true); }

	if (_timer == 540)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He's weak.");
		Battle_EndTurn();
	}
}
