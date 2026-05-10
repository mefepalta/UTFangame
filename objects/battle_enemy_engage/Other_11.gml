/// @description Battle Start
if (room == room_battle)
{
	Battle_SetTurnNumber(1);
	audio_play_sound(snd_chevalier,0,true);
	//Battle_SetState(BATTLE_STATE.TURN_PREPARATION);
	//Battle_SetTurnNumber(0);
}
if (room == room_battle_1)
{
	/*Battle_SetState(BATTLE_STATE.TURN_PREPARATION);
	Battle_SetTurnNumber(0);*/
	Battle_SetTurnNumber(5);
}
if (global.no_heal == false)
{
	for (var i = 0; i < 8; i++)
	{
	    Item_Remove(items[i]);
	    Item_Add(items[i]);
	}
}
