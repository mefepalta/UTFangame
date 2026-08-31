with (o_p05body)
{
	other.x = x + 27;
	other.y = y - 35;
}
angle_timer += 0.04;
image_angle = base_angle + sin(angle_timer) * 2;

with (o_textcontroller_p05)
{
	if (p05 > 2705) and (p05 < 2725)
	{
		other.sprite_index = s_p05arm_animation;
	}
	if (p05 > 2725)
	{
		other.sprite_index = s_p05arm_animation_end;
	}
}
