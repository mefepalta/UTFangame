///@desc Anim
if(Battle_GetMenuFightDamage()>=0){
	instance_create_depth(battle_enemy_engage.x,battle_enemy_engage.y-100,0,battle_menu_fight_anim_knife);
}