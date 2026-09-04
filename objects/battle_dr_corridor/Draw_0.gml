if(!instance_exists(battle_board)){
	exit;
}

var SURF=Battle_GetBoardSurface();
if(!surface_exists(SURF)){
	exit;
}

var B_TOP=battle_board.y-battle_board.up;
var B_BOT=battle_board.y+battle_board.down;
var B_L=battle_board.x-battle_board.left;
var B_R=battle_board.x+battle_board.right;

surface_set_target(SURF);

draw_set_alpha(1);

var YY=B_TOP-stripe_gap+scroll_off;
while(YY<B_BOT+stripe_gap){
	draw_set_color(make_color_rgb(58,58,58));
	draw_rectangle(B_L,YY,B_R,YY+stripe_h,false);
	draw_set_color(make_color_rgb(24,24,24));
	draw_rectangle(B_L,YY+stripe_h,B_R,YY+stripe_h+3,false);
	YY+=stripe_gap;
}

var SOUL_ANG=(instance_exists(battle_soul) ? battle_soul.image_angle : 180);
for(var i=0;i<array_length(after_imgs);i++){
	var IMG=after_imgs[i];
	var G=round(255*IMG.a);
	draw_sprite_ext(spr_battle_soul_orange,0,IMG.xx,IMG.yy,1,1,SOUL_ANG,make_color_rgb(G,G,G),1);
}

draw_set_alpha(1);
draw_set_color(c_white);
surface_reset_target();
