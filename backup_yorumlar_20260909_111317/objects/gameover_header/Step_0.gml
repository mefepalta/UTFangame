if (ready == 0) and (image_alpha > 0) {
	image_alpha -= 0.0055;
	if (image_alpha <= 0) {
		gameover.checkGMOver = true;
	}
}
if ready =-1 and (!instance_exists(text_typer)){
	var _back = room_battle;
	if (global.extras_room != noone) and (room_exists(global.extras_room)) { _back = global.extras_room; }
	room_goto(_back);
}