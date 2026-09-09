function Item_CallEvent() {
	var ITEM=argument[0];
	var EVENT=argument[1];
	var SLOT=-1;
	if(argument_count>=3){
		SLOT=argument[2];
	}

	if(variable_global_exists("no_heal") && global.no_heal && (room==room_battle || room==room_battle_1)){
		return false;
	}

	if(EVENT==ITEM_EVENT.USE && Difficulty_Easy() && Item_IsValid(ITEM)){
		var _old = Player_GetHp();
		Player_SetHp(Player_GetHpMax());
		audio_play_sound(snd_item_heal,0,false);

		Dialog_Add("* You ate the MaxHeal.");
		Dialog_Add("* Mefe Gods blessed you.{sleep 20}&* You recovered your whole HP!");

		if(variable_global_exists("p2_revived_pap") && global.p2_revived_pap){
			Dialog_Add("* ...just kidding!");
			global.easy_heal_kid = max(1,_old-10);
		}

		Dialog_Start();
		global.checkornot = true;
		Item_Remove(SLOT);
		return true;
	}

	if(Item_IsValid(ITEM)&&(Item_IsSlotValid(SLOT)||SLOT==-1)){
		var INST=instance_create_depth(0,0,0,ITEM);
		INST._item_slot=SLOT;
		with(INST){
			event_user(EVENT);
		}
		return true;
	}else{
		return false;
	}


}
