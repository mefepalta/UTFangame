function SlamDown(){
	battle_enemy_engage.slam_timer=0;
	Battle_SetSoul(battle_soul_blue);
	battle_soul.dir=DIR.DOWN;
	battle_soul_blue.impact=true;
	battle_soul_blue._gravity_fall=1.2
	
}