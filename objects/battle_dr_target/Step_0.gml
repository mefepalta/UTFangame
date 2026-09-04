if(flash>0){
	flash-=1;
}

if(split){
	split_time-=1;
	piece_off+=piece_spread;
	piece_vy+=piece_grav;
	piece_dy+=piece_vy;
	piece_rot+=piece_rot_spd;
	if(split_time<=0){
		instance_destroy();
	}
	exit;
}

if(cracked){
	crack_time-=1;
	if(crack_time<=0){
		split=true;
		split_time=split_max;
		audio_play_sound(snd_break_0,0,false);
		Camera_Shake(4,4,2,2);
	}
	exit;
}

if(dead){
	death_time-=1;
	if(death_time<=0){
		instance_destroy();
	}
	exit;
}

x+=lengthdir_x(spd,dir);
y+=lengthdir_y(spd,dir);

if(kind==DR_TARGET.MIRROR && instance_exists(battle_soul)){
	var D=point_distance(x,y,battle_soul.x,battle_soul.y);
	fade=clamp((D-fade_end)/(fade_start-fade_end),0,1);
	if(fade<=0){
		instance_destroy();
		exit;
	}
}

if(instance_exists(battle_soul)){
	if(point_distance(x,y,battle_soul.x,battle_soul.y)<=reach_r){
		if(kind==DR_TARGET.MIRROR){
			instance_destroy();
		}else{
			if(global.kr){
				if(!instance_exists(hurtkr)){
					instance_create_depth(0,0,0,hurtkr);
				}
			}else{
				Battle_HurtNormal(DMG_DR_TARGET);
			}
			instance_destroy();
		}
		exit;
	}
}

if(x<-80 || x>room_width+80 || y<-80 || y>room_height+80){
	instance_destroy();
}
