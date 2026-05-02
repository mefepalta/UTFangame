timer++;

blaster_angle+=blaster_speed
blaster_x = x_+lengthdir_x(distance_,blaster_angle)
blaster_y = y_+lengthdir_y(distance_,blaster_angle)

if timer < end_circle_timer{
	if timer%frequency_=0{
		RegularBlaster(0,0,blaster_x,blaster_y,0,point_direction(blaster_x,blaster_y,battle_board.x,battle_board.y),blastdurab,blastcoold,xscale,2,blastspeed)
	}
}else{
	instance_destroy()
}