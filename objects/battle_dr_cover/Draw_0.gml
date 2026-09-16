if(!instance_exists(battle_board) || alpha<=0){
	exit;
}

var SURF=Battle_GetBoardSurface();
if(!surface_exists(SURF)){
	exit;
}

var H=min(battle_board.left,battle_board.right,battle_board.up,battle_board.down);
var SC=1;
if(H<ring_r+ring_pad){
	SC=max(0.1,(H-ring_pad)/ring_r);
}

surface_set_target(SURF);
draw_sprite_ext(spr_dr_cover_ring,0,battle_board.x,battle_board.y,SC,SC,0,c_white,alpha);
draw_set_alpha(1);
draw_set_color(c_white);
surface_reset_target();
