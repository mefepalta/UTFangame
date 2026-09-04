if(bounced){
	vy+=grav;
	x+=vx;
	y+=vy;
	ang+=spin;

	if(y-16>room_height || x<-60 || x>room_width+60){
		instance_destroy();
	}
	exit;
}

x+=lengthdir_x(spd,dir);
y+=lengthdir_y(spd,dir);
ang=dir;

life-=1;
if(life<=0){
	instance_destroy();
	exit;
}

var KILL_SELF=false;
with(battle_dr_target){
	if(dead || cracked || fade<inert_at || point_distance(x,y,other.x,other.y)>hit_r){
		continue;
	}
	flash=6;

	if(kind==DR_TARGET.MIRROR){
		other.dir=(other.dir+180) mod 360;
		other.reflected=true;
		other.x+=lengthdir_x(hit_r+6,other.dir);
		other.y+=lengthdir_y(hit_r+6,other.dir);
		audio_play_sound(snd_bell,0,false);
	}else if(kind==DR_TARGET.BIG && !other.big){
		other.bounced=true;
		other.reflected=false;
		other.vx=lengthdir_x(2.4,other.dir+180)+random_range(-1.2,1.2);
		other.vy=-3;
		other.spin=random_range(-7,7);
		audio_play_sound(snd_metalic,0,false);
	}else if(kind==DR_TARGET.BIG){
		crack();
		KILL_SELF=true;
	}else{
		dead=true;
		death_time=death_max;
		audio_play_sound(snd_break_0,0,false);
		if(!other.big){
			KILL_SELF=true;
		}
	}
	break;
}

with(battle_dr_obstacle){
	if(broken || other.bounced){
		continue;
	}
	if(abs(other.y-y)>bar_h/2+6 || other.x<x-half_w || other.x>x+half_w){
		continue;
	}
	if(other.big){
		break_bar(other.x);
		KILL_SELF=true;
	}else{
		other.bounced=true;
		other.reflected=false;
		other.vx=lengthdir_x(2.4,other.dir+180)+random_range(-1.2,1.2);
		other.vy=-3;
		other.spin=random_range(-7,7);
		audio_play_sound(snd_metalic,0,false);
	}
	break;
}
if(KILL_SELF){
	instance_destroy();
	exit;
}

if(reflected && instance_exists(battle_soul)){
	if(point_distance(x,y,battle_soul.x,battle_soul.y)<=10){
		if(global.kr){
			if(!instance_exists(hurtkr)){
				instance_create_depth(0,0,0,hurtkr);
			}
		}else{
			Battle_HurtNormal(DMG_DR_REFLECT);
		}
		instance_destroy();
		exit;
	}
}

if(x<-60 || x>room_width+60 || y<-60 || y>room_height+60){
	instance_destroy();
}
