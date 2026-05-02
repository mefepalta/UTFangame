///@arg x
///@arg y
///@arg hspeed
///@arg gap
///@arg auto_destroy
///@arg color
///@arg angle
///@arg mspd
///@arg mx
///@arg my
///@arg *duration
function MakeBoneTwoV() {
	var X = argument[0];
	var Y = argument[1];
	var HSPEED = argument[2];
	var GAP = argument[3];
	var DESTROY = argument[4];
	var COLOR = argument[5];
	var ANGLE = 0;
	var MSPD = 0;
	var MX = 0;
	var MY = 0;
	var DURATION = -1;
	if(argument_count >= 7){
		ANGLE = argument[6];
	}
	if(argument_count >= 8){
		MSPD = argument[7];
	}
	if(argument_count >= 9){
		MX = argument[8];
	}
	if(argument_count >= 10){
		MY = argument[9];
	}
	if(argument_count >= 11){
		DURATION = argument[10];
	}

	MakeBoneTop(X,Y-battle_board.y+battle_board.up-GAP,HSPEED,COLOR,0,0,DESTROY,1,ANGLE,MSPD,MX,MY,DURATION)
	MakeBoneBottom(X,battle_board.y+battle_board.down-GAP-Y,HSPEED,COLOR,0,0,DESTROY,1,ANGLE,MSPD,MX,MY,DURATION)


}
