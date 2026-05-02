y = base_y + sin(global.bob_timer + 0) * 1;

with (o_p05legs)
{
	other.x = x;
}

with (o_textcontroller_p05)
{
	switch (current_line)
	{
		case 0: other.image_index = 10;
		break;
		case 1: other.image_index = 11;
		break;
		case 2: other.image_index = 2;
		break;
		case 3: other.image_index = 3;
		break;
		case 4: other.image_index = 14;
		break;
		case 5: other.image_index = 2;
		break;
		case 6: other.image_index = 7;
		break;
		case 7: other.image_index = 8;
		break;
		case 8: other.image_index = 9;
		break;
		case 9: other.image_index = 2;
		break;
		case 10: other.image_index = 13;
		break;
	}
}