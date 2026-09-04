if (instance_exists(battle_turn)) {
	image_alpha -= 0.025
	if (image_alpha <= 0)
		instance_destroy()
}else if (!instance_exists(battle_turn)) {
	instance_destroy()
}
if(battle_soul_blue_orange.dir==DIR.DOWN){
	image_angle=0;
}else if(battle_soul_blue_orange.dir==DIR.UP){
	image_angle=180;
}else if(battle_soul_blue_orange.dir==DIR.LEFT){
	image_angle=-90;
}else if(battle_soul_blue_orange.dir==DIR.RIGHT){
	image_angle=90;
}