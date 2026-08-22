if (_state == 0)
{
	draw_self();
	if (image_alpha >= 1)
	{
		if (place_meeting(x,y,battle_soul))
		{
			Battle_CallSoulEventBulletCollision();
		}
	}
}
else
{
	var _a = 1 - (_t/boom_time);
	draw_sprite_ext(spr_boom,0,x,y,boom_scale,boom_scale,0,c_white,_a);
}
