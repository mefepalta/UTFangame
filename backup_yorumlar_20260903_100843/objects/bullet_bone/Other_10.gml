///@desc Soul Collision
if !(global.invincibility){

if(colour = c_white) and global.kr=true{
//	Player_HurtKr()
    //Camera_Shake(2,3,3,-2,-2,3);
	if (!instance_exists(hurtkr)) {
		instance_create_depth(0, 0, 0, hurtkr)
	}
}else if (colour = c_white) and global.kr=false{
	//Camera_Shake(2,3,3,-2,-2,3);
	battle_soul._inv=50;
	//Camera_Shake(3,-3);
	instance_destroy(hurtkr);
	instance_destroy();
	Player_Hurt(3);
}
if(colour = c_aqua) and global.kr=true{
	if!(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
		if (!instance_exists(hurtkr)) {
			instance_create_depth(0, 0, 0, hurtkr)
			Camera_Shake(2,3,3,-2,-2,3);
		}
	}
}else if (colour = c_aqua) and global.kr=false{
	if!(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
	battle_soul._inv=50;
	//Camera_Shake(3,-3);
	instance_destroy(hurtkr);
	instance_destroy();
	Player_Hurt(3);
	}
}
if(colour = c_orange) and global.kr=true{
	if(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
		if (!instance_exists(hurtkr)){
	//		Camera_Shake(2,3,3,-2,-2,3);
			instance_create_depth(0, 0, 0, hurtkr)
		}
	}
}else if (colour = c_orange) and global.kr=false{
	//Camera_Shake(2,3,3,-2,-2,3);
	if(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
	battle_soul._inv=50;
	Camera_Shake(3,-3);
	instance_destroy(hurtkr);
	instance_destroy();
	Player_Hurt(3);
	}
}

}