if can_draw
{
	if (!surface_exists(surf))
	surf=surface_create(640,480)
	surface_set_target(surf)
	draw_clear_alpha(c_black,0)
	surface_reset_target()
}
