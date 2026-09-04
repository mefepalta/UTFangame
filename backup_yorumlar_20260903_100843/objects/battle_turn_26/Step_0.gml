//==========================================================================
// FINAL PHASE 6. tur -- iki yandan birer kemik + tek blaster
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
	// Iki yandan ayni anda ama farkli yuksekliklerde: arada durulacak
	// yer hep var.
	if (_timer == 70)
	{
		RegularBone(right_box,bottom_box,45,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,45,3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 230)
	{
		RegularBone(right_box,top_box,45,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box,45,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 390) { RegularBlaster(0,0,battle_soul.x,top_box-80,0,270,18,20,2,2,40); }

	if (_timer == 540)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He forces a smile.");
		Battle_EndTurn();
	}
}
