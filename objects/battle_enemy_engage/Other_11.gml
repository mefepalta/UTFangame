if (room == room_battle)
{
	Battle_SetTurnNumber(1);
	global.surrender_son = false;
	audio_play_sound(snd_chevalier,0,true);
}
if (room == room_battle_1)
{
	Battle_SetState(BATTLE_STATE.TURN_PREPARATION);
	Battle_SetTurnNumber(0);
	//Battle_SetTurnNumber(2);
}
