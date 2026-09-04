event_inherited();

var STATE=Battle_GetState();
var ACTIVE=(STATE==BATTLE_STATE.IN_TURN && moveable);

if(ACTIVE){
	var SPD=Player_GetSpdTotal();
	SPD=(Input_IsHeld(INPUT.CANCEL) ? SPD/2 : SPD);
	repeat(SPD*10){
		if(Input_IsHeld(INPUT.LEFT)){
			if(!position_meeting(x-sprite_width/2,y,block)){
				x-=0.1;
			}
		}
		if(Input_IsHeld(INPUT.RIGHT)){
			if(!position_meeting(x+sprite_width/2,y,block)){
				x+=0.1;
			}
		}
	}
}

if(tap_cd>0){
	tap_cd-=1;
}
if(strike_time>0){
	strike_time-=1;
}
if(dash_time>0){
	dash_time-=1;
}

if(speed_boost>0){
	speed_boost=max(0,speed_boost-1/speed_boost_dur);
}

if(ACTIVE && !airborne){
	if(Input_IsPressed(INPUT.CONFIRM) && tap_cd<=0){
		do_strike(1);
	}

	if(Input_IsHeld(INPUT.CONFIRM)){
		charging=true;
		if(charge<charge_max){
			charge+=1;
			if(charge==charge_max){
				audio_play_sound(snd_ding,0,false);
			}
		}

		if(charge<charge_max){
			orb_timer-=1;
			if(orb_timer<=0){
				orb_timer=3;
				array_push(orbs,{
					ang:irandom(359),
					dis:34+irandom(14),
					a:0,
					spd:1.6+random(1.2)
				});
			}
		}
	}else if(charging){
		if(charge>=charge_max){
			do_strike(2);
		}
		charging=false;
		charge=0;
		orbs=[];
	}
}else{
	charging=false;
	charge=0;
	orbs=[];
}

if(strike_time>0){
	with(battle_dr_obstacle){
		if(!broken && abs(y-other.y)<=other.strike_rad){
			break_bar(other.x);
			if(broken && other.strike_pow==2){
				other.strike_time=other.chain_time;
				other.strike_dur=other.chain_time;
				other.strike_ring=false;
				other.speed_boost=max(other.speed_boost,1);
				other.dash_time=other.dash_max;
				other.dash_scale=1.15;

			}
		}
	}
}

if(ACTIVE && !airborne && strike_time>0 && strike_pow==2){
	var RING=find_ring();
	if(RING!=noone){
		start_jump(RING);
	}
}

var W_SPD=5;
if(instance_exists(battle_dr_corridor)){
	W_SPD=battle_dr_corridor.scroll_spd;
}

if(!airborne && jump_buffer>0){
	jump_buffer-=1;
	var RING=find_ring();
	if(RING!=noone){
		start_jump(RING);
	}
}

if(airborne){
	jump_t+=W_SPD/jump_dist;

	if(jump_t>=jump_land_from){
		var RING=find_ring();
		if(RING!=noone){
			RING.used=true;
			jump_t=0;
			jump_chain+=1;
			audio_play_sound(snd_bell,0,false);

			strike_pow=2;
			strike_rad=78;
			strike_time=chain_time;
			strike_dur=chain_time;
		}
	}

	if(jump_t>=1+jump_grace){
		airborne=false;
		jump_t=0;
		jump_chain=0;
		audio_play_sound(snd_impact,0,false);
	}
}

jump_scale=airborne ? 1+jump_scale_max*dsin(clamp(jump_t,0,1)*180) : 1;

var JM_TARGET=1;
if(airborne){
	var CH=min(jump_chain,jump_chain_max);
	JM_TARGET=1+(jump_mul_max-1)*(CH/jump_chain_max);
}
jump_mul_cur=lerp(jump_mul_cur,JM_TARGET,0.08);
world_mul=(1+(speed_mul-1)*speed_boost)*jump_mul_cur;

for(var i=array_length(orbs)-1;i>=0;i--){
	var ORB=orbs[i];
	ORB.dis-=ORB.spd;
	ORB.a=min(1,ORB.a+0.18);
	if(ORB.dis<=2){
		array_delete(orbs,i,1);
	}
}
