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

if (_dynamic){
    _dynamic_lifetime--;
    if (_dynamic_lifetime <= 0){
        instance_destroy();
    }
    
    // Pendulum
    _dynamic_speed = lerp(_dynamic_speed, -1 * _dynamic_dir, 0.03);
    if (abs(_dynamic_speed) > 0.9 && sign(_dynamic_speed) != _dynamic_dir){
        _dynamic_dir = -_dynamic_dir;
    }
    hspeed = _base_hspeed * _dynamic_speed;
    vspeed = _base_vspeed * _dynamic_speed;
}

// Y-scale ayrı
if (_dynamic_scale){
    _scale_offset = sin(count * _scale_speed) * 0.3;
    _length = clamp(_length + _scale_offset, 10, 40);
}
	