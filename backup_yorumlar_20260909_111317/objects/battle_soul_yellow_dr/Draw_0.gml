var STATE=Battle_GetState();
var MENU=Battle_GetMenu();
var SHOW=(STATE==BATTLE_STATE.IN_TURN || STATE==BATTLE_STATE.TURN_PREPARATION || (STATE==BATTLE_STATE.MENU && MENU!=BATTLE_MENU.FIGHT_AIM && MENU!=BATTLE_MENU.FIGHT_ANIM && MENU!=BATTLE_MENU.FIGHT_DAMAGE));

if(!SHOW){
	exit;
}

var RX=x-lengthdir_x(recoil,aim);
var RY=y-lengthdir_y(recoil,aim);

if(charging && charge>0){
	var F=charge/charge_max;

	if(charge>=charge_max){
		var PS=2.15+0.12*dsin(current_time/2);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprite_index,0,RX,RY,PS,PS,aim,c_white,0.30+0.22*abs(dsin(current_time/3)));
		gpu_set_blendmode(bm_normal);
	}

	var RS=1.5+0.45*F;
	draw_sprite_ext(sprite_index,0,RX,RY,RS,RS,aim,c_white,0.3+0.4*F);
}

for(var i=0;i<array_length(orbs);i++){
	var ORB=orbs[i];
	var OX=RX+lengthdir_x(ORB.dis,ORB.ang);
	var OY=RY+lengthdir_y(ORB.dis,ORB.ang);
	draw_set_alpha(ORB.a);
	draw_set_color(make_color_rgb(255,235,40));
	draw_circle(OX,OY,3.5,false);
	draw_set_color(make_color_rgb(255,255,200));
	draw_circle(OX,OY,1.5,false);
}
draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_ext(sprite_index,image_index,RX,RY,image_xscale,image_yscale,aim,image_blend,image_alpha);
