_angle+=_angle_speed;
count++;

sprite_index = _sprite;

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
    _dynamic_speed = lerp(_dynamic_speed, -1 * _dynamic_dir, _dynamic_rate);
    if (abs(_dynamic_speed) > 0.9 && sign(_dynamic_speed) != _dynamic_dir){
        _dynamic_dir = -_dynamic_dir;
    }
    hspeed = _base_hspeed * _dynamic_speed;
    vspeed = _base_vspeed * _dynamic_speed;
}

if (_snake) {
    _snake_time += 1;
    _snake_freq_x += sin(_snake_time * 0.007) * 0.001;
    _snake_freq_y += cos(_snake_time * 0.011) * 0.001;
    _snake_freq_x = clamp(_snake_freq_x, 0.03, 0.15);
    _snake_freq_y = clamp(_snake_freq_y, 0.02, 0.12);
    _snake_jolt_timer--;
    if (_snake_jolt_timer <= 0) {
        _snake_jolt_x = random_range(-2, 2);
        _snake_jolt_y = random_range(-1.5, 1.5);
        _snake_jolt_timer = irandom_range(30, 90);
    }
    _snake_jolt_x = lerp(_snake_jolt_x, 0, 0.15);
    _snake_jolt_y = lerp(_snake_jolt_y, 0, 0.15);
    hspeed = _base_hspeed + sin(_snake_time * _snake_freq_x) * _snake_amp_x + _snake_jolt_x;
    vspeed = _base_vspeed + cos(_snake_time * _snake_freq_y) * _snake_amp_y + _snake_jolt_y;
    _angle += sin(_snake_time * 0.08) * 2 + 1.5;
}

if (_dynamic_scale){
    _scale_offset = sin(count * _scale_speed) * 0.3;
    _length = clamp(_length + _scale_offset, 10, 40);
}

if (_angle_option){
    _angle++;
}