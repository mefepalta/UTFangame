if (ready == 0) and (image_alpha > 0) {
	image_alpha -= 0.0055;
	if (image_alpha <= 0) {
		gameover.checkGMOver = true;
	}
}
if ready =-1 and (!instance_exists(text_typer)){
	room_goto(room_battle);
}