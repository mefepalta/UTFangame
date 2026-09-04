// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function S_SlamUp(){
	Battle_SetSoul(battle_soul_blue);
battle_soul.dir=DIR.UP;
battle_soul_blue.impact=true;
battle_soul_blue._gravity_fall=1.2;

}