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




if (_warning_time <= 0) exit;

// Kutu yuzeyi tahta poligonunun disini kirpiyor, duvar genisligi ise kenari tam
// kapatsin diye kasten tahtadan buyuk veriliyor: kirpilmadan cizilince cercevenin
// karsilikli iki kenari yutuluyordu. Once tahtanin icine sikistir.
var _bl = battle_board.x-battle_board.left;
var _br = battle_board.x+battle_board.right;
var _bt = battle_board.y-battle_board.up;
var _bb = battle_board.y+battle_board.down;

var _x1 = clamp(box_x, _bl, _br);
var _x2 = clamp(box_x + box_width, _bl, _br);
var _y1 = clamp(box_y, _bt, _bb);
var _y2 = clamp(box_y + box_height, _bt, _bb);

surface_set_target(Battle_GetBoardSurface()){
draw_set_color(c_black){
	draw_rectangle(_x1, _y1, _x2, _y2, false);
}
draw_set_color(_warning_color){
	draw_rectangle(min(_x1 + 2, _x2), min(_y1 + 2, _y2), max(_x2 - 2, _x1), max(_y2 - 2, _y1), true);
}
}surface_reset_target();