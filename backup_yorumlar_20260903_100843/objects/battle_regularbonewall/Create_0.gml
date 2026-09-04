

//depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2

_width=30
_bone_number=3
_bone_length_target=30
_duration=3
_bone_duration = 50
_general_x=battle_board.x
_general_y=battle_board.y
_dir = DIR.RIGHT
_randomise_angle = false
_papyrus_mode=0;

_warning_color = c_red
_warning_color_switcher=0
_warning_time = 50

audio_play_sound(snd_exclamation,0,false)

_time=0
_bone_y=0
_bone_x=0
random_angle=8

bone_length = _width / _bone_number;
	total_bone_width = bone_length * _bone_number;
	bone_height = _bone_length_target;

	box_width = total_bone_width;
	box_height = bone_height;

	box_x = _general_x-10; 
	box_y = _bone_y-_bone_length_target; 

if _dir = DIR.DOWN{
	_bone_y = (battle_board.y+battle_board.down);
}else if _dir = DIR.UP{
	_bone_y = (battle_board.y-battle_board.up);
}else if _dir = DIR.LEFT{
	_bone_x = (battle_board.x-battle_board.left);
}else if _dir = DIR.RIGHT{
	_bone_x = (battle_board.x+battle_board.right);
}
