if _dir = DIR.DOWN{
	bone_length = _width / _bone_number;
	total_bone_width = bone_length * _bone_number;
	bone_height = _bone_length_target;

	box_width = total_bone_width;
	box_height = bone_height;

	box_x = _general_x-10; 
	box_y = _bone_y-_bone_length_target; 
}else if _dir = DIR.UP{
	bone_length = _width / _bone_number;
	total_bone_width = bone_length * _bone_number;
	bone_height = _bone_length_target;

	box_width = total_bone_width;
	box_height = bone_height;

	box_x = _general_x-10; 
	box_y = _bone_y 
}else if _dir = DIR.LEFT{
	bone_length = _width / _bone_number;
	total_bone_width = bone_length * _bone_number;
	bone_height = _bone_length_target;

	box_width = bone_height;
	box_height = total_bone_width;

	box_x = _bone_x 
	box_y = _general_y-5;
}else if _dir = DIR.RIGHT{
	bone_length = _width / _bone_number;
	total_bone_width = bone_length * _bone_number;
	bone_height = _bone_length_target;

	box_width = bone_height;
	box_height = total_bone_width;

	box_x = _bone_x-box_width
	box_y = _general_y-5;
}




surface_set_target(Battle_GetBoardSurface()){
draw_set_color(c_black){
	draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
}
draw_set_color(_warning_color){
	draw_rectangle(box_x + 2, box_y + 2, box_x + box_width - 2, box_y + box_height - 2, true); // İçini doldur
}
}surface_reset_target();