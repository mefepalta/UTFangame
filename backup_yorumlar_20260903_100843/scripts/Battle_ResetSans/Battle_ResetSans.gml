// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Battle_ResetSans(){
	Battle_SetSansAction(SANS_ACTION.IDLE)
	with(battle_enemy_engage){
		squish=1.5
	}
}