if wtimer == w_time
	instance_destroy()

if (follow_dir >= 0) and (instance_exists(battle_board))
{
	var _wl = battle_board.x-battle_board.left;
	var _wr = battle_board.x+battle_board.right;
	var _wt = battle_board.y-battle_board.up;
	var _wb = battle_board.y+battle_board.down;
	switch (follow_dir)
	{
		case DIR.LEFT:
			x1 = _wl;                y1 = _wt+follow_pad;
			x2 = _wl+follow_thick;   y2 = _wb-follow_pad;
			break;
		case DIR.RIGHT:
			x1 = _wr-follow_thick;   y1 = _wt+follow_pad;
			x2 = _wr;                y2 = _wb-follow_pad;
			break;
		case DIR.UP:
			x1 = _wl+follow_pad;     y1 = _wt;
			x2 = _wr-follow_pad;     y2 = _wt+follow_thick;
			break;
		case DIR.DOWN:
			x1 = _wl+follow_pad;     y1 = _wb-follow_thick;
			x2 = _wr-follow_pad;     y2 = _wb;
			break;
	}
}

if (warn_sound) and (wtimer & 1)
	audio_play_sound(snd_warn,50,false)

if wtimer & 2
	colour = c_red
else
	colour = c_yellow

draw_rectangle_color(x1,y1,x2,y2,colour,colour,colour,colour,true)

wtimer++
