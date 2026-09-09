event_inherited();

if(instance_exists(battle_board)){
	x=battle_board.x;
	y=battle_board.y;
}

var ACTIVE=(Battle_GetState()==BATTLE_STATE.IN_TURN);

if(small_cd>0){
	small_cd-=1;
}
if(recoil>0){
	recoil=max(0,recoil-0.8);
}

if(!ACTIVE){
	charging=false;
	charge=0;
	orbs=[];
	exit;
}

aim_update();
image_angle=aim;

if(Input_IsHeld(INPUT.CONFIRM)){
	if(!charging){
		charging=true;
		charge=0;
	}
	if(charge<charge_max){
		charge+=1;
		if(charge==charge_max){
			audio_play_sound(snd_ding,0,false);
		}

		orb_timer-=1;
		if(orb_timer<=0){
			orb_timer=3;
			array_push(orbs,{
				ang:irandom(359),
				dis:30+irandom(14),
				a:0,
				spd:1.6+random(1.2)
			});
		}
	}
}else if(charging){
	if(charge>=charge_max){
		fire(true);
	}
	charging=false;
	charge=0;
	orbs=[];
}

for(var i=array_length(orbs)-1;i>=0;i--){
	var ORB=orbs[i];
	ORB.dis-=ORB.spd;
	ORB.a=min(1,ORB.a+0.18);
	if(ORB.dis<=2){
		array_delete(orbs,i,1);
	}
}

if(small_on && Input_IsPressed(INPUT.CONFIRM) && small_cd<=0){
	fire(false);
}
