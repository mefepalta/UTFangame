with (logo)
{
	if (_spear == true)
	{
		if (other.x < 310)
		{
			other.xspd = 15;
		}
		if (other.y < 210)
		{
			other.yspd = 15;
		}
		if (other.x > 310)
		{
			other.xspd = 0;
		}
		if (other.y > 210)
		{
			other.yspd = 0;
		}
	}
}

x = x + xspd;
y = y + yspd;