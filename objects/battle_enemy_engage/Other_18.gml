
if (global.p1sanshp) and (room == room_battle) { exit; }

// ---- TUR BASI NORMALIZASYONU (her tur, her zorluk) ----
// Sans'in gorunurlugu ~12 degiskene yayilmis; sahneler bunlari sifirlayip geri
// acmayi ya ayni sahnenin ilerisine ya da bir sonraki turun Other_10'una
// birakiyor. Zorluk _timer ziplamasi, erken tur sonu ya da eksik bir Other_10
// bu cifti bozunca Sans KALICI gorunmez kaliyordu (faz 2 gorunmez tahta,
// EASY'de sahne disi Sans, turn_28'in p2_state'i geri almamasi...).
// Bu olay (TURN_PREPARATION_START) turun kendi Other_10'undan ONCE calisir:
// kasitli pozlar (turn_0 monolog gizlemesi, turn_16-19 Sans'in cikip girmesi)
// Other_10'da bunun ustune yazar. Faz 1 alfalari kasten disarida (yorgun poz
// ve mevcut tur Other_10'lari onu yonetiyor).
with (battle_board) { visible = true; alpha_bg = 1; }
if (instance_exists(battle_soul)) { battle_soul.visible = true; }
if (room == room_battle_1) and (global.p25phase == 0)
{
	p2_state        = 2;
	p2_head_alpha   = 1; p2_body_alpha     = 1; p2_cape_alpha   = 1;
	p2_legs_alpha   = 1; p2_armleft_alpha  = 1; p2_armright_alpha = 1;
	p2_thingy_alpha = 1;
}

var turn_number = Battle_GetTurnNumber()

global.surrender_turn = false;

if (global.p25phase >= 1) and (global.p25phase < 5)
{
	// Final faz turlari 21..27 (PDF "Final phase" Turn 1..7 ile birebir).
	// HARD'da tur 20 bitince numara zaten 21 oluyor ve buraya hic girilmiyor.
	// NORMAL/EASY tur listesini kisalttigi icin numara 21'in altinda kaliyor
	// ve burasi devreye giriyor. Eskiden 25'e zorlaniyordu: Turn 1-4'un
	// repligi ("Th-... that's right...", "Is that the best you got?",
	// "You're afraid to die...", "That Determination of yours...") HARD
	// disinda HIC gosterilmiyordu. Giris ilk tur olmali.
	// turn_27 kendi icinde 24'e cekip 25-26-27'yi donguye sokuyor, o ayri.
	if (turn_number < 21) or (turn_number > 27)
	{
		turn_number = 21;
		Battle_SetTurnNumber(turn_number);
	}
}

if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.FIGHT){
    if (global.go_dodge == "miss") and (global.p25phase != 3){
        Battle_SetTurnNumber(Battle_GetTurnNumber()-1);
        var skip_turn = asset_get_index("battle_skip_turn_0");
        if object_exists(skip_turn)
            instance_create_depth(0, 0, 0, skip_turn);
    } else {
        var turn = asset_get_index(("battle_turn_" + string(Difficulty_MapTurn(turn_number))));
        if object_exists(turn)
            instance_create_depth(0, 0, 0, turn);
    }
}
if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.ACT) or (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.ITEM){
	Battle_SetTurnNumber(Battle_GetTurnNumber()-1);

	var _tur = noone;
	if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.ACT)
	and (Battle_GetMenuChoiceAction() == 1)
	and (room == room_battle) and (global.p25phase == 0)
	{
		_tur = Surrender_Atak();
		if (_tur != noone) { global.surrender_turn = true; }
	}
	if (_tur == noone) { _tur = asset_get_index("battle_skip_turn_0"); }
	if object_exists(_tur)
		instance_create_depth(0, 0, 0, _tur);
}
if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.MERCY){
    if global.mercy>99{
		var spared = instance_create_depth(x,y,0,obj_spared);
		spared.sprite_index=spr_spared_enemy;
		spared.image_xscale=2;
		spared.image_yscale=2;
		spared.image_alpha=0.5;
		audio_play_sound(snd_vaporize,0,false);
        instance_destroy();
    }else{
		audio_stop_sound(snd_chevalier);

		if (global.p25phase >= 1) or (room == room_battle_1)
		{
			Battle_SetTurnNumber(Battle_GetTurnNumber()-1);
		}

		instance_create_depth(0,0,0,battle_skip_turn_1);
}
}

Battle_SetEnemyActionNumber(_enemy_slot,Surrender_ActSayisi());
