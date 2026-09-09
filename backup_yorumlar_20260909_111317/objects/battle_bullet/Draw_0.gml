surface_set_target(Battle_GetBoardSurface());{
	draw_self();
}surface_reset_target();

if place_meeting(x,y,battle_soul)
	Battle_CallSoulEventBulletCollision();