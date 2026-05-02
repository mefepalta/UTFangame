function MakeSpearBottom(x_spr){
	spear=instance_create_depth(x_spr,battle_board._frame_down_y+50,0,spearDown);
	spear.x=x_spr;
	spear.direction=90;
}