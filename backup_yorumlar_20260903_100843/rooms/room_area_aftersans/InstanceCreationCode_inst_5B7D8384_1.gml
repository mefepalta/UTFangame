text = "* You can't see the end of the&box. {pause}{clear}* You decide to not examine any&further.";
image_alpha = 0;
/* with (char_player)
{
	if (_moveable_save == true)
	{
		with (o_box)
		{
			sprite_index = s_box_sprite_opening;
		}
	}
}
with (char_player)
{
	if (_moveable_save == false)
	{
		with (o_box)
		{
			sprite_index = s_box;
		}
	}
}