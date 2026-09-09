event_inherited();

moveable=false;

sprite_index=spr_dr_soul_yellow;
image_angle=0;
aim=90;

charge=0;
charge_max=32;

big_fired=0;

small_on=true;
charging=false;

orb_timer=0;
orbs=[];
tip_dist=13;

small_cd=0;
small_cd_max=9;

recoil=0;

function aim_update(){
	var DX=0;
	var DY=0;
	if(Input_IsHeld(INPUT.LEFT)){
		DX-=1;
	}
	if(Input_IsHeld(INPUT.RIGHT)){
		DX+=1;
	}
	if(Input_IsHeld(INPUT.UP)){
		DY-=1;
	}
	if(Input_IsHeld(INPUT.DOWN)){
		DY+=1;
	}
	if(DX!=0 || DY!=0){
		aim=point_direction(0,0,DX,DY);
	}
}

function fire(BIG){
	var SX=x+lengthdir_x(tip_dist,aim);
	var SY=y+lengthdir_y(tip_dist,aim);

	var SHOT=instance_create_depth(SX,SY,DEPTH_BATTLE.BULLET,battle_dr_shot);
	SHOT.big=BIG;
	SHOT.dir=aim;
	SHOT.ang=aim;
	SHOT.image_angle=aim;
	SHOT.sprite_index=(BIG ? spr_dr_bullet_big : spr_dr_bullet_small);
	SHOT.spd=(BIG ? 9 : 13);

	recoil=(BIG ? 6 : 3);

	if(BIG){
		big_fired+=1;
		audio_play_sound(snd_gb_release,0,false);
		Camera_Shake(2,2,3,3);
	}else{
		audio_play_sound(snd_swift,0,false);
		small_cd=small_cd_max;
	}
}
