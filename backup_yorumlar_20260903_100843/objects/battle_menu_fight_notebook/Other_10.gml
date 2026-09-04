///@desc Anim
if(Battle_GetMenuFightDamage()>=0){
	var ENEMY=Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());
	var X=Battle_GetEnemyCenterPosX(ENEMY);
	var Y=Battle_GetEnemyCenterPosY(ENEMY);
	var book = instance_create_depth(X,Y,0,battle_menu_fight_anim_book);
	if _perfect && _perfect2 {
		book.image_blend=c_yellow;
		audio_play_sound(snd_perfecthit,0,0);
	}
}