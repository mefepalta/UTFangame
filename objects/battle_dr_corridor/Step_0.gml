if(!instance_exists(battle_board)){
	exit;
}

var B_TOP=battle_board.y-battle_board.up;
var B_BOT=battle_board.y+battle_board.down;

var BOOST=0;
var MUL=1;
if(instance_exists(battle_soul_orange_dr)){
	BOOST=battle_soul_orange_dr.speed_boost;
	MUL=battle_soul_orange_dr.world_mul;
}
scroll_spd=scroll_base*MUL;

scroll_off+=scroll_spd;
if(scroll_off>=stripe_gap){
	scroll_off-=stripe_gap*floor(scroll_off/stripe_gap);
}

if(instance_exists(battle_soul)){
	after_timer-=1;
	if(after_timer<=0){
		after_timer=(BOOST>0 ? after_delay_special : after_delay_normal);
		array_push(after_imgs,{
			xx:battle_soul.x,
			yy:battle_soul.y,
			a:0.6
		});
	}
}
for(var i=array_length(after_imgs)-1;i>=0;i--){
	var IMG=after_imgs[i];
	IMG.yy+=scroll_spd;
	IMG.a-=0.012;
	if(IMG.a<=0 || IMG.yy>B_BOT+16){
		array_delete(after_imgs,i,1);
	}
}

if(spawn_on){
	spawn_timer-=1;
	if(spawn_timer<=0){
		spawn_timer=spawn_delay;

		var OBS=instance_create_depth(battle_board.x,B_TOP-24,DEPTH_BATTLE.BULLET,battle_dr_obstacle);
		OBS.spd_y=scroll_base;
	}
}

if(ring_on){
	ring_dist+=scroll_spd;
	if(ring_dist>=ring_gap){
		ring_dist-=ring_gap;

		var RX=battle_board.x+random_range(-(battle_board.left-ring_margin),battle_board.right-ring_margin);
		var RING=instance_create_depth(RX,B_TOP-20,DEPTH_BATTLE.BULLET,battle_dr_jumpring);
		RING.spd_y=scroll_base;
	}
}
