//==========================================================================
// FINAL PHASE 7. tur -- gucu tukenmis: sadece uc kemik, cok yavas
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
	// Son tur: gucu bitmis. Uc kemik, hiz 2 -- neredeyse yuruyerek
	// gecilecek kadar yavas.
	if (_timer == 80)  { RegularBone(right_box,bottom_box,40,-2,0,0,0,0,1,0,0,0,0,true); }
	if (_timer == 220) { RegularBone(right_box,top_box,40,-2,0,180,0,0,1,0,0,0,0,true); }
	if (_timer == 360) { RegularBone(right_box,bottom_box,40,-2,0,0,0,0,1,0,0,0,0,true); }

	if (_timer == 480)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* 1 left.");

		// Belgedeki Final Phase yedi turluk; buradan sonrasi (iskalama,
		// son vurus ve olum diyalogu) tur degil, Sans'in gercekten
		// olmesine bagli. O baglanana kadar burada TAKILMAMAK icin
		// son uc tur donguye aliniyor: sira 24'e cekiliyor, Battle_EndTurn
		// bir artirinca sonraki tur yine 25 oluyor (25 -> 26 -> 27 -> 25...).
		//
		// Bu satir olmasaydi 28. tur nesnesi bulunamayacagi icin
		// battle_enemy_engage/Other_18 hicbir sey yaratmaz, battle/Step_0
		// icindeki otomatik bitis de yorum satiri oldugu icin savas
		// IN_TURN durumunda kilitlenirdi.
		Battle_SetTurnNumber(24);
		Battle_EndTurn();
	}
}
