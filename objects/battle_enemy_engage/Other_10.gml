///@desc Init
Battle_SetMenuMercyFleeEnabled(false);

if global.mercy > 99{
	Battle_SetEnemyName(_enemy_slot,"{color `yellow`}* Sans");
	Battle_SetEnemySpareable(_enemy_slot,true);
}else if global.mercy < 100{
	Battle_SetEnemyName(_enemy_slot,"* Sans");
	Battle_SetEnemySpareable(_enemy_slot,false);
}

Battle_SetEnemyActionNumber(_enemy_slot,2);
Battle_SetEnemyActionName(_enemy_slot,0,"* Check");
Battle_SetEnemyActionName(_enemy_slot,1,"* Surrender");

Battle_SetEnemyDEF(_enemy_slot,0);