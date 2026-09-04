SapBgAdim();

var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

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
if (_timer == SAP_KUTU) and (global.sanstalk <= 22)
{
	SapBasla();
}
if (sap_on)
{
	if (_timer == SAP_SAVUR) { SapSavur(); }
	if (_timer == SAP_BIRAK) { SapBirak(); }
	if (_timer == SAP_BAS)   { SapOtur(); }
	if (_timer == SAP_CEK)   { audio_play_sound(snd_swift,3,false); }
	if (_timer == SAP_UST)   { audio_play_sound(snd_pullback,3,false); }
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