y = lerp(y, target_y, move_speedy);
x = lerp(x, target_x, move_speedx);

with (o_p1final_fall)
{
	if (p1finalattackval == 470)
	{
		other.image_alpha = 1;
		
		with (o_p1final_gbsans)
		{
			image_alpha = 1;
		}
		with (o_p1final_gbbottom)
		{
			image_alpha = 1;
		}
	}
	if (p1finalattackval == 520)
	{
		other.target_x = 448;
		other.target_y = 194;
	}
}