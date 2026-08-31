with (o_p15_body)
{
	if (sprite_index == s_p15sanssheet_1)
	{
		other.x = x + 30;
		other.y = y - 48;
	}
	if (sprite_index == s_p15sanssheet_6)
	{
		other.x = x + 30;
		other.y = y - 32;
	}
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
//12