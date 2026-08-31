///@desc Turn Preparation Start

//Prepare the attack
///@desc Turn Preparation Start
var turn_number = Battle_GetTurnNumber()

// EMNIYET KEMERI -- final phase'de sira asla tur nesnesi olmayan bir
// numaraya kacmasin. battle_turn_21..27 disina cikilirsa hicbir tur
// yaratilmaz ve savas IN_TURN durumunda kilitlenir (battle/Step_0'daki
// otomatik bitis yorum satiri). Menu secimlerinin sayaci kaydirdigi her
// durumda burasi sirayi son uc turun dongusune geri cekiyor.
if (global.p25phase >= 1) and (global.p25phase < 5)
{
	if (turn_number < 21) or (turn_number > 27)
	{
		turn_number = 25;
		Battle_SetTurnNumber(turn_number);
	}
}

//Prepare the attack
if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.FIGHT){
    if (global.go_dodge == "miss") and (global.p25phase != 3){
        Battle_SetTurnNumber(Battle_GetTurnNumber()-1);
        var skip_turn = asset_get_index("battle_skip_turn_0");
        if object_exists(skip_turn)
            instance_create_depth(0, 0, 0, skip_turn);
    } else {
        var turn = asset_get_index(("battle_turn_" + string(turn_number)));
        if object_exists(turn)
            instance_create_depth(0, 0, 0, turn);
    }
}
if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.ACT) or (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.ITEM){
	Battle_SetTurnNumber(Battle_GetTurnNumber()-1);
	var skip_turn = asset_get_index("battle_skip_turn_0")
        if object_exists(skip_turn)
            instance_create_depth(0, 0, 0, skip_turn)
}
if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.MERCY){
    if global.mercy>99{
		//TODO: create some dust effects
		var spared = instance_create_depth(x,y,0,obj_spared);
		spared.sprite_index=spr_spared_enemy;
		spared.image_xscale=2;
		spared.image_yscale=2;
		spared.image_alpha=0.5;
		audio_play_sound(snd_vaporize,0,false);
        instance_destroy();
    }else{
		audio_stop_sound(snd_chevalier);

		// MERCY, ACT/ITEM'den farkli olarak tur numarasini GERI ALMIYOR:
		// battle_skip_turn_1 de bir tur oldugu icin Battle_EndTurn sayaci
		// bir artiriyor ve her merhamet denemesi sirayi ileri kaydiriyor.
		// Final phase'de siranin 27'yi asmasi "battle_turn_28 yok" demek,
		// yani hicbir tur yaratilmiyor ve savas IN_TURN'de kilitleniyordu.
		// SADECE final phase'de telafi ediyoruz -- faz 1'in merhamet akisi
		// (sanstalk / finalstretch diyaloglari) bu sayacin ilerlemesine
		// gore kurulmus, oraya dokunmuyoruz.
		if (global.p25phase >= 1)
		{
			Battle_SetTurnNumber(Battle_GetTurnNumber()-1);
		}

		instance_create_depth(0,0,0,battle_skip_turn_1);
}
}

