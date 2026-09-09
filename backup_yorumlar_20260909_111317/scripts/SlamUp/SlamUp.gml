function SlamUp(){
	global.enemystate="slam_up";
	battle_enemy_engage.slam_timer=0;
	battle_enemy_engage._body_image=0
	Battle_SetSoul(battle_soul_blue);
	battle_soul.dir=DIR.UP;
	battle_soul_blue.impact=true;
	battle_soul_blue._gravity_fall=1.2
	var SANS = battle_enemy_engage
	with (SANS)
	{
		action = 4
	    _action_step = 0
	}
	
}