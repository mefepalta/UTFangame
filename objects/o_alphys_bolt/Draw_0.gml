draw_self();

if (image_alpha >= 1)
{
	if (place_meeting(x,y,battle_soul))
	{
		Battle_CallSoulEventBulletCollision();
	}
}
