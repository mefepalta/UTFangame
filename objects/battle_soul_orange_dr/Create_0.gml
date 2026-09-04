event_inherited();

moveable=true;

image_angle=180;

charging=false;
charge=0;
charge_max=40;
orb_timer=0;
orbs=[];

tap_cd=0;
tap_cd_max=24;


dash_time=0;
dash_max=45;
dash_dir=90;
dash_scale=1;
dash_off_y=6;
dash_alpha_max=0.72;
dash_fade_in=0.12;
dash_fade_from=0.7;

function fire_dash(SC){
	dash_scale=SC;
	dash_time=dash_max;
}

strike_time=0;

strike_ring_ac=false;
strike_ring=false;
strike_max=12;
chain_time=26;
strike_dur=12;
strike_pow=0;
strike_rad=0;

speed_boost=0;
speed_boost_dur=45;
speed_boost_tap=0.45;

airborne=false;
jump_t=0;
jump_dist=260;
jump_grace=0.12;
jump_land_from=0.55;
jump_chain=0;
jump_scale=1;
jump_scale_max=0.9;

jump_buffer=0;
jump_buffer_max=18;

function find_ring(){
	var RES=noone;
	with(battle_dr_jumpring){
		if(!used && abs(x-other.x)<=hit_x && abs(y-other.y)<=hit_y){
			RES=id;
		}
	}
	return RES;
}

function start_jump(RING){
	RING.used=true;
	airborne=true;
	jump_t=0;
	jump_chain=1;
	jump_buffer=0;
	fire_dash(1.3);
	audio_play_sound(snd_bell,0,false);

	strike_pow=2;
	strike_rad=78;
	strike_time=chain_time;
	strike_dur=chain_time;
}

speed_mul=1.8;
jump_chain_max=10;
jump_mul_max=2.4;
jump_mul_cur=1;
world_mul=1;

function do_strike(POW){
	strike_pow=POW;
	strike_time=strike_max;
	strike_dur=strike_max;
	strike_ring=strike_ring_ac;
	strike_rad=(POW==2 ? 78 : 52);

	if(POW==2){
		fire_dash(1.15);
		audio_play_sound(snd_punchstrong,0,false);
		Camera_Shake(3,3,4,4);
		speed_boost=max(speed_boost,1);

		var RING=find_ring();
		if(RING!=noone){
			start_jump(RING);
		}else{
			jump_buffer=jump_buffer_max;
		}
	}else{
		audio_play_sound(snd_punchweak,0,false);
		tap_cd=tap_cd_max;
		speed_boost=max(speed_boost,speed_boost_tap);
	}
}

instance_create_depth(x,y,0,battle_soul_orange_effect);
