with (battle_enemy_engage)
{
	if (p2_head_alpha == 0)
	{
		other.image_alpha = 1;
	}
	if (p2_head_alpha == 1)
	{
		other.image_alpha = 0;
	    other.image_index = 0;
		other.image_speed = 0;
	}
}
if (sprite_index == spr_p2_comeatmebro)
{
	image_speed = 1;
}
if (shake_time > 0) {
    x = x_origin + random_range(-shake_strength, shake_strength);
    shake_time--;
} else {
    x = x_origin;
}

if (image_index > 12) and (image_index < 13)
{
	shakemoment = true;
}
else
{
	shakemoment = false;
}
if (shakemoment == true)
{
	shake_time = 6;
}
else
{
	shake_time = 0;
}