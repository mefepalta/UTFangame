function MakeSpearLeft(y_spr){
	spear=instance_create_depth(battle_board._frame_left_x-50,y_spr,0,spearLeft);
	spear.y=y_spr;
	spear.direction=0;
}