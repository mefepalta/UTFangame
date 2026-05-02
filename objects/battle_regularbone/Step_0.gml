_angle+=_angle_speed;
count++;

sprite_index = _sprite;

///Destroy the bone
if(autoDestroy){
	if x > 640+50 or x < -50 or y > 480+50 or y < -50{
		instance_destroy()
	}
}else{
	if (y < camera.y-500) or (y > camera.y+room_height+500) or (x > camera.x+room_width+25) or (x < camera.x-25){
		instance_destroy()
	}
}
	