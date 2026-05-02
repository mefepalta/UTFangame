///@desc Turn Preparation Start

//Prepare the attack
///@desc Turn Preparation Start
var turn_number = Battle_GetTurnNumber()
//Prepare the attack
if (Battle_GetMenuChoiceButton() == BATTLE_MENU_CHOICE_BUTTON.FIGHT){
	//Battle_SetTurnNumber(Battle_GetTurnNumber()+1);
        var turn = asset_get_index(("battle_turn_" + string(turn_number)))
        if object_exists(turn)
            instance_create_depth(0, 0, 0, turn)
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
		instance_create_depth(0,0,0,battle_skip_turn_1);
}
}

