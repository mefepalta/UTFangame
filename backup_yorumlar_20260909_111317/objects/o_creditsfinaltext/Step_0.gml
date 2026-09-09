pulse++;

with (o_credits)
{
	if (creditstimer >= 6700)
	{
		other.target_alpha = 1;
	}
}

image_alpha += (target_alpha - image_alpha) * 0.04;
