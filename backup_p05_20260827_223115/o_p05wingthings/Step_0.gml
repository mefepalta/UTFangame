with (o_p05body)
{
	other.x = x + 10;
	other.y = y - 48;
}
with (o_textcontroller_p05)
{
	if (p05 > 2705) and (p05 < 2725)
	{
		other.sprite_index = s_p05wingthing_animation;
	}
	if (p05 > 2725)
	{
		other.image_index = 4;
		other.image_speed = 0;
	}
}
