_warning_time-=1;
_time+=1;

var left_box = (battle_board.x-battle_board.left);
var right_box = (battle_board.x+battle_board.right);
var up_box = (battle_board.y-battle_board.up);
var down_box = (battle_board.y+battle_board.down);

if _dir = DIR.DOWN{
	_bone_y = down_box
}else if _dir = DIR.UP{
	_bone_y = up_box
}else if _dir = DIR.LEFT{
	_bone_x = left_box
}else if _dir = DIR.RIGHT{
	_bone_x = right_box
}

if _warning_color_switcher = 0{
	_warning_color = c_red
}else if _warning_color_switcher = 1{
	_warning_color = c_yellow
}

if _warning_color_switcher < 0{
	_warning_color_switcher = 1
}
if _warning_color_switcher > 1{
	_warning_color_switcher = 0
}

if _warning_time = 0{
	audio_play_sound(snd_stab,0,false)
	_warning_color=c_black
	if _dir = DIR.DOWN{
		for (var i = 0; i < _bone_number; i++){
			var bone_X = _general_x+(i * bone_length);
    
			bon=instance_create_depth(bone_X, _bone_y, 0, battle_regularbone);
			bon._length=0
			bon._inside=0
			bon._bottom=1
			bon._angle=0
			bon._papyrus=_papyrus_mode;
			if(_randomise_angle){
				bon._angle=0+random_range(random_angle,-random_angle)
			}
			Anim_Create(bon,"_length",0,1,0,_bone_length_target,_duration)
			Anim_Create(bon,"_length",0,1,_bone_length_target,-_bone_length_target,_duration,_bone_duration)
			alarm[0]=_bone_duration+_duration
		}
	}else if _dir = DIR.UP{
		for (var i = 0; i < _bone_number; i++){
			var bone_X = _general_x+(i * bone_length);
    
			bon=instance_create_depth(bone_X, _bone_y, 0, battle_regularbone);
			bon._length=0
			bon._inside=0
			bon._bottom=1
			bon._angle=180
			bon._papyrus=_papyrus_mode;
			if(_randomise_angle){
				bon._angle=180+random_range(random_angle,-random_angle)
			}
			Anim_Create(bon,"_length",0,1,0,_bone_length_target,_duration)
			Anim_Create(bon,"_length",0,1,_bone_length_target,-_bone_length_target,_duration,_bone_duration)
			alarm[0]=_bone_duration+_duration
		}
	}else if _dir = DIR.LEFT{
		for (var i = 0; i < _bone_number; i++){
			var bone_Y = _general_y+(i * bone_length);
    
			bon=instance_create_depth(_bone_x, bone_Y, 0, battle_regularbone);
			bon._length=0
			bon._inside=1
			bon._bottom=1
			bon._angle=-90
			bon._papyrus=_papyrus_mode;
			if(_randomise_angle){
				bon._angle=-90+random_range(random_angle,-random_angle)
			}
			Anim_Create(bon,"_length",0,1,0,_bone_length_target,_duration)
			Anim_Create(bon,"_length",0,1,_bone_length_target,-_bone_length_target,_duration,_bone_duration)
			alarm[0]=_bone_duration+_duration
		}
	}else if _dir = DIR.RIGHT{
		for (var i = 0; i < _bone_number; i++){
			var bone_Y = _general_y+(i * bone_length);
    
			bon=instance_create_depth(_bone_x, bone_Y, 0, battle_regularbone);
			bon._length=0
			bon._inside=0
			bon._bottom=1
			bon._angle=90
			bon._papyrus=_papyrus_mode;
			if(_randomise_angle){
				bon._angle=90+random_range(random_angle,-random_angle)
			}
			Anim_Create(bon,"_length",0,1,0,_bone_length_target,_duration)
			Anim_Create(bon,"_length",0,1,_bone_length_target,-_bone_length_target,_duration,_bone_duration)
			alarm[0]=_bone_duration+_duration
		}
	}
}else if _warning_time > 0{
	if _time%5=0{
		_warning_color_switcher+=1
	}
}else if _warning_time < 0{
	_warning_color=c_black
}