function Battle_GetBoardSurface() {
	with (battle_board)
	{
		if (!surface_exists(_surface))
		{
			_surface = surface_create(640,480);
			surface_set_target(_surface);
			draw_clear_alpha(color_bg,0);
			surface_reset_target();
		}
		return _surface;
	}
	return -1;
}
