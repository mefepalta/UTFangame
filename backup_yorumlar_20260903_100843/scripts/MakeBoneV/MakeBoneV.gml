///@arg x
///@arg y
///@arg length
///@arg hspeed
///@arg vspeed
///@arg color
///@arg out
///@arg rot
///@arg auto_destroy
///@arg bottom
///@arg angle
///@arg mspd
///@arg mx
///@arg my
///@arg *duration
function MakeBoneV() {
	var X = argument[0];
	var Y = argument[1];
	var LENGTH = argument[2];
	var HSPEED = argument[3];
	var VSPEED = argument[4];
	var COLOR = argument[5];
	var OUT = argument[6];
	var ROT = argument[7];
	var DESTROY = argument[8];
	var BOTTOM = argument[9];
	var ANGLE = 0;
	var MSPD = 0;
	var MX = 0;
	var MY = 0;
	var DURATION = -1;
	if(argument_count >= 11){
		ANGLE = argument[10];
	}
	if(argument_count >= 12){
		MSPD = argument[11];
	}
	if(argument_count >= 13){
		MX = argument[12];
	}
	if(argument_count >= 14){
		MY = argument[13];
	}
	if(argument_count >= 15){
		DURATION = argument[14];
	}

	bone = instance_create_depth(X,Y,0,battle_bullet_bone)
	bone.length = LENGTH
	bone.hspeed = HSPEED
	bone.vspeed = VSPEED
	bone.color = COLOR
	bone.out = OUT
	bone.rotate = ROT
	bone.auto_destroy = DESTROY
	bone.angle = BONE.VERTICAL+ANGLE
	bone.bottom = BOTTOM
	bone.duration = DURATION
	bone.mspd=MSPD
	bone.mx=MX
	bone.my=MY
	return bone;


}
