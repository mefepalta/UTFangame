///@arg y
///@arg length
///@arg vspeed
///@arg color
///@arg out
///@arg rot
///@arg auto_destroy
///@arg right
///@arg angle
///@arg mspd
///@arg mx
///@arg my
///@arg *duration
function MakeBoneRight() {
	var Y = argument[0];
	var LENGTH = argument[1];
	var VSPEED = argument[2];
	var COLOR = argument[3];
	var OUT = argument[4];
	var ROT = argument[5];
	var DESTROY = argument[6];
	var RIGHT = argument[7];
	var ANGLE = 0;
	var MSPD = 0;
	var MX = 0;
	var MY = 0;
	var DURATION = -1;
	if(argument_count >= 9){
		ANGLE = argument[8];
	}
	if(argument_count >= 10){
		MSPD = argument[9];
	}
	if(argument_count >= 11){
		MX = argument[10];
	}
	if(argument_count >= 12){
		MY = argument[11];
	}
	if(argument_count >= 13){
		DURATION = argument[12];
	}
	if(RIGHT = 2){
		RIGHT = 0;
	}

	bone = MakeBoneH(battle_board.x+battle_board.right-LENGTH/2-5,Y,LENGTH,0,VSPEED,COLOR,OUT,ROT,DESTROY,RIGHT,ANGLE,MSPD,MX,MY,DURATION)


}
