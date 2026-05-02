with (battle_enemy_engage)
{
	if (_head_alpha == 0)
	{
		other.image_alpha = 1;
		if (other.image_index = 12)
		{
			other.shake_time = 6;
		}
	}
	if (_head_alpha == 1)
	{
		other.image_alpha = 0;
	    other.image_index = 0;
		other.image_speed = 0;
	}
}
if (shake_time > 0) {
    x = x_origin + random_range(-shake_strength, shake_strength);
    shake_time--;
} else {
    x = x_origin;
}
with (o_p1final_fall)
{
	if (p1finalattackval)
	{
		other.destroy = true;														  
	}
}
if (destroy == true)
{
	instance_destroy();
}