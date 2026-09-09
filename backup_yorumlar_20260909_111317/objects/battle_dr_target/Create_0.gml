event_inherited();

depth=DEPTH_BATTLE.BULLET_OUTSIDE_LOW;

kind=DR_TARGET.NORMAL;
dir=0;
spd=1.6;

hit_r=12;
reach_r=18;

flash=0;

fade=1;
fade_start=105;
fade_end=58;
inert_at=0.4;

dead=false;
death_time=0;
death_max=14;

cracked=false;
crack_time=0;
crack_max=20;
split=false;
split_time=0;
split_max=42;

piece_off=0;
piece_dy=0;
piece_vy=-2.4;
piece_grav=0.35;
piece_spread=1.8;
piece_rot=0;
piece_rot_spd=4;

piece_ang=[135,45,315,225];

function setup(KIND){
	kind=KIND;
	if(KIND==DR_TARGET.BIG){
		sprite_index=spr_dr_box_large;
		hit_r=24;
		spd=1.2;
	}else if(KIND==DR_TARGET.MIRROR){
		sprite_index=spr_dr_box_mirror;
		hit_r=24;
		spd=1.4;
	}else{
		sprite_index=spr_dr_box;
		hit_r=12;
		spd=1.9;
	}
	reach_r=hit_r*0.7+9;
}

function crack(){
	if(cracked){
		return;
	}
	cracked=true;
	crack_time=crack_max;
	spd=0;
	sprite_index=spr_dr_box_large_cracked;
	audio_play_sound(snd_metalic,0,false);
	Camera_Shake(2,2,2,2);
}

setup(DR_TARGET.NORMAL);
