function MakeSpearRight(y_spr){
	spear=instance_create_depth(battle_board._frame_right_x+50,y_spr,0,spearRight);
	spear.y=y_spr;
	spear.direction=180;
}