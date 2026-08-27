//==========================================================================
// FINAL PHASE 2. tur -- ayni sey ters yonden -- soldan saga
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
	// Bir onceki turun aynasi: bu sefer soldan geliyorlar.
	if (_timer == 60)  { RegularBone(left_box,top_box,45,3,0,180,0,0,1,0,0,0,0,true); }
	if (_timer == 130) { RegularBone(left_box,bottom_box,45,3,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 200) { RegularBone(left_box,top_box,45,3,0,180,0,0,1,0,0,0,0,true); }
	if (_timer == 270) { RegularBone(left_box,bottom_box,45,3,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 340) { RegularBone(left_box,top_box,45,3,0,180,0,0,1,0,0,0,0,true); }
	if (_timer == 410) { RegularBone(left_box,bottom_box,45,3,0,0,0,0,1,0,0,0,0,true); }

	if (_timer == 600)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He forces a smile.");
		Battle_EndTurn();
	}
}
