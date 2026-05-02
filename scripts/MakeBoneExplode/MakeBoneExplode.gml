///@arg X
///@arg Y
///@arg ANGLE
///@arg PAUSE
function MakeBoneExplode(X,Y,ANGLE,PAUSE) 
{		
	var bp = instance_create_depth(X,Y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2,Warning);
	bp.x = X;
	bp.y = Y;
	bp.image_angle = ANGLE;
	bp.PAUSEM = PAUSE;
	return bp;
}
