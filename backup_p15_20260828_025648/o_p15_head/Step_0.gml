y = base_y + sin(global.bob_timer + 0) * 1;

with (o_p15_legs)
{
	other.x = x;
}

with (o_p15_body)
{
	if (sprite_index == s_p15sanssheet_6)
	{
		other.y = y - 36;
	}
}

with (o_textcontroller_p15)
{
	switch (current_line)
	{
		case 0:
		other.sprite_index = s_p15_headraise_2;
		other.image_index = 2;
		break;
		case 1: other.image_index = 1;
		break;
		case 2: other.image_index = 5;
		break;
		case 3: other.image_index = 6;
		break;
		case 4: other.image_index = 7;
		break;
		case 5: other.image_index = 7;
		break;
		case 6: other.image_index = 8;
		break;
		case 7: other.image_index = 0;
		break;
		case 8: other.image_index = 7;
		break;
		case 9: other.image_index = 6;
		break;
		case 10: other.image_index = 5;
		break;
		case 11: other.image_index = 8;
		break;
		case 12: other.image_index = 6;
		break;
		case 13: other.image_index = 4;
		break;
		case 14: other.image_index = 5;
		break;
		case 15: other.image_index = 4;
		break;
		case 16: other.image_index = 7;
		break;
		case 17: other.image_index = 5;
		break;
		case 18: other.image_index = 5;
		break;
		case 19: other.image_index = 3;
		break;
	}
}