depth = DEPTH_BATTLE.BOARD;
radius = 60;
board_number = global.borderCount

function contains(_x, _y) {
	return sqr(_x - x) + sqr(_y - y) <= sqr(radius);
}

function limit(_x, _y) {
	_x -= x;
	_y -= y;
	var mul = radius / sqrt(sqr(_x) + sqr(_y));
	return [_x * mul + x, _y * mul + y];
}

function replaceSurfaceAlpha(_surf, _xOffset = 0, _yOffset = 0, _fillAlpha = true) {
	surface_set_target(_surf);
	gpu_set_colorwriteenable(false, false, false, true);
	gpu_set_blendenable(false);
	
	if(_fillAlpha) {
		draw_set_alpha(0);
		draw_rectangle(0, 0, surface_get_width(_surf), surface_get_height(_surf), false);
	}
	
	draw_set_alpha(1);
	draw_circle(x, y, radius, false);

	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true, true, true, true);
	surface_reset_target();
}
function drawBorder(){
	draw_circle_color(x,y,radius+5,battle_board.color_frame,battle_board.color_frame,0);
	draw_circle_color(x,y,radius,battle_board.color_bg,battle_board.color_bg,0);
}