///@desc Soul Collision
if(color = BONE.WHITE) and global.kr=true{
//	Player_HurtKr()
    //Camera_Shake(2,3,3,-2,-2,3);
	if (!instance_exists(hurtkr)) {
		instance_create_depth(0, 0, 0, hurtkr)
	}
}else if (color = BONE.WHITE) and global.kr=false{
	//Camera_Shake(2,3,3,-2,-2,3);
	battle_soul._inv=50;
	//Camera_Shake(3,-3);
	instance_destroy(hurtkr);
	instance_destroy();
	Player_Hurt(3);
}
if(color = BONE.BLUE) and global.kr=true{
	if!(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
		if (!instance_exists(hurtkr)) {
			instance_create_depth(0, 0, 0, hurtkr)
			Camera_Shake(2,3,3,-2,-2,3);
		}
	}
}else if (color = BONE.BLUE) and global.kr=false{
	if!(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
	battle_soul._inv=50;
	//Camera_Shake(3,-3);
	instance_destroy(hurtkr);
	instance_destroy();
	Player_Hurt(3);
	}
}
if(color = BONE.ORANGE) and global.kr=true{
	if(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
		if (!instance_exists(hurtkr)){
	//		Camera_Shake(2,3,3,-2,-2,3);
			instance_create_depth(0, 0, 0, hurtkr)
		}
	}
}else if (color = BONE.ORANGE) and global.kr=false{
	//Camera_Shake(2,3,3,-2,-2,3);
	if(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
	battle_soul._inv=50;
	Camera_Shake(3,-3);
	instance_destroy(hurtkr);
	instance_destroy();
	Player_Hurt(3);
	}
}
if(color = BONE.GREEN){
	Player_Heal(1)
	audio_play_sound(snd_item_heal,0,false)
}