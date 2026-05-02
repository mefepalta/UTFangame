if(y>ystart){
	gravity=0;
	vspeed=0;
	y=ystart;
}

/*if global.go_dodge="miss"{
	dmg_sprite=spr_battle_damage_miss;
}*/
if global.go_dodge="block"{
	dmg_sprite=spr_blocked_damage;
}