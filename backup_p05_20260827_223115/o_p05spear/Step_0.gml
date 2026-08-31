with (o_textcontroller_p05)
{
	if (p05 > 2715) and (p05 < 2730)
	{
		other.yspd = 12;
	}
	if (p05 > 2730)
	{
		other.yspd = 0;
	}
}

y = y + yspd;