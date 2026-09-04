///@desc Menu End
switch(Battle_GetMenuChoiceButton()){
	case BATTLE_MENU_CHOICE_BUTTON.ACT:
		switch(Battle_GetMenuChoiceAction()){
			case 0:
				Dialog_Add("* ESPE - AT 1 DF 1&* He looked like he had a nasty&  smile, as if he were ready.");
				break;
				
			case 1:
				Dialog_Add("* You're taunting at him.&* \"No one can appreciate&  your technology!\"{pause}{clear}* He seems to have&  ignored it.");
				break;
		}
		break;
	
	case BATTLE_MENU_CHOICE_BUTTON.FIGHT:
		if(_phase_pause_state==1){
			_phase_pause_state=0;
			_turn+=1;
		}
		break;
		
	case BATTLE_MENU_CHOICE_BUTTON.MERCY:
		switch(Battle_GetMenuChoiceMercy()){
			case 0:
				if(_phase_pause_state==1){
					_phase_pause_state=2;
				}
				break;
				
			case 1:
				BGM_Stop(5);
				audio_stop_all();
				room_goto(room_reset);
				break;
		}
		break;
}