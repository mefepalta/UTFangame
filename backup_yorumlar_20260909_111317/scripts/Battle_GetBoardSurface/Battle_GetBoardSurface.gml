function Battle_GetBoardSurface() {
	// Surface'ler ucucudur: GPU cihazi kaybedilirse (device removed) ya da VRAM
	// yetmezse battle_board'un Pre-Draw'daki surface_create'i basarisiz olur ve
	// _surface gecersiz kalir. O anda tahtaya cizen ilk nesne
	// "Trying to set a surface target that does not exist" ile oyunu dusuruyordu
	// (ornek: battle_regularbonewall/Draw_0). ~20 cagri noktasi var, hepsini tek
	// yerden koru: gecersizse burada yeniden olustur.
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
