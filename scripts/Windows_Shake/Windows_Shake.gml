///@arg shake_x
///@arg shake_y
///@arg shake_speed_x*
///@arg shake_speed_y*
///@arg shake_random_x*
///@arg shake_random_y*
///@arg shake_decrease_x*
///@arg shake_decrease_y*
function Windows_Shake() {

	var X=argument[0];
	var Y=argument[1];
	var SPEED_X=0;
	var SPEED_Y=0;
	var RANDOM_X=false;
	var RANDOM_Y=false;
	var DECREASE_X=1;
	var DECREASE_Y=1;
	if(argument_count>=3){
		SPEED_X=argument[2];
	}
	if(argument_count>=4){
		SPEED_Y=argument[3];
	}
	if(argument_count>=5){
		RANDOM_X=argument[4];
	}
	if(argument_count>=6){
		RANDOM_Y=argument[5];
	}
	if(argument_count>=7){
		DECREASE_X=argument[6];
	}
	if(argument_count>=8){
		DECREASE_Y=argument[7];
	}

	window_shaker.shake_x=X;
	window_shaker.shake_y=Y;
	window_shaker.shake_speed_x=SPEED_X;
	window_shaker.shake_speed_y=SPEED_Y;
	window_shaker.shake_random_x=RANDOM_X;
	window_shaker.shake_random_y=RANDOM_Y;
	window_shaker.shake_decrease_x=DECREASE_X;
	window_shaker.shake_decrease_y=DECREASE_Y;
	window_shaker._shake_pos_x=0;
	window_shaker._shake_pos_y=0;
	window_shaker._shake_time_x=0;
	window_shaker._shake_time_y=0;
	window_shaker._shake_positive_x=true;
	window_shaker._shake_positive_y=true;

	return true;


}
