if(!instance_exists(battle_board)){
	exit;
}

var MUL=1;
if(instance_exists(battle_soul_orange_dr)){
	MUL=battle_soul_orange_dr.world_mul;
}
y+=spd_y*MUL;

if(used){
	pop-=0.1;
	if(pop<=0){
		instance_destroy();
	}
}

if(y-ring_r>room_height || y-ring_r>battle_board.y+battle_board.down+20){
	instance_destroy();
}
