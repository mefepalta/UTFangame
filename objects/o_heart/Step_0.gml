with (o_menu)
{
	if (menucounter == 3)
	{
		other.heartcounter = 3;
	}
	if (menucounter == 2)
	{
		other.heartcounter = 2;
	}
	if (menucounter == 1)
	{
		other.heartcounter = 1;
	}
	if (menucounter == 0)
	{
		other.heartcounter = 0;
	}
}

y = lerp(y, target_y, move_speed);

switch (heartcounter)
{
	case 3: 
	target_y = 234;
	break;
	case 2: 
	target_y = 266;
	break;
	case 1: 
	target_y = 298;
	break;
	case 0: 
	target_y = 330;
	break;
}