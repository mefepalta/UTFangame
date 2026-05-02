function RegularBone(Xbone,Ybone,Length,Hspeed,Vspeed,Angle,Color,Inside,Alpha,Papyrus,Center,Bottom,AngleSpeed,AutoDestroy){
	var bone = instance_create_depth( Xbone, Ybone, DEPTH_BATTLE.BULLET, battle_regularbone);
	bone.x = Xbone
	bone.y = Ybone
	bone._length = Length
	bone.hspeed = Hspeed
	bone.vspeed = Vspeed
	bone._angle = Angle
	bone._color = Color
	bone._inside = Inside
	bone._alpha = Alpha
	bone._papyrus = Papyrus
	bone._center = Center
	bone._bottom = Bottom
	bone._angle_speed = AngleSpeed
	bone.autoDestroy = AutoDestroy
	return bone;
}