// Arka plan solmasi: MERCY'E BASILDIGI ANDAN itibaren, _timer'dan bagimsiz.
// (_timer ancak Sans'in repligi bitince islemeye basliyor; oysa arka planin
// konusma boyunca da solmasi isteniyor.)
SapBgAdim();

var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

// FINAL PHASE: MERCY turunda faz 1-2 atagi oynamamali. Balon kapaninca
// tur bitiyor; Sans belgedeki gibi sadece "..." diyor.
if (global.p25phase >= 1)
{
	if (_timer == 2) { Battle_SetSoul(battle_soul_red); }
	if (_timer > 5) and (!instance_exists(battle_dialog_enemy)) { Battle_EndTurn(); }
	exit;
}

if (_timer == 5) and (global.sanstalk <= 22)
{
	Battle_SetSoul(battle_soul_red)
}
// MERHAMET CEZASI: eskiden asagidan tek bir kemik duvari geliyordu
// (RegularBoneWall(DIR.DOWN,200,18,152,...)); 5 karelik uyariyla ve
// sonsuz omurle zaten kacinilmazdi. Yerine konsept gif'indeki mizrak
// saplamasi geldi: mizrak beliriyor, yukari cekiliyor, gerilip iniyor ve
// TEK DARBEDE olduruyor (bkz. Create_0'daki SapBasla / SapAdim / SapVur).
if (_timer == SAP_KUTU) and (global.sanstalk <= 22)
{
	SapBasla();
}
if (sap_on)
{
	if (_timer == SAP_SAVUR) { SapSavur(); }			/// A f17 savurma
	if (_timer == SAP_BIRAK) { SapBirak(); }			/// A f18 birakma
	if (_timer == SAP_BAS)   { SapOtur(); }			/// A f30 oturma
	if (_timer == SAP_CEK)   { audio_play_sound(snd_swift,3,false); }	/// B f7
	if (_timer == SAP_UST)   { audio_play_sound(snd_pullback,3,false); }	/// B f8
	// B f20: darbe tek karede iniyor. Ses ve sarsinti hemen, OLUM ise
	// SAP_OLUM'da: oyuncunun inen mizragi gormesi gerekiyor.
	if (_timer == SAP_VUR)   { audio_play_sound(snd_slice,3,false); SapCarp(); }
	if (_timer == SAP_OLUM)  { SapVur(); }
	if (_timer == SAP_BITIS) { Battle_EndTurn(); }
}
SapAdim(_timer);
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