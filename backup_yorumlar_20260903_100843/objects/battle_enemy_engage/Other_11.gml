/// @description Battle Start
if (room == room_battle)
{
	// Faz 1 BIRINCI turdan basliyor. Bir ara test icin 20 yazilmisti ve
	// oyle commit'lenmis (bkz. Update 1.6 -> 1.7); dovus dogrudan son
	// atakla basliyordu.
	Battle_SetTurnNumber(1);
	global.surrender_son = false;
	audio_play_sound(snd_chevalier,0,true);
	//Battle_SetState(BATTLE_STATE.TURN_PREPARATION);
	//Battle_SetTurnNumber(0);
}
if (room == room_battle_1)
{
	// Faz 2 SIFIRINCI turdan basliyor: battle_turn_0 fazin giris turu ve
	// fazin muzigini (snd_p2theme) o baslatiyor, acilis repligi de orada.
	// Test icin dogrudan bir atagi denemek istersen alttaki satiri ac --
	// ama o zaman giris turu atlandigi icin MUZIK CALMAZ.
	Battle_SetState(BATTLE_STATE.TURN_PREPARATION);
	Battle_SetTurnNumber(0);
	//Battle_SetTurnNumber(20);	/// TEST: dogrudan 20. atak
}
/*if (global.no_heal == false)
{
	for (var i = 0; i < 8; i++)
	{
	    Item_Remove(items[i]);
	    Item_Add(items[i]);
	}
}*/
