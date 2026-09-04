var STATE=Battle_GetState();
var MENU=Battle_GetMenu();
var SHOW=(STATE==BATTLE_STATE.IN_TURN || STATE==BATTLE_STATE.TURN_PREPARATION || (STATE==BATTLE_STATE.MENU && MENU!=BATTLE_MENU.FIGHT_AIM && MENU!=BATTLE_MENU.FIGHT_ANIM && MENU!=BATTLE_MENU.FIGHT_DAMAGE));

if(SHOW){
	if(airborne){
		var SW=10/jump_scale;
		draw_set_alpha(1);
		draw_set_color(make_color_rgb(45,45,45));
		draw_ellipse(x-SW,y+9-SW*0.35,x+SW,y+9+SW*0.35,false);
		draw_set_color(c_white);
	}

	if(dash_time>0){
		var DT=1-(dash_time/dash_max);
		var DFR=clamp(floor(DT*3),0,2);
		var DAL=dash_alpha_max;
		if(DT<dash_fade_in){
			DAL*=DT/dash_fade_in;
		}else if(DT>dash_fade_from){
			DAL*=1-(DT-dash_fade_from)/(1-dash_fade_from);
		}
		draw_sprite_ext(spr_dr_dash,DFR,x,y+dash_off_y,dash_scale,dash_scale,dash_dir,c_white,DAL);
	}

	if(strike_time>0 && strike_ring){
		var T=1-(strike_time/max(1,strike_dur));
		draw_set_color(strike_pow==2 ? make_color_rgb(255,190,70) : make_color_rgb(255,140,30));
		draw_set_alpha(1-T);
		draw_circle(x,y,strike_rad*T,true);
		draw_circle(x,y,max(0,strike_rad*T-2),true);
		draw_set_alpha(1);
	}

	if(charging && charge>0){
		var F=charge/charge_max;

		if(charge>=charge_max){
			var PS=2.15+0.12*dsin(current_time/2);
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(spr_battle_soul_orange,0,x,y,PS,PS,image_angle,c_white,0.30+0.22*abs(dsin(current_time/3)));
			gpu_set_blendmode(bm_normal);
		}

		var RS=1.5+0.45*F;
		draw_sprite_ext(spr_battle_soul_orange,0,x,y,RS,RS,image_angle,c_white,0.3+0.4*F);
	}

	for(var i=0;i<array_length(orbs);i++){
		var ORB=orbs[i];
		var OX=x+lengthdir_x(ORB.dis,ORB.ang);
		var OY=y+lengthdir_y(ORB.dis,ORB.ang);
		draw_set_alpha(ORB.a);
		draw_set_color(make_color_rgb(255,150,35));
		draw_circle(OX,OY,3.5,false);
		draw_set_color(make_color_rgb(255,225,150));
		draw_circle(OX,OY,1.5,false);
	}
	draw_set_alpha(1);
	draw_set_color(c_white);
}

if(SHOW && jump_scale!=1){
	draw_sprite_ext(sprite_index,image_index,x,y,jump_scale,jump_scale,image_angle,image_blend,image_alpha);
}else{
	event_inherited();
}
