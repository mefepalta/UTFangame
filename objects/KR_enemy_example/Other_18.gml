///@desc Turn Preparation Start
if(_phase_pause_state==0){
	if(_turn==0){
		Battle_SetTurnPreparationAutoEnd(false);
		alarm[1]=30;
	}
	
	if(_turn==10){
		BGM_Stop(5);
		Battle_SetSoul(battle_soul_red);
		var inst=instance_create_depth(x+100,y-120,0,battle_dialog_enemy);
		inst.text="{font FONT.SANS}{voice VOICE.SANS}{face_link 0}{face_emotion 5}i know that no one&is born to be evil.{pause}{clear}{face_emotion 4}everyone has even a&little pity.{pause}{clear}{face_link 1}{face_emotion 1}{face_link 0}{face_emotion 6}pal, let go of all this&and work with me to&fix those painful&loopholes.{pause}{clear}{face_emotion 5}after all, {sleep 20}it's faster&than I do alone.{pause}{face_link 1}{face_emotion 0}{face_link 0}{face_emotion 0}{end}";
		inst.template=0;
		SetSansAction(SANS_ACTION.STATIC);
		Battle_SetTurnInfo(BATTLE_TURN.TIME,30);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_UP,BATTLE_BOARD.UP);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,100);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,100);
		Battle_SetEnemySpareable(_enemy_slot,true);
		_phase_pause_state=1;
	}else{
		if(_turn<ds_list_size(_list_turn)){
			instance_create_depth(0,0,0,_list_turn[|_turn]);
		}
	}
}else if(_phase_pause_state==2){
	var inst=instance_create_depth(x+100,y-120,0,battle_dialog_enemy);
	inst.text="{font FONT.SANS}{voice VOICE.SANS}{face_link 0}{face_emotion 5}wow, {sleep 20}you really do that.{pause}{clear}{face_emotion 4}but, {sleep 20}everything you've done&can't be undone...{pause}{clear}{face_link 1}{face_emotion 1}{face_link 0}{face_emotion 6}{end}";
	inst.template=0;
	instance_create_depth(0,0,0,battle_turn_spared);
}