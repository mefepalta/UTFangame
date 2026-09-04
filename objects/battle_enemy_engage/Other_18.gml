
if (global.p1sanshp) and (room == room_battle) { exit; }

var turn_number = Battle_GetTurnNumber()

global.surrender_turn = false;

if (global.p25phase >= 1) and (global.p25phase < 5)
{
	if (turn_number < 21) or (turn_number > 27)
	{
		turn_number = 25;
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
        var turn = asset_get_index(("battle_turn_" + string(turn_number)));
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

		if (global.p25phase >= 1)
		{
			Battle_SetTurnNumber(Battle_GetTurnNumber()-1);
		}

		instance_create_depth(0,0,0,battle_skip_turn_1);
}
}

Battle_SetEnemyActionNumber(_enemy_slot,Surrender_ActSayisi());
