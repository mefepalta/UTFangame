function MakeSpearTop(x_spr){
	spear=instance_create_depth(x_spr,battle_board._frame_up_y-50,0,spearTop);
	spear.x=x_spr;
	spear.direction=270;
}