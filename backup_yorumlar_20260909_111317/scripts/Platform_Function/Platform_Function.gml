function Bullet_Platform(X, Y, HSPEED, VSPEED, LENGTH, OUT = 0, ANGLE = 0, STICKY = true)
{
	var DEPTH = DEPTH_BATTLE.BULLET_OUTSIDE_LOW;
	
	var platform = instance_create_depth(X, Y, DEPTH, obj_battle_platform1)
	with platform
	{
		x = X;
		y = Y;
		hspeed = HSPEED;
		vspeed = VSPEED;
		image_angle = ANGLE;
		
		length = LENGTH;
		sticky = STICKY;
		out = OUT;
	}
	return platform;
}