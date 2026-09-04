//==========================================================================
// FINAL PHASE 3. tur -- uc yavas gaster blaster -- aralari genis
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
	// Blaster'lar nisan aldiklari yere GELIRKEN goruluyor: son argüman
	// 40, yani ucus 40 kare suruyor ve kacacak bol vakit kaliyor.
	// Aralarinda 3 saniyeden fazla bosluk var.
	if (_timer == 60)  { RegularBlaster(0,0,left_box-50,battle_soul.y,0,0,18,20,2,2,40); }
	if (_timer == 250) { RegularBlaster(0,0,battle_soul.x,top_box-80,0,270,18,20,2,2,40); }
	if (_timer == 440) { RegularBlaster(0,0,right_box+50,battle_soul.y,0,180,18,20,2,2,40); }

	if (_timer == 600)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* 1 left.");
		Battle_EndTurn();
	}
}
