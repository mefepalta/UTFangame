function Papyrus_SlamLeft(){
global.enemystate="slam_left";
battle_enemy_engage.slam_timer=0;
battle_enemy_engage.can_go=false;
Battle_SetSoul(battle_soul_blue);
battle_soul.dir=DIR.LEFT;
battle_soul_blue.impact=true;
battle_soul_blue._gravity_fall=1.2;
}